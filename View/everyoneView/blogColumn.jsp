<%@page import="cc.connection.QueryOp"%>
<%@page import="cc.bean.Blog"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>专栏</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css\allPageCssFolder\mouseCss.css">
	<link rel="stylesheet" type="text/css" href="css/blogColumnCssFolder/blogColumnCss.css">
	<script type="text/javascript" src="js\loginJsFolder\loginJs.js"></script>
	<script type="text/javascript" src="js\allPageJsFolder\jquery-1.7.2.js"></script>
	<script type="text/javascript" src="js\allPageJsFolder\jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js\allPageJsFolder\mouseClick.js"></script>

</head>

<body ondragstart="return false" >
	<!-- 背景图片 -->
	<img width="100%" height="100%"
		style="z-index:-100;position:fixed;left:0;top:0"
		src="img\blogsMainImg\9.jpg">
	<div class="main_div">
		<%
			//设置编码
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			//接受页面传来的参数
			String kind = request.getParameter("kind");
		 %>
		<div class="big_tittle">
			<span><%=kind%></span>
		</div>
		<div class="item_big_div">
			<%
				//根据参数从数据库查询一类文章
				String sql = "select * from blogs where kind='" + kind + "'";
				Blog[] blogs = new QueryOp().queryOneKindBlog(sql);
				//如果该专栏没有文章，显示专栏为空
				if(blogs.length == 0){
			%>
				<div class="item_div">
					<div class="item_tittle">该专栏目前没有文章，快去催促博主更新吧！</div>
				</div>
			<% 
				}else{
					//该专栏有文章，则为其显示
					for(int i = 0;i < blogs.length;i ++){	
			 %>
			 <a href="View/everyoneView/viewBlog.jsp?id=<%=blogs[i].getId()%>">
			 	<div class="item_div">
			 		<div class="item_tittle"><%=blogs[i].getTittle()%></div>
			 		<div class="item_tongji">
						<div class='item_time'>
							<img alt='time' src='img\\blogsMainImg\\time2.png' width='22px' height='20px' style="vertical-align: middle;"> 
							<%=blogs[i].getDate()%>
						</div>
						<div class='item_read'>
							<img alt='time' src='img\\blogsMainImg\\read.png' width='30px' height='20px' style="vertical-align: middle;"> 
							<%=blogs[i].getReadCount()%>次阅读
						</div>
						<div class='item_likes'>
							<img alt='time' src='img\\blogsMainImg\\likes2.png'
								width='20px' height='20px' style='vertical-align: middle;'> <%=blogs[i].getLikes()%>个点赞
						</div>
					</div>
			 	</div>
			 </a>
			 <%
			 		}
			 	}
			  %>
		</div>
	</div>
</body>
</html>
