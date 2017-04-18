$(document).ready(function() {
	var index = 10;
	load(0, 10);
	$('#load-more').on('click',function(){
		load(index, index+10);
	})
})

//加载房屋信息的方法
var load = function(begin,num) {
	
	var loadErr = function() {
		$("#house-list-container").html('<p>数据加载出错<a id="load-more" style="cursor:pointer;">重试</a></p>');
	}
	
	$.ajax({
		url:'/HouseSearcher/house/search-houses',
		type:'POST',
		data:{beginIndex:begin,number:num},
		beforeSend:function(){
			$('#load-more').html('<img src="/HouseSearcher/icons/ajax-loader.gif" style="display:inline-block;" />');
		},
		success:function(data){
			var responseCode = data['responseCode'];//获取响应状态码
			
			if(responseCode==1){//成功获取推荐信息
				var houses = data['houses'];
				var housesHtml = '';
				for(var key in houses){
					var h = houses[key];
					
					var tags = h['HTags'].split(',');
					var tagsHtml = '';
					for(var i=0; i<tags;i++){
						if(tags[i]!=''){
							tagsHtml+='<span class="tag-block">'+tags[i]+'</span>';
						}
					}
					
					housesHtml += '<div id="house-element" style="width: 80%; margin-top100px; height:200px; margin-left: auto; margin-right: auto;">'+
			    	'<div style="width: 25%; display: inline-block; float: left; height: 200px;">'+
					'<a href="/HouseSearcher/house/house-details?houseHref='+h['HHref']+'" target="_blank"><img class="img-polaroid" src="'+h['imgHref']+'" style="height: 150px; width:230px;" alt="图片" onerror="this.src=\'/HouseSearcher/imgs/not-found-img.png\'"></a>'+
		    	'</div>'+
		    	'<div style="width: 75%; display: inline-block; float: left;">'+
		    		'<a style="text-decoration: none;" href="/HouseSearcher/house/house-details?houseHref='+h['HHref']+'"><h4><b>'+h['HTitle']+'</b></h4></a>'+
		    		'<div style="width: 100%;">'+
		    			'<div style="width: 70%; display:inline-block; float: left;">'+
		    				'<h5><b><span>'+h['CName']+'</span>&nbsp;&nbsp;<span>'+h['HRoom']+'室'+h['HHall']+'厅</span>&nbsp;&nbsp;<span>朝南</span></b></h5>'+
		    				'<p>'+h['HLevel']+'层&nbsp;|&nbsp;朝'+h['HOrientation']+'</p>'+
		    				'<p>'+tagsHtml+'</p>'+
		    			'</div>'+
		    			'<div style="width: 30%; display:inline-block; float: rigth;">'+
		    				'<div style="width: 60%; float: left;">'+
		    					'<p style="color: red;"><span style="font-size:40px;" >'+h['price']+'</span><span style="font-size:16px;">元/月</span></p>'+
		    					'<p>'+h['pubDate']+'上架</p>'+
		    				'</div>'+
		    				'<div style="width: 40%; float: left; text-align:center; ">'+
		    					'<p><b>'+h['collectNum']+'人</b><br>收藏此房</p>'+
		    				'</div>'+
		    			'</div>'+
		    		'</div>'+
		    	'</div>'+
		        '</div>';
				
				}
				
			 
			 $("#house-list-container").append(housesHtml);
			 
			 $("#load-more").html("点击加载更多...");
			 
			}else {
				loadErr();
			}
		},
		error:function(){
			
			loadErr();
		},
		complete:function(textStatus){
			if(textStatus=='timeout'||textStatus=='error'){
				loadErr();
			}else if (textStatus=='success') {
				
			}
		}
	})
}