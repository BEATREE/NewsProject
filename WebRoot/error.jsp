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
    
    <title>错误信息页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script src="js/jquery.js"></script>
	<!-- 定义error板块样式 -->
	<style type="text/css">
		.errordiv{
			width:68%;
			margin:13px auto;
			text-align: center;
		}
		.errordiv h1{
			margin-top:6px;
			font-family: "华文行楷";
		}
		.errordiv ul{
			list-style: none;
			margin-top:22px;
		}	
		.errordiv ul li{
			margin-top: 5px;
			font-size: 22px;
			color: red;
			font-weight: bold;
		}	
	</style>
  </head>
  <body>
  		
  		<jsp:include page="header.jsp"></jsp:include>
  		
  		<div class="errordiv">
  			<!-- 图片原创声明 -->
  			<h1>好吧，你都来到这儿了，那就说一下为什么吧~</h1>
   			<s:fielderror></s:fielderror>
   			<button class="btn btn-info" onclick="javascript:history.go(-1);">点击返回上一个页面</button>
   		</div>
   		<div class="position" style="height: 120px;"></div>
   		<jsp:include page="footer.html"></jsp:include>
  </body>
</html>
