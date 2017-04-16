<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>头部</title>

<%@ include file="references.txt" %>

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
	
	
	
</style>

<script type="text/javascript">
	var navi = {
			"index":{
				"url":"/HouseSearcher/index.jsp",
				"text":"首页"
			},
			"all-houses":{
				"url":"/HouseSearcher/house/search-houses.action",
				"text":"所有住房"
			},
			"collections":{
				"url":"/HouseSearcher/",
				"text":"我的收藏"
			}
	}
	
	
$(document).ready(function () {
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
		<div id="login-register"><a href="/HouseSearcher/pages/register.jsp">注册</a><span>|</span><a>登录</a></div>
	</div>
</body>
</html>