<%@page import="cc.connection.QueryOp"%>
<%@page import="cc.bean.Blog"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TestAJAX.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div id="mainDiv">
    	<%
    		//查询前5条
    		String sql = "select top 5 * from blogs";
    		Blog[] blogs = new QueryOp().queryOneKindBlog(sql);
    		for(int i = 0;i < blogs.length;i ++){
    			if(i == 6){
    				break;
    			}
    			out.println("<div>" + blogs[i].getTittle() + "</div>");
    		}
    	 %>
    	 <div id="6"></div>
    	 <div id="insertDiv"></div>
    	 <div id="tips">下滑加载更多</div>
    	 <button onclick="getMoreBlogs()">点击加载更多</button>
    </div>
  </body>
    <script type="text/javascript">
  	//ajax请求servlet
	function getMoreBlogs() {
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
				if(result == "kong"){
					var tipsDiv = document.getElementById("tips");
					tipsDiv.innerHTML = "<span style='color:red;'>没有更多内容了</span>";
				}else{
				//找到insertDiv的前一个兄弟节点，将其删除
				var insertDiv = document.getElementById("insertDiv");
				var frontDiv = insertDiv.previousSibling.previousSibling;
				//将获取到的内容写到前一个节点中
				frontDiv.innerHTML = result;
				//在insertDiv前再创建一个div
				var mainDiv = document.getElementById("mainDiv");
				var newDiv = document.createElement("div");
				newDiv.id = (parseInt(frontDiv.id) + 5);
				mainDiv.insertBefore(newDiv, insertDiv);
				//再在insertDiv前插入一个text保证格式正确
				var txtField = document.createElement("text");
				mainDiv.insertBefore(txtField, insertDiv);
				}
			}
		};
		//创建异步Post请求
		var url = "servlet/MoreBlogsServlet";
		xmlReq.open("POST", url, true);
		xmlReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		
		//找到insertDiv的前一个兄弟节点，取出其中的id值
		var insertDiv = document.getElementById("insertDiv");
		var nowDiv = insertDiv.previousSibling.previousSibling;
		alert(nowDiv.id);
		
		//发送请求
		xmlReq.send("startRow=" + nowDiv.id);
	}
  </script>
</html>
