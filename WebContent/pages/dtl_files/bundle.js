/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/*!******************!*\
  !*** multi main ***!
  \******************/
/***/ function(module, exports, __webpack_require__) {

	__webpack_require__(/*! ./qrcodePlugin.js */1);
	__webpack_require__(/*! ./footer.js */2);
	__webpack_require__(/*! ./slideToolsBar.js */3);
	__webpack_require__(/*! ./analysisTools.js */4);
	module.exports = __webpack_require__(/*! ./main.js */5);


/***/ },
/* 1 */
/*!*************************!*\
  !*** ./qrcodePlugin.js ***!
  \*************************/
/***/ function(module, exports) {

	/**
	 * Created by zhangliguang on 16/8/29.
	 */
	/** 二维码  **/
	(function(){
	    $.fn.extend({
	        downloadQrcode: function(opts) {
	
	            return this.each(function() {
	                //表示已经初始化过
	                if($(this).find('.js_qrCodeIcon').length > 0){
	                    return;
	                }
	
	                if($(this).css('position') != 'absolute'){//本身没有定位
	                    $(this).css('position','relative');
	                }
	
	                //生成二维码
	                var str = $(this).attr('source'),
	                    ewmImgW = Number($(this).attr('ewmimgw')) ? Number($(this).attr('ewmimgw')) : 119,
	                    ewmImgH = Number($(this).attr('ewmimgh')) ? Number($(this).attr('ewmimgh')) : 119,
	                    hostObj = {
	                        productionUrl: 'http://sh.lianjia.com/client/',
	                        testUrl:       'http://sh.lianjia.net/client/',
	                        developmentUrl:'http://sh.lianjia.net/client/',
	                        integrationUrl:'http://sh.lianjia.org/client/'
	                    };
	
	                //s=wem 来源：二维码
	                var env = window.headerParameters.env ? window.headerParameters.env : '',
	                    url = hostObj[env+'Url'] + "?source=" + str,
	                    qrcodeOptions = {
	                        render: "canvas",
	                        width: ewmImgW,
	                        height:ewmImgH,
	                        text: toUtf8(url)
	                    };
	                if(!checkBrowserIsLegal()){
	                    qrcodeOptions.render = "table";
	                }
	                $(this).qrcode(qrcodeOptions);
	
	                //动态插入的logo图
	                var logoImgW = parseInt(ewmImgW / 3),logoImgH = parseInt(ewmImgH / 3),
	                    borderWidth = ewmImgW <= 70 ? 1 : ( ewmImgW <= 100 ? 2 : 3),
	                    $icon = $('<img class="js_qrCodeIcon" src="' + window.headerParameters.publichost + '/public/img/qrCodeIcon_lj.png"/>');
	                $icon.css({
	                    position:'absolute',
	                    top: '50%',
	                    left: '50%',
	                    marginTop:'-' + (logoImgW/2 + borderWidth) + 'px',
	                    marginLeft:'-' + (logoImgH/2 + borderWidth) + 'px',
	                    width: logoImgW + 'px',
	                    height: logoImgH + 'px',
	                    border: borderWidth + 'px solid #fff',
	                    borderRadius: parseInt(logoImgW / 5 ) + 'px',
	                    background: '#fff'
	                }).appendTo($(this));
	            });
	        }
	    });
	
	    function checkBrowserIsLegal(){
	        var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
	        var isOpera = userAgent.indexOf("Opera") > -1; //判断是否Opera浏览器
	        var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera; //判断是否IE浏览器
	
	        var legalBrowser = true;
	
	        if (isIE) {
	            var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
	            reIE.test(userAgent);
	            var fIEVersion = parseFloat(RegExp["$1"]);
	
	            legalBrowser = fIEVersion > 8.0;//如果小于版本ie8
	        }
	
	        return legalBrowser;
	    }
	}());

/***/ },
/* 2 */
/*!*******************!*\
  !*** ./footer.js ***!
  \*******************/
