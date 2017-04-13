<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>注册账户</title>
<%@ include file="module/references.txt" %>



<script type="text/javascript" >
$(document).ready(function(){
	$("#sub").click(function(){
		var phone = $("#phone").val();
		if(!(/^1[34578]\d{9}$/.test(phone))){ 
	        alert("手机号码有误，请重填");  
	        return false; 
	    }
		
		var pwd = $("#pwd").val();
		if(pwd==undefined||pwd==null||pwd==""){
			alert("请输入密码！")
			return false;
		}
		
		var repwd = $("#repwd").val();
		
		if(pwd!=repwd){
			alert("两次密码不一致!");
			return false;
		}
	})
})
	
</script> 
<style type="text/css">
	li {
	width: 100%;
	padding:0px;
	height: 30px;
	}
	li input {
	height: 30px;
	width: 100%;
}

</style>

</head>
<body>
<div class="registContainer" style="width: 30%; margin-top: 100px; margin-left: auto; margin-right: auto;" >
  <h2>账号注册</h2>
  <hr style="color" />
  <form>
    <div class="form-group">
      <label for="inputdefault">手机号</label>
      <input class="form-control" id="phone" type="text">
    </div>
    
    <div class="form-group">
      <label for="inputdefault">密码</label>
      <input class="form-control" id="pwd" type="password">
    </div>
    
    <div class="form-group">
      <label for="inputdefault">确认密码</label>
      <input class="form-control" id="repwd" type="password">
    </div>
    <button type="submit" id="sub" class="btn" style="background-color:#39AC6A; width:100%; color: white; letter-spacing: 7px;" ><b>立即注册</b></button>
  </form>
</div>
</body>
</html>