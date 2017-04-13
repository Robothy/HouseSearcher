(function(headerParameters){
	/*var loginHtml = '<div class="overlay_bg" id="loginOverlay"></div>'+
			'<div id="dialog" class="panel_login animated btn-login bounceIn actLoginBtn" gahref="signin_pop_close">'+
				'<i class="close" style="background: none" gahref="signin_pop_close"><img src="'+headerParameters.publichost+'/public/img/close.png" width="52" /></i>'+
				'<div class="panel_info">'+
					'<div class="panel_tab">'+
						'<div class="title">'+
							'<div class="fl">用户登录</div>'+
							'<label class="fr">还没有链家网账号？<a href="http://passport.lianjia.com/register/resources/lianjia/register.html?service=http://bj.lianjia.com/" gahref="signin_pop_signup">马上注册</a>'+
							'</label>'+
						'</div>'+
						'<div class="clear"></div>'+
						'<div id="con_login_user">'+
							'<form action="" method="post">'+
								'<ul>'+
									'<li class="show-error" id="user-login-show-error">'+
										'<dd id="user-login-show-error_txt">用户名或密码错误</dd>'+
									'</li>'+
									'<li class="item userName">'+
										'<i></i>'+
										'<input type="text" id="user_name" class="the_input users" placeholder="请输入手机号">'+
									'</li>'+
									'<li class="item pwd">'+
										'<i></i>'+
										'<input type="password" id="user_password" class="the_input password" placeholder="请输入登录密码">'+
									'</li>'+
									'<li class="item checkVerimg" style="display:none">'+
										'<input type="text" id="user_verimg" class="the_input ver-img" maxlength="4" placeholder="请输入验证码">'+
										'<img class="verImg">'+
									'</li>'+
									'<li class="li_01">'+
										'<a href="https://passport.lianjia.com/register/resources/lianjia/forget.html?service=http://bj.lianjia.com/" gahref="signin_pop_find_password">找回密码</a>'+
									'</li>'+
									'<li><a class="login-user-btn" id="login-user-btn" gahref="signin_pop_submit">立即登录</a></li>'+
								'</ul>'+
							'</form>'+
						'</div>'+
					'</div>'+
				'</div>'+
				'<div class="registered"></div>'+
			'</div>';
			
	var registerHtml = 
			
	$('#loninContainer').html(loginHtml);*/
	
	var loginDoing = false;//登录弹层－防重复提交中间变量
	
	function submitLogin(btnSelf){
        if(loginDoing == true) return false;

        loginDoing = true;
        //var btnSelf = $(this);
        btnSelf.addClass("disabled");
        $("#user-login-show-error").hide();
        if($.trim($("#user_name").val()) == "" || $.trim($("#user_password").val()) == ""){
            btnSelf.removeClass("disabled");
			loginDoing = false;
            return false;
        }

        var requestParams = {
            username: $.trim($("#user_name").val()),
            password: $.trim($("#user_password").val()),
            verifycode: ""
        };

        if($("#remember_login").prop("checked") == true){//下次自动登
            requestParams.remember = 1;
        }

        lianjiaCasManager.login(requestParams,
            function(e) {
                //登录成功
                window.location.reload();
            },
            function() {
                //登录失败
                loginDoing = false;
                btnSelf.removeClass("disabled");
                $("#user-login-show-error_txt").text("用户名或密码错误");
                $("#user-login-show-error").css({
                    'display': 'list-item'
                }).show();
                console.info("执行失败");
            }
        );
    }
    //login
    $("#loninContainer").on("click", "#login-user-btn", function(){
        $.ajax({
            url:'http://bj.lianjia.com/api/checkuserbeforelogin',
            type:"get",
            dataType:"jsonp",
            data:{
                mobile:$.trim($("#user_name").val())
            },
            success:function(response){
                if(response.code == 1){//非黑名单用户－执行登录
                    submitLogin($(this));
                }
                else{//黑名单用户－不予登录
                    $("#user-login-show-error_txt").text(response.msg);//"由于您发表不当言论，已被加入黑名单"
                    $("#user-login-show-error").css({
                        'display': 'list-item'
                    }).show();
                }
            },
            error : function(response,status){
                console.log(status);
            }
        })
        
    });

    //login enter
    $("#loninContainer").on("keyup","#user_name,#user_password,#user_verimg",function(event){
        if(event.keyCode === 13){
            submitLogin($("#login-user-btn"));
        }
    });

    //登录窗口关闭
    $("#loninContainer").on('click',"#dialog i.close",function(){
        $("#dialog, #loginOverlay").css({//登录弹层
            "display" : "none"
        });
    });
	
})(headerParameters);