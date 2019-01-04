<%@page import="zzu.ruanko.util.SimplifyText"%>
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
    
    <title>网站首页</title>
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
  			
  		<div>
  		<div class="rightPart">
  			<iframe allowtransparency="true" frameborder="0" width="195" height="96" scrolling="no" src="//tianqi.eastday.com/plugin/widget_v1.html?sc=1&z=1&t=0&v=0&d=1&bd=0&k=&f=&q=1&a=1&c=54511&w=195&h=96&align=center"></iframe>
  			<div class="singlebox">
				<h3>搜索新闻</h3>
				<form action="searchNews" method="post">
					<div class="form-group form-inline">
						<input name="title" type="text" class="form-control" placeholder="请输入新闻名称或关键词" >
						<button type="submit" class="btn btn-success" >搜索</button>
					</div>
				</form>
			</div>
			<div class="singlebox">
				<h3>热门排行</h3>
				<s:if test="#session.hotList.size()>5">
					<s:iterator value="#session.hotList" id="hl" begin="0" end="4">
						<p class="newsList"><a href="readNews?nid=${hl.id }" target="_blank"><s:property value="#hl.title"/></a></p>
					</s:iterator>
				</s:if><s:else>
					<s:iterator value="#session.hotList" id="hl">
						<p class="newsList"><a href="readNews?nid=${hl.id }" target="_blank"><s:property value="#hl.title"/></a></p>
					</s:iterator>
				</s:else>
			</div>
		</div>
  		<div class="AllNews">
	  		<ul>
		  		<s:iterator value="#session.newsList" id="nl">
		  			<li class="newsbox"> 
		  				<h3><a href="readNews?nid=${nl.id }" target="_blank"><s:property value="#nl.title"/></a></h3> 
		  				 <div class="lesscontent">
		  				 <s:if test="#nl.content.length()>160">
						    <s:property value='#nl.content.substring(0,160)' escape="false" />
						    ...<a href="readNews?nid=${nl.id }" target="_blank">查看全文</a>
						 </s:if>  
						 <s:else>     
						     <s:property value='#nl.content' escape="false"/>
						 </s:else> 
						 </div>
		  				<div class="info">
		  				<span class="ntype">新闻类型：<s:property value="#nl.newstype"/></span>
		  				<span class="ndate">发表者：<s:property value="#nl.username"/></span>
		  				<span class="ndate">发表时间：<s:property value="#nl.createTime"/></span>
		  				<span class="ndate">热度：<s:property value="#nl.click"/></span>
		  				</div>
		  			</li>
		  		</s:iterator>
	  		</ul>
  		</div>
  		
  		</div>
  		<jsp:include page="footer.html"></jsp:include>
  </body>
</html>