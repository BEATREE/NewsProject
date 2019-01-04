<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人资料</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/nav_style.css">
	<link rel="stylesheet" type="text/css" href="iconfont/iconfont.css">
	<script src="js/responsive-nav.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>

  </head>
  
  <body>
    <%--引入导航页面 --%>
	<jsp:include page="aside.html"></jsp:include>
	<div role="main" class="main">
		<a href="#nav" class="nav-toggle">Menu</a>
		<div class="formdiv">
			<h3>个人资料</h3>
			<form role="form" action="updateUser" method="post">
					<div class="form-group form-inline">
						<label class="control-label col-md-2">您的ID：</label>
						<input name="uid" type="text" class="form-control col-md-3" value="${session.currentUser.id}" readonly="readonly">
					</div>
					<div class="form-group form-inline">
						<label class="control-label col-md-2">您的昵称：</label>
						<input name="nickname" type="text" class="form-control col-md-3" value="${session.currentUser.nickname}">
					</div>
					<div class="form-group form-inline">
						<label class="control-label col-md-2">您的帐号：</label>
						<input name="username" type="text" class="form-control col-md-3" value="${session.currentUser.username}">
					</div>
					<div class="form-group form-inline">
						<label class="control-label col-md-2">您的密码：</label>
						<input name="password" type="text" class="form-control col-md-3" value="${session.currentUser.password}">
					</div>

					<div class="form-group col-md-5">
					<button class="btn btn-primary" type="submit" style="float: right;" onclick=" return confirm('您正在修改您的个人信息，是否确定提交？')"><i class="iconfont icon-bianji"></i>  点击修改</button>
					<br>
					<small>点击按钮后将会更改您的个人信息！</small>

					</div>
				</form>
		</div>
		
	</div>


	<%--实用js的自适应的导航栏菜单 --%>
	<script>
		var navigation = responsiveNav("foo", {
			customToggle : ".nav-toggle"
		});
	</script>
  </body>
</html>
