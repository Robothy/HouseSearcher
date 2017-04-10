

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>房源列表</title>
    <script type="text/javascript" async="" src="./house-lists_files/analytics.js"></script>
    <style type="text/css">
        @charset "UTF-8";
        [ng\:cloak],
        [ng-cloak],
        [data-ng-cloak],
        [x-ng-cloak],
        .ng-cloak,
        .x-ng-cloak,
        .ng-hide {
            display: none !important;
        }
        
        ng\:form {
            display: block;
        }
    </style>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Cache-Control" content="no-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <meta name="format-detection" content="telephone=no">

    <meta name="keywords" content="上海租房,上海租房网,上海房屋出租,上海房屋租赁,上海房屋出租信息">
    <meta name="description" content="链家上海租房网在上海租房市场用户口碑极佳，为上海租房用户使用率和满意度极好的网络租房交易及信息平台，同时也是上海租房用户重点推荐使用的网站。链家上海租房网提供上海最新出租房源，房源真实可靠无虚假无重复，让每一个用户安心满意的在上海进行房屋出租及租赁，营造最值得用户信赖的上海租房网络平台。">
    <link rel="stylesheet" href="./house-lists_files/common.css">
    <link rel="stylesheet" href="./house-lists_files/header.css">
    <link rel="stylesheet" href="./house-lists_files/weiliao.css">

    <link rel="stylesheet" href="./house-lists_files/list.css">

    <!--[if lt IE 9]>
	<script type="text/javascript" src="http://sh.lianjia.com/public/js/html5.js"></script>
	<![endif]-->
    <script type="text/javascript" async="" src="./house-lists_files/s.js"></script>
    <script type="text/javascript" async="" src="./house-lists_files/vds.js"></script>
    <script async="" src="./house-lists_files/gtm.js"></script>
    <script async="" src="./house-lists_files/analytics.js(1)"></script>
    <script>
        var headerParameters = {
            env: 'production',
            publichost: 'http://sh.lianjia.com',
            photohost: 'http://cdn1.dooioo.com',
            statichost: 'http://cdn7.dooioo.com',
            managehost: 'http://support.dooioo.com',
            webhost: 'http://sh.lianjia.com',
            xinfanghost: 'http://sh.fang.lianjia.com',
            uchost: 'http://user.sh.lianjia.com',
            agenthost: 'http://agent.sh.lianjia.com',
            apihost: 'http://soa.dooioo.com',
            openhost: 'http://open.dooioo.com',
            chathost: 'http://chat.dooioo.com',
            loginhost: 'http://huihua.lianjia.com',
            cityId: '310000',
            cityCode: 'sh',
            cityName: '上海',
            lianjiaSource: '',
            lianjiaSignature: '',
            newHouseModuleSwitch: 'true',
            hasFixBar: true, //是否有右侧边栏
            hasSaveSearch: true //是否支持登录后把缓存在本地local中的“已保存搜索”数据存入服务端功能
        }
    </script>

    <script src="./house-lists_files/jquery.min.js"></script>
    <script src="./house-lists_files/jQuery.XDomainRequest.js"></script>
    <script src="./house-lists_files/jquery.qrcode.min.js"></script>
    <script src="./house-lists_files/jquery-upload-1.0.js"></script>
    <script src="./house-lists_files/jquery-jtemplates.js"></script>
    <script src="./house-lists_files/jquery.cookie.js"></script>
    <script src="./house-lists_files/common.js"></script>
    <script src="./house-lists_files/saveSearchInit.js"></script>
    <script src="./house-lists_files/ljubt.min.js"></script>
    <script src="./house-lists_files/lianjiaUlog.js"></script>
</head>

