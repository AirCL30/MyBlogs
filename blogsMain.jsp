<%@ page language="java" import="java.util.*,cc.bean.*,cc.connection.*" pageEncoding="UTF-8"%>
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

<title>冰淇淋梦工厂</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css\blogsMainCssFolder\blogsMainCss.css">
<link rel="stylesheet" type="text/css" href="css\allPageCssFolder\mouseCss.css">
<script type="text/javascript" src="js\blogsMainJsFolder\blogsMainJs.js"></script>
<script type="text/javascript" src="js\allPageJsFolder\jquery-1.7.2.js"></script>
<script type="text/javascript" src="js\allPageJsFolder\jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js\allPageJsFolder\mouseClick.js"></script>
</head>

<body onload="showTime(),divToBottom(),autoAdjustDiv(),moneyShow()" ondragstart="return false" onresize="autoAdjustDiv()">
	<!-- 背景图片 -->
	<img width="100%" height="100%" style="z-index:-100;position:fixed;left:0;top:0" src="img\blogsMainImg\003.jpg">
	<!-- mainPage与footer一块来控制页面底部的footer -->
	<div class="mainPage">
		<!-- 最上边的主页、专栏、日记、登录、神秘空间等 -->
		<div class="a">
			<div class="a_a" id="a_a">
				<img alt="冰淇淋梦工厂" src="img\blogsMainImg\blogsNameImg.png" width="80%" height="65%">
				<img alt="冰淇淋梦工厂" src="img\blogsMainImg\basketball01.gif" width="18%" height="65%">
				<ul id="a_a_ul">
					<li class="a_a_ul_li"><a href="#">主站</a></li>
					<li class="a_a_ul_li">
						<ul id="zhuanlan">
							<li><a href="#">代码人生</a></li>
							<li>↘↓↙</li>
							<a href="View/everyoneView/blogColumn.jsp?kind=Java" target="_blank"><li class="zhuanlan_item">Java</li></a>
							<a href="View/everyoneView/blogColumn.jsp?kind=Java Web" target="_blank"><li class="zhuanlan_item">Java Web</li></a>
							<a href="View/everyoneView/blogColumn.jsp?kind=Android" target="_blank"><li class="zhuanlan_item">Android</li></a>
							<a href="View/everyoneView/blogColumn.jsp?kind=Linux" target="_blank"><li class="zhuanlan_item">Linux</li></a>
							<a href="View/everyoneView/blogColumn.jsp?kind=Data Structure" target="_blank"><li class="zhuanlan_item">数据结构</li></a>
							<a href="View/everyoneView/blogColumn.jsp?kind=Oracle" target="_blank"><li class="zhuanlan_item">Oracle</li></a>
						</ul>
					</li>
					<li class="a_a_ul_li"><a href="#">博主项目</a></li>
					<li class="a_a_ul_li"><a href="#">日记</a></li>
					<li class="a_a_ul_li"><a href="#">神秘空间</a></li>
					<li class="a_a_ul_li"><a href="View/loginView/login.html" target="_blank">登录</a></li>
					<li class="a_a_ul_li" id="time_li"><span id="time">时间</span></li>
				</ul>
			</div>
		</div>
	
		<!-- 下边的所有内容都在b里 -->
    	<div class="b" id="b">
    		<!-- 中间的内容，左边为b_left，中间为b_center，右边为b_right -->
    		<!-- 左边为博客、项目、留言的条数统计，和博主的各种账号 -->
    		<div class="b_left" id="b_left">
    			<div class="b_left_top">
    				<!-- 先是一个以图片为背景的div，然后接一张头像，然后是统计内容 -->
    				<div class="b_left_top_img_div">
    				</div>
    				<div class="b_left_top_touxiang_div">
    					<a href="View/adminView/admin.jsp" target="_blank">
    					<img alt="头像" src="img\blogsMainImg\touxiang.png" width="90px" height="90px"></a><br/><br/>
    					<span id="ice_cream">冰淇淋</span>
    				</div>
    				<div class="b_left_top_tongji_div">
    					<div class="tongji">
    						<span class="tongji_number_1"><%
    							Blog[] blogNumber = new QueryOp().queryOneKindBlog("select * from blogs");out.println(blogNumber.length);
    						%></span><br/>
    						<span>博客</span>
    					</div>
    					<div class="tongji">
    						<span class="tongji_number_2">0</span><br/>
    						<span>项目</span>
    					</div>
    					<div class="tongji">
    						<span class="tongji_number_3">
    						<% Message[] messages = new QueryOp().queryAllMess("select * from messageBoardTable");out.println(messages.length); %>
							</span><br/>
    						<span>留言</span>
    					</div>
    				</div><br/>
    				<div class="b_left_top_account_div">
    					<!-- GitHub、CSDN、 知乎-->
    					<div class="account">
    						<a href="https://github.com/IceCreamFactory" target="_Blank">
    						<img alt="Github" src="img\blogsMainImg\github.png"  width="50px" height="50px"/></a>
    					</div>
    					<div class="account">
    						<a href="https://me.csdn.net/C__orz" target="_Blank">
    						<img alt="Github" src="img\blogsMainImg\csdn.png"  width="50px" height="50px"/></a>
    					</div>
    					<div class="account">
    						<a href="https://www.zhihu.com/people/IceCreamFactory" target="_Blank">
    						<img alt="Github" src="img\blogsMainImg\zhihu.png"  width="50px" height="50px"/></a>
    					</div>
    				</div>
    			</div>
    		</div>
    		<!-- 中间为最新的博客 -->
    		<div class="b_center" id="b_center">
    			<%
    				//首先显示前5条
    				String sql = "select top 5 * from blogs;";
    			    Blog[] blogs = new QueryOp().queryOneKindBlog(sql);
    			    if(blogs.length == 0){
    			    	out.println("<div class='b_blogs'><div class='b_blogs_tittle'>啥也没有</div></div>");
    			    }else{
    			    	for(int i = 0;i < blogs.length;i ++){
    			 %>
    			 <div class='b_blogs' id="b_blogsId">
    			    <a href="View/everyoneView/viewBlog.jsp?id=<%=blogs[i].getId()%>" target="_blank">
    			    	<div class="b_blogs_tittle" id="b_blogs_tittleId"><%=blogs[i].getTittle()%></div>
    			    </a>
    			    <div class='b_blogs_tongji'>
    			    	<div class='blog_time'>
    			    		<img alt='time' src='img\\blogsMainImg\\time2.png' width='22px' height='20px' style='vertical-align: middle;'>
    			    		<%=blogs[i].getDate()%>
    			    	</div>
    			    	<div class='blogs_read'>
    			    		<img alt='read' src='img\\blogsMainImg\\read.png' width='23px' height='16px' style='vertical-align: middle;'>
    			    		<%=blogs[i].getReadCount()%> 次阅读
    			    	</div>
    			    	<div class='blogs_likes'>
    			    		<img alt='like' src='img\\blogsMainImg\\likes2.png' width='20px' height='20px' style='vertical-align: middle;'>
    			    		<%=blogs[i].getLikes()%> 个点赞
    			    	</div>
    			    </div>
    			 </div>
    			<%
    			    	}
    			%>
    			<div id="6"></div>
    			<div id="insertDiv"></div>
    			<div id="tipsDiv" onclick="getMoreBlogs()">👉点击我加载更多博客👈</div>
    			<% 
    			    }
    			%>
    		</div>
    		<!-- 右边展示公告栏和更多功能 -->
    		<div class="b_right" id="b_right">
    			<!-- 致敬木叶 -->
    			<div class="b_right_muye">
    				木叶飞舞之处，火亦生生不息
    			</div>
    			<div class="b_right_gonggao">
    				<div class="gonggao_tittle">
    					公告栏
    				</div>
    				<div class="gonggao_text">
    					冰淇淋梦工厂个人博客试运行阶段，大家发现Bug请给博主留言呦🎈
    				</div>
    			</div>
    			<div class="b_right_otherwork">
    				<div class="otherwork_tittle">
    					更多功能
    				</div>
    				<div class="otherwork_work">
    					<div class="otherwork_subwork">
    						<a href="View/everyoneView/messageBoard.jsp" target="_blank">
    						<img alt="留言" src="img\blogsMainImg\liuyan.png" width="20px" height="20px" style="vertical-align: middle;"> 留言</a>
    					</div>
    					<div class="otherwork_subwork" id="money_div">
    						<img alt="收款码" src="img/blogsMainImg/weixin.png" width="150px" height="150px" id="moneyImgWeiXin">
    						<img alt="收款码" src="img/blogsMainImg/alipay.jpg" width="150px" height="150px" id="moneyImgAlipay">
    						<img alt="打赏" src="img\blogsMainImg\money.png" width="30px" height="30px" style="vertical-align: middle;"> 打赏
    					</div>
    					<div class="otherwork_subwork">
    						<a href="View/everyoneView/bloggerProfile.jsp" target="_blank">
    						<img alt="简介" src="img\blogsMainImg\me.gif" width="30px" height="40px" style="vertical-align: middle;"> 博主简介</a> 
    					</div>
    				</div>
    			</div>
    		</div>
   	 	</div>
    </div>
    <div class="backTopDiv">
    	<a href="#top"><img alt="返回顶部" src="img/blogsMainImg/huojian.png" width="100px" height="120px"></a>
    </div>
    <footer><a href="http://www.beian.miit.gov.cn" style="color:white;text-decoration:none;">Copyright@IceCreamFactory<br/>豫ICP备19035079号</a></footer>
</body>
</html>
