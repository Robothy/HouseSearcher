$(document).ready(function() {
	loadRecommendHouses(0, 4);
	$('#another-batch').on('click',function(){
		/** 更新推荐信息 **/
		
		/**加载新的推荐住房**/
		loadRecommendHouses((new Date).getSeconds(), 4);
		
	})
	
})

/**
 * 加载推荐房屋信息
 * @param begin 其实索引
 * @param mun 数量
 */
function loadRecommendHouses(begin,num){
	$.ajax({
		url:'/HouseSearcher/recommend/recommend-house-list',
		data:{requestHouseFirst:begin,requestHousesNumber:num},
		type:'POST',
		beforeSend:function(){
			$("#another-batch-loading").html('<img src="/HouseSearcher/icons/ajax-loader.gif" style="display:inline-block;" />');
		},
		error:function(){
			$("#another-batch-loading").html('<span style="color:red;">数据加载出错!</span>');
		},
		success:function(data){
			var responseCode = data['responseCode'];//获取响应状态码
			
			if(responseCode==1){//成功获取推荐信息
				var houses = data['responseHouses'];
				var housesHtml = '';
				for(var key in houses){
					var h = houses[key];
					housesHtml += '<div class="col-md-3">'+
				      '<div class="thumbnail">'+
				        '<a href="/HouseSearcher/house/house-details?houseHref='+h['HHref']+'" target="_blank">'+
				    			'<img src="'+h['imgHref']+'" onerror="this.src=\'/HouseSearcher/imgs/not-found-img.png\'" alt="Lights" style="width:100%; height:150px;" />'+
				        '</a>'+
				        '<div style="width: 100%;" class="caption">'+
				        	'<div class="foot-text left-text">'+
				            	'<a href="/HouseSearcher/house-details?houseHref='+h['HHref']+'">'+h['CName']+'</a>'+       	
				        	'</div>'+
				        	'<div class="foot-text right-text">'+
				            	'<a>朝'+h['HOrientation']+'</a>|'+
				            	'<a>'+h['HRoom']+'室'+h['HHall']+'厅</a>'+
				        	'</div>'+
				      	'</div>'+
				      '</div>'+
				   '</div>';
				}
			 $("#recommend-houses-list").html(housesHtml);
			}else {
				$("#recommend-houses-list").html('<h3>未能为您推荐房屋信息，您可以<a href="/HouseSearcher/house/search-all.action">查看所有</a></h3>');
			}
		},
		complete:function(){
			var img_tag = $("#another-batch-loading").find('img');
			if(img_tag!=null || img_tag!=undefined){
				$(img_tag).remove();
			}
		}
		
	})
	
	
}