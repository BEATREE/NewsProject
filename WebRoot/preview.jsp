<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>${currentNews.title }</title>
    
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
   		<jsp:include page="header.jsp"></jsp:include>
  		<s:debug></s:debug>
  		<div class="col-md-12">
  			<div class="row">
  				<div class="col-md-8">
  					<div class="topmessage">
  					<h3 style="border-left:5px red solid;"><s:property value="#session.currentNews.title"/></h3>
  					<span class="info">来自用户：${currentNews.username }</span>
  					<span class="info">文章来源：${currentNews.source }</span>
  					<span class="info">原文编辑：${currentNews.author }</span>
  					<span class="info">新闻类型：${currentNews.newstype }</span>
  					</div>
  					<hr>
  					<s:property value="#session.currentNews.content" escape="false"/>
  					<hr>
  					<span style="float:right;">文章关键字为：<b><s:property value="#session.currentNews.keywords"/></b></span>
  				</div>
  				<div class="rightbox col-md-4">
  				<h3>搜索新闻</h3>
				<form action="searchNews" method="post">
					<div class="form-group form-inline">
						<input name="title" type="text" class="form-control" placeholder="请输入新闻名称" >
						<button type="submit" class="btn btn-success" >搜索</button>
					</div>
				</form>
  				
  				<s:if test="#session.aboutList.size()!=0"><!-- 判断是否存在相关新闻 -->
  					<h3>其他热门${currentNews.newstype }</h3>
  					<s:iterator value="#session.aboutList" id="al">
  					<div class="aboutNews"><a href="readNews?nid=${al.id }"><s:property value="#al.title"/></a></div>
  					</s:iterator>
  				</s:if><s:else>
  					<br>
  					<h5>还没有相关新闻，不如你去发表一篇吧~</h5>
  					<h5><a href="user/publish.jsp">>>>前往发表&lt;&lt;&lt;</a></h5>
  				</s:else>
  				
  				</div>
  			</div>
  		</div>
  		
  		<jsp:include page="footer.html"></jsp:include>
  </body>
</html>
