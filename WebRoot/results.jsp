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
    
    <title>关于 ${title } 的搜索结果</title>
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
	  		<s:if test="#session.resultNews.size!=0">
	  			<h2 style="text-align: left;border-left:4px solid red;padding-left:6px;">以下是关于${title }的搜索结果</h2>
		  		<s:iterator value="#session.resultNews" id="rn">
		  			<li class="newsbox"> 
		  				<h3><a href="readNews?nid=${rn.id }" target="_blank"><s:property value="#rn.title"/></a></h3> 
		  				 <div class="lesscontent">
		  				 <s:if test="#rn.content.length()>160">
						    <s:property value='#rn.content.substring(0,160)' escape="false"/>
						    ...<a href="readNews?nid=${rn.id }" target="_blank">查看全文</a>
						 </s:if>  
						 <s:else>     
						     <s:property value='#rn.content' escape="false"/>
						 </s:else> 
						 </div>
		  				<div class="info">
		  				<span class="ntype">新闻类型：<s:property value="#rn.newstype"/></span>
		  				<span class="ndate">发表者：<s:property value="#rn.username"/></span>
		  				<span class="ndate">发表时间：<s:property value="#rn.createTime"/></span>
		  				<span class="ndate">热度：<s:property value="#rn.click"/></span>
		  				</div>
		  			</li>
		  		</s:iterator>
		  		</s:if>
		  		<s:else>
		  			<h2>抱歉，没找到关于${title }新闻</h2>
		  			<img src="img/notfound.gif">
		  		</s:else>
	  		</ul>
  		</div>
  		
  		</div>
  		<div style="height: 100px;"></div>
  		<jsp:include page="footer.html"></jsp:include>
  </body>
</html>