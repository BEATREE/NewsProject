package zzu.ruanko.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import zzu.ruanko.bean.User;
import zzu.ruanko.util.MD5Code;
import zzu.ruanko.util.MyConnector;

public class LoginAction extends ActionSupport implements SessionAware{
	
	//定义涉及到的相关变量
	private String userName,userPassword; 
	private Map<String, Object> session;
	User currentUser = new User();
	
	
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}
	public Map<String, Object> getSession() {
		return session;
	}

	public String getUserName(){
		return this.userName;
	}
	public void setUserName(String userName){
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	//无参构造函数
	public LoginAction() {
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public String execute() throws Exception {//用于进行登陆操作的处理
		//获取数据库链接
		Connection conn = MyConnector.getConnection();
		//List<User> uList = new ArrayList<User>();
		try {
			String sql = "select * from user where username=? and password=?";
			//预编译代码
			PreparedStatement ps = conn.prepareStatement(sql);
			MD5Code md5Code = new MD5Code();	//MD5加密处理
			ps.setString(1, md5Code.getMD5(userName));
			ps.setString(2, md5Code.getMD5(userPassword));//填入数据
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				currentUser.setId(rs.getInt("uid"));
				currentUser.setNickname(rs.getString("nickname"));
				currentUser.setUsername(userName);
				currentUser.setPassword(userPassword);
				session.put("currentUser", currentUser);
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
	
	
	@Override
	public void validate() {	//拦截器
		// TODO Auto-generated method stub
		super.validate();
	}
	

}
