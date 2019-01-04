<%@page import="zzu.ruanko.util.MyConnector"%>
<%@page import="zzu.ruanko.util.IdCreator"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>新闻发布页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/nav_style.css">
<script type="text/javascript" src="js/responsive-nav.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>

</head>

<body>
	<%--引入导航页面 --%>
	<jsp:include page="aside.html"></jsp:include>
	<div role="main" class="main">
		<a href="#nav" class="nav-toggle">Menu</a>
		
		<div class="formdiv">
			<s:debug></s:debug>
			<h3>新闻发布</h3>
			<form role="form" action="<s:if test='nid==null'>publishNews</s:if><s:else>reeditNews</s:else>" method="post">
				<input name="nid" type="hidden" value="${nid }" />
				<div class="form-group form-inline">
					<label class="control-label col-md-2">标题：</label>
					<input name="title"	type="text" class="form-control col-md-4" placeholder="请输入新闻标题"
					value="${title }" required />
				</div>
				<div class="form-group form-inline">
					<label class="control-label col-md-2">类型：</label> 
					<select name="newstype"	class="form-control col-md-4" >
						<option>体育新闻</option>
						<option>娱乐新闻</option>
						<option>财经新闻</option>
						<option>科技新闻</option>
						<option>军事新闻</option>
					</select>
				</div>
				<div class="form-group form-inline">
					<label class="control-label col-md-2">来源：</label> 
					<input name="source" type="text" class="form-control col-md-4"  placeholder="请输入新闻来源，原创请输入“原创”"
					value="${source }" />
				</div>
				<div class="form-group form-inline">
					<label class="control-label col-md-2">作者：</label> 
					<input name="author" type="text" class="form-control col-md-4" placeholder="请输入新闻作者，原创请输入自己昵称" required 
					value="${author }" />
				</div>
				<div class="form-group form-inline">
					<label class="control-label col-md-2">发布人：</label> 
					<input name="username" type="text" class="form-control col-md-4" value="${currentUser.id }" readonly="readonly" />
					<small>&nbsp;&nbsp;这里显示的是您的ID标识</small>
				</div>
				<!-- <div class="form-group form-inline">
					<label class="control-label col-md-2">发布时间：</label> 
					<input name="createTime" type="date" class="form-control col-md-4">
				</div> -->
				<div class="form-group form-inline">
					<label class="control-label col-md-2">关键字：</label> 
					<input name="keywords" type="text" class="form-control col-md-4" placeholder="请输入关键字" 
					value="${keywords}"/>
				</div>
				<!-- JS放在此处，加快网页整体获取速度 -->
				<%-- <script src="//cdn.ckeditor.com/4.10.0/full/ckeditor.js"></script> --%>
				<div class="form-group form-inline">
					<label class="control-label col-md-2">内容：</label> 
					<textarea id="mytextarea" name="content" class="form-control col-md-4" required	>
					${content}
					</textarea>
				</div>
				<input class="btn btn-info col-md-3" type="reset" value="点击重置">
				<button class="btn btn-success col-md-3" type="submit" onclick="return alert('提交后文章不会直接发表\n需要在您的新闻页进行预览和二次审核才可发表！')">点击提交</button>
			</form>
		</div>
	</div>


	<%--实用js的自适应的导航栏菜单 --%>
	<script>
		var navigation = responsiveNav("foo", {
			customToggle : ".nav-toggle"
		});
		
		var myEditor = null;
		window.onload = function(){
		     ClassicEditor
		    .create(document.querySelector("#mytextarea"))
		    .then(editor => {
		        myEditor = editor;
		    })
		    .catch(error => {
		        console.error(error);
		    });
		}
	</script>
	<%-- <script type="text/javascript">
		CKEDITOR.replace( 'mytextarea', {
   		width: "1200px"
		});
	</script> --%>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</body>
</html>
