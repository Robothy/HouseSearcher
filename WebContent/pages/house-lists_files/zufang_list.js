$(function(){
	//页面加载时初始化社区搜索－小区 展开更多 的状态
	if($("#communityInnerWrap").outerHeight() > parseInt($("#option-list-community").css("minHeight"))){
		$("#btn_expand_community").css({"visibility":"visible"});
	}

	//页面加载时初始化筛选条件展开｜收起的状态（根据sessionStorage里相应的状态值）
	if(window.sessionStorage.getItem("isFilterMoreOpen_"+pagePrefix.replace("/", ""))){
		$("#options-list-more-switch").find(".text").text("收起选项");
		$("#options-list-more-switch").attr("status", 1).find(".icon").addClass("open");
		$("#options-list-more").show();
	}

	//筛选条件 － 社区（小区）选项 － 更多选项按钮点击事件
	$("#btn_expand_community").click(function(){
		$("#option-list-community").css({'maxHeight':'none'});
		$(this).css({"visibility":"hidden"});
	});

	//筛选条件 －［更多选项］按钮点击事件
	$("#options-list-more-switch").click(function(){
		if($(this).attr("status") == "0"){//收起状态，要打开
			$(this).attr("status", "1").find(".text").text("收起选项");
			$(this).find(".icon").addClass("open");
			$("#options-list-more").show();
			window.sessionStorage.setItem("isFilterMoreOpen_"+pagePrefix.replace("/", ""), 1);
		}
		else{//打开状态，要收起
			$(this).attr("status", "0").find(".text").text("展开选项（装修、楼层、朝向等）")
			$(this).find(".icon").removeClass("open");
			$("#options-list-more").hide();
			window.sessionStorage.removeItem("isFilterMoreOpen_"+pagePrefix.replace("/", ""));
		}
	});

	//售价、面积 范围输入框与确定按钮的联动
	rangeSubmitCtrl("min_area", "max_area");
	rangeSubmitCtrl("min_price", "max_price");

	//根据cookie，初始化当前列表的头图模式（实景图模式/户型图模式）
	$("#"+$.cookie('houseThumbType')).click();

	//搜索结果列表表头悬停效果
	var listHeadPos = $(".main-box").eq(0).position().top;
	$(window).scroll(function(){
		//窗口滚动时的置顶｜归位
		if($(document).scrollTop() >= listHeadPos){
			$(".main-box .list-head").eq(0).addClass("list-head-fixed");
		}
		else{
			$(".main-box .list-head").eq(0).removeClass("list-head-fixed");
		}
	});

	/*************************
	 推荐房源
	 **************************/
	buildList('recommendHouse', {maxPerPage:4});
	buttonEventBind('recommendHouse', {maxPerPage:4});

	//推荐列表-翻页组件状态设置
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
	//推荐列表－翻页按钮点击事件绑定
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
	//推荐列表－构建
	function buildList(type, opts){
		var maxPerPage = (opts && opts.maxPerPage) ? opts.maxPerPage : 3;
		var data = {
			list : init[type+"List"].slice((init[type+"ListPageNo"]-1)*maxPerPage, init[type+"ListPageNo"]*maxPerPage)
		}
		//初始化推荐列表
		$("#result_"+type).setTemplateElement("template_"+type);
		$("#result_"+type).processTemplate(data);
		buildBtn(type, maxPerPage);
	}
});