function checkLogin(){
	var uname = document.getElementById("userName").value;
	var upwd = document.getElementById("userPwd").value;
	if(uname == "" || upwd == ""){
		alert("咋又忘了输入完整的信息？");
		return false;
	}
	return true;
}