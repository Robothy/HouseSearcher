<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <script type="text/javascript" async="" src="./dtl_files/analytics.js"></script>
      <style type="text/css">@charset "UTF-8";[ng\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide{display:none !important;}ng\:form{display:block;}</style>
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta http-equiv="Cache-Control" content="no-transform">
      <meta http-equiv="Cache-Control" content="no-siteapp">
      <meta name="format-detection" content="telephone=no">
      <link href="http://sh.lianjia.com/public/img/favicon.ico" type="image/x-icon" rel="icon">
      <link href="http://sh.lianjia.com/public/img/favicon.ico" type="image/x-icon" rel="shortcut icon">
      <title>dtl</title>
      <meta name="keywords" content="两室户，钥匙房，生活很便利，空气清新海天公寓推荐租房房源,海天公寓优质租房">
      <meta name="description" content="两室户，钥匙房，生活很便利，空气清新 租房推荐，两室户，钥匙房，生活很便利，空气清新 用户值得关注的好房源，向上海租房用户推荐海天公寓优质租房房源。">
      <link rel="stylesheet" href="./dtl_files/common.css">
      <link rel="stylesheet" href="./dtl_files/header.css">
      <link rel="stylesheet" href="./dtl_files/weiliao.css">
      <link rel="stylesheet" href="./dtl_files/detail.css">
      <link rel="stylesheet" href="./dtl_files/detail_top.css">
      <!--[if lt IE 9]>
      <script type="text/javascript" src="http://sh.lianjia.com/public/js/html5.js"></script>
      <![endif]-->
      <script type="text/javascript" async="" src="./dtl_files/vds.js"></script><script async="" src="./dtl_files/gtm.js"></script><script async="" src="./dtl_files/analytics.js(1)"></script><script>
         var headerParameters = {
         	env : 'production',
         	publichost : 'http://sh.lianjia.com',
         	photohost : 'http://cdn1.dooioo.com',
         	statichost : 'http://cdn7.dooioo.com',
         	managehost : 'http://support.dooioo.com',
         	webhost : 'http://sh.lianjia.com',
         	xinfanghost : 'http://sh.fang.lianjia.com',
         	uchost : 'http://user.sh.lianjia.com',
         	agenthost : 'http://agent.sh.lianjia.com',
         	apihost : 'http://soa.dooioo.com',
         	openhost : 'http://open.dooioo.com',
         	chathost : 'http://chat.dooioo.com',
         	loginhost:'http://huihua.lianjia.com',
         	cityId : '310000',
         	cityCode : 'sh',
         	cityName : '上海',
         	lianjiaSource:'',
         	lianjiaSignature:'',
         	newHouseModuleSwitch:'true',
         	hasFixBar : true, //是否有右侧边栏
         	hasSaveSearch : true //是否支持登录后把缓存在本地local中的“已保存搜索”数据存入服务端功能
         }
      </script>
      <script src="./dtl_files/jquery.min.js"></script>
      <script src="./dtl_files/jQuery.XDomainRequest.js"></script>
      <script src="./dtl_files/jquery.qrcode.min.js"></script>
      <script src="./dtl_files/jquery-upload-1.0.js"></script>
      <script src="./dtl_files/jquery-jtemplates.js"></script>
      <script src="./dtl_files/jquery.cookie.js"></script>
      <script src="./dtl_files/common.js"></script>
      <script src="./dtl_files/compare.js"></script>
      <script src="./dtl_files/saveSearchInit.js"></script>
      <script src="./dtl_files/ljubt.min.js"></script><script src="./dtl_files/lianjiaUlog.js"></script>
      <style type="text/css">.BMap_mask{background:transparent url(http://api0.map.bdimg.com/images/blank.gif);}.BMap_noscreen{display:none;}.BMap_button{cursor:pointer;}.BMap_zoomer{background-image:url(http://api0.map.bdimg.com/images/mapctrls1d3.gif);background-repeat:no-repeat;overflow:hidden;font-size:1px;position:absolute;width:7px;height:7px;}.BMap_stdMpCtrl div{position:absolute;}.BMap_stdMpPan{width:44px;height:44px;overflow:hidden;background:url(http://api0.map.bdimg.com/images/mapctrls2d0.png) no-repeat;}.BMap_ie6 .BMap_stdMpPan{background:none;}.BMap_ie6 .BMap_smcbg{left:0;width:44px;height:464px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src="http://api0.map.bdimg.com/images/mapctrls2d0.png");}.BMap_ie6 .BMap_stdMpPanBg{z-index:-1;}.BMap_stdMpPan .BMap_button{height:15px;width:15px;}.BMap_panN,.BMap_panW,.BMap_panE,.BMap_panS{overflow:hidden;}.BMap_panN{left:14px;top:0;}.BMap_panW{left:1px;top:12px;}.BMap_panE{left:27px;top:12px;}.BMap_panS{left:14px;top:25px;}.BMap_stdMpZoom{top:45px;overflow:hidden;}.BMap_stdMpZoom .BMap_button{width:22px;height:21px;left:12px;overflow:hidden;background-image:url(http://api0.map.bdimg.com/images/mapctrls2d0.png);background-repeat:no-repeat;z-index:10;}.BMap_ie6 .BMap_stdMpZoom .BMap_button{background:none;}.BMap_stdMpZoomIn{background-position:0 -221px;}.BMap_stdMpZoomOut{background-position:0 -265px;}.BMap_ie6 .BMap_stdMpZoomIn div{left:0;top:-221px;}.BMap_ie6 .BMap_stdMpZoomOut div{left:0;top:-265px;}.BMap_stdMpType4 .BMap_stdMpZoom .BMap_button{left:0;overflow:hidden;background:-webkit-gradient(linear,50% 0,50% 100%,from(rgba(255,255,255,0.85)),to(rgba(217,217,217,0.85)));z-index:10;-webkit-border-radius:22px;width:34px;height:34px;border:1px solid rgba(255,255,255,0.5);-webkit-box-shadow:0 2px 3.6px #CCC;display:-webkit-box;-webkit-box-align:center;-webkit-box-pack:center;-webkit-box-sizing:border-box;}.BMap_stdMpType4 .BMap_smcbg{position:static;background:url(http://api0.map.bdimg.com/images/mapctrls2d0_mb.png) 0 0 no-repeat;-webkit-background-size:24px 32px;}.BMap_stdMpType4 .BMap_stdMpZoomIn{background-position:0 0;}.BMap_stdMpType4 .BMap_stdMpZoomIn .BMap_smcbg{width:24px;height:24px;background-position:0 0;}.BMap_stdMpType4 .BMap_stdMpZoomOut{background-position:0 0;}.BMap_stdMpType4 .BMap_stdMpZoomOut .BMap_smcbg{width:24px;height:6px;background-position:0 -25px;}.BMap_stdMpSlider{width:37px;top:18px;}.BMap_stdMpSliderBgTop{left:18px;width:10px;overflow:hidden;background:url(http://api0.map.bdimg.com/images/mapctrls2d0.png) no-repeat -23px -226px;}.BMap_stdMpSliderBgBot{left:19px;height:8px;width:10px;top:124px;overflow:hidden;background:url(http://api0.map.bdimg.com/images/mapctrls2d0.png) no-repeat -33px bottom;}.BMap_ie6 .BMap_stdMpSliderBgTop,.BMap_ie6 .BMap_stdMpSliderBgBot{background:none;}.BMap_ie6 .BMap_stdMpSliderBgTop div{left:-23px;top:-226px;}.BMap_ie6 .BMap_stdMpSliderBgBot div{left:-33px;bottom:0;}.BMap_stdMpSliderMask{height:100%;width:24px;left:10px;cursor:pointer;}.BMap_stdMpSliderBar{height:11px;width:19px;left:13px;top:80px;overflow:hidden;background:url(http://api0.map.bdimg.com/images/mapctrls2d0.png) no-repeat 0 -309px;}.BMap_stdMpSliderBar.h{background:url(http://api0.map.bdimg.com/images/mapctrls2d0.png) no-repeat 0 -320px;}.BMap_ie6 .BMap_stdMpSliderBar,.BMap_ie6 .BMap_stdMpSliderBar.h{background:none;}.BMap_ie6 .BMap_stdMpSliderBar div{top:-309px;}.BMap_ie6 .BMap_stdMpSliderBar.h div{top:-320px;}.BMap_zlSt,.BMap_zlCity,.BMap_zlProv,.BMap_zlCountry{position:absolute;left:34px;height:21px;width:28px;background-image:url(http://api0.map.bdimg.com/images/mapctrls2d0.png);background-repeat:no-repeat;font-size:0;cursor:pointer;}.BMap_ie6 .BMap_zlSt,.BMap_ie6 .BMap_zlCity,.BMap_ie6 .BMap_zlProv,.BMap_ie6 .BMap_zlCountry{background:none;overflow:hidden;}.BMap_zlHolder{display:none;position:absolute;top:0;}.BMap_zlHolder.hvr{display:block;}.BMap_zlSt{background-position:0 -380px;top:21px;}.BMap_zlCity{background-position:0 -401px;top:52px;}.BMap_zlProv{background-position:0 -422px;top:76px;}.BMap_zlCountry{background-position:0 -443px;top:100px;}.BMap_ie6 .BMap_zlSt div{top:-380px;}.BMap_ie6 .BMap_zlCity div{top:-401px;}.BMap_ie6 .BMap_zlProv div{top:-422px;}.BMap_ie6 .BMap_zlCountry div{top:-443px;}.BMap_stdMpType1 .BMap_stdMpSlider,.BMap_stdMpType2 .BMap_stdMpSlider,.BMap_stdMpType3 .BMap_stdMpSlider,.BMap_stdMpType4 .BMap_stdMpSlider,.BMap_stdMpType2 .BMap_stdMpZoom,.BMap_stdMpType3 .BMap_stdMpPan,.BMap_stdMpType4 .BMap_stdMpPan{display:none;}.BMap_stdMpType3 .BMap_stdMpZoom{top:0;}.BMap_stdMpType4 .BMap_stdMpZoom{top:0;}.BMap_cpyCtrl a{font-size:11px;color:#7979CC;}.BMap_scaleCtrl{height:23px;overflow:hidden;}.BMap_scaleCtrl div.BMap_scaleTxt{font-size:11px;font-family:Arial,sans-serif;}.BMap_scaleCtrl div{position:absolute;overflow:hidden;}.BMap_scaleHBar img,.BMap_scaleLBar img,.BMap_scaleRBar img{position:absolute;width:37px;height:442px;left:0;}.BMap_scaleHBar{width:100%;height:5px;font-size:0;bottom:0;}.BMap_scaleHBar img{top:-437px;width:100%;}.BMap_scaleLBar,.BMap_scaleRBar{width:3px;height:9px;bottom:0;font-size:0;z-index:1;}.BMap_scaleLBar img{top:-427px;left:0;}.BMap_scaleRBar img{top:-427px;left:-5px;}.BMap_scaleLBar{left:0;}.BMap_scaleRBar{right:0;}.BMap_scaleTxt{text-align:center;width:100%;cursor:default;line-height:18px;}.BMap_omCtrl{background-color:#fff;overflow:hidden;}.BMap_omOutFrame{position:absolute;width:100%;height:100%;left:0;top:0;}.BMap_omInnFrame{position:absolute;border:1px solid #999;background-color:#ccc;overflow:hidden;}.BMap_omMapContainer{position:absolute;overflow:hidden;width:100%;height:100%;left:0;top:0;}.BMap_omViewMv{border-width:1px;border-style:solid;border-left-color:#84b0df;border-top-color:#adcff4;border-right-color:#274b8b;border-bottom-color:#274b8b;position:absolute;z-index:600;}.BMap_omViewInnFrame{border:1px solid #3e6bb8;}.BMap_omViewMask{width:1000px;height:1000px;position:absolute;left:0;top:0;background-color:#68c;opacity:.2;filter:progid:DXImageTransform.Microsoft.Alpha(opacity=20);}.BMap_omBtn{height:13px;width:13px;position:absolute;cursor:pointer;overflow:hidden;background:url(http://api0.map.bdimg.com/images/mapctrls1d3.gif) no-repeat;z-index:1210;}.anchorBR .BMap_omOutFrame{border-top:1px solid #999;border-left:1px solid #999;}.quad4 .BMap_omBtn{background-position:-26px -27px;}.quad4 .BMap_omBtn.hover{background-position:0 -27px;}.quad4 .BMap_omBtn.BMap_omBtnClosed{background-position:-39px -27px;}.quad4 .BMap_omBtn.BMap_omBtnClosed.hover{background-position:-13px -27px;}.anchorTR .BMap_omOutFrame{border-bottom:1px solid #999;border-left:1px solid #999;}.quad1 .BMap_omBtn{background-position:-39px -41px;}.quad1 .BMap_omBtn.hover{background-position:-13px -41px;}.quad1 .BMap_omBtn.BMap_omBtnClosed{background-position:-26px -41px;}.quad1 .BMap_omBtn.BMap_omBtnClosed.hover{background-position:0 -41px;}.anchorBL .BMap_omOutFrame{border-top:1px solid #999;border-right:1px solid #999;}.quad3 .BMap_omBtn{background-position:-27px -40px;}.quad3 .BMap_omBtn.hover{background-position:-1px -40px;}.quad3 .BMap_omBtn.BMap_omBtnClosed{background-position:-40px -40px;}.quad3 .BMap_omBtn.BMap_omBtnClosed.hover{background-position:-14px -40px;}.anchorTL .BMap_omOutFrame{border-bottom:1px solid #999;border-right:1px solid #999;}.quad2 .BMap_omBtn{background-position:-40px -28px;}.quad2 .BMap_omBtn.hover{background-position:-14px -28px;}.quad2 .BMap_omBtn.BMap_omBtnClosed{background-position:-27px -28px;}.quad2 .BMap_omBtn.BMap_omBtnClosed.hover{background-position:-1px -28px;}.anchorR .BMap_omOutFrame{border-bottom:1px solid #999;border-left:1px solid #999;border-top:1px solid #999;}.anchorL .BMap_omOutFrame{border-bottom:1px solid #999;border-right:1px solid #999;border-top:1px solid #999;}.anchorB .BMap_omOutFrame{border-top:1px solid #999;border-left:1px solid #999;border-right:1px solid #999;}.anchorT .BMap_omOutFrame{border-bottom:1px solid #999;border-right:1px solid #999;border-left:1px solid #999;}.anchorNon .BMap_omOutFrame,.withOffset .BMap_omOutFrame{border:1px solid #999;}.BMap_zoomMask0,.BMap_zoomMask1{position:absolute;left:0;top:0;width:100%;height:100%;background:transparent url(http://api0.map.bdimg.com/images/blank.gif);z-index:1000;}.BMap_contextMenu{position:absolute;border-top:1px solid #adbfe4;border-left:1px solid #adbfe4;border-right:1px solid #8ba4d8;border-bottom:1px solid #8ba4d8;padding:0;margin:0;width:auto;visibility:hidden;background:#fff;z-index:10000000;}.BMap_cmShadow{position:absolute;background:#000;opacity:.3;filter:alpha(opacity=30);visibility:hidden;z-index:9000000;}div.BMap_cmDivider{border-bottom:1px solid #adbfe4;font-size:0;padding:1px;margin:0 6px;}div.BMap_cmFstItem{margin-top:2px;}div.BMap_cmLstItem{margin-bottom:2px;}.BMap_shadow img{border:0 none;margin:0;padding:0;height:370px;width:1144px;}.BMap_pop .BMap_top{border-top:1px solid #ababab;background-color:#fff;}.BMap_pop .BMap_center{border-left:1px solid #ababab;border-right:1px solid #ababab;background-color:#fff;}.BMap_pop .BMap_bottom{border-bottom:1px solid #ababab;background-color:#fff;}.BMap_shadow,.BMap_shadow img,.BMap_shadow div{-moz-user-select:none;-webkit-user-select:none;}.BMap_checkbox{background:url(http://api0.map.bdimg.com/images/mapctrls1d3.gif);vertical-align:middle;display:inline-block;width:11px;height:11px;margin-right:4px;background-position:-14px 90px;}.BMap_checkbox.checked{background-position:-2px 90px;}.BMap_pop .BMap_top img,.BMap_pop .BMap_center img,.BMap_pop .BMap_bottom img{display:none;}@media print{.BMap_noprint{display:none;}.BMap_noscreen{display:block;}.BMap_mask{background:none;}.BMap_pop .BMap_top img,.BMap_pop .BMap_center img,.BMap_pop .BMap_bottom img{display:block;}}.BMap_vectex{cursor:pointer;width:11px;height:11px;position:absolute;background-repeat:no-repeat;background-position:0 0;}.BMap_vectex_nodeT{background-image:url(http://api0.map.bdimg.com/images/nodeT.gif);}.BMap_vectex_node{background-image:url(http://api0.map.bdimg.com/images/node.gif);}.iw{width:100%;-webkit-box-sizing:border-box;border:.3em solid transparent;-webkit-background-clip:padding;}.iw_rt{position:relative;height:46px;width:195px;-webkit-box-sizing:border-box;display:-webkit-box;-webkit-box-align:center;margin:2px 5px 0 2px;background-color:rgba(0,0,0,0.8);-webkit-box-shadow:2px 2px 7px rgba(0,0,0,0.3);-webkit-border-radius:2px;color:#fff;}.iw_rt:after{content:"";position:absolute;left:50%;bottom:-8px;width:0;height:0;border-left:5px solid transparent;border-top:8px solid rgba(0,0,0,0.8);border-right:5px solid transparent;margin:0 0 0 -6px;}.iw_s{text-align:center;vertical-align:middle;height:100%;-webkit-box-sizing:border-box;}.iw_rt .iw_s1{color:#cbcbcb;}.iw_rt b{color:#fff;font-weight:bold;}.iw_rt_gr{margin-left:-4px;}.iw_busline{margin:32px 0 0 -3px;}.iw_busline .iw_cc{text-align:center;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;padding:0 6px;}.iw_r{-webkit-box-ordinal-group:3;}.iw_r,.iw_l{height:100%;font-size:4.5em;text-align:center;color:#747474;border:none;-webkit-box-sizing:border-box;-webkit-border-radius:0;line-height:.7em;border:1px solid rgba(255,255,255,0.2);width:41px;}.iw_r{border-style:none none none solid;}.iw_l{border-style:none solid none none;}.iw_search,.iw_l{background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAlCAYAAAAuqZsAAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ bWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6 eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEz NDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAv IiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RS ZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpD cmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNl SUQ9InhtcC5paWQ6QjA3NjMyREJDNzQ2MTFFMTlBQUM5QzlCRDZGODZCQkYiIHhtcE1NOkRvY3Vt ZW50SUQ9InhtcC5kaWQ6QjA3NjMyRENDNzQ2MTFFMTlBQUM5QzlCRDZGODZCQkYiPiA8eG1wTU06 RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpCMDc2MzJEOUM3NDYxMUUxOUFB QzlDOUJENkY4NkJCRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpCMDc2MzJEQUM3NDYxMUUx OUFBQzlDOUJENkY4NkJCRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1w bWV0YT4gPD94cGFja2V0IGVuZD0iciI/PllB9T8AAAKuSURBVHjaxFjRcdpAEAX+mVEqiFxB5AoQ HZAKElcArsBWBSgVQCoAVwCuwEoFlivwGQpI7jKrzGXn7ep0EsPO7BjLp/O73bdv9xifTqdRpCXW c+sz65n1lNy3mvzZemX9aN34C6bTKdx8HAHMgVlaX0QeaGv9J4EcBJgD9EA/hzAH7N4Cq/oAW1tf KX+vKEXP7PlMSLFvhQX32BWY49GBOIRO7FKy57wBlnoUQHu5yJX+g4mymdvgFWzkAM3JtwGgmiJw a2/pvQoEYBQCLKNI8RfuaeNjT245gAUdqgHdmkqUPiOctLdJVYkithkAVO/K5cC+M30KAZVSxboo /ybnn1eIR5r5qUyI7P4GX6nqJHskbQsxQ7wqu6aSn2qrgHLrXjqAat5ZC0WlRuzVE0J3uhtBCjRt a3qjX92JIMiOIqYtYgumzpo+7RRtu/E0zvknokMF5GgdQv4Ze/5DWL8CFVe2aNuedGsLCi1vS+WL F4WKNkL2Dnh414FnO1b1R5vKuRaxjKUF2YKBqjuCGtF6nyL5+XxOJWCcL2/CpjzdRYRuGpDShQQs ARUj9U/OnRh7Yr9/CW1JXU4fYxXoHIMCu+iB+gBLIt/LgShDYCYktGCDfCBgvyRgVQgZwTy/jIzy EnQNMZV1QCT4bJ+3XFCkS81/WijdkiYAdSak04BWtabWEmIbsNZYgU00YE+gjyErQeo31GpShVMH Yc+/dwsEzh97/D6ojT2ZMlM1XwN8WP9Ma7NAbZvbtBoEjE+jBT2TusCu5SIbI7z/wLWN1rdKi0o6 cqwTuAmYyTm5NQW/82atWvlnBbo7apxD98qDJxl7mkC76JQ2Qm0CI1xKF95Gb4oLXHJDwJlxjy/u LgruGtNFM8lqnNtfK2JqN3CVeW1gzWj9jThd0xd59R8BBgAAiefGO1Bt1gAAAABJRU5ErkJggg==") no-repeat 50% 50%;-webkit-background-size:19px 19px;}.iw_line_s,.iw_r{background:url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACUAAAAmCAYAAABDClKtAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ bWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6 eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEz NDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAv IiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RS ZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpD cmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNSBNYWNpbnRvc2giIHhtcE1NOkluc3RhbmNl SUQ9InhtcC5paWQ6QjA3NjMyREZDNzQ2MTFFMTlBQUM5QzlCRDZGODZCQkYiIHhtcE1NOkRvY3Vt ZW50SUQ9InhtcC5kaWQ6QjA3NjMyRTBDNzQ2MTFFMTlBQUM5QzlCRDZGODZCQkYiPiA8eG1wTU06 RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpCMDc2MzJEREM3NDYxMUUxOUFB QzlDOUJENkY4NkJCRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpCMDc2MzJERUM3NDYxMUUx OUFBQzlDOUJENkY4NkJCRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1w bWV0YT4gPD94cGFja2V0IGVuZD0iciI/PqheQ+MAAAEtSURBVHja7JftDYIwEIbB8JeEUXACZQPd oGygE+gGxAnQEZzAOgEdwREIDKBXUgjBIqW5Npj0kvcHpG0erveFX1WVZ8l2oBhEhRoLw/BroW8J KgeR3vMVlI5BrSwAHQZAnngmYxtMe4oIL41ZAp6iNqF4/BQTa0oBxmxAcaAHKFJY+wKtAaw0CRUJ oHjGHiY8VpqCKmYCdRkJUKmJ7Ms1gZqkqOs6w/bUGXRCOGePCcXjaItwDsW8PoZ0zhM70IeeyiZi jH/Isf+CF9MAOdCppDj+LJ6yim6j9802B6VqQa818BFjY6AHakHp9Crj15ctCaiFIi7Q/wCKLRHq vjSoVNKWunH4rTBDv5Cv7NKeKfvvU2nINzHAuexzUA7KQTkoB6UxDicKvc+qfQQYABaiUBxugCsr AAAAAElFTkSuQmCC") no-repeat 50% 50%;-webkit-background-size:19px 19px;}.iw_line{height:64px;width:228px;padding:0 11px;line-height:20px;}.iw_bustrans .iw_cc{text-align:center;}.iw_c{color:#FFFFFF;text-decoration:none;overflow:hidden;display:-webkit-box;-webkit-box-align:center;-webkit-box-flex:1;}.iw_cc{-webkit-box-sizing:border-box;width:100%;border:none;}.gray_background{filter:alpha(opacity=50);-moz-opacity:0.5;-khtml-opacity:0.5;opacity: 0.5} .light_gray_background {filter:alpha(opacity=70);-moz-opacity:0.7;-khtml-opacity:0.7;opacity: 0.7} .panoInfoBox {cursor: pointer; } .panoInfoBox {position: relative; width: 323px; height: 101px; margin-bottom: 4px; cursor: pointer; } .panoInfoBox .panoInfoBoxTitleBg {width: 323px; height: 19px; position: absolute; left: 0; bottom: 0; z-index: 2; background-color: #000; opacity: .7; } .panoInfoBox .panoInfoBoxTitleContent {font-size: 12px; color: #fff; position: absolute; bottom: 2px; left: 5px; z-index: 3; text-decoration: none; } .RouteAddressOuterBkg{position:relative; padding: 32px 4px 4px 3px; background-color:#ffdd99; } .RouteAddressInnerBkg{padding: 3px 5px 8px 8px; background-color:#ffffff; } #RouteAddress_DIV1{margin-top: 5px; } .RouteAddressTip{position:absolute; width:100%; top:0px; text-align:center; height:30px; line-height:30px; color:#994c00; } .route_tip_con {position:absolute;top:145px;} .route_tip_con .route_tip{position:absolute;width:233px;height:29px;color:#803300;text-align:center;line-height:29px;border:#cc967a solid 1px;background:#fff2b2;z-index:100000;} .route_tip_con .route_tip span{position:absolute;top:0;right:0;_right:-1px;width:14px;height:13px;background:url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107) no-repeat 0 -121px;cursor:pointer;} .route_tip_con .route_tip_shadow{width:233px;height:29px;  position:absolute;left:1px;top:1px;background:#505050;border:1px solid #505050;opacity:0.2;filter:alpha(opacity=20)} .sel_body_body_page{margin:5px 0} .sel_n{margin-top:5px;overflow:hidden;} .sel_n .sel_top{background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0 -418px;height:4px;font-size:0px;} .sel_n .sel_body_top{height:32px;width:100%;background:url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107) no-repeat 0 -41px;} .sel_n .sel_body_title{float:left;width:100%;height:31px;} .sel_n .sel_body_sign{margin-top:1px;width:30px;height:31px;float:left;background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat -79px -387px;} .sel_n .sel_body_name{height: 10px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; margin:0 20px 0 30px;padding:8px 7px 7px;font-size:14px;color:#FA8722;} .sel_n .sel_body_button{float:left;width:55px;margin-left:-55px;padding-top:8px;} .sel_n .sel_body_button a{} .sel_n .sel_bottom{background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0 -415px;height:4px;font-size:0px;} .sel_n .sel_body_body{padding:3px 0 0 0} .sel_n1{margin-top:5px;width:329px;overflow:hidden;} .sel_n1 .sel_top{background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0 -418px;height:4px;font-size:0px;} .sel_n1 .sel_body_top{height:31px;width:100%;background:url(http://api0.map.bdimg.com/images/sel_body_n_top.gif) repeat-x;} .sel_n1 .sel_body_top{height:32px;width:100%;background:url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107) no-repeat 0 -41px} .sel_n1 .sel_body_title{float:left;width:100%;height:31px;cursor:pointer;} .sel_n1 .sel_body_sign{margin-top:1px;width:30px;height:31px;float:left;background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat -79px -387px;} .sel_n1 .sel_body_name{margin:0 20px 0 30px;padding:8px 7px 7px;font-size:14px;color:#FA8722;} .sel_n1 .sel_body_button{float:left;width:20px;height:31px;margin-left:-23px;background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat -253px -382px;overflow:hidden;zoom:1;cursor:pointer;} .sel_n1 .sel_body_button a{display:none;} .sel_n1 .sel_body_body{display:none} .sel_n1 .sel_bottom{background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0 -415px;height:4px;font-size:0px;} .sel_y{margin-top:5px;overflow:hidden;} .sel_y .sel_top{background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0 -439px;height:4px;zoom:1;font-size:0px;} .sel_y .sel_body_top{height:32px;width:100%;background:url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107) no-repeat 0 0} .sel_y .sel_body_title{float:left;width:100%;height:31px;cursor:pointer;} .sel_y .sel_body_sign{margin-top:1px;width:30px;height:31px;float:left;background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat -167px -384px;} .sel_y .sel_body_name{margin:0 20px 0 30px;padding:8px 7px 7px;font-size:14px;color:#5B7BCB;} .sel_y .sel_body_button{float:left;width:20px;height:31px;margin-left:-20px;background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat -269px -297px;cursor:pointer;} .sel_y .sel_body_button a{display:none;} .sel_y .sel_body_body{display:none;height:0px} .sel_y .sel_body_body_div{} .sel_y .sel_bottom{background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0 -436px;height:4px;font-size:0px;} .sel_y .sel_body_body_page{display:none;height:0px;} .sel_x{margin-top:5px;width:329px;overflow:hidden;} .sel_x .sel_top{background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0 -418px;height:4px;font-size:0px;} .sel_x .sel_body_top{height:32px;width:100%;background:url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107) no-repeat 0 -41px;} .sel_x .sel_body_title{float:left;width:100%;height:31px;} .sel_x .sel_body_sign{margin-top:1px;width:30px;height:31px;float:left;background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat -122px -384px;} .sel_x .sel_body_name{margin:0 20px 0 30px;padding:8px 7px 7px;font-size:14px;color:#FA8722;} .sel_x .sel_body_button{float:left;width:55px;margin-left:-55px;padding-top:8px;} .sel_x .sel_body_button a{} .sel_x .sel_body_body{} .sel_x .sel_body_body_div{padding:5px 5px 0 5px;} .sel_x .sel_bottom{background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0 -415px;height:4px;font-size:0px;} .sel_x1{margin-top:5px;width:329px;overflow:hidden;} .sel_x1 .sel_top{background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0 -418px;height:4px;font-size:0px;} .sel_x1 .sel_body_top{height:32px;width:100%;background:url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107) no-repeat 0 -41px} .sel_x1 .sel_body_title{float:left;width:100%;height:31px;cursor:pointer;} .sel_x1 .sel_body_sign{margin-top:1px;width:30px;height:31px;float:left;background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat -122px -384px;} .sel_x1 .sel_body_name{margin:0 20px 0 30px;padding:8px 7px 7px;font-size:14px;color:#FA8722;} .sel_x1 .sel_body_button{float:left;width:55px;height:31px;margin-left:-55px;} .sel_x1 .sel_body_button a{display:none;} .sel_x1 .sel_body_body{display:none;height:0px;} .sel_x1 .sel_body_body_div{padding:5px 5px 0 5px;} .sel_x1 .sel_bottom{background:url(http://api0.map.bdimg.com/images/bgs.gif) no-repeat 0 -415px;height:4px;font-size:0px;} .sel_body_citylist{height:100px;padding: 0 0 0 5px} .sel_body_resitem{table-layout:fixed;overflow-x:hidden;overflow-y:hidden;} .sel_body_resitem table {margin-right:5px;} .sel_body_resitem tr{cursor:pointer;} .sel_body_resitem th{padding-top:5px;padding-left:5px;text-align:left;vertical-align:top;width:22px;} .sel_body_resitem th div.iconbg{background:url(http://api0.map.bdimg.com/images/markers_new_ie6.png) no-repeat scroll 0 0;height:29px;width:24px;} .sel_body_resitem th div.icon{cursor:pointer} .sel_body_resitem th div#no_0_1, .sel_body_resitem th div#no_1_1{background-position:0 -64px} .sel_body_resitem th div#no_0_2, .sel_body_resitem th div#no_1_2{background-position:-24px -64px} .sel_body_resitem th div#no_0_3, .sel_body_resitem th div#no_1_3{background-position:-48px -64px} .sel_body_resitem th div#no_0_4, .sel_body_resitem th div#no_1_4{background-position:-72px -64px} .sel_body_resitem th div#no_0_5, .sel_body_resitem th div#no_1_5{background-position:-96px -64px} .sel_body_resitem th div#no_0_6, .sel_body_resitem th div#no_1_6{background-position:-120px -64px} .sel_body_resitem th div#no_0_7, .sel_body_resitem th div#no_1_7{background-position:-144px -64px} .sel_body_resitem th div#no_0_8, .sel_body_resitem th div#no_1_8{background-position:-168px -64px} .sel_body_resitem th div#no_0_9, .sel_body_resitem th div#no_1_9{background-position:-192px -64px} .sel_body_resitem th div#no_0_10, .sel_body_resitem th div#no_1_10{background-position:-216px -64px} .sel_body_resitem td{line-height:160%;padding:3px 0 3px 3px;vertical-align:top;} .sel_body_resitem div.ra_td_title{float:left;margin-right:40px;} .sel_body_resitem div.ra_td_button{float:right; width:40px;} .sel_body_resitem div.ra_td_button input{height:18px;font-size:12px;width:40px;} .sel_body_resitem div.clear{clear:both;height:0px;width:100%;} .sel_body_resitem td .selBtn {width:70px;height:29px;background:url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107) no-repeat -21px -81px;text-align:center;line-height:29px;visibility:hidden;color:#b35900;display:inline-block;*display:inline;*zoom:1;} .sel_body_resitem td .list_street_view_poi {display:inline-block;float:none;margin-right:6px;position:static;*vertical-align:-3px;_vertical-align:-5px;*display:inline;*zoom:1;} .selInfoWndBtn {width:70px;height:29px;background:url(http://api0.map.bdimg.com/images/addrPage.png?v=20121107) no-repeat -21px -81px;text-align:center;line-height:29px;margin: 0 auto;cursor:pointer;color:#b35900} .sel_body_body td a{text-decoration: none; cursor: auto; } .sel_body_body td a:hover,.sel_body_body td a:focus{text-decoration:underline; }.panoInfoBox{cursor:pointer}.panoInfoBox{position:relative;width:323px;height:101px;margin-bottom:4px;cursor:pointer}.panoInfoBox .panoInfoBoxTitleBg{width:323px;height:19px;position:absolute;left:0;bottom:0;z-index:2;background-color:#000;opacity:.7}.panoInfoBox .panoInfoBoxTitleContent{font-size:12px;color:#fff;position:absolute;bottom:2px;left:5px;z-index:3;text-decoration:none}.pano_switch_left,.pano_switch_right{position:absolute;width:28px;height:38px;cursor:pointer;background-color:#252525;background-color:rgba(37,37,37,.9)}.pano_switch_left{background:url(http://api0.map.bdimg.com/images/panorama/zuojiantou.png) no-repeat;-webkit-background-size:100% 100%;background-size:100% 100%}.pano_switch_right{background:url(http://api0.map.bdimg.com/images/panorama/youjiantou.png) no-repeat;-webkit-background-size:100% 100%;background-size:100% 100%}.pano_switch_left:hover{background:url(http://api0.map.bdimg.com/images/panorama/zuojiantou_hover.png) no-repeat;-webkit-background-size:100% 100%;background-size:100% 100%}.pano_switch_right:hover{background:url(http://api0.map.bdimg.com/images/panorama/youjiantou_hover.png) no-repeat;-webkit-background-size:100% 100%;background-size:100% 100%}.pano_switch_left.pano_switch_disable,.pano_switch_right.pano_switch_disable{background:0 0;border:none}.pano_poi_1,.pano_poi_2,.pano_poi_4{display:inline-block;width:16px;height:16px;vertical-align:middle;background:url(http://webmap0.map.bdimg.com/newmap/static/common/images/pano_whole/guide_icons_4b871b2.png) no-repeat;background-position:0 0}.pano_photo_arrow_l,.pano_photo_arrow_r{position:absolute;top:0;width:20px;height:100%;background:#f3eeee}.pano_photo_arrow_l{left:0}.pano_photo_arrow_r{right:0}.pano_arrow_l,.pano_arrow_r{display:inline-block;width:18px;height:18px;background:url(http://webmap0.map.bdimg.com/newmap/static/common/images/pano_whole/pano-icons_223a291.png) no-repeat}.pano_catlogLi{cursor:pointer;position:relative;line-height:10px;font-size:10px;text-align:center;color:#abb0b2;border:1px solid #53565c;padding:3px 0;margin-top:3px;margin-left:2px;width:90%}.pano_catlogLi:hover{color:#3DAAFC;border:1px solid #3DAAFC}.pano_catlogLiActive{color:#3DAAFC;border:1px solid #3DAAFC}.pano_arrow_l{background-position:0 -36px}.pano_arrow_r{background-position:-54px -36px}.pano_photo_arrow_l:hover .pano_arrow_l{background-position:-18px -36px}.pano_photo_arrow_r:hover .pano_arrow_r{background-position:-72px -36px}.pano_photo_arrow_l.pano_arrow_disable .pano_arrow_l{background-position:-36px -36px}.pano_photo_arrow_r.pano_arrow_disable .pano_arrow_r{background-position:-90px -36px}.pano_photo_item{position:relative;float:left;line-height:0;padding-left:8px}.pano_photo_decs{position:absolute;bottom:1px;left:0;padding:2px 0;text-indent:5px;margin-left:8px;display:inline-block;color:#fff;background:#000;opacity:.5;filter:alpha(opacity=50)9;text-overflow:ellipsis;overflow:hidden;white-space:nowrap}.pano_photo_item img{display:inline-block;border:solid 1px #252525}.pano_photo_item:hover img{border-color:#005efc}.pano_photo_item_seleted{position:absolute;top:0;left:-100000px;border:3px solid #097df3}.pano_close{position:absolute;right:10px;top:10px;width:40px;cursor:pointer;height:40px;line-height:40px;border-radius:3px;background-color:rgba(37,37,37,.9);background-image:url(http://api0.map.bdimg.com/images/panorama/close.png);background-repeat:no-repeat;background-position:center center;background-size:90%}.pano_close:hover{background-image:url(http://api0.map.bdimg.com/images/panorama/close_hover.png)}.pano_pc_indoor_exit{position:absolute;right:60px;top:10px;width:89px;cursor:pointer;height:40px;line-height:40px;color:#ebedf0;border-radius:3px;background-color:#252525;background-color:rgba(37,37,37,.9);background-image:url(http://api0.map.bdimg.com/images/panorama/indoor_exit.png);background-repeat:no-repeat;background-position:15px 12px}.pano_pc_indoor_exit:hover{background-image:url(http://api0.map.bdimg.com/images/panorama/indoor_exit_hover.png);color:#2495ff}.pano_m_indoor_exit{font-size:16px;position:absolute;right:30px;top:10px;width:89px;cursor:pointer;height:40px;line-height:40px;color:#ebedf0;border-radius:3px;background-color:#252525;background-color:rgba(37,37,37,.9);background-image:url(http://api0.map.bdimg.com/images/panorama/indoor_exit.png);background-repeat:no-repeat;background-position:15px 12px}.navtrans-table tr{color:#666}.navtrans-table tr:hover{color:#333}.navtrans-navlist-icon{float:left;width:18px;height:16px;background:url(http://webmap0.map.bdimg.com/wolfman/static/common/images/nav-icon_b5c3223.png) no-repeat 0px 0px;_background:url(http://webmap0.map.bdimg.com/wolfman/static/common/images/nav-icon_ie6_134841b.png) no-repeat 0px 0px;margin-top:2px;margin-right:5px}.navtrans-navlist-icon.s-1{background-position:0px 0px}.navtrans-navlist-icon.s-2{background-position:-18px 0px}.navtrans-navlist-icon.s-3{background-position:-36px 0px}.navtrans-navlist-icon.s-4{background-position:-54px 0px}.navtrans-navlist-icon.s-5{background-position:-72px 0px}.navtrans-navlist-icon.s-6{background-position:-90px 0px}.navtrans-navlist-icon.s-7{background-position:0px -16px}.navtrans-navlist-icon.s-8{background-position:-18px -16px}.navtrans-navlist-icon.s-9{background-position:-36px -16px}.navtrans-navlist-icon.s-10{background-position:-54px -16px}.navtrans-navlist-icon.s-11{background-position:-72px -16px}.navtrans-navlist-icon.s-12{background-position:-90px -16px}.navtrans-navlist-icon.s-13{background-position:0px -32px}.navtrans-navlist-icon.s-14{background-position:-18px -32px}.navtrans-navlist-icon.s-18{background-position:-36px -32px}.navtrans-navlist-icon.s-19{background-position:-54px -32px}.navtrans-navlist-icon.s-20{background-position:-72px -32px}.navtrans-navlist-icon.s-21{background-position:-90px -32px}.navtrans-navlist-icon.nav-st,.navtrans-navlist-icon.nav-through{background-position:-16px -70px}.navtrans-navlist-icon.nav-ed{background-position:0px -70px}.navtrans-view{border-top:1px solid #e4e6e7;border-left:1px solid #e4e6e7;border-right:1px solid #e4e6e7}.navtrans-view:hover{cursor:pointer}.navtrans-view .navtrans-arrow{position:absolute;top:8px;right:5px;width:7px;height:4px;background-image:url(http://webmap0.map.bdimg.com/wolfman/static/common/images/nav-icon_b5c3223.png);background-repeat:no-repeat;background-position:-40px -70px;margin-top:3px;margin-right:3px;_background-image:url(http://webmap0.map.bdimg.com/wolfman/static/common/images/nav-icon_ie6_134841b.png)}.navtrans-view.expand:hover .navtrans-arrow{background-position:-61px -70px}.navtrans-view.expand .navtrans-arrow{background-position:-54px -70px}.navtrans-view:hover .navtrans-arrow{background-position:-47px -70px}.navtrans-navlist-content{overflow:hidden}.navtrans-res{border-bottom:1px solid #E4E6E7;border-left:1px solid #E4E6E7;border-right:1px solid #E4E6E7}.navtrans-bus-icon{display:inline-block;float:left;background-image:url(http://webmap0.map.bdimg.com/wolfman/static/common/images/ui3/mo_banner_e1aa2e6.png);background-repeat:no-repeat}.navtrans-bus-icon.bus{width:13px;height:16px;background-position:-1px -192px;position:relative;top:4px}.navtrans-bus-icon.walk{width:16px;height:18px;background-position:-63px -189px;position:relative;top:2px;left:-2px}.navtrans-bus-desc{line-height:24px;margin-left:20px}.navtrans-busstation{color:#36c;font-weight:600}.tranroute-plan-list.expand .trans-title{border-bottom:1px solid #e4e6e7;background-color:#ebf1fb}.trans-plan-content tr td:hover .bus{background-position:-15px -192px}.trans-plan-content tr td:hover .walk{background-position:-82px -189px}.suggest-plan{position:absolute;background-color:#0C88E8;padding:0px 15px;line-height:20px;color:#fff;left:0px;top:0px}.suggest-plan-des{text-align:left;padding:29px 0px 0px 25px;font-size:13px;color:#000}.bmap-clearfix{*+height:1%}.bmap-clearfix:after{content:".";display:block;height:0px;clear:both;visibility:hidden}.BMap_CityListCtrl{font-size:12px}.BMap_CityListCtrl a{text-decoration:none!important}.BMap_CityListCtrl a:hover{text-decoration:underline!important}.BMap_CityListCtrl .citylist_popup_main{border:1px solid #cdcdcd;z-index:2;position:relative;width:100%;height:100%;background:#fafafa;overflow:hidden;box-shadow:1px 1px 1px rgba(0,0,0,.1)}.ui_city_change_top .ui_city_change_inner,.ui_city_change_bottom .ui_city_change_inner{display:inline-block;height:24px;line-height:24px;border:1px solid #c4c7cc;background-color:#fff;padding:0 10px 0 10px;color:#000}.ui_city_change_top .ui_city_change_inner i,.ui_city_change_bottom .ui_city_change_inner i{width:8px;height:6px;display:inline-block;position:relative;top:9px;left:5px;-webkit-transition:all ease-in-out .15s;transition:all ease-in-out .15s;display:none9}.ui_city_change_click .ui_city_change_inner i,.ui_city_change_click_close .ui_city_change_inner i{-webkit-transform:rotate(180deg);-moz-transform:rotate(180deg);-o-transform:rotate(180deg);transform:rotate(180deg)}.ui_city_change_top .ui_city_change_inner:hover em{border-top-color:#0C88E8}.ui_city_change_top .ui_city_change_inner em{width:0;height:0;border-color:rgba(255,255,255,0);border-top-color:#D0D4DA;border-style:solid;border-width:4px}.ui_city_change_top .ui_city_change_inner:hover,.ui_city_change_bottom .ui_city_change_inner:hover{text-decoration:none!important;color:#3d6dcc}.ui_city_change_bottom .ui_city_change_inner:hover em{border-bottom-color:#0C88E8}.ui_city_change_bottom .ui_city_change_inner em{width:0;height:0;border-color:rgba(255,255,255,0);border-bottom-color:#D0D4DA;border-style:solid;border-width:4px;position:relative;top:-18px}.citylist_popup_main .citylist_ctr_title{background:#f9f9f9;border-bottom:1px solid #dadada;height:25px;line-height:25px;font-size:12px;color:#4c4c4c;padding-left:7px}.citylist_popup_main .city_content_top{position:relative;height:30px;padding:15px 10px 0px 10px;border-bottom:1px solid #CCC;margin:0px 10px}.citylist_popup_main .city_content_top .cur_city_info{display:inline-block;margin:0;padding:0;}#city_ctrl_form{position:absolute;right:12px;top:10px}#selCityWd{border:1px solid #ccc;height:20px;width:121px;line-height:20px;text-indent:4px;outline:none}#selCitySubmit:hover{background-position:-355px -98px}#selCitySubmit{float:right;background:url(http://webmap0.map.bdimg.com/wolfman/static/common/images/index_a2f1ac4.png) no-repeat scroll -302px -98px;height:24px;line-height:24px;width:48px;cursor:pointer;margin-left:5px;text-align:center}#sel_city_letter_list{padding-top:10px}#sel_city_letter_list a{white-space:nowrap;margin-right:11px;line-height:18px;font-size:13px;font-family:Arial,Helvetica,SimSun,sans-serif}.city_content_medium{padding:10px 10px 10px 10px;border-bottom:1px solid #CCC;margin:0px 10px}.city_content_bottom{padding:10px 10px 10px 8px;margin:9px 5px 5px 5px;height:218px;overflow-y:auto}#city_detail_table tr td{vertical-align:top}.sel_city_hotcity a{color:#3d6dcc}.sel_city_letter{padding:0 14px 0 3px}.sel_city_letter div{font-size:24px;line-height:24px;font-weight:700;color:#ccc;padding:0;margin:0;font-family:Arial,Helvetica,SimSun,sans-serif}.sel_city_sf{padding-right:8px;font-weight:700}.sel_city_sf a{white-space:nowrap;line-height:18px;color:#3d6dcc}.city_names_wrap{margin-bottom:9px}.sel_city_name{color:#3d6dcc;white-space:nowrap;margin-right:9px;line-height:18px;float:left}#popup_close{outline:none;position:absolute;z-index:50;top:7px;right:6px;width:12px;height:12px;background:url(http://webmap0.map.bdimg.com/wolfman/static/common/images/popup_close_15d2283.gif) no-repeat;border:0;cursor:pointer}</style>
   </head>
   <body>

	  <%@ include file="./module/head.jsp" %>      

      

      <!--begin: searchs Top -->
      
      <!--begin:正文-->
      <!--begin: 房源概况-->
      <div class="zf-top">
         <div class="title-wrapper">
            <div class="content">
            <br/><br/>
               <div class="title">
               	<a id="house-href" style="visibility: hidden;" >${houseDetails['houseHref']}</a>
                  <h1 class="main" title="两室户，钥匙房，生活很便利，空气清新">两室户，钥匙房，生活很便利，空气清新</h1>
               </div>
               <div class="btnContainer">
                  <!--非已下架、非已失效时显示-->
                  <form action="?houseHref=#houseDetails.houseHref">
                  <button id="notice_focus" class="notice-focus fr notice" houserentid="3789248" gahref="zufang_subscribe">收藏此房</button>
                  </form>
               </div>
            </div>
         </div>
         <div class="cj-cun">
            <!--begin: 房源相册-->
            <div class="album-box">
               <div class="album-box left" id="album-box">
                  <div class="pic-panel pic-panel-hover" style="overflow:hidden;">
                     <a href="javascript:;">
                     <img src="./dtl_files/0d276395-a616-42c3-b96f-45deaf65dd29.jpg_600x450.jpg" id="view_big_img" onerror="this.src=&#39;http://cdn7.dooioo.com/static/img/new-version/default_block.png&#39;; this.onerror=null;">
                     </a>
                     <div class="label">
                        <div class="fl" id="houseTag">主卧</div>
                        <div class="fr"><span id="currentIndex"></span> </div>
                     </div>
                  </div>
                  <!-- 小图区域 -->
                  <div class="album-panel">
                     <a href="javascript:;" class="ctrl-btn ctrl-btn-prev" id="ctrl-btn-prev">
                     <i class="dt-ico ico-arr-top"></i>
                     </a>
                     <div class="album-view-wrap" id="album-view-wrap">
                        <ul>
                        	<s:iterator var="img" value="#request.houseDetails.images">
                        		<li>
                        		<img data-large="${img[0] }" src="${img[1] }" img-title="${img[2] }" onerror="this.src=&#39;http://cdn7.dooioo.com/static/img/new-version/default_block.png&#39;; this.onerror=null;">
                        		</li>
                        	</s:iterator>
                        </ul>
                     </div>
                     <a href="javascript:;" class="ctrl-btn ctrl-btn-next" id="ctrl-btn-next">
                     <i class="dt-ico ico-arr-bottom"></i>
                     </a>
                  </div>
               </div>
            </div>
            <!--end: 房源相册-->
            <!--begin: 房源概况-->
            <div class="content forRent">
               <div class="houseInfo">
                  <div class="price">
                     <div class="mainInfo bold" style="font-size:28px;">${houseDetails["price"] }<span class="unit"></span></div>
                  </div>
                  <div class="room">
                     <div class="mainInfo">${houseDetails["room"] }<span class="unit">室</span> ${houseDetails["hall"] }<span class="unit">厅</span></div>
                  </div>
                  <div class="area">
                     <div class="mainInfo">${houseDetails["area"] }<span class="unit"></span></div>
                  </div>
               </div>
               <table class="aroundInfo">
               <!-- 这里实际上是html -->
               ${houseDetails["level"] }
                  
                  
               </table>
               <!--非已下架、非已失效时显示-->
               <div class="brokerInfo">
                  <a href="#houseDetails.agentHref" target="_blank">
                  <img class="lj-lazy" src="#houseDetails.agentImg" onerror="this.src=&#39;http://cdn7.dooioo.com/static/img/jingjiren/noimg.jpg&#39;; this.onerror=null;" data-original="#houseDetails.agentImg" style="display: inline;">
                  </a>
                  <div class="brokerInfoText">
                     <div class="brokerName">
                        <a href="http://sh.lianjia.com/jingjiren/detail/203598.html?phone=4007675011,598137" class="name" target="_blank">${houseDetails["agentName"] }</a>
                        <span class="tag first"></span>
                        <a class="lianjiaim-createtalkAll" usercode="203598" style="display: none;" title="在线咨询" data-role="lianjiaim-createtalk" data-ucid="1000000020105479" source="rentHouse"></a>
                     </div>
                     <div class="evaluate">
                        好评率<span class="evaluate rate">${houseDetails["praiseRate"] }%</span>
                     </div>
                     <div class="phone">${houseDetails["agentPhone"] }
                     </div>
                  </div>
               </div>
               <!-- begin: 加入对比 -->
               <div style="width:100%; text-align:right;">
				<a id="add-to-compare" href="javascript:{};" style="color:#FFFFFF;display:inline-block; background-color:green; padding:10px 20px 10px 20px; margin-top:20px;">加入对比</a>
			   </div>
			   <!-- end: 加入对比 -->
            </div>
            <!--end: 房源概况-->
            <div class="clear"></div>
         </div>
      </div>
      <!--end: 房源概况-->
      <!--begin: 内容导航--><!-- 这句不要删 -->
      <div class="detailPageTab" id="res-nav" style="position: static; top: 767px; margin-top: 15px;">
         
      </div>
      <!--begin: 内容导航-->
      <!--begin: 周边配套 -->
      <div class="around js_content" id="zoneMap" longitude="121.448226" latitude="31.197659">
         <div class="content">
            <div class="title">周边配套</div>
         </div>
         <div id="house-map">
            <div class="detail-map">
               <div class="map-box clear">
                  <div class="left">
                     <div id="map-around" class="map-content" xiaoqu="海天公寓" style="overflow: hidden; position: relative; z-index: 0; background-color: rgb(243, 241, 236); color: rgb(0, 0, 0); text-align: left;">
                        <div style="overflow: visible; position: absolute; z-index: 0; left: 0px; top: 0px; cursor: url(&quot;http://api0.map.bdimg.com/images/openhand.cur&quot;) 8 8, default;">
                           <div class="BMap_mask" style="position: absolute; left: 0px; top: 0px; z-index: 9; overflow: hidden; user-select: none; width: 671px; height: 330px;"></div>
                           <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;">
                              <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 800;"></div>
                              <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;"><span class="BMap_Marker BMap_noprint" unselectable="on" "="" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url(&quot;http://api0.map.bdimg.com/images/blank.gif&quot;); width: 27px; height: 41px; left: 319px; top: 99px; z-index: -6239530;" title=""></span><span class="BMap_Marker BMap_noprint" unselectable="on" "="" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url(&quot;http://api0.map.bdimg.com/images/blank.gif&quot;); width: 27px; height: 41px; left: 327px; top: 272px; z-index: -6238998; user-select: none;" title=""></span><span class="BMap_Marker BMap_noprint" unselectable="on" "="" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url(&quot;http://api0.map.bdimg.com/images/blank.gif&quot;); width: 27px; height: 41px; left: 311px; top: 15px; z-index: -6239790; user-select: none;" title=""></span><span class="BMap_Marker BMap_noprint" unselectable="on" "="" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url(&quot;http://api0.map.bdimg.com/images/blank.gif&quot;); width: 27px; height: 41px; left: 154px; top: 234px; z-index: -6239116; user-select: none;" title=""></span><span class="BMap_Marker BMap_noprint" unselectable="on" "="" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url(&quot;http://api0.map.bdimg.com/images/blank.gif&quot;); width: 27px; height: 41px; left: 491px; top: 138px; z-index: -6239412; user-select: none;" title=""></span><span class="BMap_Marker BMap_noprint" unselectable="on" "="" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url(&quot;http://api0.map.bdimg.com/images/blank.gif&quot;); width: 27px; height: 41px; left: 310px; top: 21px; z-index: -6239772; user-select: none;" title=""></span><span class="BMap_Marker BMap_noprint" unselectable="on" "="" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url(&quot;http://api0.map.bdimg.com/images/blank.gif&quot;); width: 27px; height: 41px; left: 404px; top: 164px; z-index: -6239330; user-select: none;" title=""></span><span class="BMap_Marker BMap_noprint" unselectable="on" "="" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url(&quot;http://api0.map.bdimg.com/images/blank.gif&quot;); width: 27px; height: 41px; left: 372px; top: 16px; z-index: -6239788; user-select: none;" title=""></span><span class="BMap_Marker BMap_noprint" unselectable="on" "="" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url(&quot;http://api0.map.bdimg.com/images/blank.gif&quot;); width: 27px; height: 41px; left: 327px; top: 275px; z-index: -6238990; user-select: none;" title=""></span></div>
                              <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 600;"></div>
                              <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 500;"><label class="BMapLabel" unselectable="on" style="position: absolute; display: none; cursor: inherit; background-color: rgb(190, 190, 190); border: 1px solid rgb(190, 190, 190); padding: 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: -20000; color: rgb(190, 190, 190);">shadow</label></div>
                              <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 400;">
                                 <span class="BMap_Marker" unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: 319px; top: 99px; z-index: -6239530;">
                                    <div style="position: absolute; margin: 0px; padding: 0px; width: 27px; height: 41px; overflow: hidden;"><img src="./dtl_files/point-dis-around.png" style="display: block; border:none;margin-left:0px; margin-top:0px; "></div>
                                 </span>
                                 <span class="BMap_Marker" unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: 327px; top: 272px; z-index: -6238998;">
                                    <div style="position: absolute; margin: 0px; padding: 0px; width: 27px; height: 41px; overflow: hidden;"><img src="./dtl_files/aroundPos.png" style="display: block; border:none;margin-left:2px; margin-top:0px; "></div>
                                    <label class="BMapLabel" unselectable="on" style="position: absolute; display: inline; cursor: inherit; background: transparent; border: 0px; padding: 5px 1px 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: 80; color: rgb(255, 255, 255); letter-spacing: -2px; text-align: center; width: 26px; height: 29px; margin-left: -1px; user-select: none; left: 0px; top: 0px;">A1</label>
                                 </span>
                                 <span class="BMap_Marker" unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: 311px; top: 15px; z-index: -6239790;">
                                    <div style="position: absolute; margin: 0px; padding: 0px; width: 27px; height: 41px; overflow: hidden;"><img src="./dtl_files/aroundPos.png" style="display: block; border:none;margin-left:2px; margin-top:0px; "></div>
                                    <label class="BMapLabel" unselectable="on" style="position: absolute; display: inline; cursor: inherit; background: transparent; border: 0px; padding: 5px 1px 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: 80; color: rgb(255, 255, 255); letter-spacing: -2px; text-align: center; width: 26px; height: 29px; margin-left: -1px; user-select: none; left: 0px; top: 0px;">A2</label>
                                 </span>
                                 <span class="BMap_Marker" unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: 154px; top: 234px; z-index: -6239116;">
                                    <div style="position: absolute; margin: 0px; padding: 0px; width: 27px; height: 41px; overflow: hidden;"><img src="./dtl_files/aroundPos.png" style="display: block; border:none;margin-left:2px; margin-top:0px; "></div>
                                    <label class="BMapLabel" unselectable="on" style="position: absolute; display: inline; cursor: inherit; background: transparent; border: 0px; padding: 5px 1px 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: 80; color: rgb(255, 255, 255); letter-spacing: -2px; text-align: center; width: 26px; height: 29px; margin-left: -1px; user-select: none; left: 0px; top: 0px;">A3</label>
                                 </span>
                                 <span class="BMap_Marker" unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: 491px; top: 138px; z-index: -6239412;">
                                    <div style="position: absolute; margin: 0px; padding: 0px; width: 27px; height: 41px; overflow: hidden;"><img src="./dtl_files/aroundPos.png" style="display: block; border:none;margin-left:2px; margin-top:0px; "></div>
                                    <label class="BMapLabel" unselectable="on" style="position: absolute; display: inline; cursor: inherit; background: transparent; border: 0px; padding: 5px 1px 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: 80; color: rgb(255, 255, 255); letter-spacing: -2px; text-align: center; width: 26px; height: 29px; margin-left: -1px; user-select: none; left: 0px; top: 0px;">A4</label>
                                 </span>
                                 <span class="BMap_Marker" unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: 310px; top: 21px; z-index: -6239772;">
                                    <div style="position: absolute; margin: 0px; padding: 0px; width: 27px; height: 41px; overflow: hidden;"><img src="./dtl_files/aroundPos.png" style="display: block; border:none;margin-left:2px; margin-top:0px; "></div>
                                    <label class="BMapLabel" unselectable="on" style="position: absolute; display: inline; cursor: inherit; background: transparent; border: 0px; padding: 5px 1px 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: 80; color: rgb(255, 255, 255); letter-spacing: -2px; text-align: center; width: 26px; height: 29px; margin-left: -1px; user-select: none; left: 0px; top: 0px;">A5</label>
                                 </span>
                                 <span class="BMap_Marker" unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: 404px; top: 164px; z-index: -6239330;">
                                    <div style="position: absolute; margin: 0px; padding: 0px; width: 27px; height: 41px; overflow: hidden;"><img src="./dtl_files/aroundPos.png" style="display: block; border:none;margin-left:2px; margin-top:0px; "></div>
                                    <label class="BMapLabel" unselectable="on" style="position: absolute; display: inline; cursor: inherit; background: transparent; border: 0px; padding: 5px 1px 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: 80; color: rgb(255, 255, 255); letter-spacing: -2px; text-align: center; width: 26px; height: 29px; margin-left: -1px; user-select: none; left: 0px; top: 0px;">A6</label>
                                 </span>
                                 <span class="BMap_Marker" unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: 372px; top: 16px; z-index: -6239788;">
                                    <div style="position: absolute; margin: 0px; padding: 0px; width: 27px; height: 41px; overflow: hidden;"><img src="./dtl_files/aroundPos.png" style="display: block; border:none;margin-left:2px; margin-top:0px; "></div>
                                    <label class="BMapLabel" unselectable="on" style="position: absolute; display: inline; cursor: inherit; background: transparent; border: 0px; padding: 5px 1px 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: 80; color: rgb(255, 255, 255); letter-spacing: -2px; text-align: center; width: 26px; height: 29px; margin-left: -1px; user-select: none; left: 0px; top: 0px;">A7</label>
                                 </span>
                                 <span class="BMap_Marker" unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: 327px; top: 275px; z-index: -6238990;">
                                    <div style="position: absolute; margin: 0px; padding: 0px; width: 27px; height: 41px; overflow: hidden;"><img src="./dtl_files/aroundPos.png" style="display: block; border:none;margin-left:2px; margin-top:0px; "></div>
                                    <label class="BMapLabel" unselectable="on" style="position: absolute; display: inline; cursor: inherit; background: transparent; border: 0px; padding: 5px 1px 1px; white-space: nowrap; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 12px; line-height: normal; font-family: arial, sans-serif; z-index: 80; color: rgb(255, 255, 255); letter-spacing: -2px; text-align: center; width: 26px; height: 29px; margin-left: -1px; user-select: none; left: 0px; top: 0px;">A8</label>
                                 </span>
                              </div>
                              <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 300;"></div>
                              <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 201;"></div>
                              <div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;">
                                 <svg version="1.1" type="system" x="1671px" y="1330px" viewBox="-500 -500 1671 1330" style="position: absolute; top: -500px; left: -500px; width: 1671px; height: 1330px;">
                                    <path stroke-linejoin="round" stroke-linecap="round" fill-rule="evenodd" stroke="transparent" stroke-width="5" stroke-dasharray="none" fill="transparent" stroke-opacity="0.65" fill-opacity="0.65" style="cursor: pointer; user-select: none;" d="M 332 -171 L 286 -168 241 -157 199 -140 160 -116 125 -86 95 -52 71 -13 54 30 43 74 39 119 43 165 54 209 71 251 95 290 125 325 160 355 199 379 241 396 286 407 332 410 377 407 422 396 464 379 503 355 538 325 568 290 592 251 610 209 620 165 624 119 620 74 610 30 592 -13 568 -52 538 -86 503 -116 464 -140 422 -157 377 -168 332 -171"></path>
                                 </svg>
                              </div>
                           </div>
                           <div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 1;">
                              <div style="position: absolute; overflow: visible; z-index: -100; left: 335px; top: 165px; display: block; transform: translate3d(0px, 0px, 0px);"><img src="./dtl_files/saved_resource" style="position: absolute; border: none; width: 256px; height: 256px; left: -174px; top: -103px; max-width: none; opacity: 1;"><img src="./dtl_files/saved_resource(1)" style="position: absolute; border: none; width: 256px; height: 256px; left: -430px; top: -103px; max-width: none; opacity: 1;"><img src="./dtl_files/saved_resource(2)" style="position: absolute; border: none; width: 256px; height: 256px; left: 82px; top: -103px; max-width: none; opacity: 1;"><img src="./dtl_files/saved_resource(3)" style="position: absolute; border: none; width: 256px; height: 256px; left: -174px; top: 153px; max-width: none; opacity: 1;"><img src="./dtl_files/saved_resource(4)" style="position: absolute; border: none; width: 256px; height: 256px; left: -174px; top: -359px; max-width: none; opacity: 1;"><img src="./dtl_files/saved_resource(5)" style="position: absolute; border: none; width: 256px; height: 256px; left: -430px; top: 153px; max-width: none; opacity: 1;"><img src="./dtl_files/saved_resource(6)" style="position: absolute; border: none; width: 256px; height: 256px; left: -430px; top: -359px; max-width: none; opacity: 1;"><img src="./dtl_files/saved_resource(7)" style="position: absolute; border: none; width: 256px; height: 256px; left: 82px; top: 153px; max-width: none; opacity: 1;"><img src="./dtl_files/saved_resource(8)" style="position: absolute; border: none; width: 256px; height: 256px; left: 82px; top: -359px; max-width: none; opacity: 1;"></div>
                           </div>
                           <div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 2; display: none;">
                              <div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 0; display: none;"></div>
                           </div>
                           <div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 3;"></div>
                        </div>
                        <div class="pano_close" title="退出全景" style="z-index: 1201; display: none;"></div>
                        <a class="pano_pc_indoor_exit" title="退出室内景" style="z-index: 1201; display: none;"><span style="float:right;margin-right:12px;">出口</span></a>
                        <div class=" anchorBL" style="height: 32px; position: absolute; z-index: 30; text-size-adjust: none; bottom: 20px; right: auto; top: auto; left: 1px;"><a title="到百度地图查看此区域" target="_blank" href="http://map.baidu.com/?sr=1" style="outline: none;"><img style="border:none;width:77px;height:32px" src="./dtl_files/copyright_logo.png"></a></div>
                        <div id="zoomer" style="position:absolute;z-index:0;top:0px;left:0px;overflow:hidden;visibility:hidden;cursor:url(http://api0.map.bdimg.com/images/openhand.cur) 8 8,default">
                           <div class="BMap_zoomer" style="top:0;left:0;"></div>
                           <div class="BMap_zoomer" style="top:0;right:0;"></div>
                           <div class="BMap_zoomer" style="bottom:0;left:0;"></div>
                           <div class="BMap_zoomer" style="bottom:0;right:0;"></div>
                        </div>
                        <div unselectable="on" class=" BMap_stdMpCtrl BMap_stdMpType0 BMap_noprint anchorTL" style="width: 62px; height: 192px; bottom: auto; right: auto; top: 10px; left: 10px; position: absolute; z-index: 1100; text-size-adjust: none;">
                           <div class="BMap_stdMpPan">
                              <div class="BMap_button BMap_panN" title="向上平移"></div>
                              <div class="BMap_button BMap_panW" title="向左平移"></div>
                              <div class="BMap_button BMap_panE" title="向右平移"></div>
                              <div class="BMap_button BMap_panS" title="向下平移"></div>
                              <div class="BMap_stdMpPanBg BMap_smcbg"></div>
                           </div>
                           <div class="BMap_stdMpZoom" style="height: 147px; width: 62px;">
                              <div class="BMap_button BMap_stdMpZoomIn" title="放大一级">
                                 <div class="BMap_smcbg"></div>
                              </div>
                              <div class="BMap_button BMap_stdMpZoomOut" title="缩小一级" style="top: 126px;">
                                 <div class="BMap_smcbg"></div>
                              </div>
                              <div class="BMap_stdMpSlider" style="height: 108px;">
                                 <div class="BMap_stdMpSliderBgTop" style="height: 108px;">
                                    <div class="BMap_smcbg"></div>
                                 </div>
                                 <div class="BMap_stdMpSliderBgBot" style="top: 13px; height: 99px;"></div>
                                 <div class="BMap_stdMpSliderMask" title="放置到此级别"></div>
                                 <div class="BMap_stdMpSliderBar" title="拖动缩放" style="cursor: url(&quot;http://api0.map.bdimg.com/images/openhand.cur&quot;) 8 8, default; top: 13px;">
                                    <div class="BMap_smcbg"></div>
                                 </div>
                              </div>
                              <div class="BMap_zlHolder">
                                 <div class="BMap_zlSt">
                                    <div class="BMap_smcbg"></div>
                                 </div>
                                 <div class="BMap_zlCity">
                                    <div class="BMap_smcbg"></div>
                                 </div>
                                 <div class="BMap_zlProv">
                                    <div class="BMap_smcbg"></div>
                                 </div>
                                 <div class="BMap_zlCountry">
                                    <div class="BMap_smcbg"></div>
                                 </div>
                              </div>
                           </div>
                           <div class="BMap_stdMpGeolocation" style="position: initial; display: none; margin-top: 43px; margin-left: 10px;">
                              <div class="BMap_geolocationContainer" style="position: initial; width: 24px; height: 24px; overflow: hidden; margin: 0px; box-sizing: border-box;">
                                 <div class="BMap_geolocationIconBackground" style="width: 24px; height: 24px; background-image: url(http://api0.map.bdimg.com/images/navigation-control/geolocation-control/pc/bg-20x20.png); background-size: 20px 20px; background-position: 3px 3px; background-repeat: no-repeat;">
                                    <div class="BMap_geolocationIcon" style="position: initial; width: 24px; height: 24px; cursor: pointer; background-image: url(&#39;http://api0.map.bdimg.com/images/navigation-control/geolocation-control/pc/success-10x10.png&#39;); background-size: 10px 10px; background-repeat: no-repeat; background-position: center;"></div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div unselectable="on" class=" BMap_scaleCtrl BMap_noprint anchorTL" style="bottom: auto; right: auto; top: 18px; left: 81px; width: 62px; position: absolute; z-index: 10; text-size-adjust: none;">
                           <div class="BMap_scaleTxt" unselectable="on" style="background-color: transparent; color: black;">100&nbsp;米</div>
                           <div class="BMap_scaleBar BMap_scaleHBar" style="background-color: black;"><img style="border:none" src="./dtl_files/mapctrls.png"></div>
                           <div class="BMap_scaleBar BMap_scaleLBar" style="background-color: black;"><img style="border:none" src="./dtl_files/mapctrls.png"></div>
                           <div class="BMap_scaleBar BMap_scaleRBar" style="background-color: black;"><img style="border:none" src="./dtl_files/mapctrls.png"></div>
                        </div>
                        <div unselectable="on" class=" BMap_cpyCtrl BMap_noprint anchorBL" style="cursor: default; white-space: nowrap; color: black; background: none; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 11px; line-height: 15px; font-family: arial, sans-serif; bottom: 2px; right: auto; top: auto; left: 2px; position: absolute; z-index: 10; text-size-adjust: none;"><span _cid="1" style="display: inline;"><span style="background: rgba(255, 255, 255, 0.701961);padding: 0px 1px;line-height: 16px;display: inline;height: 16px;">©&nbsp;2017 Baidu - GS(2015)2650号&nbsp;- Data © 长地万方</span></span></div>
                     </div>
                  </div>
                  <div class="right">
                     <div class="map_around_keyword_tab js_tab_wrap" id="map-keyword">
                        <a class="on" href="javascript:;" data-keyword="地铁|公交">交通</a>
                        <a href="javascript:;" data-keyword="幼儿园|小学|中学|大学|学院">教育</a>
                        <a href="javascript:;" data-keyword="医院|药店">医疗</a>
                        <a href="javascript:;" data-keyword="商场|超市|便利店|市场">购物</a>
                        <a href="javascript:;" data-keyword="ATM|银行|快餐|餐厅|咖啡厅">生活</a>
                        <a href="javascript:;" data-keyword="公园|电影院|KTV|健身房|体育馆">娱乐</a>
                     </div>
                     <div class="map_around_distance_tab js_tab_wrap" id="map-distance">
                        <a class="on" href="javascript:;" data-distance="500">0.5km</a>
                        <a href="javascript:;" data-distance="1000">1km</a>
                        <a href="javascript:;" data-distance="1500">1.5km</a>
                        <a href="javascript:;" data-distance="2000">2km</a>
                        <a href="javascript:;" data-distance="2500">2.5km</a>
                     </div>
                     <div id="env-list" class="env-list">
                        <h3>公交</h3>
                        <dl>
                           <dt class="clear">
                              <h4 class="left" title="天钥桥路辛耕路(徐家汇)"><i>A5</i>天钥桥路辛耕路(徐家汇)</h4>
                              <span class="right">135米</span>
                           </dt>
                        </dl>
                        <dl>
                           <dt class="clear">
                              <h4 class="left" title="天钥桥路辛耕路"><i>A2</i>天钥桥路辛耕路</h4>
                              <span class="right">145米</span>
                           </dt>
                        </dl>
                        <dl>
                           <dt class="clear">
                              <h4 class="left" title="辛耕路天钥桥路(徐家汇)"><i>A7</i>辛耕路天钥桥路(徐家汇)</h4>
                              <span class="right">169米</span>
                           </dt>
                        </dl>
                        <dl>
                           <dt class="clear">
                              <h4 class="left" title="南丹东路天钥桥路"><i>A6</i>南丹东路天钥桥路</h4>
                              <span class="right">184米</span>
                           </dt>
                        </dl>
                        <dl>
                           <dt class="clear">
                              <h4 class="left" title="天钥桥路南丹路"><i>A1</i>天钥桥路南丹路</h4>
                              <span class="right">297米</span>
                           </dt>
                        </dl>
                        <dl>
                           <dt class="clear">
                              <h4 class="left" title="天钥桥路南丹东路"><i>A8</i>天钥桥路南丹东路</h4>
                              <span class="right">301米</span>
                           </dt>
                        </dl>
                        <dl>
                           <dt class="clear">
                              <h4 class="left" title="南丹东路斜土路"><i>A4</i>南丹东路斜土路</h4>
                              <span class="right">301米</span>
                           </dt>
                        </dl>
                        <dl>
                           <dt class="clear">
                              <h4 class="left" title="南丹东路漕溪北路"><i>A3</i>南丹东路漕溪北路</h4>
                              <span class="right">363米</span>
                           </dt>
                        </dl>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!--end: 周边配套 -->

      <!--begin: 相似房源-->
      <div class="push js_content" id="recommend">
         <div class="content">
            <div class="header">
               <span class="title">相似房源</span>
               <span class="btn">
               <span class="pre disable" id="btn_recommend_pre" gahref="tuijian_prev"><i></i></span>
               <span class="next" id="btn_recommend_next" gahref="tuijian_next"><i></i></span>
               </span>
            </div>
            <ul id="result_recommend">
            </ul>
         </div>
      </div>
      <!--end: 相似房源-->
      <!--begin:模板－联系经纪人-->
      <textarea id="template_agent" style="display:none">    {#foreach $T.list as agent}
    &lt;li&gt;
        &lt;a href="http://sh.lianjia.com/jingjiren/detail/{$T.agent.userCode}.html?phone={$T.agent.hostNumber},{$T.agent.extNumber}" target="_blank"&gt;
            &lt;img src="{$T.agent.photoUrl}" onerror="this.src='http://cdn7.dooioo.com/static/img/jingjiren/noimg.jpg'; this.onerror=null;"&gt;
        &lt;/a&gt;
        &lt;div class="desc"&gt;
            &lt;div class="title"&gt;
                &lt;a href="http://sh.lianjia.com/jingjiren/detail/{$T.agent.userCode}.html?phone={$T.agent.hostNumber},{$T.agent.extNumber}" class="name" target="_blank" title="{$T.agent.userName}"&gt;{$T.agent.userName}&lt;/a&gt;
                &lt;a class="lianjiaim-createtalkAll" style="display: none;" title="在线咨询" usercode="{$T.agent.userCode}" source="rentHouse"&gt;&lt;/a&gt;
                &lt;div class="rate"&gt;{$T.agent.positionName}&lt;/div&gt;
                &lt;div class="rate"&gt;本房带看：{$T.agent.daikan}次&lt;/div&gt;
            &lt;/div&gt;
            &lt;div class="phone"&gt;{$T.agent.phone}&lt;/div&gt;
        &lt;/div&gt;
    &lt;/li&gt;
    {#/for}
    &lt;li class="fix_align"&gt;&lt;/li&gt;
    {#if $T.list.length&lt;3}
        {#for index=1 to (3-$T.list.length)}
        &lt;li class="fix_align"&gt;&lt;/li&gt;
        {#/for}
    {#/if}
    </textarea>
      <!--end:模板－联系经纪人-->
      

      <!--begin:模板－看房记录-->
      <textarea id="template_kanfang" style="display:none">    {#if $T.list.length&gt;0}
        {#foreach $T.list as record}
        &lt;div class="row"&gt;
            &lt;div class="item"&gt;{$T.record.date}&lt;/div&gt;
            &lt;div class="item agent"&gt;
                {#if $T.record.positionId == 1 &amp;&amp; $T.record.status == 1}
                    &lt;a href="http://sh.lianjia.com/jingjiren/detail/{$T.record.userCode}.html?phone={$T.record.hostNumber},{$T.record.extNumber}" class="photo" target="_blank"&gt;
                        &lt;img src="{$T.record.photoUrl}" onerror="this.src='http://cdn7.dooioo.com/static/img/jingjiren/noimg.jpg'; this.onerror=null;"&gt;
                    &lt;/a&gt;
                    &lt;a href="http://sh.lianjia.com/jingjiren/detail/{$T.record.userCode}.html?phone={$T.record.hostNumber},{$T.record.extNumber}" class="name" target="_blank" title="{$T.record.userName}"&gt;{$T.record.userName}&lt;/a&gt;
                    {#if $T.record.display==1}
                        &lt;a class="lianjiaim-createtalk" title="在线咨询" usercode="{$T.record.userCode}"&gt;&lt;/a&gt;
                    {#/if}
                {#else}
                    &lt;img src="{$T.record.photoUrl}" onerror="this.src='http://cdn7.dooioo.com/static/img/jingjiren/noimg.jpg'; this.onerror=null;" title="{$T.record.userName}已转岗或离职，暂无详细信息"&gt;
                    &lt;span class="name" target="_blank" title="{$T.record.userName}已转岗或离职，暂无详细信息"&gt;{$T.record.userName}&lt;/span&gt;
                {#/if}
            &lt;/div&gt;
            &lt;div class="item"&gt;{$T.record.times}次&lt;/div&gt;

            &lt;div class="phone"&gt;
                {#if $T.record.status==1 &amp;&amp; $T.record.display==1 &amp;&amp; $T.record.positionId==1}
                    {$T.record.phone}
                {#/if}
                {#if $T.record.status!=1 || $T.record.display==0 || $T.record.positionId!=1}
                     &lt;span style="color:#BEBEBE"&gt;暂无联系方式&lt;/span&gt;
                {#/if}
            &lt;/div&gt;
        &lt;/div&gt;
        {#/for}
    {#/if}

    {#if $T.list.length==0}
    &lt;div class="row"&gt;&lt;span class="noData"&gt;还没有客户看房记录喔&lt;/span&gt;&lt;/div&gt;
    {#/if}
    </textarea>
      <!--end:模板－看房记录-->
      <!--begin:模板－为你推荐（房源）-->
      <textarea id="template_recommend" style="display:none">    {#if $T.list.length&gt;0}
        {#foreach $T.list as house}
            &lt;li&gt;
                &lt;div class="pic"&gt;
                    &lt;a href="/zufang/{$T.house.rentCityCode}{$T.house.houseRentId}.html" gahref="tuijian_open_{$T.house$index+1}"&gt;
                        &lt;img src="{$T.house.photourl}" onerror="this.src='http://cdn7.dooioo.com/static/img/new-version/default_block.png'; this.onerror=null;"&gt;
                    &lt;/a&gt;
                    &lt;span class="price"&gt;{$T.house.price}元/月&lt;/span&gt;
                     {#if $T.house.ziruTag}
                    &lt;span class="rentType"&gt;{$T.house.ziruTag}&lt;/span&gt;
                    {#/if}
                &lt;/div&gt;
                &lt;div class="title"&gt;
                    &lt;span class="name" title="{$T.house.name}"&gt;&lt;a href="/zufang/{$T.house.rentCityCode}{$T.house.houseRentId}.html"  gahref="tuijian_open_{$T.house$index+1}"&gt;{$T.house.name}&lt;/a&gt;&lt;/span&gt;
                    &lt;span class="info"&gt;{$T.house.room}室{$T.house.hall}厅/{$T.house.area}平&lt;/span&gt;
                &lt;/div&gt;
            &lt;/li&gt;
            {$last}
            {#if !$last}
            &lt;li class="bar"&gt;&lt;/li&gt;
            {#/if}
        {#/for}
        &lt;li class="fix_align"&gt;&lt;/li&gt;
        {#if $T.list.length&lt;4}
            {#for index=1 to (4-$T.list.length)}
            &lt;li class="fix_align"&gt;&lt;/li&gt;
            {#/for}
        {#/if}
    {#/if}
    {#if $T.list.length==0}
        &lt;li class="noData"&gt;暂无数据&lt;/li&gt;
    {#/if}
    
    </textarea>
      <!--end:模板－模板－为你推荐（房源）-->
      
      <script>
         var nowUrl = "";
         var pagePrefix = "/zufang"
         var init = {
             propertyNo : "5011000015263",  //小区编号
             propertyId : "5011000015263",  //小区ID(小区成交图表用的数据)
             plateId : "613000345",         //板块ID(小区成交图表用的数据)
             plateName : "徐家汇",     //板块名称(小区成交图表用的数据)
             houseRentId : "3789248",//房源编号(如sh，虚假举报、短信分享用到)
             album_current_Index : 0, //相册当前显示图片的索引号
             hasAllowedPhoto : "true", //是否有认证户型图
             agentList : [ //经纪人列表
                 
                 {
                     userName: "石佳超",
                     userCode: "220604",
                     hostNumber: "4007675011",
                     extNumber: "598138",
                     positionName: "初级物业顾问",
                     daikan: "4",
                     phone: "4007675011转598138",
                     positionId : 1,
                     status : 1,
                     
                     
                     photoUrl: "http://cdn1.dooioo.com/fetch/vp/touxiang/photos/220604_150x200.jpg"
                     
                 },
                 
             ],
             agentListPageNo : 1, //经纪人列表当前页码
         
             kanfangList : [ //看房记录列表
                 
                 {
                     userName: "龙晓艳",
                     userCode: "167046",
                     hostNumber: "4007675016",
                     extNumber: "23046",
                     date: "2017-03-19",
                     times : "1",
                     phone: "4007675016转23046",
                     positionId : 1,
                     status : 1,
                     photoUrl: "http://cdn1.dooioo.com/fetch/vp/touxiang/photos/167046_150x200.jpg",
                     
                     status : "1",
                     display : "1",
                     positionId : "1"
                 },
                 
             ],
             kanfangListPageNo : 1, //看房记录列表当前页码
         
             recommendList : [ //推荐房源列表
                 
                 {
                     photourl: "http://cdn1.dooioo.com/fetch/vp/fy/gi/20170207/1f828934-9330-4c84-be5b-fbda2bdaaa1b.jpg_200x150.jpg",
                     
                     price: "7000",
                     name: "海天公寓",
                     room: "2",
                     hall: "1",
                     area: '52',
                     houseRentId: "3740529",
                     ziruTag: "",
                     rentCityCode:"shz"
                 },
                 
                 {
                     photourl: "http://cdn1.dooioo.com/fetch/vp/fy/gi/20161119/98525750-a629-4d4f-8036-9ae0325fd506.jpg_200x150.jpg",
                     price: "6800",
                     name: "海天公寓",
                     room: "2",
                     hall: "0",
                     area: '52',
                     houseRentId: "3790408",
                     ziruTag: "",
                     rentCityCode:"shz"
                 },
                 
                 {
                     photourl: "http://cdn1.dooioo.com/fetch/vp/fy/gi/20161119/98525750-a629-4d4f-8036-9ae0325fd506.jpg_200x150.jpg",
                     price: "6800",
                     name: "海天公寓",
                     room: "2",
                     hall: "0",
                     area: '52',
                     houseRentId: "3790408",
                     ziruTag: "",
                     rentCityCode:"shz"
                 },
             ],
             recommendListPageNo : 1, //看房记录列表当前页码
         
             gio : {//GrowingIO页面相关业务参数收集的数据初始化
                 "setPageGroup" : "租房", //页面名称
                 "setPS1" : "shz3789248", //房源编号
                 "setPS2" : "2" //户型图类型ID
             }
         }
      </script>
      <!--begin: 登录弹层-->
      <%@ include file="./module/login.jsp" %>
	  
      <!--end: 登录弹层-->
      
      
      
      <div id="show-compare" style="position:fixed; top:40%; right:0px; min-width:25px; visibility:visible;">
   <div style="cursor: pointer; cursor: hand;background-color:#a0a0a0; color:#ffffff; text-align:center; width:100%; padding-top:5px; padding-bottom:5px;"><span>&lt;<br/>展<br/>开</div>
   <div style="cursor: pointer; cursor: hand;background-color:#e4e3e3; text-align:center; padding-top:5px; padding-bottom:5px;"><span>住<br/>房<br/>对<br/>比</span></div>
</div>
<div id="compare-houses" style="position:fixed; top:40%; right:0px; min-width:250px; visibility:hidden;">
   <div id="hide-compare-houses" style="cursor: pointer; cursor: hand;background-color:#a0a0a0; width:100%; color:#ffffff; text-align:center; width:100%; padding-top:5px; padding-bottom:5px;"><span>&gt;隐藏</span></div>
   <div style="background-color:#e4e3e3; width:100%; text-align:center; padding-top:5px; padding-bottom:5px;">
   		<ul id="compare-houses-lst"></ul>
		<a id="begin-compare-houses" style="display:inline-block; background-color:red; width:80px; padding: 5px 5px 5px 5px; color:#FFFFFF;" target="_blank" href="/HouseSearcher/pages/compare-houses.jsp" >开始对比</a>&nbsp;&nbsp;&nbsp;
		<a id="clear-compare-houses" style="display:inline-block; background-color:gray; width:80px; padding: 5px 5px 5px 5px; color:#000000;" href="javascript:void(0)">清空</a>
   </div>
</div>
      
      <!-- 微聊 --
      <div id="ng-app" ng-app="weiliaoApp" style="position: absolute;" class="ng-scope">
          
         <div weiliao-win="">
            <div class="lianjiaim im-fold" ng-class="{&#39;im-fold&#39;: !helper.isShowWeiliaoPop}" id="weiliaoWrapper">
               <div class="lianjiaim-shandow clear">
                  <div class="lianjiaim-wrap" session-win="">
                     <div class="lianjiaim-head" ng-click="clickWeiliaoHeader()">
                     </div>
                     <div class="lianjiaim-body" style="position: relative">
                        <div class="lianjiaim-noagent ng-scope" ng-if="!weiliao.isLogin">
                           <div class="noagent-sub">您还没有登陆,先去登陆/注册吧</div>
                           <div><a href="javascript:;" class="js_login" ng-click="doLogin()">登录/注册</a></div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
          
      </div>
      <!-- 微聊  end-->
      <script src="./dtl_files/loginpoplayer.js"></script>
      <script src="./dtl_files/jquery.lazyload.min.js"></script>
      <script src="./dtl_files/passport.js"></script>
      <script src="./dtl_files/suggestion.js"></script>
      <script src="./dtl_files/search.js"></script>
      <script src="./dtl_files/AV.realtime.js"></script>
      <script src="./dtl_files/angular.min.js"></script>
      <script src="./dtl_files/weiliao.min.js"></script>
      <script src="./dtl_files/bundle.js"></script><iframe src="./dtl_files/ns.html" height="0" width="0" style="display:none;visibility:hidden"></iframe>
      <script src="./dtl_files/user.js"></script>
      <link rel="stylesheet" href="./dtl_files/style.css">
      <script type="text/javascript" src="./dtl_files/api"></script><script type="text/javascript" src="./dtl_files/getscript"></script>
      <script src="./dtl_files/zoom-viewer.js"></script>
      <script src="./dtl_files/zufang_detail.js"></script>
      <script src="./dtl_files/around.js"></script>
   </body>
</html>



