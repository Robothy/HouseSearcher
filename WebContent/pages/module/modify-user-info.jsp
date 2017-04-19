<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>注册账户</title>
      <style type="text/css">
         .form-group{
         width: 100%;
         }
      </style>
      
      <%@ include file="references.txt" %>
            
   </head>
   <body>
   	  <%@ include file="head.jsp" %>
   	  
   	  
   	  <script type="text/javascript">
   	  	$('#sub').on('click',function(){
   	  		//校验密码
   	  		pwd = $('#pwd').val();
   	  		repwd = $('#repwd').val();
   	  		firstName = $('#firstName').val();
   	  		nickName = $('#nickName').val();
   	  		if(pwd==''||repwd==''){
   	  			alert('密码不能为空！');
   	  			return;
   	  		}
   	  		
   	  		if(pwd!=repwd){
   	  			alert('两次密码不一致！');
   	  		}
   	  		
   	  		$.ajax({
   	  			type:'POST',
   	  			url:'/HouseSearcher/user/modify-user-info',
   	  			data:{pwd:pwd,firstName:firstName,nickName:nickName},
   	  			success:function(data){
   	  				if(data['responseCode']==1){
   	  					alert('信息保存成功！');
   	  				}else {
						alert('信息保存失败');
					}
   	  			},
   	  			error: function(){
   	  				alert('信息保存失败');
   	  			}
   	  		})
   	  		
   	  	})
   	  </script>
   	  
      <div class="registContainer" style="width: 30%; margin-top: 50px; margin-left: auto; margin-right: auto;" >
         <h2>修改个人信息</h2>
         <hr style="border-width: 2px; border-color:#39AC6A; "/>
         <div class="form-inline">
            <div style="margin-top: 15px;" class="form-group">
               <label style="">姓名</label><br>
               <input style="width: 100%;" class="form-control" id="firstName" type="text">
            </div>
            <div style="margin-top: 15px;" class="form-group">
               <label style="">昵称</label><br>
               <input style="width: 100%;" class="form-control" id="nickName" type="text">
            </div>
            <div style="margin-top: 15px;" class="form-group">
               <label for="inputdefault">新密码</label><br>
               <input style="width: 100%;" class="form-control" id="pwd" type="password">
            </div>
            <div style="margin-top: 15px;" class="form-group">
               <label for="inputdefault">确认密码</label><label style="float: right;" id="pwd-check-info"></label><br>
               <input style="width: 100%;" class="form-control" id="repwd" type="password">
            </div>
            <br>
            <div style="margin-top: 15px;" class="form-group">
               <button type="button" id="sub" class="btn" style="background-color:#39AC6A; width:100%; color: white; letter-spacing: 7px;" ><b>保存修改</b></button>
            </div>
         </div>
      </div>
   </body>
</html>