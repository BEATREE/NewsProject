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
    
    <title>新闻分类</title>
    
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
  		
  		<div class="newstype">
  			<ul>
  				<li class="types" onclick="showChoose('ty')">体育新闻</li>
  				<li class="types" onclick="showChoose('yl')">娱乐新闻</li>
  				<li class="types" onclick="showChoose('cj')">财经新闻</li>
  				<li class="types" onclick="showChoose('kj')">科技新闻</li>
  				<li class="types" onclick="showChoose('js')">军事新闻</li>
  				
  			</ul>
  		</div>
  		
  		<!-- 财经新闻板块 -->
  		<div id="cjnews" class="newstype hiddenbox">
  			<h1>以下为财经新闻：</h1>
  			<ul>
  			<s:iterator value="#session.newsList" id="selectNews">
  			<s:if test="#selectNews.newstype.equals('财经新闻')">
  				<a href="readNews?nid=${selectNews.id }" target="_blank"><li class="chooseNews">
					<div class="postType">
						${selectNews.newstype }
					</div>
					<div class="postTitle">
					<h2>${selectNews.title }</h2>
					</div>
					<div class="chooseInfo">
						发布时间：${selectNews.createTime }  发布者：${selectNews.username }
					</div>
				</li>
				</a>
			</s:if>
			</s:iterator>
  			</ul>
  		</div>
  		<!-- 体育新闻板块 -->
  		<div id="tynews" class="newstype hiddenbox">
  			<h1>以下为体育新闻：</h1>
  			<ul>
  			<s:iterator value="#session.newsList" id="selectNews">
  			<s:if test="#selectNews.newstype.equals('体育新闻')">
  				<a href="readNews?nid=${selectNews.id }" target="_blank"><li class="chooseNews">
					<div class="postType">
						${selectNews.newstype }
					</div>
					<div class="postTitle">
					<h2>${selectNews.title }</h2>
					</div>
					<div class="chooseInfo">
						发布时间：${selectNews.createTime }  发布者：${selectNews.username }
					</div>
				</li>
				</a>
			</s:if>
			</s:iterator>
  			</ul>
  		</div>
  		<!-- 娱乐新闻 -->
  		<div id="ylnews" class="newstype hiddenbox">
  			<h1>以下为娱乐新闻：</h1>
  			<ul>
  			<s:iterator value="#session.newsList" id="selectNews">
  			<s:if test="#selectNews.newstype.equals('娱乐新闻')">
  				<a href="readNews?nid=${selectNews.id }" target="_blank"><li class="chooseNews">
					<div class="postType">
						${selectNews.newstype }
					</div>
					<div class="postTitle">
					<h2>${selectNews.title }</h2>
					</div>
					<div class="chooseInfo">
						发布时间：${selectNews.createTime }  发布者：${selectNews.username }
					</div>
				</li>
				</
			</s:if>
			</s:iterator>
  			</ul>
  		</div>
  		<!-- 军事新闻 -->
  		<div id="jsnews" class="newstype hiddenbox">
  			<h1>以下为军事新闻：</h1>
  			<ul>
  			<s:iterator value="#session.newsList" id="selectNews">
  			<s:if test="#selectNews.newstype.equals('军事新闻')">
  				<a href="readNews?nid=${selectNews.id }" target="_blank"><li class="chooseNews">
					<div class="postType">
						${selectNews.newstype }
					</div>
					<div class="postTitle">
					<h2>${selectNews.title }</h2>
					</div>
					<div class="chooseInfo">
						发布时间：${selectNews.createTime }  发布者：${selectNews.username }
					</div>
				</li>
				</a>
			</s:if>
			</s:iterator>
  			</ul>
  		</div>
  		<!-- 科技新闻 -->
  		<div id="kjnews" class="newstype hiddenbox">
  			<h1>以下为科技新闻：</h1>
  			<ul>
  			<s:iterator value="#session.newsList" id="selectNews">
  			<s:if test="#selectNews.newstype.equals('科技新闻')">
  				<a href="readNews?nid=${selectNews.id }" target="_blank"><li class="chooseNews">
					<div class="postType">
						${selectNews.newstype }
					</div>
					<div class="postTitle">
					<h2>${selectNews.title }</h2>
					</div>
					<div class="chooseInfo">
						发布时间：${selectNews.createTime }  发布者：${selectNews.username }
					</div>
				</li>
				</a>
			</s:if>
			</s:iterator>
  			</ul>
  		</div>
  		
  		<jsp:include page="footer.html"></jsp:include>
  		
  		<script type="text/javascript">
  			 //1、随机色的函数-rgb
	        function getRandomColor(){
	        	var a = document.getElementsByClassName("types");
	            var colors = new Array();	/* 定义随机颜色数组 */
	            colors[0] = "#87CEFA";
	            colors[1] = "#40E0D0";
	            colors[2] = "#00EEEE";
	            colors[3] = "#66CD00";
	            colors[4] = "#fb9e7d";
				for(var i=0;i<a.length;i++){
					var chooser =Math.round(Math.random()*4) ;
					
					a[i].style.backgroundColor=colors[chooser];
				}
	        }
	        window.onload = getRandomColor();
	        
	        //2、用于显示不同的新闻信息
	    	function showChoose(a){
	    		var hiddenboxs = document.getElementsByClassName("hiddenbox");
	    		//上一行代码获取类名相同的组件数组
	    		for(var i=0;i<hiddenboxs.length;i++){
	    			hiddenboxs[i].style.visibility = 'hidden';
	    			hiddenboxs[i].style.height = 0;
	    		}//设置隐藏属性
	    		
	    		var newstype2 = a +"news";		//获取要显示的div的id
	    		var divplace = document.getElementById(newstype2);//获取div
	    		divplace.style.visibility = 'visible';
	    		divplace.style.height = 'auto';//设置相关属性
	    	}
  		</script>
  </body>
</html>
