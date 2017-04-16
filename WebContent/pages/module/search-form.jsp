<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索框</title>
</head>
<body>
	<form class="form-inline" action="/HouseSearcher/house/search-houses.action" method="post">
	<div style="width: 100%; text-align: center;">
		<div style="width: 60%; margin-top: 100px; margin-left: auto; margin-right: auto;">
			<input type="text" style="float: left; width: 80%;" class="form-control" placeholder="请输入小区、租金等信息进行搜索">
			<button class="btn btn-default" style="color:#ffffff; letter-spacing:5px; float: left; width: 20%; background-color:#39AC6A;" type="submit">搜索</button>
    	</div>	
	</div>
</form>
</body>
</html>