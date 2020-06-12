<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>博主简介</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.mainDiv{
			text-align: center;
			color: white;
		}
		.tittleDiv{
			font-weight: bold;
			font-size: 200%;
			margin-top: 50px;
		}
		.contentDiv{
			margin-top: 50px;
			font-size: 120%;
		}
	</style>
  </head>
  
  <body ondragstart="return false">
  	<!-- 背景图片 -->
	<img width="100%" height="100%" style="z-index:-100;position:fixed;left:0;top:0" src="img\bloggerProfileImg\naruto001.jpg">
    <div class="mainDiv">
    	<div class="tittleDiv">
    		博主简介
    	</div>
    	<div class="contentDiv">
    		博主菜鸡CS本科生、火影迷一枚，喜欢动手捣鼓点东西，感兴趣的同学可以联系博主，互相学习，博主手机号：15690868618；QQ：1562727813：微信同手机号。
    	</div>
    </div>
  </body>
</html>