<body><!--begin: header-->
    <header class="lj_header" id="lianjia-header" systemid="zufang">
        <div class="nav-wrap">
            <div class="wrapper">
                <ul class="nav">
                    <li class=" "><a href="http://sh.lianjia.com/" gahref="header_homepage">首页</a></li>
                    <li class=" "><a href="http://sh.lianjia.com/" gahref="header_homepage">全部</a></li>
                    
                    <li class=" "><a href="http://sh.lianjia.com/xiaoqu" gahref="header_xiaoqu">我的收藏</a></li>
                    
                </ul>
                <div class="login">
                    <div class="ti-hover">
                        <div class="login-panel typeUserInfo">
                            <div class="typeShowUser" id="userInfo"><span class="welcome"><a id="regUrl" href="#" onclick="doLogin()" gahref="header_signup"><span class="log">注册</span></a>|<a id="loginUrl" href="https://passport.lianjia.com/cas/login?service=http://user.sh.lianjia.com/index/ershou" class="btn-login bounceIn actLoginBtn" gahref="header_signin"><span class="reg">登录</span></a></span>
                            </div>
                        </div>
                        <div class="user-news" id="userNews"></div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- <script src="./house-lists_files/header.js"></script> -->
    <!--end: header-->

    <!--begin: searchs Top -->
    <div class="lj_searchs ">
        <div class="wrapper clear">
            <!-- <a href="http://sh.lianjia.com/" class="lj_logo fl"></a> -->
            <div class="label fl">租房</div>
            <div class="search-txt fr">
                <form id="formSearch" class="clear" action="http://sh.lianjia.com/zufang/rs" actdata="zufang" method="post">
                    <div class="search-tab">
                        <i class="icon"></i>
                        <div class="check" id="channelChked" formact="/zufang/rs" actdata="zufang" gahref="search_channel">租房</div>
                         <ul class="tabs" style="display: none;">
                            <li>
                                <label formact="/ershoufang/rs" tips="请输入区域、板块或小区名开始找房" actdata="ershoufang">住房</label>
                            </li>

                            <li>
                                <label formact="http://sh.fang.lianjia.com/loupan/search" tra="_blank" tips="请输入区名或街道名" actdata="xinfang">区域</label>
                            </li>

                            <li>
                                <label formact="/xiaoqu/rs" tra="_blank" tips="请输入小区名" actdata="xiaoqu">小区</label>
                            </li>
                        </ul> 
                        <div class="txt-serach">
                            <a href="javascript:;" class="saveSearchTotal" id="saveSearchTotal"><span></span>条已保存搜索</a>
                            <input value="" pagetype="zufang" class="left txt autoSuggest" name="keyword" autocomplete="off" placeholder="请输入区域、板块或小区名开始找房" id="keyword-box" popdiv="suggestion" maxlength="20" gahref="search_keyword_box">
                            <div class="hot-sug" id="hot-sug" style="display: none;">
                                <ul id="ershoufang">
                                    <div class="js_hotList js_history">
                                        <li class="hot-name">搜索历史
                                            <a href="javascript:;" class="del js_delHisSuggest">清空搜索记录</a>
                                        </li>
                                        <div class="list">
                                        </div>
                                    </div>
                                    <div class="js_hotList js_hot">
                                        <li class="hot-name">热门搜索</li>
                                        <div class="list">

                                            <li><a href="http://sh.lianjia.com/ershoufang/rs%E4%B8%8A%E6%B5%B7%E5%BA%B7%E5%9F%8E" gahref="search_hot_ershoufang_click_order_1">热门</a></li>
                                            <li class="line"></li>

                                            <li><a href="http://sh.lianjia.com/ershoufang/rs%E6%85%A7%E8%8A%9D%E6%B9%96%E8%8A%B1%E5%9B%AD" gahref="search_hot_ershoufang_click_order_2">热门慧芝湖花园</a></li>
                                            <li class="line"></li>

                                            <li><a href="http://sh.lianjia.com/ershoufang/rs%E4%BF%9D%E5%88%A9%E8%A5%BF%E5%AD%90%E6%B9%BE" gahref="search_hot_ershoufang_click_order_8">保利西子湾</a></li>

                                        </div>
                                    </div>
                                    <div class="js_hotList js_saveSearch" style="display:block">
                                        <!--已保存搜索，模板生成-->
                                    </div>
                                </ul>

                                
                                <ul id="zufang">
                                    <div class="js_hotList js_history">
                                        <li class="hot-name">搜索历史
                                            <a href="javascript:;" class="del">清空搜索记录</a>
                                        </li>
                                        <div class="list">
                                        </div>
                                    </div>
                                    <div class="js_hotList js_hot">
                                        <li class="hot-name">热门搜索</li>
                                        <div class="list">

                                            <li><a href="http://sh.lianjia.com/zufang/rs%E9%9D%99%E5%AE%89%E6%96%B0%E5%9F%8E" gahref="search_hot_zufang_click_order_1">静安新城</a></li>
                                            <li class="line"></li>

                                            <li><a href="http://sh.lianjia.com/zufang/rs%E4%B8%8A%E6%B5%B7%E5%BA%B7%E5%9F%8E" gahref="search_hot_zufang_click_order_7">上海康城</a></li>
                                            <li class="line"></li>

                                            <li><a href="http://sh.lianjia.com/zufang/rs%E9%A6%A8%E4%BD%B3%E5%9B%AD" gahref="search_hot_zufang_click_order_8">馨佳园</a></li>
                                            <li class="line"></li>

                                            <li><a href="http://sh.lianjia.com/zufang/rs%E4%B9%9D%E6%AD%8C%E4%B8%8A%E9%83%A1" gahref="search_hot_zufang_click_order_9">九歌上郡</a></li>
                                            <li class="line"></li>

                                            <li><a href="http://sh.lianjia.com/zufang/rs%E5%9C%B0%E6%9D%B0%E5%9B%BD%E9%99%85%E5%9F%8E" gahref="search_hot_zufang_click_order_10">地杰国际城</a></li>

                                        </div>
                                    </div>
                                    <div class="js_hotList js_saveSearch" style="display:block">
                                        <!--已保存搜索，模板生成-->
                                    </div>
                                </ul>

                                <ul id="xiaoqu">
                                    <div class="js_hotList js_history">
                                        <li class="hot-name">搜索历史
                                            <a href="javascript:;" class="del">清空搜索记录</a>
                                        </li>
                                        <div class="list">
                                        </div>
                                    </div>
                                    <div class="js_hotList js_hot">
                                        <li class="hot-name">热门搜索</li>
                                        <div class="list">
                                            <li><a href="http://sh.lianjia.com/xiaoqu/rs%E6%96%B0%E9%AB%98%E8%8B%91" gahref="search_hot_xiaoqu_click_order_5">新高苑</a></li>
                                            <li class="line"></li>

                                            <li><a href="http://sh.lianjia.com/xiaoqu/rs%E4%B9%9D%E5%9F%8E%E6%B9%96%E6%BB%A8%E5%9B%BD%E9%99%85" gahref="search_hot_xiaoqu_click_order_6">九城湖滨国际</a></li>
                                            <li class="line"></li>

                                            <li><a href="http://sh.lianjia.com/xiaoqu/rs%E5%90%8C%E6%B6%A6%E8%8F%B2%E8%AF%97%E8%89%BE%E4%BC%A6" gahref="search_hot_xiaoqu_click_order_7">同润菲诗艾伦</a></li>
                                            <li class="line"></li>

                                            <li><a href="http://sh.lianjia.com/xiaoqu/rs%E4%BB%81%E6%81%92%E6%BB%A8%E6%B1%9F%E5%9B%AD" gahref="search_hot_xiaoqu_click_order_8">仁恒滨江园</a></li>

                                        </div>
                                    </div>
                                    <div class="js_hotList js_saveSearch" style="display:block">
                                        <!--已保存搜索，模板生成-->
                                    </div>
                                </ul>
                                <ul style="border:0;"></ul>
                            </div>
                            <div id="suggest-cont" class="suggest-wrap" style="width:628px; display:none">
                                <ul style="width: 100%; display: none;" class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content" id="suggestion">
                                </ul>
                            </div>
                        </div>
                    </div>
                    <input type="text" style="display:none">
                    <button type="button" id="btn_topSearch" class="act-search btn home-ico ico-search" gahref="search_submmit">搜索</button>
                </form>

            </div>

        </div>
    </div>
    <!--保存搜索条件－反馈-->
    <%-- <div id="slideMsg_saveSearch" class="slideMsg_saveSearch" style="position:absolute; display:none;">
        <span>保存成功</span>
    </div> --%>

    <!--begin:模板－已保存搜索弹层-->
    <textarea id="template_saveSearchList" style="display:none"> &lt;li class="hot-name saveSearch-title"&gt;已保存搜索 {#if $T.login} &lt;a href="http://user.sh.lianjia.com/search/index"&gt;管理&gt;&gt;&lt;/a&gt; {#/if} &lt;/li&gt; &lt;div class="list saveSearchFix"&gt; {#foreach $T.list as list} &lt;li class="filter" id="searchId_{$T.list.id}"&gt; &lt;a href="{$T.list.url}?from=saveSearch" title="{$T.list.filter}" class="filter_name"&gt; {#foreach $T.list.filterShortCut as filter} &lt;span&gt;{$T.filter}&lt;/span&gt; {#/for} {#if $T.list.hasMore}&lt;span style="background:transparent"&gt;...&lt;/span&gt;{#/if} &lt;/a&gt; &lt;a href="javascript:;" class="filter_del" type="{$T.list.type}" searchid="{$T.list.id}"&gt;删除&lt;/a&gt; &lt;/li&gt; {#if !$T.list$last} &lt;li class="line"&gt;&lt;/li&gt; {#/if} {#/for} &lt;/div&gt;
    </textarea>
    <!--end:模板－已保存搜索弹层-->
    <!--begin:模板－已保存搜索弹层 － 追加的条目（预加载的隐藏项）-->
    <textarea id="template_saveSearchPreload" style="display:none"> &lt;li class="line"&gt;&lt;/li&gt; {#foreach $T.list as list} &lt;li class="filter" id="searchId_{$T.list.id}"&gt; &lt;a href="{$T.list.url}?from=saveSearch" title="{$T.list.filter}" class="filter_name"&gt; {#foreach $T.list.filterShortCut as filter} &lt;span&gt;{$T.filter}&lt;/span&gt; {#/for} {#if $T.list.hasMore}&lt;span style="background:transparent"&gt;...&lt;/span&gt;{#/if} &lt;/a&gt; &lt;a href="javascript:;" class="filter_del" type="{$T.list.type}" searchid="{$T.list.id}"&gt;删除&lt;/a&gt; &lt;/li&gt; {#if !$T.list$last} &lt;li class="line"&gt;&lt;/li&gt; {#/if} {#/for}
    </textarea>
    <!--end:模板－已保存搜索弹层 － 追加的条目（预加载的隐藏项）-->

    <!-- 视频入口浮层 -->

    <script type="text/javascript">
        /*var oWrap_video_all = document.getElementById('wrap-video-all');
        	 oWrap_video_all.onclick = function(){
        	 var oVideo_box = document.getElementById('video-box');
        	 var oVideo_close = document.getElementById('video-close');
        	 oVideo_box.style.display = "block";
        	 oVideo_close.onclick = function(){
        	 oVideo_box.style.display = "none";
        	 }
        	 }*/
    </script>
    <!--begin: searchs Top -->

    <!--begin: 正文-->

    <div class="wrapper">
        <!--begin: 筛选条件-->
        <div class="filter-box">
            <div class="hd clear">
                <ul class="tab-lst">
                    <li class="on"><a href="http://sh.lianjia.com/zufang/"><span>全部租房</span></a></li>
                    <!--<li><a href="http://sh.lianjia.com/ditiezufang/"><span>地铁租房</span></a></li>
                    <li><a href="http://sh.lianjia.com/zufangditu?dataId=sh&amp;type=city"><span>地图找房</span></a></li>-->
                </ul>
                <div class="info">
                    <!-- <a href="http://sh.ziroom.com/" gahref="link_ziroom" class="num" target="_blank" >查看自如在租房源</a> --></div>
            </div>
            <div class="pd">
                <div class="bd zufang" id="filter-options">

                    <dl class="dl-lst clear">
                        <dt>区域：</dt>
                        <dd>
                            <div class="option-list gio_district">
                                <a href="http://sh.lianjia.com/zufang/" gahref="district-nolimit" class="nolimit on">不限</a>

                                <a href="http://sh.lianjia.com/zufang/pudongxinqu" class="" gahref="pudongxinqu">浦东</a>

                                <a href="http://sh.lianjia.com/zufang/minhang" class="" gahref="minhang">闵行</a>

                                <a href="http://sh.lianjia.com/zufang/baoshan" class="" gahref="baoshan">宝山</a>

                                <a href="http://sh.lianjia.com/zufang/xuhui" class="" gahref="xuhui">徐汇</a>

                                <a href="http://sh.lianjia.com/zufang/putuo" class="" gahref="putuo">普陀</a>

                                <a href="http://sh.lianjia.com/zufang/yangpu" class="" gahref="yangpu">杨浦</a>

                                <a href="http://sh.lianjia.com/zufang/changning" class="" gahref="changning">长宁</a>

                                <a href="http://sh.lianjia.com/zufang/songjiang" class="" gahref="songjiang">松江</a>

                                <a href="http://sh.lianjia.com/zufang/jiading" class="" gahref="jiading">嘉定</a>

                                <a href="http://sh.lianjia.com/zufang/huangpu" class="" gahref="huangpu">黄浦</a>

                                <a href="http://sh.lianjia.com/zufang/jingan" class="" gahref="jingan">静安</a>

                                <a href="http://sh.lianjia.com/zufang/zhabei" class="" gahref="zhabei">闸北</a>

                                <a href="http://sh.lianjia.com/zufang/hongkou" class="" gahref="hongkou">虹口</a>

                                <a href="http://sh.lianjia.com/zufang/qingpu" class="" gahref="qingpu">青浦</a>

                                <a href="http://sh.lianjia.com/zufang/fengxian" class="" gahref="fengxian">奉贤</a>

                                <a href="http://sh.lianjia.com/zufang/jinshan" class="" gahref="jinshan">金山</a>

                                <a href="http://sh.lianjia.com/zufang/chongming" class="" gahref="chongming">崇明</a>

                                <a href="http://sh.lianjia.com/zufang/shanghaizhoubian" class="" gahref="shanghaizhoubian">上海周边</a>

                            </div>

                        </dd>
                    </dl>

                    <dl class="dl-lst clear gio_price">
                        <dt>租金：</dt>
                        <dd>
                            <div class="option-list multiChk">
                                <a href="http://sh.lianjia.com/zufang/" gahref="rent-price-nolimit" class="nolimit on">不限</a>
                                <div class="item-list">

                                    <a href="http://sh.lianjia.com/zufang/z1" gahref="z1" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">1000-2000元</span>
                                    </a>

                                    <a href="http://sh.lianjia.com/zufang/z2" gahref="z2" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">2000-4000元</span>
                                    </a>

                                    <a href="http://sh.lianjia.com/zufang/z3" gahref="z3" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">4000-6000元</span>
                                    </a>

                                    <a href="http://sh.lianjia.com/zufang/z4" gahref="z4" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">6000-8000元</span>
                                    </a>

                                    <a href="http://sh.lianjia.com/zufang/z5" gahref="z5" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">8000-12000元</span>
                                    </a>

                                    <a href="http://sh.lianjia.com/zufang/z6" gahref="z6" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">12000元以上</span>
                                    </a>

                                    <div class="custom">
                                        <div class="txt-box">
                                            <input type="text" class="txt" name="min_price" value="" placeholder="最小" maxlength="8">
                                        </div>&nbsp;-
                                        <div class="txt-box">
                                            <input type="text" class="txt" name="max_price" value="" placeholder="最大" maxlength="8">
                                        </div>&nbsp; 元/月
                                        <input type="button" gahref="price-custom-confirm" codetype="k" class="ok inputCode" value="确定" style="display:none">
                                    </div>
                                </div>
                            </div>
                        </dd>
                    </dl>
                    <dl class="dl-lst clear gio_area">
                        <dt>面积：</dt>
                        <dd>
                            <div class="option-list multiChk">
                                <a href="http://sh.lianjia.com/zufang/" gahref="area-nolimit" class="nolimit on">不限</a>
                                <div class="item-list">

                                    <a href="http://sh.lianjia.com/zufang/a1" gahref="a1" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">50平以下</span>
                                    </a>

                                    <a href="http://sh.lianjia.com/zufang/a2" gahref="a2" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">50-70平</span>
                                    </a>

                                    <a href="http://sh.lianjia.com/zufang/a3" gahref="a3" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">70-90平</span>
                                    </a>

                                    <a href="http://sh.lianjia.com/zufang/a4" gahref="a4" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">90-110平</span>
                                    </a>

                                    <a href="http://sh.lianjia.com/zufang/a9" gahref="a9" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">110-150平</span>
                                    </a>

                                    <a href="http://sh.lianjia.com/zufang/a7" gahref="a7" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">150平以上</span>
                                    </a>

                                    <div class="custom">
                                        <div class="txt-box">
                                            <input type="text" class="txt" name="min_area" value="" placeholder="最小" maxlength="8">
                                        </div>&nbsp;-
                                        <div class="txt-box">
                                            <input type="text" class="txt" name="max_area" value="" placeholder="最大" maxlength="8">
                                        </div>&nbsp; 平
                                        <input type="button" gahref="area-custom-confirm" codetype="m" class="ok inputCode" value="确定" style="display:none">
                                    </div>
                                </div>
                            </div>
                        </dd>
                    </dl>
                    <dl class="dl-lst clear gio_room">
                        <dt>户型：</dt>
                        <dd>
                            <div class="option-list multiChk">
                                <a href="http://sh.lianjia.com/zufang/" gahref="room-nolimit" class="nolimit on">不限</a>
                                <div class="item-list">

                                    <a href="http://sh.lianjia.com/zufang/l1" gahref="l1" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">一室</span>
                                    </a>

                                    <a href="http://sh.lianjia.com/zufang/l2" gahref="l2" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">二室</span>
                                    </a>

                                    <a href="http://sh.lianjia.com/zufang/l3" gahref="l3" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">三室</span>
                                    </a>

                                    <a href="http://sh.lianjia.com/zufang/l4" gahref="l4" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">四室</span>
                                    </a>

                                    <a href="http://sh.lianjia.com/zufang/l5" gahref="l5" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">五室</span>
                                    </a>

                                    <a href="http://sh.lianjia.com/zufang/l6" gahref="l6" class="">
                                        <span class="checkbox"></span>
                                        <span class="name">五室以上</span>
                                    </a>

                                </div>
                            </div>
                        </dd>
                    </dl>
                    <div id="options-list-more" style="display:none">
                        <dl class="dl-lst clear gio_face">
                            <dt>朝向：</dt>
                            <dd>
                                <div class="option-list multiChk">
                                    <a href="http://sh.lianjia.com/zufang/" gahref="face-nolimit" class="nolimit on">不限</a>
                                    <div class="item-list">

                                        <a href="http://sh.lianjia.com/zufang/f1" gahref="f1" class="">
                                            <span class="checkbox"></span>
                                            <span class="name">东</span>
                                        </a>

                                        <a href="http://sh.lianjia.com/zufang/f2" gahref="f2" class="">
                                            <span class="checkbox"></span>
                                            <span class="name">南</span>
                                        </a>

                                        <a href="http://sh.lianjia.com/zufang/f3" gahref="f3" class="">
                                            <span class="checkbox"></span>
                                            <span class="name">西</span>
                                        </a>

                                        <a href="http://sh.lianjia.com/zufang/f4" gahref="f4" class="">
                                            <span class="checkbox"></span>
                                            <span class="name">北</span>
                                        </a>

                                        <a href="http://sh.lianjia.com/zufang/f10" gahref="f10" class="">
                                            <span class="checkbox"></span>
                                            <span class="name">南北</span>
                                        </a>

                                    </div>
                                </div>
                            </dd>
                        </dl>
                        <dl class="dl-lst clear gio_floor">
                            <dt>楼层：</dt>
                            <dd>
                                <div class="option-list multiChk">
                                    <a href="http://sh.lianjia.com/zufang/" gahref="floor-nolimit" class="nolimit on">不限</a>
                                    <div class="item-list">

                                        <a href="http://sh.lianjia.com/zufang/c1" gahref="c1" class="">
                                            <span class="checkbox"></span>
                                            <span class="name">低区</span>
                                        </a>

                                        <a href="http://sh.lianjia.com/zufang/c2" gahref="c2" class="">
                                            <span class="checkbox"></span>
                                            <span class="name">中区</span>
                                        </a>

                                        <a href="http://sh.lianjia.com/zufang/c3" gahref="c3" class="">
                                            <span class="checkbox"></span>
                                            <span class="name">高区</span>
                                        </a>

                                    </div>
                                </div>
                            </dd>
                        </dl>
                        <dl class="dl-lst clear gio_decoration">
                            <dt>装修：</dt>
                            <dd>
                                <div class="option-list multiChk">
                                    <a href="http://sh.lianjia.com/zufang/" gahref="decoration-nolimit" class="nolimit on">不限</a>
                                    <div class="item-list">

                                        <a href="http://sh.lianjia.com/zufang/x1" gahref="x1" class="">
                                            <span class="checkbox"></span>
                                            <span class="name">精装</span>
                                        </a>

                                        <a href="http://sh.lianjia.com/zufang/x2" gahref="x2" class="">
                                            <span class="checkbox"></span>
                                            <span class="name">豪装</span>
                                        </a>

                                        <a href="http://sh.lianjia.com/zufang/x3" gahref="x3" class="">
                                            <span class="checkbox"></span>
                                            <span class="name">中装</span>
                                        </a>

                                        <a href="http://sh.lianjia.com/zufang/x4" gahref="x4" class="">
                                            <span class="checkbox"></span>
                                            <span class="name">简装</span>
                                        </a>

                                        <a href="http://sh.lianjia.com/zufang/x5" gahref="x5" class="">
                                            <span class="checkbox"></span>
                                            <span class="name">毛坯</span>
                                        </a>

                                    </div>
                                </div>
                            </dd>
                        </dl>
                        
                        <dl class="dl-lst clear gio_rent_type">
                            <dt>类型：</dt>
                            <dd>
                                <div class="option-list multiChk">
                                    <a href="http://sh.lianjia.com/zufang/" gahref="brand-nolimit" class="nolimit on">不限</a>
                                    <div class="item-list">

                                        <a href="http://sh.lianjia.com/zufang/i1" gahref="i1" class="">
                                            <span class="checkbox"></span>
                                            <span class="name">整租</span>
                                        </a>

                                        <a href="http://sh.lianjia.com/zufang/i2" gahref="i2" class="">
                                            <span class="checkbox"></span>
                                            <span class="name">合租</span>
                                        </a>

                                    </div>
                                </div>
                            </dd>
                        </dl>
                        <dl class="dl-lst clear gio_label">
                            <dt>标签：</dt>
                            <dd>
                                <div class="option-list multiChk">
                                    <a href="http://sh.lianjia.com/zufang/" gahref="lable-nolimit" class="nolimit on">不限</a>
                                    <div class="item-list">

                                        <a href="http://sh.lianjia.com/zufang/t1" gahref="t1" class="clear ">
                                            <span class="checkbox"></span>
                                            <span class="name">地铁房</span>
                                        </a>

                                        <a href="http://sh.lianjia.com/zufang/t3" gahref="t3" class="clear ">
                                            <span class="checkbox"></span>
                                            <span class="name">随时看</span>
                                        </a>

                                        <a href="http://sh.lianjia.com/zufang/t4" gahref="t4" class="clear ">
                                            <span class="checkbox"></span>
                                            <span class="name">降价</span>
                                        </a>

                                    </div>
                                </div>
                            </dd>
                        </dl>

                    </div>
                    <div class="options-list-more-switch-wrap">
                        <a id="options-list-more-switch" status="0">
                            <span class="text">展开选项（装修、楼层、朝向等）</span>
                            <span class="icon"></span>
                        </a>
                    </div>
                </div>

                <%-- <div class="filter-bar01">
                    <div class="sort-bar" id="sort-bar">
                        <span>排序：</span>
                        <div class="sort-parent on">
                            <a href="http://sh.lianjia.com/zufang/" gahref="default-order"><span>默认</span></a>
                        </div>

                        <div class="sort-parent ">
                            <a href="http://sh.lianjia.com/zufang/s7" gahref="s7"><span>最新</span></a>
                        </div>

                        <div class="sort-parent ">
                            <span>租金</span>
                            <i></i>
                            <ul class="sort-children">
                                <li><a href="http://sh.lianjia.com/zufang/s22" gahref="s22">从低到高</a></li>
                                <li><a href="http://sh.lianjia.com/zufang/s21" gahref="s21">从高到低</a></li>
                            </ul>
                        </div>
                        <div class="sort-parent ">
                            <span>面积</span>
                            <i></i>
                            <ul class="sort-children">
                                <li><a href="http://sh.lianjia.com/zufang/s6" gahref="s6">从小到大</a></li>
                                <li><a href="http://sh.lianjia.com/zufang/s5" gahref="s5">从大到小</a></li>
                            </ul>
                        </div>
                    </div>
                </div> --%>
            </div>
        </div>
        <!--end: 筛选条件-->

        <!--begin: 搜索结果-->

        <div class="main-box clear">
            <div class="con-box">
                <div class="list-head clear">

                    <!--<a href="http://sh.lianjia.com/zufangditu?dataId=sh&amp;type=city" class="btn_map_result fr ml_20" target="_blank" gahref="tooltip_view_on_map">地图查看</a>-->

                    <h2>为您找到<span>63096</span>套房源</h2>
                    <div class="view-type" id="viewType">
                        
                    </div>
                </div>
				
                <div class="list-wrap">
                    <ul id="house-lst" class="house-lst">
                    	<s:iterator var="house" value="#request['houses']" >
                    	
                    	<input type="text" style="visibility: hidden;" name="houseHref" value="${house['HHref'] }" />
                        <li>
                            <div class="pic-panel">
                                <a name="selectDetail" class="rent" target="_blank" href="house-details.action?houseHref=${house['HHref'] }">
                                	<object data="./img/img-err.jpg" type="image/jpg">
                                    <img src="${house['imgHref'] }" data-img-real="http://cdn1.dooioo.com/fetch/vp/fy/gi/20160624/6c64db47-8ca9-49e9-aa71-7073d4d26688.jpg_200x150.jpg" data-img-layout="http://cdn1.dooioo.com/fetch/vp/fy/gi/20160430/52b7e060-9a63-457b-b013-1c03290f5bc4.jpg_200x150.jpg" data-original="http://cdn1.dooioo.com/fetch/vp/fy/gi/20160624/6c64db47-8ca9-49e9-aa71-7073d4d26688.jpg_200x150.jpg" class="lj-lazy" alt="沧源小区，有钥匙房源，上门实拍，交通方便" style="display: inline;">
                                	</object>
                                </a>
                            </div>
                            <div class="info-panel">
                                <h2><a name="selectDetail" gahref="results_click_order_1" key="sh3804714" target="_blank" href="${house['HHref']}" title="${house['HTitle'] }">${house['HTitle'] }</a>

						</h2>
                                <div class="col-1">
                                    <div class="where">
                                        <a class="laisuzhou" href="${house['CHref']}"><span class="nameEllipsis" title="${house['CName']}">${house['CName']}</span></a>&nbsp;&nbsp;
                                        <span>${house["HType"]} 室1厅&nbsp;&nbsp;</span>
                                        <span>${house["area"] }平&nbsp;&nbsp;</span>
                                    </div>
                                    <div class="other">
                                        <div class="con">
                                            <!-- <a href="http://sh.lianjia.com/zufang/minhang/">闵行</a>
                                            <a href="http://sh.lianjia.com/zufang/laominhang/">老闵行</a> -->

                                            <span>| </span> ${house["HLevel"]}楼

                                            <span>| </span> 朝${house["HOrientation"] }

                                        </div>
                                    </div>
                                    <div class="chanquan">
                                        <div class="left agency">
                                            <div class="view-label left">
                                            	<s:iterator var="c" value="#house.HTags.split(',')" >
                                                	<span class="anytime-ex"><span>${c}</span></span>
                                            	</s:iterator>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="price">
                                        <span class="num">${house["price"]}</span>元/月

                                        <!-- <img src="./house-lists_files/animatedec.gif"> -->

                                    </div>
                                    <div class="price-pre">${house["pubDate"] }
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="square">
                                        <div>
                                            <span class="num">12</span>人
                                        </div>
                                        <div class="col-look">收藏过</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    	</s:iterator>

                    </ul>

                </div>
            </div>
        </div>

        <!--begin: 没有搜索结果时：附近小区推荐｜推荐房源-->

        <!--end: 没有搜索结果时：附近小区推荐｜推荐房源-->

        <!--begin:模板－房源推荐-->
        <textarea id="template_recommendHouse" style="display:none"> {#foreach $T.list as house} &lt;li&gt; &lt;div class="pic"&gt; &lt;a href="/zufang/{$T.house.rentCityCode}{$T.house.houseRentId}.html" gahref="tuijian_open_{($T.currentPage-1)*$T.maxPerPage+$T.house$index+1}"&gt; &lt;img src="{$T.house.photourl}" onerror="this.src='http://cdn7.dooioo.com/static/img/new-version/default_block.png'; this.onerror=null;"&gt; &lt;/a&gt; &lt;span&gt;{$T.house.price}元/月&lt;/span&gt; &lt;/div&gt; &lt;div class="title"&gt; &lt;span class="name" title="{$T.house.name}"&gt;&lt;a href="/zufang/{$T.house.rentCityCode}{$T.house.houseRentId}.html" gahref="tuijian_open_{($T.currentPage-1)*$T.maxPerPage+$T.house$index+1}"&gt;{$T.house.name}&lt;/a&gt;&lt;/span&gt; &lt;span class="info"&gt;&lt;span class="grey"&gt;{$T.house.room}室{$T.house.hall}厅/{$T.house.area}平&lt;/span&gt;&lt;/span&gt; &lt;/div&gt; &lt;/li&gt; {#/for} &lt;li class="fix_align"&gt;&lt;/li&gt;
        </textarea>
        <!--end:模板－房源推荐-->
        <!--end: 搜索结果-->
        <!--begin: 翻页组件-->

        <div class="page-box house-lst-page-box">

            <a href="http://sh.lianjia.com/zufang/d1" class="on" gahref="results_d1">1</a>
            <a href="http://sh.lianjia.com/zufang/d2" gahref="results_d2">2</a>
            <a href="http://sh.lianjia.com/zufang/d3" gahref="results_d3">3</a>

            <a href="http://sh.lianjia.com/zufang/d4" gahref="results_d4">4</a>
            <a href="http://sh.lianjia.com/zufang/d5" gahref="results_d5">5</a>
            <a href="http://sh.lianjia.com/zufang/d6" gahref="results_d6">6</a>
            <a href="http://sh.lianjia.com/zufang/d7" gahref="results_d7">7</a> &nbsp;...&nbsp;
            <a href="http://sh.lianjia.com/zufang/d100" gahref="results_totalpage">100</a>

            <a href="http://sh.lianjia.com/zufang/d2" gahref="results_next_page">下一页</a>

        </div>

        <!--end: 翻页组件-->
    </div>
    <!--end: 正文-->

    <!--begin: 登录弹层-->
    <div class="loninContainer" id="loninContainer">
        <div class="overlay_bg" id="loginOverlay"></div>
        <div id="dialog" class="panel_login animated btn-login bounceIn actLoginBtn" gahref="signin_pop_close"><i class="close" style="background: none" gahref="signin_pop_close"><img src="./house-lists_files/close.png" width="52"></i>
            <div class="panel_info">
                <div class="panel_tab">
                    <div class="title">
                        <div class="fl">用户登录</div>
                        <label class="fr">还没有链家网账号？<a href="http://passport.lianjia.com/register/resources/lianjia/register.html?service=http://bj.lianjia.com/" gahref="signin_pop_signup">马上注册</a></label>
                    </div>
                    <div class="clear"></div>
                    <div id="con_login_user">
                        <form action="http://sh.lianjia.com/zufang" method="post">
                            <ul>
                                <li class="show-error" id="user-login-show-error">
                                    <dd id="user-login-show-error_txt">用户名或密码错误</dd>
                                </li>
                                <li class="item userName"><i></i>
                                    <input type="text" id="user_name" class="the_input users" placeholder="请输入手机号">
                                </li>
                                <li class="item pwd"><i></i>
                                    <input type="password" id="user_password" class="the_input password" placeholder="请输入登录密码">
                                </li>
                                <li class="item checkVerimg" style="display:none">
                                    <input type="text" id="user_verimg" class="the_input ver-img" maxlength="4" placeholder="请输入验证码"><img class="verImg"></li>
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
    <!--end: 登录弹层-->

    

    

    <!-- 微聊 -->
    <div id="ng-app" ng-app="weiliaoApp" style="position: absolute;" class="ng-scope">
        <div weiliao-win="">
            <div class="lianjiaim im-fold" ng-class="{&#39;im-fold&#39;: !helper.isShowWeiliaoPop}" id="weiliaoWrapper">
                <div class="lianjiaim-shandow clear">
                    <div class="lianjiaim-wrap" session-win="">
                        <div class="lianjiaim-head" ng-click="clickWeiliaoHeader()"> <span>咨询经纪人</span>
                            <!-- ngIf: computeTotalMsgCount(sessionList) > 0 -->
                            <!-- ngIf: helper.isShowWeiliaoPop -->
                        </div>
                        <div class="lianjiaim-body" style="position: relative">
                            <!-- ngIf: helper.isShowWeiliaoPop && weiliao.isLogin -->
                            <!-- ngIf: !weiliao.isLogin -->
                            <div class="lianjiaim-noagent ng-scope" ng-if="!weiliao.isLogin">
                                <div class="noagent-sub">您还没有登陆,先去登陆/注册吧</div>
                                <div><a href="javascript:;" class="js_login" ng-click="doLogin()">登录/注册</a></div>
                            </div>
                            <!-- ngIf: helper.loading && weiliao.isLogin && !sessionList -->
                            <!-- ngIf: isNobody(sessionList) && weiliao.isLogin && !helper.loading -->
                        </div>
                    </div>
                    <!-- ngIf: helper.isShowChatList -->
                </div>
            </div>
        </div>
    </div>
    <!-- 微聊  end-->

    <script src="./house-lists_files/loginpoplayer.js"></script>
    <script src="./house-lists_files/jquery.lazyload.min.js"></script>
    <script src="./house-lists_files/passport.js"></script>
    <script src="./house-lists_files/suggestion.js"></script>

    <script src="./house-lists_files/search.js"></script>

    <script src="./house-lists_files/AV.realtime.js"></script>
    <script src="./house-lists_files/angular.min.js"></script>
    <script src="./house-lists_files/weiliao.min.js"></script>
    <script src="./house-lists_files/bundle.js"></script>
    <iframe src="./house-lists_files/ns.html" height="0" width="0" style="display:none;visibility:hidden"></iframe>
    <script src="./house-lists_files/user.js"></script>
    <script>
        var nowUrl = "";
        var pagePrefix = "/zufang"
        var ubtData = {
            searchType: "GoHouseDetail",
            searchKeyword: "",
            resultNum: "63096",
        }
        var init = {
            recommendHouseList: [ //推荐房源列表

                {

                    photourl: "http://cdn1.dooioo.com/fetch/vp/fy/gi/20160624/6c64db47-8ca9-49e9-aa71-7073d4d26688.jpg_200x150.jpg",
                    price: "2600",
                    name: "沧源小区",
                    room: "2",
                    hall: "1",
                    area: "57.82",
                    houseRentId: "3804714",
                    rentCityCode: "shz"
                }
            ],
            recommendHouseListPageNo: 1 //推荐房源当前页号
        };
        if (window.sessionStorage) {
            delete window.sessionStorage['isDidSearch'];
        }
    </script>
    <script src="./house-lists_files/zufang_list.js"></script>
	
</body>
</html>

