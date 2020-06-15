function checkForm() {
	var message = document.getElementById("messageContentId");
	if(message.value == ""){
		alert("留言内容不能为空！");
		return false;
	}
	return true;
}