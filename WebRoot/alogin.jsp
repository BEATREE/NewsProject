<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<style type="text/css">
		body{
			background-image: url("img/background.jpg");
			background-size: cover;
			background-attachment: fixed;
		}
		.centerDiv{
			text-align:center;
			margin: 10% auto;
			width: 60%;
			font-size: 18px;
			padding-bottom: 3px;
		}
		.inputbox{
			border:2px solid white;
			padding:5px;
			border-radius: 3px;
			background: transparent;
		}
		.inputbox:FOCUS {
			box-shadow: 0 0 8px #00FFFF;
		}
	</style>

  </head>
  		<form action="loginAdmin" method="post">
  			<div class="centerDiv">
  				<h1>后台管理登录页</h1>
  				<br>
  				<span class="label">帐号：</span><input name="adminname" class="inputbox" type="text" placeholder="请输入您的管理员帐号"> 
  				<br><br>
  				<span class="label">密码：</span><input name="adminpassword" class="inputbox" type="password" placeholder="请输入密码"> 
  				<div style="height: 12px;"></div>
  				<input type="button" class="btn btn-info" value="返回主页">
  				<input type="submit" class="btn btn-success" value="点击登录" style="margin-left: 12px;">
  			</div>
  		</form>
  <body>
    	
  </body>
</html>
