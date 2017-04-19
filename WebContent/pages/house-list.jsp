<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>房源列表</title>

<%@ include file="module/references.txt" %>

<style type="text/css">
	.tag-block{
		border: solid 1px #82A1BB;
		padding: 3px 3px 3px 3px;
		margin-right: 5px;
		color:#6C879E;
		background-color: #B1DFF2;
		
	}
	
	#house-element{
		border-bottom: dotted 1px black;
	}
	
	#house-list-container{
		padding-top: 100px;
	}
	
	
</style>
</head>

<body>
    <%@include file="module/head.jsp" %>
    <%@include file="module/search-form.jsp" %>
    <script type="text/javascript" src="/HouseSearcher/js/HouseList.js"></script>
    <div id="house-list-container">
        
        <%-- <div id="house-element" style="width: 80%; margin-top100px; height:200px; margin-left: auto; margin-right: auto;">
    	<div style="width: 25%; display: inline-block; float: left; height: 200px;">    	
			<a href="#"><img class="img-polaroid" src="http://cdn1.dooioo.com/fetch/vp/fy/gi/20150413/0d936b6b-c5a8-4175-a32d-e2680253cfde.jpg_600x450.jpg" style="height: 150px; width: 100%;" alt="图片" onerror="this.src='/HouseSearcher/imgs/not-found-img.png'"></a>
    	</div>
    	<div style="width: 75%; display: inline-block; float: left;">
    		<a style="text-decoration: none;" href="#"><h4><b>采光方彪发哈接口类发哈是家乐福发哈森林防火傻蛋，发的时间里</b></h4></a>
    		<div style="width: 100%;">
    			<div style="width: 70%; display:inline-block; float: left;">
    				<h5><b><span>小明小区</span>&nbsp;&nbsp;<span>3室1厅</span>&nbsp;&nbsp;<span>朝南</span></b></h5>
    				<p>高区20层&nbsp;|&nbsp;朝南</p>
    				<p><span class="tag-block">距离11号线浦三路站624米</span><span class="tag-block">有暖气</span></p>
    			</div>
    			<div style="width: 30%; display:inline-block; float: rigth;">
    				<div style="width: 60%; float: left;">
    					<p style="color: red;"><span style="font-size:40px;" >3000</span><span style="font-size:16px;">元/月</span></p>
    					<p>2017-20-12上架</p>
    				</div>
    				<div style="width: 40%; float: left; text-align:center; ">
    					<p><b>23人</b><br>收藏此房</p>
    				</div>
    			</div>
    		</div>
    	</div>
        </div>
        
        <hr style="color:#ffffff; border: 0; padding: 0;">
        
        
        <div id="house-element" style="width: 80%; margin-top100px; height:200px; margin-left: auto; margin-right: auto;">
    	<div style="width: 25%; display: inline-block; float: left; height: 200px;">    	
			<a href="#"><img class="img-polaroid" src="http://cdn1.dooioo.com/fetch/vp/fy/gi/20150413/0d936b6b-c5a8-4175-a32d-e2680253cfde.jpg_600x450.jpg" style="height: 150px;" alt="图片" onerror="this.src='/HouseSearcher/imgs/not-found-img.png'"></a>
    	</div>
    	<div style="width: 75%; display: inline-block; float: left;">
    		<a style="text-decoration: none;" href="#"><h4><b>采光方彪发哈接口类发哈是家乐福发哈森林防火傻蛋，发的时间里</b></h4></a>
    		<div style="width: 100%;">
    			<div style="width: 70%; display:inline-block; float: left;">
    				<h5><b><span>小明小区</span>&nbsp;&nbsp;<span>3室1厅</span>&nbsp;&nbsp;<span>朝南</span></b></h5>
    				<p>高区20层&nbsp;|&nbsp;朝南</p>
    				<p><span class="tag-block">距离11号线浦三路站624米</span><span class="tag-block">有暖气</span></p>
    			</div>
    			<div style="width: 30%; display:inline-block; float: rigth;">
    				<div style="width: 60%; float: left;">
    					<p style="color: red;"><span style="font-size:40px;" >3000</span><span style="font-size:16px;">元/月</span></p>
    					<p>2017-20-12上架</p>
    				</div>
    				<div style="width: 40%; float: left; text-align:center; ">
    					<p><b>23人</b><br>收藏此房</p>
    				</div>
    			</div>
    		</div>
    	</div>
        </div> --%>
        
    </div>
    
	<div id="load-more-container" class="row">
  		<div style="text-align: center; padding: 30px 0 30px 0; cursor: pointer;" class="col-md-12">
  			<p id="load-more" style="font-size: 18ox; ">点击加载更多...</p>
  		</div>
  	</div>
		
		
</body>
</html>

