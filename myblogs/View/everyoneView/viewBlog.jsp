<%@ page language="java" import="java.util.*,cc.bean.*,cc.connection.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看博客</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/viewBlogCssFolder/viewBlogCss.css">
	<link rel="stylesheet" type="text/css" href="css\allPageCssFolder\mouseCss.css">
	<script type="text/javascript" src="js\loginJsFolder\loginJs.js"></script>
	<script type="text/javascript" src="js\allPageJsFolder\jquery-1.7.2.js"></script>
	<script type="text/javascript" src="js\allPageJsFolder\jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js\allPageJsFolder\mouseClick.js"></script>

  </head>
  
  <body>
  	<!-- 背景图片 -->
	<img width="100%" height="100%" style="z-index:-100;position:fixed;left:0;top:0" src="img\viewBlogImg\kakasi.jpg">
    <div class="allFather">
    	<%
    		String id = request.getParameter("id");
    	 %>
    	<%
    		String sqlFirst = "select * from blogs where id='" + id + "'";
    	    		Blog blogFirst = new QueryOp().queryOneBlog(sqlFirst);
    	    			if(blogFirst == null){
    	    				out.println("<div class='b_blogs'>没有此篇文章</div>");
    	   				}else{
    	   					//阅读数加一
    	    				String readPlusSql = "update blogs set readCount += 1 where id ='" + id + "'";
    	    				new UpdateOp().updateBlogPrefence(readPlusSql);
    	    				//获取文章的内容
    	    				String sql = "select * from blogs where id='" + id + "'";
    	    				Blog blog = new QueryOp().queryOneBlog(sql);
    	%>
   		<div class="tittle">
   			<h1><%=blog.getTittle() %></h1>
   		</div>
   		<div class="tongji">
   			<div class='blog_time'>
   				<img alt='time' src='img\\blogsMainImg\\time2.png' width='22px' height='20px' style="vertical-align: middle;"> 
   				<%=blog.getDate() %>
    		</div>
    		<div class='blogs_read'>
    			<img alt='time' src='img\\blogsMainImg\\read.png' width='23px' height='16px' style="vertical-align: middle;"> 
    			<%=blog.getReadCount() %>次阅读
    		</div>
    		<div class='blogs_likes'>
    			<a href="javascript:sendRequestByPost()" title="点赞">
    			<img alt='time' src='img\\blogsMainImg\\likes2.png' width='20px' height='20px' style="vertical-align: middle;"></a> 
    			<span id="likesId"><%=blog.getLikes() %></span>个点赞
    		</div>
   		</div><br>
   		<div class="mainContent">
   			<%=blog.getMainContent() %>
   		</div>
   		<%
   		}
   		 %>
    </div>
  </body>
  <script type="text/javascript">
  	//ajax请求servlet
	function sendRequestByPost() {
		//定义异步请求对象
		var xmlReq;
		//检测浏览器是否直接支持ajax
		if (window.XMLHttpRequest) {//直接支持ajax
			xmlReq = new XMLHttpRequest();
		} else {//不直接支持ajax
			xmlReq = new ActiveObject('Microsoft.XMLHTTP');
		}
		//设置回调函数
		xmlReq.onreadystatechange = function() {
			if (xmlReq.readyState == 4 && xmlReq.status == 200) {
				//获取服务器的响应值
				var result = xmlReq.responseText;
				//后续操作
				var likeId = document.getElementById("likesId");
				
				if(result != "error"){
					alert("点赞成功");
					likeId.innerHTML = result;
				}else alert("点赞失败");
			}
		};
		//创建异步Post请求
		var url = "servlet/updateLikesServlet";
		xmlReq.open("POST", url, true);
		xmlReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		
		//发送请求
		var blogId = getQueryString("id");
		//alert(blogId);
		var data = "blogId=" + blogId;
		xmlReq.send(data);
	}
	//从url中获取参数值
	function getQueryString(name) {
  		var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
  		var r = window.location.search.substr(1).match(reg);
  		if (r != null) {
    		return unescape(r[2]);
  		}
  		return null;
	}
  </script>
</html>