/***/ function(module, exports) {

	/**
	 * Created by zhangliguang on 16/8/24.
	 */
	/** 底部footer **/
	
	(function() {
	    window.footerNamespace = window.footerNamespace || {};
	
	    window.footerNamespace.initFooter = function ($container, headerParameters) {
	        var footerHtml = '<div class="footer js_footer">\
	                                
	                            </div>';
	        $container.prepend(footerHtml);
	
	
	        //初始化页脚
	        initFooterLink($container.find('.js_footerLinkContainer'), headerParameters.cityCode);
	        initAppDownload($container.find('.js_lianjiaLinkBox'), headerParameters);
	
	
	        /** 页脚底部内容 **/
	        /*
	         $root: 链接容器的根dom对象
	         cityCode: 表示城市
	         */
	        function initFooterLink($root, cityCode) {
	            $root.append('<div class="tab js_footer_tab_wrapper"></div>' +
	                '<div class="link-list js_footer_content_wrapper"></div>');
	
	            var footer_link_data = [
	                {
	                    "title": "上海找房大推荐",
	                    "link": [
	                        // createItem('满五唯一', '/ershoufang/u1/'),
	                        createItem('手机找上海二手房', '/ershoufang/', 'http://m.sh.lianjia.com'),
	                        createItem('底特律财富天地', '/xiaoqu/5011000009061.html'),
	                        createItem('新城金郡', '/xiaoqu/5011000009660.html'),
	                        createItem('同润菲诗艾伦', '/xiaoqu/5011000014575.html'),
	                        createItem('三湘四季花城', '/xiaoqu/5011000012033.html'),
	                        createItem('上海康城', '/xiaoqu/5011000012332.html'),
	                        createItem('世茂滨江花园', '/xiaoqu/5011000017872.html'),
	                        createItem('奥林匹克花园', '/xiaoqu/5011000015174.html'),
	                        createItem('中远两湾城', '/xiaoqu/5011000014141.html'),
	                        createItem('浦发绿城', '/xiaoqu/5011000013259.html'),
	
	                        createItem('绿洲康城亲水湾', '/xiaoqu/5011000013546.html'),
	                        createItem('三盛颐景园', '/xiaoqu/5011000016116.html'),
	                        createItem('地杰国际城', '/xiaoqu/5011000016197.html'),
	                        createItem('开元地中海', '/xiaoqu/5011000009586.html'),
	                        createItem('九城湖滨国际', '/xiaoqu/5011000014093.html'),
	                        createItem('紫东新苑', '/xiaoqu/5011000014198.html'),
	                        createItem('莱顿小城', '/xiaoqu/5011000014745.html'),
	                        createItem('保利西子湾', '/xiaoqu/5011000012581.html'),
	                        createItem('中环一号', '/xiaoqu/5011000012041.html'),
	                        createItem('大华二村', '/xiaoqu/5011000013692.html'),
	                        createItem('上海源花城', '/xiaoqu/5011000004375.html'),
	                        createItem('仁恒滨江园', '/xiaoqu/5011000017860.html'),
	
	                        createItem('浦东星河湾', '/xiaoqu/5011000012349.html'),
	                        createItem('馨佳园', '/xiaoqu/5011000014189.html'),
	                        createItem('仁恒河滨花园', '/xiaoqu/5011000015555.html'),
	                        createItem('尚海湾', '/xiaoqu/5011000015960.html'),
	                        createItem('丽水华庭', '/xiaoqu/5011000017981.html'),
	                        createItem('凯欣豪园', '/xiaoqu/5011000018329.html'),
	                        createItem('华润置地橡树湾', '/xiaoqu/5011000014068.html'),
	                        createItem('财富海景花园', '/xiaoqu/5011000017211.html'),
	                        createItem('上海春城', '/xiaoqu/5011000015954.html'),
	                        createItem('上海星河湾', '/xiaoqu/5011000011257.html')
	                    ]
	                },
	                {
	                    "title": "上海小区列表",
	                    "link": [
	                        createItem('静安', '/ershoufang/jingan/'),
	                        createItem('徐汇', '/ershoufang/xuhui/'),
	                        createItem('黄浦', '/ershoufang/huangpu/'),
	                        createItem('闵行', '/ershoufang/minhang/'),
	                        createItem('长宁', '/ershoufang/changning/'),
	                        createItem('普陀', '/ershoufang/putuo/'),
	                        createItem('闸北', '/ershoufang/zhabei/'),
	                        createItem('虹口', '/ershoufang/hongkou/'),
	                        createItem('杨浦', '/ershoufang/yangpu/'),
	                        createItem('宝山', '/ershoufang/baoshan/'),
	                        createItem('金山', '/ershoufang/jinshan/'),
	                        createItem('嘉定', '/ershoufang/jiading/'),
	                        createItem('奉贤', '/ershoufang/fengxian/'),
	                        createItem('松江', '/ershoufang/songjiang/'),
	                        createItem('青浦', '/ershoufang/qingpu/'),
	                        createItem('曹家渡', '/ershoufang/caojiadu/'),
	                        createItem('江宁路', '/ershoufang/jiangninglu/'),
	                        createItem('静安寺', '/ershoufang/jingansi/'),
	                        createItem('南京西路', '/ershoufang/nanjingxilu/'),
	                        createItem('华东理工', '/ershoufang/huadongligong/'),
	                        createItem('衡山路', '/ershoufang/hengshanlu/'),
	                        createItem('建国西路', '/ershoufang/jianguoxilu/'),
	
	                        createItem('龙华', '/ershoufang/longhua/'),
	                        createItem('上海南站', '/ershoufang/shanghainanzhan/'),
	                        createItem('万体馆', '/ershoufang/wantiguan/'),
	                        createItem('徐家汇', '/ershoufang/xujiahui/'),
	                        createItem('蓬莱公园', '/ershoufang/penglaigongyuan/'),
	                        createItem('人民广场', '/ershoufang/renminguangchang/'),
	                        createItem('新天地', '/ershoufang/xintiandi/'),
	                        createItem('西郊', '/ershoufang/xijiao/'),
	                        createItem('中山公园', '/ershoufang/zhongshangongyuan/'),
	                        createItem('康桥', '/ershoufang/kangqiao/'),
	                        createItem('陆家嘴', '/ershoufang/lujiazui/'),
	                        createItem('淞宝', '/ershoufang/songbao/'),
	                        createItem('不夜城', '/ershoufang/buyecheng/'),
	                        createItem('古美', '/ershoufang/gumei/'),
	                        createItem('南翔', '/ershoufang/nanxiang/')
	                    ]
	                },
	                {
	                    "title": "热门城市新房",
	                    "link": [
	                        createItem('北京新房', '/', 'http://bj.fang.lianjia.com'),
	                        createItem('天津新房', '/', 'http://tj.fang.lianjia.com'),
	                        createItem('上海新房', '/', 'http://sh.fang.lianjia.com'),
	                        createItem('青岛新房', '/', 'http://qd.fang.lianjia.com'),
	                        createItem('大连新房', '/', 'http://dl.fang.lianjia.com'),
	                        createItem('南京新房', '/', 'http://nj.fang.lianjia.com'),
	                        createItem('杭州新房', '/', 'http://hz.fang.lianjia.com'),
	                        createItem('成都新房', '/', 'http://cd.fang.lianjia.com'),
	                        createItem('武汉新房', '/', 'http://wh.fang.lianjia.com'),
	                        createItem('深圳新房', '/', 'http://sz.fang.lianjia.com'),
	                        createItem('重庆新房', '/', 'http://cq.fang.lianjia.com'),
	                        createItem('长沙新房', '/', 'http://cs.fang.lianjia.com'),
	                        createItem('西安新房', '/', 'http://xa.fang.lianjia.com')
	                    ]
	                },
	                {
	                    "title": "热门城市租房网",
	                    "link": [
	                        createItem('天津租房', '/zufang/', 'http://tj.lianjia.com'),
	                        createItem('杭州租房', '/zufang/', 'http://hz.lianjia.com'),
	                        createItem('成都租房', '/zufang/', 'http://cd.lianjia.com'),
	                        createItem('大连租房', '/zufang/', 'http://dl.lianjia.com'),
	                        createItem('青岛租房', '/zufang/', 'http://qd.lianjia.com'),
	                        createItem('厦门租房', '/zufang/', 'http://xm.lianjia.com'),
	                        createItem('深圳租房', '/zufang/', 'http://sz.lianjia.com'),
	                        createItem('武汉租房', '/zufang/', 'http://wh.lianjia.com'),
	                        createItem('长沙租房', '/zufang/', 'http://cs.lianjia.com'),
	                        createItem('重庆租房', '/zufang/', 'http://cq.lianjia.com'),
	                        createItem('济南租房', '/zufang/', 'http://jn.lianjia.com'),
	                        createItem('广州租房', '/zufang/', 'http://gz.lianjia.com')
	                    ]
	                },
	                {
	                    "title": "合作与友情链接",
	                    "link": [
	                        createItem('房产网', '/', 'http://www.lianjia.com'),
	                        createItem('买房注意事项', '/baike/', 'http://bj.lianjia.com'),
	                        createItem('北京房屋经纪人', '/jingjiren/', 'http://bj.lianjia.com'),
	                        createItem('北京业主委托', '/yezhu/', 'http://bj.lianjia.com'),
	                        createItem('手机房产网', '/', 'http://m.lianjia.com'),
	                        createItem('广州二手房', '/', 'http://gz.esf.focus.cn'),
	                        createItem('上海房产', '/', 'http://sh.cityhouse.cn'),
	                        createItem('上海租房网', '/', 'http://sh.zu.anjuke.com'),
	                        createItem('上海房产', '/', 'http://sh.house.sina.com.cn'),
	                        createItem('家居网', '/', 'http://home.fang.com'),
	                        createItem('定制家具', '/', 'http://www.oppein.cn'),
	                        createItem('装修网', '/', 'http://www.fuwo.com'),
	                        createItem('上海楼盘网', '/', 'http://sh.loupan.com'),
	
	                        createItem('武汉热线房产网', '/', 'http://www.rexian.net.cn'),
	                        createItem('上海买房网', '/', 'http://sh.jiwu.com'),
	                        createItem('上海装修网', '/', 'http://sh.to8to.com'),
	                        createItem('家居设计', '/', 'http://sheji.pchouse.com.cn'),
	                        createItem('上海房产', '/', 'http://sh.focus.cn'),
	                        createItem('邯郸房产', '/', 'http://www.ljia.net'),
	                        createItem('工程信息', '/', 'http://jsgc168.com'),
	                        createItem('家居装修', '/', 'http://guju.com.cn'),
	                        createItem('长沙房产网', '/', 'http://www.0731fdc.com'),
	                        createItem('海外房产', '/', 'http://www.juwai.com')
	                    ]
	                }
	            ];
	
	            //遍历数据源，生成DOM
	            (function generateDom() {
	                var $tabRoot = $root.find(".js_footer_tab_wrapper"),
	                    $contentRoot = $root.find(".js_footer_content_wrapper"),
	                    node;
	                for (var i = 0; i < footer_link_data.length; i++) {
	                    node = footer_link_data[i];
	                    if (cityCode !== 'sh' && (node.title === '上海找房大推荐' || node.title === '上海小区列表')) {
	                        continue;
	                    }
	
	                    //生成Tab
	                    $tabRoot.append('<span class="js_tabItem" related_content="js_footerContent_' + i + '">' + node.title + '</span>');
	
	                    //生成链接内容
	                    $contentRoot.append('<div class="js_footerContent js_footerContent_' + i + '"><dd>' +
	                        $.map(node.link, function (n) {
	                            return '<a target="_blank" href="' + n.url + '">' + n.title + '</a>';
	                        }).join('') +
	                        '</dd></div>');
	                }
	            }());
	
	            //绑定tab切换事件
	            (function bindEvent() {
	                $root.find(".js_tabItem").on("mouseenter", function () {
	                    $(this).siblings().removeClass("hover");
	                    $(this).addClass("hover");
	
	                    $root.find('.js_footerContent').hide();
	                    $root.find('.' + $(this).attr('related_content')).show();
	                });
	                $root.find(".js_tabItem").first().trigger('mouseenter');
	            }());
	
	
	            function createItem(title, path, domain) {
	                domain = domain || 'http://sh.lianjia.com';
	                return {
	                    title: title,
	                    url: domain + path
	                }
	            }
	        }
	
	
	        //初始化app下载二维码
	        function initAppDownload($parent, headerParameters) {
	            $('<div class="fr"><div class="ewmWrap"><div class="js_downloadApp" source="dbewm" ewmimgw="129" ewmimgh="129"></div></div></div>').appendTo($parent);
	            $parent.find('.js_downloadApp').downloadQrcode();
	        }
	    };
	}());

/***/ },
/* 3 */
/*!**************************!*\
  !*** ./slideToolsBar.js ***!
  \**************************/
