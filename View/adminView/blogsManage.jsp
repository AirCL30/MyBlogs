<%@ page language="java" import="java.util.*,cc.bean.*,cc.connection.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>管理博客</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css\adminCssFolder\blogsManageCss.css">
<link rel="stylesheet" type="text/css" href="css\allPageCssFolder\mouseCss.css">
	<script type="text/javascript" src="js\loginJsFolder\loginJs.js"></script>
	<script type="text/javascript" src="js\allPageJsFolder\jquery-1.7.2.js"></script>
	<script type="text/javascript" src="js\allPageJsFolder\jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js\allPageJsFolder\mouseClick.js"></script>
</head>

<body>
	<div class="managBlogs">
		<h1>管理博客</h1>
		<%
			String sql = "select * from blogs;";
			Blog[] blogs = new QueryOp().queryOneKindBlog(sql);
			if (blogs.length == 0) {
				out.println("<div class='b_blogs'>空空如也</div>");
			} else {
				for (int i = blogs.length - 1; i >= 0; i--) {
					out.println("<div class='b_blogs'>"
							+ "<a href='View/everyoneView/viewBlog.jsp?id="
							+ blogs[i].getId()
							+ "'>"
							+ "<div class='b_blogs_tittle'>"
							+ blogs[i].getTittle()
							+ "</div></a>"
							+ "<div class='b_blogs_tongji'>"
							+ "<div class='blog_time'>"
							+ "<img alt='time' src='img\\blogsMainImg\\time2.png' width='22px' height='20px' style='vertical-align: middle;'> "
							+ blogs[i].getDate()
							+ "</div>"
							+ "<div class='blogs_read'>"
							+ "<img alt='time' src='img\\blogsMainImg\\read.png' width='23px' height='16px' style='vertical-align: middle;'> "
							+ blogs[i].getReadCount()
							+ "次阅读"
							+ "</div>"
							+ "<div class='blogs_likes'>"
							+ "<img alt='time' src='img\\blogsMainImg\\likes2.png' width='20px' height='20px' style='vertical-align: middle;'> "
							+ blogs[i].getLikes()
							+ "个点赞"
							+ "</div>"
							+ "</div>"
							+ "<a href='View/adminView/updateBlog.jsp?id="+ blogs[i].getId() +"'><button>编辑</button></a> "
							+ "<Button onclick=\"sendRequestByPost('"
							+ blogs[i].getId() + "')\">删除</Button>" + "</div>");
				}
			}
		%>
	</div>
</body>
  <script type="text/javascript">
  	//ajax请求servlet
	function sendRequestByPost(id) {
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
				
				if(result == "success"){
					alert("删除成功");
					window.location.reload(true); //强制从服务器重新加载当前页面
				}else {
					alert("删除失败");
				}
			}
		};

		//创建异步Post请求
		var url = "servlet/deleteBlogServlet";
		xmlReq.open("POST", url, true);
		xmlReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		
		//发送请求
		var blogId = id;
		var data = "blogId=" + blogId;

		xmlReq.send(data);

	}
  </script>
</html>
