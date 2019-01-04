package zzu.ruanko.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import zzu.ruanko.bean.Admin;
import zzu.ruanko.bean.News;
import zzu.ruanko.bean.User;
import zzu.ruanko.util.IdCreator;
import zzu.ruanko.util.MyConnector;
import zzu.ruanko.util.SimplifyText;

public class NewsAction extends ActionSupport implements SessionAware{

	private String nid,title,newstype,source,author,username,createTime,keywords,content;
	private int state;
	private static String newstype2;
	News news = new News();
	Map<String, Object> session;
	private List<News> aboutList = new ArrayList<News>();	//用于存储相关的数据记录
	
	public NewsAction() {
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}
	public Map<String,Object> getSession(){
		return this.session;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}

	public String getNid() {
		return nid;
	}
	public void setNid(String nid) {
		this.nid = nid;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getNewstype() {
		return newstype;
	}
	public void setNewstype(String newstype) {
		this.newstype = newstype;
	}

	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}

	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	//用于处理新闻的阅读
	public String readNews() throws Exception{
		System.out.println("______________新闻阅读_______________");
		System.out.println("_____________id为："+nid+"______________");
		//String id = ServletActionContext.getRequest().getParameter("id");
		System.out.println("_____________id为："+nid+"______________");
		Connection conn = MyConnector.getConnection();
		String sql = "select * from news,user where news.username=user.uid and nid=?";
		PreparedStatement ps = conn.prepareStatement(sql);//执行查询本条新闻信息
		ps.setString(1, nid);
		try {
			ResultSet rs = ps.executeQuery();
			int clicknum = 0;
			if (rs.next()) {
				if (rs.getInt("state")==1&&rs.getInt("del")==0) {
					newstype2 = rs.getString("newstype");
					news.setId(nid);
					news.setUsername(rs.getString("nickname"));
					news.setNewstype(newstype2);
					news.setTitle(rs.getString("title"));
					news.setAuthor(rs.getString("author"));
					news.setKeywords(rs.getString("keywords"));
					news.setSource(rs.getString("source"));
					news.setContent(rs.getString("content"));
					news.setCreateTime(rs.getString("createTime"));
					clicknum = rs.getInt("click");
					news.setClick(clicknum);
					session.put("currentNews", news);
				}else{
					newstype2 = rs.getString("newstype");
					news.setId(nid);
					news.setUsername(rs.getString("nickname"));
					news.setNewstype(newstype2);
					news.setTitle(rs.getString("title"));
					news.setAuthor(rs.getString("author"));
					news.setKeywords(rs.getString("keywords"));
					news.setSource(rs.getString("source"));
					news.setContent("<h1 style='color:red;font-weight:bold;'>该文章暂时处于预览阶段，尚未正式发布</h1><br/>"+rs.getString("content"));
					news.setCreateTime(rs.getString("createTime"));
					clicknum = rs.getInt("click");
					news.setClick(clicknum);
					session.put("currentNews", news);
				}
			}
			conn.close();
			System.out.println("____________clicknum="+clicknum+"__________");
			Connection conn2 = MyConnector.getConnection();
			String sql2 = "update news set click=? where nid=?";
			PreparedStatement ps2 = conn2.prepareStatement(sql2);//更新点击记录本条新闻信息
			ps2.setInt(1, clicknum+1);
			ps2.setString(2, nid);
			int resultUpdate = ps2.executeUpdate();
			//在update语句中含有占位符时不能使用executeUpdate(String)函数
			if (resultUpdate!=0) {
				return "jump";
			}else{
				addFieldError("readError", "该条文章不存在或已被发布者删除。");
				return INPUT;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
	}
	//用户后台查看自己的新闻
	public String myNews() throws Exception{
		Connection conn = MyConnector.getConnection();
		try {
			String sql = "select nid,title,newstype,createTime,state from news where username=? order by createTime desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			User u = (User)session.get("currentUser");
			if (u==null) {
				addFieldError("notLogin", "您还未登录，或登录已过期");
				return INPUT;
			}
			ps.setInt(1, u.getId());
			ResultSet rs = ps.executeQuery();
			List<News> newsList = new ArrayList<News>();
			while (rs.next()) {
				News n = new News();
				n.setId(rs.getString("nid"));
				n.setTitle(rs.getString("title"));
				n.setNewstype(rs.getString("newstype"));
				n.setCreateTime(rs.getString("createTime"));
				n.setState(rs.getInt("state"));
				newsList.add(n);
			}
			session.put("myNews", newsList);
			System.out.println("____________已执行myNews___________");
			return "myNewsSuccess";
		} catch (Exception e) {
			addFieldError("myNewsError", "查询个人文章失败了，抱歉。。。");
			e.printStackTrace();
			return INPUT;
		}
	}
	//查询代码块
	public String searchNews() throws Exception{
		Connection conn = MyConnector.getConnection();
		try {
			String sql = "select nid,title,news.username,newstype,createTime,content,click,nickname from news,user where state=1 and del=0 and news.username=user.uid and (title like ? or keywords like ?) order by createTime desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+title+"%");
			ps.setString(2, "%"+title+"%");
			ResultSet rs = ps.executeQuery();
			List<News> newsList = new ArrayList<News>();
			while (rs.next()) {
				News n = new News();
				n.setId(rs.getString("nid"));
				n.setTitle(rs.getString("title"));
				n.setNewstype(rs.getString("newstype"));
				n.setCreateTime(rs.getString("createTime"));
				n.setUsername(rs.getString("nickname"));
				n.setContent(SimplifyText.StripHTML(rs.getString("content")));
				n.setClick(rs.getInt("click"));
				newsList.add(n);
			}
			session.put("resultNews", newsList);
			System.out.println("____________已执行searchNews___________");
			return "searchSuccess";
		} catch (Exception e) {
			e.printStackTrace();
			return "searchEmpty";
		}
	}
	public String aboutNews() throws Exception{
		
		Connection conn = MyConnector.getConnection();
		//查询同类其他新闻的sql
		String sql2 = "select nid,title from news where newstype=? and state<>0 and nid<>?";	/*order by id desc*/
		PreparedStatement ps2 = conn.prepareStatement(sql2);//执行查询同类型新闻信息
		//开始查询相关的数据记录
		ps2.setString(1, newstype2);
		ps2.setString(2, nid);
		ResultSet rs2 = ps2.executeQuery();
		System.out.println("____________"+newstype2+"_________");
		while (rs2.next()) {
			News n = new News();
			System.out.println(rs2.getString("nid"));
			n.setId(rs2.getString("nid"));
			n.setTitle(rs2.getString("title"));
			aboutList.add(n);
		}
		session.put("aboutList",aboutList );
		return SUCCESS;
	}
	//拦截发布文章Action
	public void validatePublishNews() {
		User cuser = (User)session.get("currentUser");
		if (cuser==null) {
			addFieldError("notlogin", "您似乎还没有登录吧~");
		}
	}
	//发布新闻
	public String publishNews() throws Exception{
		System.out.println("_____________原始id为："+nid+"______________");
		//String id = ServletActionContext.getRequest().getParameter("id");
		//id = IdCreator.getStringId();
		Connection conn = MyConnector.getConnection();
		String sql = "insert into news values(?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);//执行查询本条新闻信息
		createTime = LocalDate.now().toString();
		String cid ;	//currentNewsId
		if (nid == null || nid.equals("")) {
			cid = IdCreator.getStringId();
		}else{
			cid = nid;
		}
		System.out.println("_____________生成id为："+cid+"______________");
		ps.setString(1,cid);
		ps.setString(2, username);
		ps.setString(4, title);
		ps.setString(3, newstype);
		ps.setString(5, author);
		ps.setString(6, keywords);
		ps.setString(7, source);
		ps.setString(8, content);
		ps.setString(9, createTime);
		ps.setInt(10, 0);
		ps.setInt(11, 0);
		ps.setInt(12, 0);
		
		int n = ps.executeUpdate();
		if (n!=0) {
			return "updateSuccess";
		}else{
		addFieldError("updateError", "发布新闻失败");
		return INPUT;
		}
	}
	//修改新闻状态
	public String stateNews() throws Exception{
		Connection con = MyConnector.getConnection();
		String sql ="update news set state=? where nid=? and username=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, state);
		ps.setString(2, nid);
		User u = (User)session.get("currentUser");
		Admin a = (Admin)session.get("currentAdmin");
		if (u==null&&a==null) {	//判断是否已经登录
			addFieldError("notLogin", "未登录不能改变新闻的状态的，你个逗比！");
			return INPUT;
		}
		ps.setInt(3, u.getId());
		int end = ps.executeUpdate();
		System.out.println("___________"+state+"____________");
		if (end!=0) {
			return "stateSuccess";
		}
		addFieldError("stateError", "更新状态失败！");
		return INPUT;
	}
	//重新编辑新闻
	public String editNews() throws Exception{
		System.out.println("_____________id为："+nid+"______________");
		Connection conn = MyConnector.getConnection();
		String sql = "select * from news where nid=? and username=?";
		PreparedStatement ps = conn.prepareStatement(sql);//执行查询本条新闻信息
		User u = (User)session.get("currentUser");
		if (u==null) {	//判断是否已经登录
			addFieldError("notLogin", "未登录不能修改新闻的，你个逗比！");
			return INPUT;
		}
		ps.setString(1, nid);
		ps.setInt(2, u.getId());
		try {
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				nid = rs.getString("nid");
				title = rs.getString("title");
				newstype = rs.getString("newstype");
				source = rs.getString("source");
				author = rs.getString("author");
				keywords = rs.getString("keywords");
				content = rs.getString("content");
				return "editSuccess";
			}
			addFieldError("editError", "未查获到相关记录");
			return INPUT;
		}catch (Exception e) {
			e.printStackTrace();
			addFieldError("editError", "重新编辑失败！");
			return INPUT;
		}
	}
	//重新编辑新闻
	public String reeditNews() throws Exception{
		System.out.println("_____________id为："+nid+"______________");
		Connection conn = MyConnector.getConnection();
		String sql = "update news set title=?,newstype=?,source=?,author=?,keywords=?,content=?,state=0 where nid=?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);//执行查询本条新闻信息
			ps.setString(1, title);
			ps.setString(2, newstype);
			ps.setString(3, source);
			ps.setString(4, author);
			ps.setString(5, keywords);
			ps.setString(6, content);
			ps.setString(7, nid);
			
			int a = ps.executeUpdate();
			if (a!=0) {
				return "reeditSuccess";
			}
			addFieldError("reeditError", "修改失败");
			return INPUT;
		}catch (Exception e) {
			e.printStackTrace();
			addFieldError("editError", "重新编辑失败！");
			return INPUT;
		}
	}
	
	//用户删除新闻
	public String deleteNews() throws Exception{
		Connection con = MyConnector.getConnection();
		String sql = "delete from news where nid=? and username=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, nid);
		User u = (User)session.get("currentUser");
		if (u==null) {	//判断是否已经登录
			addFieldError("notLogin", "未登录不能删除新闻的，你个逗比！");
			return INPUT;
		}
		ps.setInt(2, u.getId());
		int status = ps.executeUpdate();
		if (status!=0) {
			con.close();
			return "deleteSuccess";
		}
		con.close();
		addFieldError("deleteError", "新闻删除失败！");
		return INPUT;
		
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return super.execute();
	}
}
