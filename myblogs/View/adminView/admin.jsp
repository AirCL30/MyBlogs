<%@ page language="java" import="java.util.*,cc.bean.*,cc.connection.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>adminPage</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css\adminCssFolder\adminCss.css">
	<link rel="stylesheet" type="text/css" href="css\allPageCssFolder\mouseCss.css">
	<script type="text/javascript" src="js\loginJsFolder\loginJs.js"></script>
	<script type="text/javascript" src="js\allPageJsFolder\jquery-1.7.2.js"></script>
	<script type="text/javascript" src="js\allPageJsFolder\jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js\allPageJsFolder\mouseClick.js"></script>

  </head>
  
  <body>
  	<!-- 背景图片 -->
	<img width="100%" height="100%" style="z-index:-100;position:fixed;left:0;top:0" src="img\adminImg\006.jpg">
  	<h1 style="text-align: center;margin-top: 50px;color: white;">管理员界面</h1>
    <div class="mainDiv">
    	<div class="partDiv">
    		<a href="View/adminView/writeBlogs.html" target="_blank">
  			<div class="write_div" id="writeDiv">
  				写博客
  			</div>
  			</a>
  		</div>
  		<div class="partDiv">
  			<a href="View/adminView/blogsManage.jsp" target="_blank">
  			<div class="write_div" id="blogsMDiv">
  				<span class="blogsMSpan">管理博客</span>
  			</div>
  			</a>
  		</div>
  		<div class="partDiv">
  			<a href="View/adminView/messagesManage.jsp" target="_blank">
  			<div class="write_div" id="messMDiv">
  				管理留言
  			</div>
  			</a>
  		</div>
  		<div class="backMainDiv">
  			<a href="blogsMain.jsp"><img alt="回到首页" src="img/adminImg/Home.png" width="80px" height="80px"><br>
  			回到首页
  			</a>
  		</div>
  	</div>
  </body>
</html>
