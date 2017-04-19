<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>房屋推荐</title>

<script type="text/javascript" src="/HouseSearcher/js/Recommend.js" ></script>

<style type="text/css">
	#load-more:HOVER {
		text-decoration: underline;
	}
	#load-more{
		cursor: pointer; 
		cursor: hand;
	}
	
	.foot-text{
		display: inline-block;
	}
	
	.foot-text a{
		color: black;
		cursor:pointer;
		cursor:hand;
	}
	
	.foot-text a:HOVER{
		color: black;
	}
	
	.left-text{
		position: 
		float: left;
	}
	
	.right-text{
		float: right;
	}
	.another-batch{
		color: black;
		cursor: hand;
		cursor: pointer;
		margin-left: 30px;
		font-size: 16px;
	}
	.another-batch:HOVER {
		color: black;
	}
</style>


	<%@ include file="references.txt" %>

</head>
<body>
<div class="container">

  <div class="row">
  	<div class="col-md-12">
  		<h2>为您推荐<a id="another-batch" class="another-batch">换一批</a><span id="another-batch-loading"></span></h2>
  		<hr>
  	</div>
  </div>

  
  <div id="recommend-houses-list" class="row">
    <!-- <div class="col-md-3">
      <div class="thumbnail">
        <a href="/w3images/lights.jpg" target="_blank">
        	<object data="http://stackoverflow.com/does-not-exist.png" type="image/png">
    			<img src="https://appharbor.com/assets/images/stackoverflow-logo.png" alt="Lights" style="width:100%" />
  			</object>
        </a>
        <div style="width: 100%;" class="caption">
        	<div class="foot-text left-text">
            	<a href="">龙骨新城</a>        	
        	</div>
        	<div class="foot-text right-text">
            	<a>朝南</a>|
            	<a>3室2厅</a>
        	</div>
      	</div>
      </div>
    </div>
    
    <div class="col-md-3">
      <div class="thumbnail">
        <a href="/w3images/nature.jpg" target="_blank">
          <img src="/w3images/nature.jpg" alt="Nature" style="width:100%">
          <div class="caption">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    
    <div class="col-md-3">
      <div class="thumbnail">
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="/w3images/fjords.jpg" alt="Fjords" style="width:100%">
          <div class="caption">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-3">
      <div class="thumbnail">
        <a href="/w3images/fjords.jpg" target="_blank">
          <img src="/w3images/fjords.jpg" alt="Fjords" style="width:100%">
          <div class="caption">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div> -->
    </div>
    
    <!-- <div class="row">
  		<div style="text-align: center;" class="col-md-12">
  			<p id="load-more" style="font-size: 18ox; ">点击加载更多...</p>
  		</div>
  	</div> -->
    
    
  </div>
</div>
</body>
</html>