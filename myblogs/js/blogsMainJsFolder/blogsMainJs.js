//显示时间
function showTime() {
	var Today = new Date();
	var year = Today.getFullYear();
	var month = Today.getMonth();
	var day = Today.getDate();
	var hours = Today.getHours();
	var minutes = Today.getMinutes();
	var seconds = Today.getSeconds();
	var time_string;
	month += 1;
	if (month < 10 && month > 0) {
		month = '0' + month;
	}
	if (day < 10) {
		day = '0' + day;
	}
	if (hours < 10) {
		hours = '0' + hours;
	}
	if (minutes < 10) {
		minutes = '0' + minutes;
	}
	if (seconds < 10) {
		seconds = '0' + seconds;
	}
	time_string = "当前时间<br/>↘↓↙<br/>" + year + '-' + month + '-' + day
			+ "<br/>" + hours + ":" + minutes + ":" + seconds;
	document.getElementById("time").innerHTML = time_string;
	setTimeout("showTime()", 1000);
}
// 鼠标移动到下拉列表上时，下方的控件往下移动
function divToBottom() {
	// 获取专栏和时间的id
	var zhuanlan = document.getElementById("zhuanlan");
	var time_li = document.getElementById("time_li");
	var b = document.getElementById("b");

	zhuanlan.onmouseover = function() {
		b.style.margin = '230px 10% 0 10%';
	};
	zhuanlan.onmouseout = function() {
		b.style.margin = '30px 10% 0 10%';
	};

	time_li.onmouseover = function() {
		b.style.margin = '130px 10% 0 10%';
	};
	time_li.onmouseout = function() {
		b.style.margin = '30px 10% 0 10%';
	};
}
// 监视浏览器分辨率，分辨率宽低于960px，把b的左、右两部分隐藏
function autoAdjustDiv() {
	var bodyWidth = document.body.clientWidth;
	var aDiv = document.getElementById("a_a");
	var bLfetDiv = document.getElementById("b_left");
	var bCenterDiv = document.getElementById("b_center");
	var bRightDiv = document.getElementById("b_right");
	if (bodyWidth <= 1188) {
		// 消失bLeft,bRight
		bLfetDiv.style.display = 'none';
		bRightDiv.style.display = 'none';
		//调整bCenter
		bCenterDiv.style.width = '100%';
	}else{
		// 显示bLeft,bRight
		bLfetDiv.style.display = 'inline-block';
		bRightDiv.style.display = 'inline-block';
		//调整bCenter
		bCenterDiv.style.width = '59%';
	}
}
//收款码操作
function moneyShow() {
	var moneyDiv = document.getElementById("money_div");
	var moneyImgWeiXin = document.getElementById("moneyImgWeiXin");
	var moneyImgAlipay = document.getElementById("moneyImgAlipay");
	
	moneyDiv.onmouseover = function() {
		moneyImgWeiXin.style.display = 'inline';
		moneyImgAlipay.style.display = 'inline';
	};
	moneyDiv.onmouseout = function() {
		moneyImgWeiXin.style.display = 'none';
		moneyImgAlipay.style.display = 'none';
	};
}
//AJAX请求博客
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
				var tipsDiv = document.getElementById("tipsDiv");
				tipsDiv.innerHTML = "<span style='color:red;font-size:130%;font-weight:bold;'>👆没有更多内容了👆</span>";
			}else{
			//找到insertDiv的前一个兄弟节点，将其删除
			var insertDiv = document.getElementById("insertDiv");
			var frontDiv = insertDiv.previousSibling.previousSibling;
			//将获取到的内容写到前一个节点中
			frontDiv.innerHTML = result;
			//在insertDiv前再创建一个div
			var b_centerDiv = document.getElementById("b_center");
			var newDiv = document.createElement("div");
			newDiv.id = (parseInt(frontDiv.id) + 5);
			b_centerDiv.insertBefore(newDiv, insertDiv);
			//再在insertDiv前插入一个text保证格式正确
			var txtField = document.createElement("text");
			b_centerDiv.insertBefore(txtField, insertDiv);
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
	//alert(nowDiv.id);
	
	//发送请求
	xmlReq.send("startRow=" + nowDiv.id);
}