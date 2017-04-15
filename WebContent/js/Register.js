$(document).ready(function(){
         	
         	var isPhoneValid = false;
         	var isPwdValid = false;
         	
         	//校验电话号码是否合法，包括后台校验和前台校验
         	$("#phone").on("change",function(){	//输入了电话号码
         		isPhoneValid = false;
         		var phone = $("#phone").val();
         		if(phone.length>=11){
         			if((/^1[34578]\d{9}$/.test(phone))){ //手机号输入格式正确
         				$.ajax({
         					type:"POST",
         					data:{phone:$("#phone").val(),pwd:$("#pwd").val()},
         					url:"/HouseSearcher/user/check-user.action",
         					dataType:"json",
         					beforeSend(){
         						$("#phone-check-info").html("<img style=\"display:inline-block; vertical-align: middle;\" src=\"/HouseSearcher/icons/ajax-loader.gif\" />")
         					},
         					success:function(data){
         						if(data["result"]=="1"){//可以使用
         							$("#phone-check-info").html('<span style="color:green;">√ 可以注册</span>')
         							isPhoneValid = true;
         						}else{//已被注册
         							$("#phone-check-info").html('<span style="color:red;">× 已被注册</span>')
         						}
         					},
         					error:function(){
         						$("#phone-check-info").html('<span style="color:red;">× 系统错误</span>');
         					},
         					complete:function(){
         						$("#phone-check-info").find("img").remove();
         					}
         					
         				})
         			}else{	//手机号输入格式不正确
         				;
         			}
         		}
         	});
         	
         	//输入了密码或者重复密码，校验两次输入的密码是否一致
         	$("#pwd,#repwd").on('change',function(){
         		isPwdValid = false;
         		var pwd = $("#pwd").val();
         		var repwd = $("#repwd").val();
         		//标志是否两个框都有内容
         		var typed = pwd!='' && repwd!='';
         		if(typed){
         			if (pwd ==repwd) {//两次验证一致
         				$("#pwd-check-info").html('<span style="color:green;">√ 验证成功！</span>');
         				isPwdValid = true;
         			}else{
         				$("#pwd-check-info").html('<span style="color:red;">√ 两次密码不一致！</span>');
         			}
         		}
         	});
         	
         	//点击输入框清空提示内容
         	$("#pwd,#repwd").on('click',function(){
         		$("#pwd-check-info").html('');
         	});
         	
         	$("#phone").on('click',function(){
         		$("#phone-check-info").html('');
         	});
         	
         	
         	$("#sub").click(function(){
         		if (!(isPhoneValid || isPwdValid)) { //检查校验是否成功
         			return;
         	}
         		
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
         		
         	$.ajax({
         		type:"POST",
         		url:"/HouseSearcher/user/register.action",
         		data:{phone:$("#phone").val(),pwd:$("#pwd").val()},
         		success:function(data){
         			var result = data["result"];
         			
         			if (result=="0") {//用户已存在
         				alert("该用户已注册！");
         			}else if (result=="1") {//注册成功
         				$("body").html('<div style="position: absolute; width:100%; height:100%; background-color:black; opacity:0.5;-moz-opacity:0.5;filter:alpha(opacity=50); z-index=1000;">'+
         					'<div style="border-top:solid 3px green; width:200px; background-color:white; margin-top:150px; margin-left:auto; margin-right:auto;">'+
         					'√ 注册成功,<span id="timer">5</span>秒后<a href="/HouseSearcher/index.html">跳转</a>'+
         					'</div>'+
         				'</div>');
         				for(var i=4; i>-1; i--){
         					setTimeout(function(){
         						$("#timer").text(i.toString());
         					},1000);
         				}
         				window.location = '/HouseSearcher/index.html';
         			}else {
         				alert("系统内部错误，请稍后重试！");
         			}
         		},
         		error:function(){//发生错误
         			alert("系统内部错误，请稍后重试！");
         		}
         	});
         	});
         });