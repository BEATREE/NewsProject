package zzu.ruanko.action;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import zzu.ruanko.bean.User;
import zzu.ruanko.util.IdCreator;
import zzu.ruanko.util.MD5Code;
import zzu.ruanko.util.MyConnector;

public class UserAction extends ActionSupport implements SessionAware{
	
	private String uid, nickname,username,password;
	private javax.servlet.http.HttpServletResponse response = ServletActionContext.getResponse();
	private Map<String, Object> session;
	User currentUser = new User();
	MD5Code md5Code = new MD5Code();
	
	public Map<String,Object> getSession(){
		return this.session;
	}
	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}
	
	public javax.servlet.http.HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(javax.servlet.http.HttpServletResponse response) {
		this.response = response;
	}

	
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UserAction() {
		// TODO Auto-generated constructor stub
	}
	
	//处理用户注册
	public String registerUser() throws Exception{
		int uid = IdCreator.getIntegerId();		//创建id
		Connection con = MyConnector.getConnection();	//创建链接
		String selectsql = "select * from user where username=?";
		PreparedStatement psselect = con.prepareStatement(selectsql);
		psselect.setString(1, md5Code.getMD5(username));
		ResultSet rs = psselect.executeQuery();
		if (rs.next()) {
			addFieldError("existError", "您输入的账号已被注册！");
			return "exist";
		}else{
			String sql = "insert into user values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, uid);
			ps.setString(2, nickname);
			ps.setString(3, md5Code.getMD5(username));
			ps.setString(4, md5Code.getMD5(password));
			int i=ps.executeUpdate();
	        if(i==0){
	        	addFieldError("registerError", "注册出错，请稍后再试！");
	            return INPUT;
	        }
	        return "registersuccess";
		}
	}
	
	public void validateUpdateUser() {
		User cuser = (User)session.get("currentUser");
		if (cuser==null) {
			addFieldError("notlogin", "您似乎还没有登录吧~");
		}
	}
	//更新用户资料信息
	public String updateUser() throws Exception{
		
		Connection con = MyConnector.getConnection();	//创建链接
		String checksql = "select username from user where uid<>? and username=?";
		PreparedStatement pscheck = con.prepareStatement(checksql);
		pscheck.setString(1, uid);
		pscheck.setString(2, md5Code.getMD5(username));
		ResultSet rs = pscheck.executeQuery();
		if (rs.next()) {
			addFieldError("existError", "您输入的账号已被注册！");
			return INPUT;
		}else{
			String sql = "update user set nickname=?,username=?,password=? where uid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, nickname);
			ps.setString(2, md5Code.getMD5(username));
			ps.setString(3, md5Code.getMD5(password));
			ps.setString(4, uid);
			int a = ps.executeUpdate();
			if (a!=0) {
				currentUser.setId(Integer.parseInt(uid));
				currentUser.setNickname(nickname);
				currentUser.setUsername(username);
				currentUser.setPassword(password);
				session.replace("currentUser", currentUser);
				System.out.println("______________资料更新完成________________");
				return SUCCESS;
			}
		}
		return INPUT;
	}
	
	public String outUser() throws Exception{
		session.remove("currentUser");
		session.remove("currentAdmin");
		return "out";
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return super.execute();
	}

}
