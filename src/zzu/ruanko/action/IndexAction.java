package zzu.ruanko.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import zzu.ruanko.bean.News;
import zzu.ruanko.util.MyConnector;
import zzu.ruanko.util.SimplifyText;

public class IndexAction extends ActionSupport implements SessionAware{
	
	private Map<String, Object> session;
	private List<News> newsList = new ArrayList<News>();
	
	public IndexAction() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}
	
	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public String execute() throws Exception {
		Connection conn = MyConnector.getConnection();
		try {
			String sql = "select nid,uid,title,news.username,newstype,createTime,content,click,nickname from news,user where state=1 and del=0 and news.username=user.uid order by createTime desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			String uname = "";
			while (rs.next()) {
				News n = new News();
				n.setId(rs.getString("nid"));
				n.setTitle(rs.getString("title"));
				n.setNewstype(rs.getString("newstype"));
				n.setCreateTime(rs.getString("createTime"));
				n.setUsername(rs.getString("nickname"));
				n.setContent(SimplifyText.StripHTML(rs.getString("content")));
				//System.out.println(SimplifyText.StripHTML(rs.getString("content")));
				n.setClick(rs.getInt("click"));
				newsList.add(n);
			}
			session.put("newsList", newsList);
			System.out.println("____________已执行indexAction___________");
			conn.close();//结束conn
			//开始查询热门文章
			Connection conn2 = MyConnector.getConnection();
			String sql2 = "select nid,title from news where state<>0 order by click desc";
			PreparedStatement ps2 = conn2.prepareStatement(sql2);
			ResultSet rs2 = ps2.executeQuery();
			List<News> hotList = new ArrayList<News>();
			while (rs2.next()) {
				News n = new News();
				n.setId(rs2.getString("nid"));
				n.setTitle(rs2.getString("title"));
				hotList.add(n);
			}
			session.put("hotList", hotList);
			System.out.println("____________已查询热门文章___________");
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
	}
}
