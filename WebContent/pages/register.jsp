<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>注册账户</title>
      <%@ include file="module/references.txt" %>
      <script type="text/javascript" src="/HouseSearcher/js/Register.js"></script>
      <style type="text/css">
         .form-group{
         width: 100%;
         }
      </style>
   </head>
   <body>
      <div class="registContainer" style="width: 30%; margin-top: 100px; margin-left: auto; margin-right: auto;" >
         <h2>账号注册</h2>
         <hr style="color" />
         <div class="form-inline">
            <div style="margin-top: 15px;" class="form-group">
               <label style="">手机号</label><label style="float: right;" id="phone-check-info"></label><br>
               <input style="width: 100%;" class="form-control" id="phone" type="text">
            </div>
            <div style="margin-top: 15px;" class="form-group">
               <label for="inputdefault">密码</label><br>
               <input style="width: 100%;" class="form-control" id="pwd" type="password">
            </div>
            <div style="margin-top: 15px;" class="form-group">
               <label for="inputdefault">确认密码</label><label style="float: right;" id="pwd-check-info"></label><br>
               <input style="width: 100%;" class="form-control" id="repwd" type="password">
            </div>
            <br>
            <div style="margin-top: 15px;" class="form-group">
               <button type="button" id="sub" class="btn" style="background-color:#39AC6A; width:100%; color: white; letter-spacing: 7px;" ><b>立即注册</b></button>
            </div>
         </div>
      </div>
   </body>
</html>