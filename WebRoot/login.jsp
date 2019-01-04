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

<title>登陆页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>

<body>
	
	<jsp:include page="header.jsp" flush="true"></jsp:include>
	<div class="container main">
		<div class="row form">
			<form action="doLoginAction" method="post">
				<div id="form-group">
					<label>帐号：</label> <input name="userName" type="text"
						class="form-control"  placeholder="请输入您的账号" required />
				</div>
				<div id="form-group">
					<label>密码：</label> <input name="userPassword" type="password"
						class="form-control" placeholder="请输入您的密码" required />
				</div>
				<br> 
				<a href="register.jsp"><input type="button" class="btn btn-info" value="前往注册"></a>
				<input type="submit" class="btn btn-primary" value="点击登陆">
			</form>

		</div>
	</div>
	<jsp:include page="footer.html"></jsp:include>
</body>
</html>
