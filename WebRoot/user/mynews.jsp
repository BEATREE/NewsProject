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

<title>我的新闻</title>

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
						<h3>您发布的新闻</h3>
						<table class="table table-hover">
				<thead>
					<tr>
						<th>id编号</th>
						<th>文章标题<span style="color:red;">(点击标题预览或查看)</span></th>	
						<th>新闻类型</th>
						<th>发布时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#session.myNews" id="my" status="num">
						<tr <s:if test="#num.odd"> class="table-success" </s:if>
							<s:else>class="table-warning"</s:else>
						>
							<td>
								<s:property value="#my.id"/>
							</td>
							<td>
								<span class="newsList"> <a style="color: #666;text-decoration: none; font-size:16px;"  href="readNews?nid=${my.id }" target="_blank"><s:property value="#my.title"/></a>
								</span>
							</td>
							<td>
								<s:property value="#my.newstype"/>
							</td>
							<td>
								<s:property value="#my.createTime"/>
							</td>
							<td>
							<s:if test="#my.state==1">
								<a href="stateNews?nid=${my.id }&state=0"><button class="btn btn-success" onclick="return confirm('是否确定将新闻切换为“待发布”状态？\n\n切换后将等待管理员进行审核！')"><i class="iconfont icon-kechakan"></i>&nbsp;已发布</button></a>
							</s:if><s:else>
								<button class="btn btn-warning" onclick="return alert('您无法将文章切换为发布状态！')"><i class="iconfont icon-bukechakan"></i>&nbsp;待发布</button>
							</s:else>
							</td>
							<td>
								<a href="editNews?nid=${my.id }"><button class="btn btn-info"><i class="iconfont icon-bianji"></i>&nbsp;编辑</button></a>
								<a href="deleteNews?nid=${my.id }"><button class="btn btn-danger" onclick="return confirm('确定删除吗？\n\n该操作不可撤回！')"><i class="iconfont icon-shanchu"></i>&nbsp;删除</button></a>
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
