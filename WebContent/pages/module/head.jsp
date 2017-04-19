<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>头部</title>



<style type="text/css">

	#navigator-background{
		background-color: #000000;
		text-align:center;
		width: 100%;
	}

	#navigator-background a{
		display: inline-block;
		text-decoration: none;
		padding: 5px 20px 5px 20px;
		color: #EEEEEE;
	}
	
	#navigator-background span{
		color: #EEEEEE;
	}
	
	#navigator-background a:HOVER{
		background-color: gray;
	}
	
	#navigator{
		width: 60%;
		text-align: left;
		margin-left: auto;
		margin-right: auto;
		display: inline-block;
	}
	
	#login-register{
		text-align: right;
		width: 20%;
		display: inline-block;
	}
	
	#login-register a{
		padding: 5px 10px 5px 10px;
	}

	
	
	
</style>

<script type="text/javascript">
	var navi = {
			"index":{
				"url":"/HouseSearcher/index.jsp",
				"text":"首页"
			},
			"all-houses":{
				"url":"/HouseSearcher/pages/house-list.jsp",
				"text":"所有住房"
			},
			"collections":{
				"url":"/HouseSearcher/house/hosue-collection",
				"text":"我的收藏"
			}
	}
	
	//未登录导航栏显示登录|注册
	var nologin = function(){
		$('#login-register').html('<a href="/HouseSearcher/pages/register.jsp">注册</a><span>|</span><a href="/HouseSearcher/pages/module/login.jsp">登录</a>');
	}
	
	var logout = function(){
			$.ajax({
				type : 'POST',
				url : '/HouseSearcher/user/logout',
				success:function(data){
					if(data['responseCode']==1){
						//退出成功,修改页面头部内容显示
						nologin();
					}else {
						alert('退出失败！');
					}
				},
				error:function(){
					alert('退出失败！');
				}
			})
	}
	
	
$(document).ready(function () {
	
	
	/*获取用户session*/
	$.ajax({
		type:'POST',
		url: '/HouseSearcher/user/islogin',
		success:function(data){
			if (data['responseCode']==1) {
				var user = data['user'];
				var phone = user['phone'];
				var name = user['firstName'];
				var nick = user['nickName'];
				var uname = name!=''?name:nick!=''?nick:phone;
				$('#login-register').html('<a>'+uname+'</a>'+
  					'|<a href="javascript:logout()" id="logout">退出</a>'+
  					'|<a href="/HouseSearcher/pages/module/modify-user-info.jsp">修改</a>');
			}else {
				nologin()
			}
		},
		error: nologin()
	})
	
	/*初始化导航栏*/
	$("#navigator").html();
	for(var key in navi){
		var elementInfo = navi[key];
		var element = document.createElement("a");
		$(element).attr("href",elementInfo["url"]);
		$(element).text(elementInfo["text"]);
		$("#navigator").append(element);
	}
	
	
	
	
})




</script>


</head>
<body>
	<div id="navigator-background">
		<div class="" id="navigator"></div>
		<div id="login-register"></div>
	</div>
</body>
</html>