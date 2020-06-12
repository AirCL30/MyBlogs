<%@page import="cc.bean.Message"%>
<%@ page language="java" import="java.util.*,cc.bean.*,cc.connection.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'viewMessages.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css\adminCssFolder\messageManageCss.css">

  </head>
  
  <body>
    <div class="managBlogs">
		<h1>管理留言</h1>
		<%
			String sql = "select * from messageBoardTable;";
			Message[] mess = new QueryOp().queryAllMess(sql);
			if (mess.length == 0) {
				out.println("<div class='b_blogs'>空空如也</div>");
			} else {
				for (int i = mess.length - 1; i >= 0; i--) {
					out.println("<div class='b_blogs'>"
							+ "留言序号-"
							+ (i+1)
							+ "&nbsp;&nbsp;&nbsp;留言时间："
							+ mess[i].getMessageTime()
							+ "&nbsp;&nbsp;&nbsp;留言内容："
							+ "<div class='mcontent'>"
							+ mess[i].getMessageContent()
							+ "</div>"
							+ "<Button onclick=\"sendRequestByPost('"
							+ mess[i].getMessageId() + "')\">删除</Button>"
							+ "</div>");
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
		var url = "servlet/DeleteMessageServlet";
		xmlReq.open("POST", url, true);
		xmlReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		
		//发送请求
		var messId = id;
		var data = "messId=" + messId;

		xmlReq.send(data);
	}
  </script>
</html>