/***/ function(module, exports) {

	/**
	 * Created by zhangliguang on 16/8/29.
	 */
	/** 右侧固定工具条 **/
	(function(){
	    window.footerNamespace = window.footerNamespace || {};
	
	    window.footerNamespace.initToolsBar = function($container, outerParams, loginUserInfo){
	        if(!loginUserInfo) return;
	
	        // var onlyShHtml = '<li class="baodan">\
	        //                 <a href="http://www.lianjia.com/zhuanti/baodan#310000" title="安心保单" target="_blank" gahref="right_link_baodan">安心保单</a>\
	        //                 <span class="popup"><i></i>安心保单</span>\
	        //             </li>',
	        var onlyShHtml = '';
	            toolsHtml = '<div class="fix-right-v2" id="back-top" daty-id="index">\
	                            <table><tr><td>\
	                            <div class="sidebar-wrap">\
	                            <ul id="ul_myfav">\
	                                <li class="myfav">\
	                                    <a title="我关注的房源" href="javascript:;" id="link_myFav" gahref="right_link_myFav">我关注的房源</a>\
	                                    <span class="popup"><i></i>我关注的房源</span>\
	                                </li>\
	                            </ul>\
	                            <div class="sidebar-line" id="line_myfav"></div>\
	                            <ul>\
	                                <li class="sell">\
	                                    <a title="在线卖房" href="' + headerParameters.webhost + '/yezhu/" target="_blank" gahref="right_link_yezhu">在线卖房</a>\
	                                    <span class="popup"><i></i>在线卖房</span>\
	                                </li>\
	                            </ul>\
	                            <div class="sidebar-line"></div>\
	                            <ul class="js_otherTools">\
	                                <li class="download">\
	                                    <a href="' + headerParameters.webhost + '/client?source=pccbl" title="" target="_blank" gahref="right_link_app">下载' + (outerParams.cityName) + '链家APP</a>\
	                                    <span class="popup popup-qr">\
	                                        <i></i>\
	                                        <div class="js_qrcodeWrapper" source="cbewm" ewmimgw="80" ewmimgh="80"></div>\
	                                        <em class="qr-title">APP下载</em>\
	                                    </span>\
	                                </li>\
	                                <li class="phone">\
	                                    <a title="客服热线">客服热线</a>\
	                                    <span class="popup"><i></i>客服热线 4007 001 001</span>\
	                                </li>\
	                                <li class="feedback" id="feedback">\
	                                    <a title="意见反馈" gahref="right_open_feedback_pop">意见反馈</a>\
	                                    <span class="popup"><i></i>意见反馈</span>\
	                                </li>\
	                            </ul>\
	                        </div>\
	                        </td></tr></table>\
	                        <ul>\
	                            <li class="gotop" id="gotop">\
	                                <a title="返回顶部" href="#top" gahref="right_back_to_top">返回顶部</a>\
	                                <span class="popup"><i></i>返回顶部</span>\
	                            </li>\
	                        </ul>\
	                        <div class="js_feedbackPlaceholder"></div>\
	                </div>';
	
	        $container.append(toolsHtml);
	
	        //保单和下载app功能, 仅上海才有
	        if(outerParams.cityCode === 'sh'){
	            $container.find('.js_otherTools').prepend(onlyShHtml);
	        }
	
	        //初始化二维码
	        $container.find('.js_qrcodeWrapper').downloadQrcode();
	
	        //显示|隐藏tips
	        $container.find('li').hover(function(){
	            $(this).find('span.popup').show().css({
	                opacity : 0,
	                right : '48px'
	            }).animate({
	                opacity : 1,
	                right : '38px'
	            }, 300);
	        }, function(){
	            $container.find('span.popup').hide();
	        });
	
	        //fix-right - go top
	
	        $("#gotop").click(function(){
	            $("body").css({ scrollTop : 0 });
	        });
	
	        $(window).scroll(function(){
	            var h = $(window).height(),
	                t = $(document).scrollTop();
	            if(t>h){
	                $("#gotop").show();
	                $(".fix-right .tips,.fix-right .has-ask").show();
	            }
	            else{
	                $("#gotop").hide();
	                $(".fix-right .tips,.fix-right .has-ask").hide();
	            }
	        }).scroll();
	
	        if(loginUserInfo.code != -1 && loginUserInfo.data.isAgent){//经纪人已登录 － 隐藏”我关注的房源“入口
	            $("#ul_myfav, #line_myfav").remove();
	        }
	        else{//经纪人未登录
	            $("#link_myFav").click(function(){
	                if(loginUserInfo.code == -1) {//未登录 － 弹登录弹层
	                    $("#dialog, #loginOverlay").css({"display" : "block"});
	                }
	                else{//用户已登录 - 跳转到个人中心－我关注的房源
	                    window.location = outerParams.uchost + "/favor/house";
	                }
	            });
	        }
	
	        //初始化反馈弹层
	        initFeedbackPopup($container.find('.js_feedbackPlaceholder'), outerParams, loginUserInfo);
	    };
	
	
	
	    /** 用户反馈弹层 **/
	    function initFeedbackPopup($container, outerParams, loginUserInfo) {
	        var html = '<div class="feedbackContainer">\
	                        <div class="overlay_bg" id="feedbackOverlay"></div>\
	                        <div class="feedback-box animated bounceIn">\
	                            <div class="complain">\
	                                <div id="feedback_content" class="js_tabBox">\
	                                    <p>您对新版链家网有任何意见和建议，或使用中遇到的问题，请在本页面反馈。我们会每天关注并不断优化产品，为您提供更好的服务！</p>\
	                                    <div class="box">\
	                                        <span>反馈内容<label id="erro-tips">请输入反馈内容</label></span>\
	                                        <textarea id="feedbackContent" placeholder="我们非常乐意收到您使用网站过程中的感受和意见" autofocus=""></textarea>\
	                                    </div>\
	                                    <div class="box">\
	                                        <span>联系方式<i>(选填)</i></span>\
	                                        <input type="text" id="feedbackContact" placeholder="手机号、Email、QQ均可">\
	                                    </div>\
	                                    <div class="clear"></div>\
	                                    <div class="fl">\
	                                        <button id="btn_feedbackSubmit" gahref="feedback_pop_submit">提交反馈</button>\
	                                        <span id="tips"></span>\
	                                    </div>\
	                                    <div class="fr has"></div>\
	                                </div>\
	                                <div id="feedback_tousu" class="js_tabBox tab-box appeal" style="display: none">\
	                                    <div class="tel">\
	                                        <i></i>投诉热线/4007001001\
	                                    </div>\
	                                    <b>处理流程</b>\
	                                    <p>您可以通过链家网投诉热线提交投诉，我们会在24小时内（工作时间）反馈解决方案。</p>\
	                                    <div id="tousu">\
	                                        <b>投诉公示（<a href="' + headerParameters.webhost + '/tousu" target="_blank">点此查看公示页面</a>）</b>\
	                                        <ul id="list"></ul>\
	                                        <p>如果你愿意公开您的投诉，我们会在投诉公示页面进行展示，欢迎您的监督。</p>\
	                                    </div>\
	                                </div>\
	                            </div>\
	                            <div id="feedback_success">\
	                                反馈成功，感谢您的反馈。\
	                            </div>\
	                            <div class="closebok" id="feedbackPopClose" gahref="right_close_feedback_pop">\
	                                <img src="' + headerParameters.webhost + '/public/img/close.png">\
	                            </div>\
	                        </div>\
	                    </div>';
	        $container.append(html);
	
	        var vm = {
	            feedbackContent: '',
	            feedbackContact: '',
	            hasSubmitted: false,
	            isSubmitting: false,
	            isSubmitSuccess: false,
	            isShowPop: false,
	            render: function () {
	                !this.feedbackContent && this.hasSubmitted ? $("#erro-tips").show() : $("#erro-tips").hide();
	                this.isSubmitting ? $('#btn_feedbackSubmit').addClass("disabled") : $('#btn_feedbackSubmit').removeClass("disabled");
	                if (this.isSubmitSuccess) {
	                    $("#feedback_content, .js_feedbackTab").hide();
	                    $("#feedback_success").show();
	                }
	            },
	            updateModel: function (key, value, delay) {
	                this[key] = value;
	                this.render();
	                if (key === 'isShowPop') {      //3s后隐藏弹层
	                    setTimeout(function () {
	                        $(".feedback-box, #feedbackOverlay").css({"display": value ? "block" : "none"});
	                    }, delay || 0);
	                }
	            }
	        };
	
	
	        //反馈按钮点击事件
	        $("#feedback").click(function () { vm.updateModel('isShowPop', true); });
	
	        //反馈弹层 － 内容输入框值变化时检查清理验证报错信息
	        $("#feedbackContent").change(function () { vm.updateModel('feedbackContent', $.trim($(this).val())); });
	
	        //反馈弹层 － 关闭按钮点击事件
	        $('#feedbackPopClose').click(function () { vm.updateModel('isShowPop', false); });
	
	        //反馈弹层 － 提交反馈按钮点击事件
	        $("#btn_feedbackSubmit").click(function () {
	            if (vm.isSubmitting) return;//防重复提交
	
	            vm.updateModel('feedbackContent', $.trim($("#feedbackContent").val()));
	            vm.updateModel('feedbackContact', $.trim($("#feedbackContact").val()));
	            vm.updateModel('hasSubmitted', true);
	
	            if (vm.feedbackContent == '') { return; }
	
	            vm.updateModel('isSubmitting', true);
	            var loginCode = loginUserInfo.code,
	                loginInfo = loginUserInfo.data,
	                reqParams = "content=" + encodeURIComponent(vm.feedbackContent) +
	                    "&contact=" + encodeURIComponent(vm.feedbackContact) +
	                    "&cityCode=" + outerParams.cityCode +
	                    "&isAgent=" + (loginInfo.isAgent ? 1 : 0) +
	                    "&client=web";
	
	            if (loginCode == 1) { //已登录
	                reqParams += '&userId=' + (loginInfo.isAgent ? loginInfo.agentId : loginInfo.uid);
	            }
	
	            $.post(outerParams.apihost + '/api/v4/online/support/feedback?access_token=7poanTTBCymmgE0FOn1oKp&' + reqParams).then(function (response) {
	                if (response.status == "ok") {
	                    vm.updateModel('isSubmitting', false);
	                    vm.updateModel('isSubmitSuccess', true);
	                    vm.updateModel('isShowPop', false, 3000);
	                }
	            }, function (response) {
	                vm.updateModel('isSubmitting', false);
	                console.log(response);
	            });
	        });
	    }
	}());


/***/ },
/* 4 */
/*!**************************!*\
  !*** ./analysisTools.js ***!
  \**************************/
