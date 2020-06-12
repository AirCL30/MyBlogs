<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>留言板</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/messageBoardCssFolder/messageBoardCss.css">
	<script type="text/javascript" src="js/messageBoardJsFolder/messageBoardJs.js"></script>
  </head>
  
  <body ondragstart="return false">
    <!-- 背景图片 -->
	<img width="100%" height="100%" style="z-index:-100;position:fixed;left:0;top:0" src="img\messageBoardImg\zilaiye.jpg">
    <div class="mainDiv">
    	<h1>留言板</h1>
    	<div class="formDiv">
    		<form action="servlet/InsertMessageServlet" method="post">
    			<textarea rows="10" cols="50" placeholder=" 向博主说点什么吧！" name="messageContent" id="messageContentId"></textarea><p><br>
    			<button onclick="return checkForm()">留言</button>
    		</form>
    	</div>
    </div>
  </body>
</html>
