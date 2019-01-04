<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>个人主页</title>

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
		<div>
			<div class="container-fluid">
				<div class="row">
					<s:debug></s:debug>
					<div class="col-md-12">
						<h3>您的后台主页</h3>
						<br>
						<div class="row">
							<div class="col-md-6">
								<span class="badge badge-default">新闻发布</span> <br>
								<br> 
								<button type="button" class="btn btn-info" onclick="window.location.href='user/publish.jsp'">
								<i class='iconfont icon-bianji'></i>  点击前往编辑新闻</button>
							</div>
							<div class="col-md-6">
								<span class="badge badge-default">个人信息</span> <br>
								<br>
								<div class="form-group form-inline">
									<label class="control-label col-md-3">您的ID：</label>
									<input name="id" type="text" class="form-control col-md-5" value="${session.currentUser.id}" readonly>
								</div>
								<div class="form-group form-inline">
									<label class="control-label col-md-3">您的昵称：</label>
									<input name="nickname" type="text" class="form-control col-md-5" value="${session.currentUser.nickname}" readonly>
								</div>
								<div class="form-group form-inline">
									<label class="control-label col-md-3">您的帐号：</label>
									<input name="username" type="text" class="form-control col-md-5" value="${session.currentUser.username}" readonly>
								</div>
								<div class="form-group form-inline">
									<label class="control-label col-md-3">您的密码：</label>
									<input name="password" type="text" class="form-control col-md-5" value="${session.currentUser.password}" readonly>
								</div>
								<button type="button" class="btn btn-info col-md-3 col-offset-2" onclick="window.location.href='user/profile.jsp'">
								<i class='iconfont icon-bianji'></i>  前往编辑</button>
							</div>
						</div>
					</div>
				</div>
			</div>
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
