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

<title>注册页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container main">
		<div class="row form">

			<form  action="registerUser" method="post">
				<div id="form-group">
					<label>昵称：</label> <input name="nickname" type="text"
						class="form-control"  placeholder="请输入您的昵称" required />
				</div>
				<div id="form-group">
					<label>帐号：</label> 
					<input name="username" type="text" class="form-control"  placeholder="请输入您的账号" required />
					<s:fielderror></s:fielderror>
				</div>
				<div id="form-group">
					<label>密码：</label> <input id="password" name="password" type="password"
						class="form-control" placeholder="请输入您的密码" required />
				</div>
				<div id="form-group">
					<label>重复密码：</label> <input id="password2" name="password2" type="password"
						class="form-control" placeholder="请重新输入您的密码" onkeyup="checkSame()" required />
						<div id="tishi"></div>
				</div>
				<br> 
				<a href="login.jsp"><input type="button" class="btn btn-info" value="前往登陆"></a>
				<input id="submit" type="submit" class="btn btn-primary" value="点击注册" disabled="disabled">
			</form>
		
		</div>
	</div>
	<jsp:include page="footer.html"></jsp:include>
	
	<script type="text/javascript">
		function checkSame(){
			var str1 = document.getElementById("password").value;
			var str2 = document.getElementById("password2").value;
			if( str1==str2 ){
				document.getElementById("tishi").innerHTML="<span style='color:green'>密码验证成功</span>";
                document.getElementById("submit").disabled = false;
			}else{
				document.getElementById("tishi").innerHTML="<span style='color:red'>两次密码不同！</span>";
                document.getElementById("submit").disabled = true;
			}
		}
	</script>
</body>
</html>