/***/ function(module, exports) {

	/**
	 * Created by zhangliguang on 16/8/29.
	 */
	
	
	(function(headerParameters, init){
	
	    //版本号
	    var now = new Date(),
	        versionNo = now.getFullYear() + '' + (now.getMonth() + 1) + '' + now.getDate();
	
	    /********上海、苏州*******/
	
	    //ubt
	    var ubtScript=document.createElement("script");
	    ubtScript.src= headerParameters.publichost + "/public/js/ljubt.min.js?v=" + versionNo, document.getElementsByTagName("head")[0].appendChild(ubtScript);
	
	    //GA统计
	    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	    })(window,document,'script', headerParameters.publichost + '/public/js/analytics.js','ga');
	
	    ga('create', 'UA-73846703-1', 'auto');
	    ga('send', 'pageview');
	
	    //新增账号, pc和wap公用
	    ga('create', 'UA-83726672-1', 'auto', {'name': 'u'});
	    ga('u.send', 'pageview');
	
	    if(headerParameters.cityCode == "su"){//苏州单独用的GA账户
	        ga('create', 'UA-85639643-1', 'auto', {'name': 'su'});
	        ga('su.send', 'pageview');
	    }
	
	    //Google Tag Manager
	    $('body').append('<iframe src="//www.googletagmanager.com/ns.html?id=GTM-TK48MZ" height="0" width="0" style="display:none;visibility:hidden"></iframe>');
	    (function(w,d,s,l,i){
	            w[l]=w[l]||[];
	            w[l].push({'gtm.start': new Date().getTime(),event:'gtm.js'});
	            var f=d.getElementsByTagName(s)[0],
	                j=d.createElement(s),
	                dl=l!='dataLayer'?'&l='+l:'';
	            j.async=true;
	            //原地址: //www.googletagmanager.com/gtm.js
	            j.src= 'http://www.googletagmanager.com/gtm.js?id='+i+dl;
	            f.parentNode.insertBefore(j,f);
	    })(window,document,'script','dataLayer','GTM-TK48MZ');
	
	    
	
	    //非产品环境, 其他监控工具不记录监控
	    //if(headerParameters.env !== 'production'){
	    //    return;
	    //}
	
	    //北京监控
	    window.__UDL_CONFIG={"pid":"lianjiaweb"};
	    var ulogScript=document.createElement("script");
	    ulogScript.src="http://dig.lianjia.com/lianjiaUlog.js",document.getElementsByTagName("head")[0].appendChild(ulogScript);
	
	
	    //growingIO统计
	    if(window.location.hostname != "www.dooioo.com"){//排除掉www.dooioo.com
	        var _vds = _vds || [];
	        _vds.push(['enableHT', true]);
	        window._vds = _vds;
	        (function(){
	            _vds.push(['setAccountId', '970bc0baee7301fa']);
	
	            //记录用户ID
	            if($.cookie("lianjia_userId")){
	                _vds.push(['setCS1', 'userid', $.cookie("lianjia_userId")]);
	            }
	            if($.cookie("lianjia_agentId")){
	                _vds.push(['setCS1', 'userid', $.cookie("lianjia_agentId")]);
	                _vds.push(['setCS3', 'agentid', $.cookie("lianjia_agentId")]);
	            }
	            if($.cookie("ubta")){
	                var ubtArray = $.cookie("ubta").split(".");
	                if(ubtArray && ubtArray[1]){
	                    var ubthid = ubtArray[1];
	                    if(ubthid){
	                        _vds.push(['setCS4', 'ubthid', ubthid]);
	                    }
	                }
	            }
	
	            //记录页面业务参数
	            //页面存放业务参数的数据格式示例：
	            // var init = {
	            //     gio : {
	            //         "setPageGroup" : "二手房",
	            //         "setPS1" : "sh12123123"  //房源ID
	            //     }
	            // }
	            if(init && init.gio){
	                for(var key in init.gio){
	                    _vds.push([key, init.gio[key]]);
	                }
	            }
	
	            (function() {
	                var vds = document.createElement('script');
	                vds.type='text/javascript';
	                vds.async = true;
	                vds.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'dn-growing.qbox.me/vds.js';
	                var s = document.getElementsByTagName('script')[0];
	                s.parentNode.insertBefore(vds, s);
	            })();
	        })();
	    }
	
	}(window.headerParameters, window.init));

/***/ },
/* 5 */
/*!*****************!*\
  !*** ./main.js ***!
  \*****************/
/***/ function(module, exports) {

	/**
	 * Created by zhangliguang on 16/8/29.
	 */
	
	//初始化工具条
	//window.addEventListener('message', function(e){
	//    if(e.data.messageType  === 'loginInfoReady'){
	//        window.footerNamespace.initToolsBar($('#side-bar-tools-placeholder'),
	//            window.headerParameters, e.data.loginUserInfo);
	//    }
	//});
	
	
	//初始化footer
	window.footerNamespace.initFooter($('#footer-wrapper-placeholder'), window.headerParameters);
	
	
	//其他地方的二维码生成
	$('div.js_downAppEwmStatic_img').downloadQrcode();

/***/ }
/******/ ]);
//# sourceMappingURL=bundle.js.map