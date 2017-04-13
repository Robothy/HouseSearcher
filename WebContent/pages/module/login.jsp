<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="loninContainer" id="loninContainer">
         <div class="overlay_bg" id="loginOverlay"></div>
         <div id="dialog" class="panel_login animated btn-login bounceIn actLoginBtn" gahref="signin_pop_close">
            <i class="close" style="background: none" gahref="signin_pop_close"><img src="./dtl_files/close.png" width="52"></i>
            <div class="panel_info">
               <div class="panel_tab">
                  <div class="title">
                     <div class="fl">用户登录</div>
                     <label class="fr">没有账号？<a href="/HouseSearcher/pages/register.jsp" gahref="signin_pop_signup">马上注册</a></label>
                  </div>
                  <div class="clear"></div>
                  <div id="con_login_user">
                     <form action="file:///C:/Users/robothy/Desktop/details.htm" method="post">
                        <ul>
                           <li class="show-error" id="user-login-show-error">
                              <dd id="user-login-show-error_txt">用户名或密码错误</dd>
                           </li>
                           <li class="item userName"><i></i><input type="text" id="user_name" class="the_input users" placeholder="请输入手机号"></li>
                           <li class="item pwd"><i></i><input type="password" id="user_password" class="the_input password" placeholder="请输入登录密码"></li>
                           <li class="item checkVerimg" style="display:none"><input type="text" id="user_verimg" class="the_input ver-img" maxlength="4" placeholder="请输入验证码"><img class="verImg"></li>
                           <li class="li_01"><a href="https://passport.lianjia.com/register/resources/lianjia/forget.html?service=http://bj.lianjia.com/" gahref="signin_pop_find_password">找回密码</a></li>
                           <li><a class="login-user-btn" id="login-user-btn" gahref="signin_pop_submit">立即登录</a></li>
                        </ul>
                     </form>
                  </div>
               </div>
            </div>
            <div class="registered"></div>
         </div>
      </div>
	  
	  <div style="height:30px"></div>
</body>
</html>