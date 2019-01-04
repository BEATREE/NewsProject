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

<title>用户信息</title>

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
	<div role="main" class="main" style=" padding: 0 0;">
		<a href="#nav" class="nav-toggle">Menu</a>
		<div>
			<div class="container-fluid">
				<div class="row">
					<s:debug></s:debug>
					<div class="col-md-12">
						<h3>用户信息</h3>
						<table class="table table-hover">
				<thead>
					<tr>
						<th>id编号</th>
						<th>用户昵称</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#session.allUser" id="my" status="num">
						<tr <s:if test="#num.odd"> class="table-success" </s:if>
							<s:else>class="table-warning"</s:else>
						>
							<td>
								<s:property value="#my.id"/>
							</td>
							<td>
								<s:property value="#my.nickname"/>
							</td>
							
							<td>
								<a href="deleteUserAdmin?nid=${my.id }"><button class="btn btn-danger" onclick="return confirm('确定删除吗？\n\n该操作不可撤回！')"><i class="iconfont icon-shanchu"></i>&nbsp;删除</button></a>
							</td>
						</tr>
				</s:iterator>
			</tbody>
			</table>
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
