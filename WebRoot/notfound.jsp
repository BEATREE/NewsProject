<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isErrorPage="true"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>404 | 页面未找到</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 引入CSS和JS文件 -->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script src="js/jquery.js"></script>

  </head>
  
  <body>
    	<div class="container-fluid" id="navmain">
		<div class="row">
			<img class="logo" alt="新闻上传系统" src="img/newslogo.png">
			<div class="col-md-12">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link" href="#" >网站首页</a></li>
					<li class="nav-item" ><a class="nav-link active" href="#" >页面404啦</a></li>
				</ul>

			</div>
		</div>
	</div>
  		<center style="margin-bottom: 36px;">
  		<img alt="图片也没找到。。。/委屈" src="img/notfound.gif" >
  		<h3>页面404咯~你访问的页面不存在</h3>
  		<br>
  		<h5><a href="javascript:;" class="re" onclick="javascript:location.reload();">刷新本页</a>
  		<a style="margin-left: 16px;" href="#" class="home">网站首页</a></h5>
  		<br>
  		通过搜索把你想找的新闻给揪出来吧...
  		</center>
  		<jsp:include page="footer.html"></jsp:include>
  </body>
</html>
