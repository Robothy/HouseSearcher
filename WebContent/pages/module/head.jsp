<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="lj_header" id="lianjia-header" systemid="zufang">
	<div class="nav-wrap">
		<div class="wrapper">
			<ul class="nav">
				<li class=" "><a href="http://sh.lianjia.com/"
					gahref="header_homepage">首页</a></li>
				<li class=" "><a href="http://sh.lianjia.com/"
					gahref="header_homepage">全部</a></li>

				<li class=" "><a href="http://sh.lianjia.com/xiaoqu"
					gahref="header_xiaoqu">我的收藏</a></li>

			</ul>
			<div class="login">
				<div class="ti-hover">
					<div class="login-panel typeUserInfo">
						<div class="typeShowUser" id="userInfo">
							<span class="welcome"><a href="./register.jsp"><span class="log">注册</span></a>|<a
								id="loginUrl"
								href="#"
								class="btn-login bounceIn actLoginBtn" gahref="header_signin"><span
									class="reg">登录</span></a></span>
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
			<!-- <div class="label fl">租房</div> -->
			<div class="search-txt fr">
				<form id="formSearch" class="clear"
					action="http://sh.lianjia.com/zufang/rs" actdata="zufang"
					method="post">
					<div class="search-tab" style="text-align: center;" >
						<i class="icon"></i>
						<!-- <div class="check" id="channelChked" formact="/zufang/rs"
							actdata="zufang" gahref="search_channel">租房</div>
						<ul class="tabs" style="display: none;">
							<li><label formact="/ershoufang/rs" tips="请输入区域、板块或小区名开始找房"
								actdata="ershoufang">住房</label></li>

							<li><label
								formact="http://sh.fang.lianjia.com/loupan/search" tra="_blank"
								tips="请输入区名或街道名" actdata="xinfang">区域</label></li>

							<li><label formact="/xiaoqu/rs" tra="_blank" tips="请输入小区名"
								actdata="xiaoqu">小区</label></li>
						</ul> -->
						<div class="txt-serach" style="margin-left: auto; margin-right: auto;" >
							<input value=""
								pagetype="zufang" class="left txt autoSuggest" name="keyword"
								autocomplete="off" placeholder="请输入区域、板块或小区名开始找房"
								id="keyword-box" popdiv="suggestion" maxlength="20"
								gahref="search_keyword_box">
							<!-- <div class="hot-sug" id="hot-sug" style="display: none;">
								<ul id="ershoufang">
									<div class="js_hotList js_history">
										<li class="hot-name">搜索历史 <a href="javascript:;"
											class="del js_delHisSuggest">清空搜索记录</a>
										</li>
										<div class="list"></div>
									</div>
									<div class="js_hotList js_hot">
										<li class="hot-name">热门搜索</li>
										<div class="list">

											<li><a
												href="http://sh.lianjia.com/ershoufang/rs%E4%B8%8A%E6%B5%B7%E5%BA%B7%E5%9F%8E"
												gahref="search_hot_ershoufang_click_order_1">热门</a></li>
											<li class="line"></li>

											<li><a
												href="http://sh.lianjia.com/ershoufang/rs%E6%85%A7%E8%8A%9D%E6%B9%96%E8%8A%B1%E5%9B%AD"
												gahref="search_hot_ershoufang_click_order_2">热门慧芝湖花园</a></li>
											<li class="line"></li>

											<li><a
												href="http://sh.lianjia.com/ershoufang/rs%E4%BF%9D%E5%88%A9%E8%A5%BF%E5%AD%90%E6%B9%BE"
												gahref="search_hot_ershoufang_click_order_8">保利西子湾</a></li>

										</div>
									</div>
									<div class="js_hotList js_saveSearch" style="display: block">
										已保存搜索，模板生成
									</div>
								</ul>


								<ul id="zufang">
									<div class="js_hotList js_history">
										<li class="hot-name">搜索历史 <a href="javascript:;"
											class="del">清空搜索记录</a>
										</li>
										<div class="list"></div>
									</div>
									<div class="js_hotList js_hot">
										<li class="hot-name">热门搜索</li>
										<div class="list">

											<li><a
												href="http://sh.lianjia.com/zufang/rs%E9%9D%99%E5%AE%89%E6%96%B0%E5%9F%8E"
												gahref="search_hot_zufang_click_order_1">静安新城</a></li>
											<li class="line"></li>

											<li><a
												href="http://sh.lianjia.com/zufang/rs%E4%B8%8A%E6%B5%B7%E5%BA%B7%E5%9F%8E"
												gahref="search_hot_zufang_click_order_7">上海康城</a></li>
											<li class="line"></li>

											<li><a
												href="http://sh.lianjia.com/zufang/rs%E9%A6%A8%E4%BD%B3%E5%9B%AD"
												gahref="search_hot_zufang_click_order_8">馨佳园</a></li>
											<li class="line"></li>

											<li><a
												href="http://sh.lianjia.com/zufang/rs%E4%B9%9D%E6%AD%8C%E4%B8%8A%E9%83%A1"
												gahref="search_hot_zufang_click_order_9">九歌上郡</a></li>
											<li class="line"></li>

											<li><a
												href="http://sh.lianjia.com/zufang/rs%E5%9C%B0%E6%9D%B0%E5%9B%BD%E9%99%85%E5%9F%8E"
												gahref="search_hot_zufang_click_order_10">地杰国际城</a></li>

										</div>
									</div>
									<div class="js_hotList js_saveSearch" style="display: block">
										已保存搜索，模板生成
									</div>
								</ul>

								<ul id="xiaoqu">
									<div class="js_hotList js_history">
										<li class="hot-name">搜索历史 <a href="javascript:;"
											class="del">清空搜索记录</a>
										</li>
										<div class="list"></div>
									</div>
									<div class="js_hotList js_hot">
										<li class="hot-name">热门搜索</li>
										<div class="list">
											<li><a
												href="http://sh.lianjia.com/xiaoqu/rs%E6%96%B0%E9%AB%98%E8%8B%91"
												gahref="search_hot_xiaoqu_click_order_5">新高苑</a></li>
											<li class="line"></li>

											<li><a
												href="http://sh.lianjia.com/xiaoqu/rs%E4%B9%9D%E5%9F%8E%E6%B9%96%E6%BB%A8%E5%9B%BD%E9%99%85"
												gahref="search_hot_xiaoqu_click_order_6">九城湖滨国际</a></li>
											<li class="line"></li>

											<li><a
												href="http://sh.lianjia.com/xiaoqu/rs%E5%90%8C%E6%B6%A6%E8%8F%B2%E8%AF%97%E8%89%BE%E4%BC%A6"
												gahref="search_hot_xiaoqu_click_order_7">同润菲诗艾伦</a></li>
											<li class="line"></li>

											<li><a
												href="http://sh.lianjia.com/xiaoqu/rs%E4%BB%81%E6%81%92%E6%BB%A8%E6%B1%9F%E5%9B%AD"
												gahref="search_hot_xiaoqu_click_order_8">仁恒滨江园</a></li>

										</div>
									</div>
									<div class="js_hotList js_saveSearch" style="display: block">
										已保存搜索，模板生成
									</div>
								</ul>
								<ul style="border: 0;"></ul>
							</div> -->
							<div id="suggest-cont" class="suggest-wrap"
								style="width: 628px; display: none">
								<ul style="width: 100%; display: none;"
									class="ui-autocomplete ui-front ui-menu ui-widget ui-widget-content"
									id="suggestion">
								</ul>
							</div>
						</div>
					</div>
					<input type="text" style="display: none">
					<button type="button" id="btn_topSearch"
						class="act-search btn home-ico ico-search" gahref="search_submmit">搜索</button>
				</form>

			</div>

		</div>
	</div>
</body>
</body>
</html>