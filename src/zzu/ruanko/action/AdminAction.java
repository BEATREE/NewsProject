package zzu.ruanko.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import zzu.ruanko.bean.Admin;
import zzu.ruanko.bean.News;
import zzu.ruanko.bean.User;
import zzu.ruanko.util.MD5Code;
import zzu.ruanko.util.MyConnector;
import zzu.ruanko.util.SimplifyText;

public class AdminAction extends ActionSupport implements SessionAware{
	
	Map<String, Object> session;
	private String adminname,adminpassword,nid,state;
	
	Admin currentAdmin = new Admin();
	
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getAdminpassword() {
		return adminpassword;
	}
	public void setAdminpassword(String adminpassword) {
		this.adminpassword = adminpassword;
	}
	public String getNid() {
		return nid;
	}
	public void setNid(String nid) {
		this.nid = nid;
	}
	//处理登录
	public String loginAdmin() throws Exception{
		//获取数据库链接
		Connection conn = MyConnector.getConnection();
		//List<User> uList = new ArrayList<User>();
		try {
			String sql = "select * from admin where adminname=? and adminpassword=?";
			//预编译代码
			PreparedStatement ps = conn.prepareStatement(sql);
			MD5Code md5Code = new MD5Code();	//MD5加密处理
			ps.setString(1, md5Code.getMD5(adminname));
			ps.setString(2, md5Code.getMD5(adminpassword));//填入数据
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				currentAdmin.setAdminname(adminname);
				currentAdmin.setAdminpassword(adminpassword);
				session.put("currentAdmin", currentAdmin);
				return SUCCESS;
			}
			addFieldError("LoginError", "账号或密码错误！");
		} catch (Exception e) {
			addFieldError("LoginError", "登陆出错！");
			e.printStackTrace();
			return INPUT;
		}
		return INPUT;
				
	}
	public String allNewsAdmin() throws Exception{
		Connection conn = MyConnector.getConnection();
		try {
			String sql = "select nid,uid,title,newstype,createTime,state,news.username,nickname from news,user where news.username=user.uid order by createTime desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			Admin a = (Admin)session.get("currentAdmin");
			if (a==null) {
				addFieldError("notLogin", "您还未登录，或登录已过期");
				return INPUT;
			}
			ResultSet rs = ps.executeQuery();
			List<News> newsList = new ArrayList<News>();
			while (rs.next()) {
				News n = new News();
				n.setId(rs.getString("nid"));
				n.setTitle(rs.getString("title"));
				n.setNewstype(rs.getString("newstype"));
				n.setCreateTime(rs.getString("createTime"));
				n.setState(rs.getInt("state"));
				n.setUsername(rs.getString("nickname"));
				newsList.add(n);
			}
			session.put("allNews", newsList);
			System.out.println("____________已执行myNews___________");
			return "allNewsSuccess";
	}catch (Exception e) {
		addFieldError("allNewsError", "查询文章信息失败了，抱歉。。。");
		e.printStackTrace();
		return INPUT;
	}
	}
	//删除新闻
	public String deleteNewsAdmin() throws Exception{
		Connection con = MyConnector.getConnection();
		String sql = "delete from news where nid=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, nid);
		Admin u = (Admin)session.get("currentAdmin");
		if (u==null) {	//判断是否已经登录
			addFieldError("notLogin", "未登录不能删除新闻的，你个逗比！");
			return INPUT;
		}
		int status = ps.executeUpdate();
		if (status!=0) {
			con.close();
			return "deleteSuccess";
		}
		con.close();
		addFieldError("deleteError", "新闻删除失败！");
		return INPUT;
	}
	//修改新闻状态
	public String stateNewsAdmin() throws Exception{
		Connection con = MyConnector.getConnection();
		String sql ="update news set state=? where nid=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, state);
		ps.setString(2, nid);
		
		int end = ps.executeUpdate();
		System.out.println("___________"+state+"____________");
		if (end!=0) {
			return "stateSuccess";
		}
		addFieldError("stateError", "更新状态失败！");
		return INPUT;
	}
	//获取所有用户信息
	public String allUserAdmin() throws Exception{
		Connection conn = MyConnector.getConnection();
			try {
				String sql = "select uid,nickname from user";
				PreparedStatement ps = conn.prepareStatement(sql);
				Admin a = (Admin)session.get("currentAdmin");
				if (a==null) {
					addFieldError("notLogin", "您还未登录，或登录已过期");
					return INPUT;
				}
				ResultSet rs = ps.executeQuery();
				List<User> userList = new ArrayList<User>();
				while (rs.next()) {
					User u = new User();
					u.setId(rs.getInt("uid"));
					u.setNickname(rs.getString("nickname"));
					userList.add(u);
				}
				session.put("allUser", userList);
				System.out.println("____________已执行allUserAdmin__________");
				return "allUserSuccess";
		}catch (Exception e) {
			addFieldError("allNewsError", "查询用户信息失败了，抱歉。。。");
			e.printStackTrace();
			return INPUT;
		}
	}
	public String deleteUserAdmin() throws Exception{
		Connection con = MyConnector.getConnection();
		String sql = "delete from user where uid=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, nid);
		Admin u = (Admin)session.get("currentAdmin");
		if (u==null) {	//判断是否已经登录
			addFieldError("notLogin", "未登录不能删除用户的，你个逗比！");
			return INPUT;
		}
		int status = ps.executeUpdate();
		if (status!=0) {
			con.close();
				Connection con2 = MyConnector.getConnection();
				String sql2 = "delete from news where username=?";
				PreparedStatement ps2 = con2.prepareStatement(sql2);
				ps2.setString(1, nid);
				int status2 = ps2.executeUpdate();
				return "deleteUserSuccess";
		}
		con.close();
		addFieldError("deleteError", "用户删除失败！");
		return INPUT;
	}
}
