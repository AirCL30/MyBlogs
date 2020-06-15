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

<title>更新博客</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/writeBlogsCssFolder/writeBlogs.css">

<link rel="stylesheet" type="text/css" href="plugin/simditor-2.3.28/site/assets/styles/simditor.css" />
<link rel="stylesheet" type="text/css" href="css\allPageCssFolder\mouseCss.css">
<script type="text/javascript" src="plugin/simditor-2.3.28/site/assets/scripts/jquery.min.js"></script>
<script type="text/javascript" src="plugin/simditor-2.3.28/site/assets/scripts/module.js"></script>
<script type="text/javascript" src="plugin/simditor-2.3.28/site/assets/scripts/hotkeys.js"></script>
<!-- 不需要上传文件
	<script type="text/javascript" src="../plugin/simditor-2.3.28/site/assets/scripts/uploader.js"></script>
	 -->
<script type="text/javascript" src="plugin/simditor-2.3.28/site/assets/scripts/simditor.js"></script>
<script type="text/javascript" src="js\loginJsFolder\loginJs.js"></script>
<script type="text/javascript" src="js\allPageJsFolder\jquery-1.7.2.js"></script>
<script type="text/javascript" src="js\allPageJsFolder\jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js\allPageJsFolder\mouseClick.js"></script>
</head>

<body ondragstart="return false">
	<% 
		//接受参数
		String blogId = request.getParameter("id");
		//查出该博客内容
		String sql = "select * from blogs where id = " + blogId;
		Blog blog = new QueryOp().queryOneBlog(sql);
	%>
	<!-- 背景图片 -->
	<img width="100%" height="100%"
		style="z-index:-100;position:fixed;left:0;top:0"
		src="img\writeBlogsImg\001.jpg">
	<div class="main">
		<div class="tittle">
			<h1>写 篇 东 西 再 走 吧 ~</h1>
		</div>
		<div class="tittle_and_kind_div">
			<div class="tittle_div">
				<span>标题：</span> <input name="blogTittle" id="blogTittleId" value="<%=blog.getTittle()%>"/>
			</div>
			<div class="kind_div">
				<span>类别：</span> 
				<select name="blogKind" id="blogKindId">
					<option selected="selected" value="Java" id="JavaOption">&nbsp;Java&nbsp;</option>
					<option value="Java Web" id="JavaWebOption">&nbsp;Java Web&nbsp;</option>
					<option value="Android"  id="AndroidOption">&nbsp;Android&nbsp;</option>
					<option value="Linux" id="LinuxOption">&nbsp;Linux&nbsp;</option>
					<option value="Data Structure" id="DataStructureOption">&nbsp;Data Structure&nbsp;</option>
					<option value="Oracle" id="OracleOption">&nbsp;Oracle&nbsp;</option>
				</select>
			</div>
		</div>
		<div class="editor_div">
			<textarea id="editor" placeholder="Balabala"></textarea>
		</div>
		<div class="button_div">
			<button onclick="sendRequestByPost()">发表</button>
		</div>
	</div>
</body>
<script type="text/javascript">
	var editor = new Simditor({
		textarea : $('#editor')
	});
	editor.setValue("<%=blog.getMainContent()%>");
	/*
	var JavaOptionId = document.getElementById("JavaOption");
	var JavaWebOptionId = document.getElementById("JavaWebOption");
	var AndroidOptionId = document.getElementById("AndroidOption");
	var LinuxOptionId = document.getElementById("LinuxOption");
	var DataStructureOptionId = document.getElementById("DataStructureOption");
	var OracleOptionId = document.getElementById("OracleOption");
	if("<%=blog.getKind()%>" == "Java"){
		JavaOptionId.selected = "selected";
	}else if("<%=blog.getKind()%>" == "Java Web"){
		JavaWebOptionId.selected.selected = "selected";
	}else if("<%=blog.getKind()%>" == "Android"){
		AndroidOptionId.selected = "selected";
	}else if("<%=blog.getKind()%>" == "Linux"){
		LinuxOptionId.selected = "selected";
	}else if("<%=blog.getKind()%>" == "Data Structure"){
		DataStructureOptionId.selected = "selected";
	}else if("<%=blog.getKind()%>" == "Oracle"){
		OracleOptionId.selected = "selected";
	}
	*/
</script>
<script type="text/javascript">
//ajax请求servlet
	function sendRequestByPost() {
		if (!editor.getValue() || document.getElementById("blogTittleId").value == "") {
			alert("先输入内容，忘了？");
			return false;
		}
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
					alert("修改成功");
					window.location.href = "View/adminView/blogsManage.jsp";
				}else {
					alert("修改失败");
				}
			}
		};
		//创建异步Post请求
		var url = "servlet/UpdateBlogServlet";
		xmlReq.open("POST", url, true);
		xmlReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");	
		//发送请求
		var id = "<%=blogId%>";
		var tittle = document.getElementById("blogTittleId").value;
		var kind = document.getElementById("blogKindId").value;
		var content = editor.getValue();
		var data = "id=" + id + "&blogTittle=" + tittle + "&blogKind=" + kind + "&blogContent=" + content;
		xmlReq.send(data);
	}
</script>
</html>
