$(function(){
	/**************************
            关注｜取消关注此房
    ***************************/
	    //关注｜取消关注此房
	    $("#notice_focus").click(function(){
	        var isFocused = $(this).hasClass("notice-done");
	        var houseRentId = $(this).attr("houseRentId");
	        var btn = $(this);
	        if(isFocused){//已关注，可取消关注
	            $.ajax({
	                url : "/zufang/delMyFavorRent.json",
	                type : "post",
	                data : {
	                	houseRentId : houseRentId
	                },
	                dataType : "json",
	                success : function(response){	                    
	                    if(response.status == "ok"){//取消关注成功
	                        btn.removeClass("notice-done").text("关注此房");
	                    }
	                    else{//失败，原因通常为用户未登录，弹登录层
	                        $("#dialog, #loginOverlay").css({
	                            "display" : "block"
	                        });
	                    }
	                }
	            });
	        }
	        else{//未关注，可关注
	            $.ajax({
	                url : "/zufang/addMyFavorRent.json",
	                type : "post",
	                data : {
	                	houseRentId : houseRentId
	                },
	                dataType : "json",
	                success : function(response){
	                    if(response.status == "ok"){//关注成功
	                        btn.addClass("notice-done").text("已关注");
	                    }
	                    else{//失败，原因通常为用户未登录，弹登录层
	                        $("#dialog, #loginOverlay").css({
	                            "display" : "block"
	                        });
	                    }
	                }
	            });
	        }
	    }).mouseenter(function(){
	    	if($(this).hasClass("notice-done")){
	    		$(this).text("取消关注");
	    	}
	    }).mouseout(function(){
	    	if($(this).hasClass("notice-done")){
	    		$(this).text("已关注");
	    	}
	    });
    

    /*********************
            房源相册
    **********************/
	    //向前翻
	    function albumPrev(step){
	        if(init.album_current_Index > 0){
	            init.album_current_Index += step;
	            $("#view_big_img").attr("src", $("#album-view-wrap ul li img").eq(init.album_current_Index).attr("data-large"));
	            $("#houseTag").text($("#album-view-wrap ul li img").eq(init.album_current_Index).attr("img-title"));
	            $("#currentIndex").text(init.album_current_Index+1);

	            var wrapML = parseInt($("#album-view-wrap ul").css("marginLeft"));
	            if(wrapML<0){
	                var ml = parseInt($("#album-view-wrap ul").css("marginLeft"));
	                var prevPR = parseInt($("#album-view-wrap ul li").eq(init.album_current_Index-1).css("paddingRight"));
	                var imgW = parseInt($("#album-view-wrap ul li img").eq(init.album_current_Index).css("width"));
	                var _ml = init.album_current_Index>3 ? ((ml+(imgW+prevPR)*Math.abs(step)) + "px") : 0;
	                $("#album-view-wrap ul").css({marginLeft : _ml});
	            }
	        }
	    }
	    //向后翻
	    function albumNext(step){
	        if(init.album_current_Index < $("#album-view-wrap ul li img").length-1){
	            init.album_current_Index += step;
	            $("#view_big_img").attr("src", $("#album-view-wrap ul li img").eq(init.album_current_Index).attr("data-large"));
	            $("#houseTag").text($("#album-view-wrap ul li img").eq(init.album_current_Index).attr("img-title"));
	            $("#currentIndex").text(init.album_current_Index+1);

	            if(init.album_current_Index > 3){
	                var ml = parseInt($("#album-view-wrap ul").css("marginLeft"));
	                var prevPR = parseInt($("#album-view-wrap ul li").eq(init.album_current_Index-1).css("paddingRight"));
	                var imgW = parseInt($("#album-view-wrap ul li img").eq(init.album_current_Index).css("width"));
	                $("#album-view-wrap ul").css({marginLeft : (ml-(imgW+prevPR)*step) + "px"});
	            }
	        }
	    }
	    //小图点击
	    $("#album-view-wrap ul li").on("click", "img", function(){
	        var lastIndex = init.album_current_Index;
	        var nowIndex = $("#album-view-wrap ul li img").index($(this));
	        var step = nowIndex - lastIndex;
	        if(step == 0) return false;
	        step>0 ? albumNext(step) : albumPrev(step);
	    });
	    //小图向前按钮点击
	    $("#ctrl-btn-prev").click(function(){
	        albumPrev(-1);
	    });
	    //小图向后按钮点击
	    $("#ctrl-btn-next").click(function(){
	        albumNext(1);
	    });
	    //大图点击事件 － 弹层大图轮播
	    var zoneViewData = [];
	    $("#album-view-wrap li img").each(function(){
	        zoneViewData.push({
	            src : $(this).attr("data-large"),
	            title : $(this).attr("img-title")
	        });
	    });
	    $("#view_big_img").click(function(){
	        var option = {
	            theme: 'poplayer',
	            currentIndex: init.album_current_Index,
	            groupTitle: zoneViewData[init.album_current_Index].title,
	            src: zoneViewData
	        };
	        $('body').zoomViewer(option);
	    });

    /************************
    		内容导航
    *************************/
	    //页面级导航头 － 滚动到顶部置顶，当前项高亮
	    var navTop = $("#res-nav").position().top;
	    var moduleList = [];
	    $(".js_content").each(function(){
	        moduleList.push($(this).attr("id"));
	    });
	    $(window).scroll(function(){
	        //窗口滚动时的置顶｜归位
	        if($(document).scrollTop() >= navTop){
	            $("#res-nav").css({
	                position: 'fixed',
	                top: '0px',
	                left: $(".js_content:first").offset().left,
	                zIndex: 99,
	                width: '1000px',
	                marginTop: 0
	            });
	        }
	        else{
	            $("#res-nav").css({
	                position : 'static',
	                top : navTop + "px",
	                marginTop : "15px"
	            });
	        }


	        //滚到模块时导航当前项高亮
	        $.each(moduleList, function(index, node){
	            if($(document).scrollTop() >= ($("#"+node).position().top - $("#res-nav").outerHeight())){
	                $("#res-nav li a.on").removeClass("on");
	                $("#res-nav li a").eq(index).addClass("on");
	            }
	        });
	    });
		//导航选项点击事件
		$("#res-nav li a").click(function(){
			$("#res-nav li a.on").removeClass("on");
			$(this).addClass("on");
			$("#res-nav").css({
				position: 'fixed',
				top: '0px',
				zIndex: 99,
				width: '1000px'
			});

			var index = $("#res-nav li a").index($(this));
			$(window).scrollTop($(".js_content").eq(index).position().top - $("#res-nav").outerHeight());
		});


	/************************
			房源图片
	*************************/
		//显示“查看更多图片”
		if($("#houseImg .list img").length>6){
			$("#btn_photoMore").show();
		}
		//点击“查看更多图片”
		$("#btn_photoMore").click(function(){
			$("#houseImg .container").css({"maxHeight":'none'});
			$("#btn_photoMore").hide();
		});


	/*****************************
			同小区｜同板块成交记录
	******************************/
		//Tab切换
		$("#dealRecord .title span").click(function(){
	        var index = $("#dealRecord .title span").index($(this));
	        $("#dealRecord .title span.select").removeClass("select");
	        $(this).addClass("select");

	        $("#dealRecord div.js_dealRecordCon").css({display:'none'}).eq(index).css({display:'block'});
	    });


    /*************************
    		联系经纪人
    **************************/
	    //页面加载时初始化经纪人列表
	    //buildList('agent');
	    //buttonEventBind('agent');


	/*************************
	         户型分间
	*************************/
		//页面加载时初始化户型分间信息
	    if(init.hasAllowedPhoto){
			$.ajax({
				url: '/api/house/getCells.json',
				type:'get',
				data: {
					houseId: init.houseRentId,
					type: 'zufang'
				},
				dataType:'json',
				success: function(response){
					if(response.status == 'ok'){
						if(response.cellInfoList){//GIO页面参数收集(户型图类型：3-有认证户型图且有分间信息）
							if(window._vds){//GIO对象已初始化
								window._vds.push("setPS2", "3");
							}
							else{//GIO对象未初始化
								init.gio.setPS2 = "3";
							}
						}

						//户型专家信息
						if(response.agent){
							$("#huxingAgent").setTemplateElement("template_huxing_agent");
							$("#huxingAgent").processTemplate(response);
						}
						//分间信息（如果没有，则显示收集中）
						if(!response.cellInfoList) response.cellInfoList = [];
						$("#huxingfenjian").setTemplateElement("template_huxingfenjian");
						$("#huxingfenjian").processTemplate(response);
					}
				},
				error: function(response, status){
					console.log(status);
				}
			})
		}


    /*************************
    		看房记录
    **************************/
	    //页面加载时初始化看房记录列表
	    //buildList('kanfang');
	    //buttonEventBind('kanfang');


    /*************************
    		为你推荐
    **************************/
	    //buildList('recommend', {maxPerPage:4});
	    //buttonEventBind('recommend', {maxPerPage:4});


	    //列表-翻页组件状态设置（联系经纪人，看房记录，为你推荐）
	    function buildBtn(type, maxPerPage){
	    	if(init[type+"ListPageNo"] == 1){
	    		$("#btn_"+type+"_pre").addClass("disable");
	    	}
	    	else{
	    		$("#btn_"+type+"_pre").removeClass("disable");
	    	}

	    	var lastPageNo = Math.ceil(init[type+"List"].length / maxPerPage);
	    	if(init[type+"ListPageNo"] == lastPageNo){
	    		$("#btn_"+type+"_next").addClass("disable");
	    	}
	    	else{
	    		$("#btn_"+type+"_next").removeClass("disable");
	    	}
	    }
	    //列表－翻页按钮点击事件绑定（联系经纪人，看房记录，为你推荐）
	    function buttonEventBind(type, opts){
	    	//向前翻页
		    $("#btn_"+type+"_pre").click(function(){
		    	if($(this).hasClass("disable")) return false;

		    	init[type+"ListPageNo"] -= 1;
		    	buildList(type, opts);
		    });
		    //向后翻页
		    $("#btn_"+type+"_next").click(function(){
		    	if($(this).hasClass("disable")) return false;

		    	init[type+"ListPageNo"] += 1;
		    	buildList(type, opts);
		    });
	    }

	    //列表－构建（联系经纪人，看房记录，为你推荐）
	    function buildList(type, opts){
	    	var maxPerPage = (opts && opts.maxPerPage) ? opts.maxPerPage : 3;
	    	var data = {
		    	list : init[type+"List"].slice((init[type+"ListPageNo"]-1)*maxPerPage, init[type+"ListPageNo"]*maxPerPage)
		    }
	    	//初始化经纪人列表（一页三条）
		    $("#result_"+type).setTemplateElement("template_"+type);
		    $("#result_"+type).processTemplate(data);
		    buildBtn(type, maxPerPage);
	    }

	/**
	 * 租房虚假举报相关
	 * */
	//虚假房源举报链接 － 点击事件
	$("#btn_report").click(function(){
		if(headerParameters.loginUserInfo.code==-1){//用户未登录，显示用户登录弹层
			$("#dialog, #loginOverlay").css({
				"display" : "block"
			});
		}
		else{//用户已登录，显示举报弹层
			if($("#yanzhengmasrcs").length==0){//验证码初始化
				$("#yanzhengmaWrap").html('<img id="yanzhengmasrcs" src="/api/house/getCaptcha" width="120" height="36" style="cursor:pointer" title="点击换一张" onclick="this.src=\'/api/house/getCaptcha?v=\'+Math.random()">');
			}
			$("#validateOverlay, #valideteMain").css({
				display: "block"
			});
		}
	});

	//关闭虚假房源举报弹层
	function closeReportPop(){
		$("#validateOverlay, #valideteMain").css({
			display: "none"
		});
	}
	//虚假房源举报弹层 － 关闭按钮点击事件
	$("#validateCloseBtn").click(function(){
		closeReportPop();
	});

	//切换举报房源理由，清理报错信息
	$("input:checkbox[name=reason]").click(function(){
		if($("input:checkbox[name=reason]:checked").length!=0 && $("#checkReason").attr("errCode")==1){
			$("#checkReason").text("").hide();
		}
	});

	//填写验证码，清理报错信息
	$("#valicode").change(function(){
		if($(this).val()!="" && $("#checkReason").attr("errCode")==3){
			$("#checkReason").text("").hide();
		}
	});

	//举报弹层 － 点击确定按钮事件
	$("#btn_reportSubmit").click(function(){
		if(init.reportDoing == true) return false; //防重复提交

		if($("input:checkbox[name=reason]:checked").length==0){
			$("#checkReason").text("请选择您举报该房源的理由").attr("errCode", 1).show();
			return false;
		}

		if($.trim($("#valicode").val()).length==0){
			$("#checkReason").text("请填写验证码").attr("errCode", 3).show();
			return false;
		}
		var reason1 = $("#reason1").prop("checked")==true ? 1 : 0;
		var reason2 = $("#reason2").prop("checked")==true ? 1 : 0;
		var reason3 = $("#reason3").prop("checked")==true ? 1 : 0;
		var reason4 = $("#reason4").prop("checked")==true ? 1 : 0;
		// var data = "reason1=" + reason1 + "&reason2=" + reason2 + "&reason3=" + reason3 + "&reason4=" + reason4
		// 		+ "&detail=" + $.trim($("#report_detail").val()) + "&valicode=" + $.trim($("#valicode").val()) + "&cityCode="
		// 		+ headerParameters.cityCode + "&dataId=" + init.houseRentId + "&houseType=租房"
		// 		+ "&userId="  + (headerParameters.loginUserInfo.data.isAgent ? headerParameters.loginUserInfo.data.agentId : headerParameters.loginUserInfo.data.uid);
		
		var data = {
			reason1 : reason1,
			reason2 : reason2,
			reason3 : reason3,
			reason4 : reason4,
			detail : $.trim($("#report_detail").val()),
			valicode : $.trim($("#valicode").val()),
			cityCode : headerParameters.cityCode,
			dataId : init.houseRentId,
			houseType : "租房",
			userId : (headerParameters.loginUserInfo.data.isAgent ? headerParameters.loginUserInfo.data.agentId : headerParameters.loginUserInfo.data.uid)
		}
		init.reportDoing = true;
		var btnSelf = $(this);
		btnSelf.addClass("disabled");
		$.ajax({
			type : "post",
			url : '/api/house/complaint',
			data : data,
			dataType : "json",
			success: function(response,status){
				init.reportDoing = false;
				btnSelf.removeClass("disabled");
				if(response.status == "ok"){
					$("#infju_me").hide();
					$("#infju_me_success").show();

					window.setTimeout(function(){
						closeReportPop();
					}, 3000);
				}
				else{
					switch(response.errorCode){
						case 1 : $("#checkReason").text(response.message).attr("errCode", 4).show();break; //验证码错误
						case 2 : alert("未登录，请先登录"); closeReportPop(); $("#dialog, #loginOverlay").css({"display" : "block"}); break; //未登录
						case 3 : alert("提交失败，请重试"); break; //保存失败
						case 4 : closeReportPop(); alert("您已举报过此房源，谢谢！"); break;
						default : break;
					}
					$("#yanzhengmasrcs").trigger("click");
				}
			},
			error : function(response,status){
				init.reportDoing = false;
				btnSelf.removeClass("disabled");
			}
		});
	});
});