package zzu.ruanko.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnector {
	
	private static String URL="jdbc:mysql://localhost:3306/newsdb?useUnicode=true&characterEncoding=utf-8";
	private static String USER="root";
	private static String PASSWORD="123456";
	private static Connection conn=null;
	
	public MyConnector() {
	}
	public static Connection getConnection(){
		
		
		 try {
			//1.加载驱动程序
			Class.forName("com.mysql.jdbc.Driver");
			//2.获得数据库链接
			conn=DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return conn;
	}
}
