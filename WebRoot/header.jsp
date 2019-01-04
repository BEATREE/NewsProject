<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>header.jsp</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<div class="container-fluid" id="navmain">
		<div class="row">
			<img class="logo" alt="新闻上传系统" src="img/newslogo.png">
			<div class="col-md-12">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link" href="">网站首页</a></li>
					<li class="nav-item"><a class="nav-link" href="type.jsp">新闻分类</a></li>
					<s:if test="#session.currentUser==null">
						<li class="nav-item"><a class="nav-link" href="login.jsp">登录页面</a>
						</li>
					</s:if>
					<s:else>
						<li class="nav-item"><a class="nav-link" href="user/">个人中心</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="outUser">安全退出</a>
						</li>
					</s:else>
					<s:if test="#session.currentAdmin!=null">
						<li class="nav-item"><a class="nav-link" href="admin/index.jsp">管理员主页</a>
						</li>
					</s:if>
				</ul>

			</div>
		</div>
	</div>

	<script src="js/nav.js"></script>
</body>
</html>
