/*
 * 包含收藏房屋、取消收藏的js代码 
 */

var hasCollected = function(){
	$('#collect-this-house').css({'background-color':'gray'});
	$('#collect-this-house').text('取消收藏');
} 

$(document).ready(function() {
	$.ajax({
		type:'POST',
		url:'HouseSearcher/house/collect-house',
		data:{houseHref:$('#house-href').text()},
		success:function(data){
			var responseCode = data['responseCode'];
			if(data['responseCode']==1){//已收藏
				hasCollected();
			}
		}
	})
})

$(document).ready(function() {
	
	$('#collect-this-house').on('click',function(){
		
		if($('#collect-this-house').text()=='收藏此房'){
			$.ajax({
				type:'POST',
				url:'/HouseSearcher/house/collect-house',
				data:{houseHref:$('#house-href').text()},
				success:function(data){
					var responseCode = data['responseCode'];
					if(responseCode==0){	//住房已经收藏
						alert("系统错误，住房收藏失败");
					}else if (responseCode==1) { //住房收藏成功
						hasCollected();
					}else if(responseCode==2){//未登录
						window.location = '/HouseSearcher/pages/module/login.jsp';
					}
				},
				error:function(){
					alert("系统错误，住房收藏失败");
				}
			})
			
		}else {//取消收藏
			$.ajax({
				type:'POST',
				url:'/HouseSearcher/house/cancel-collect-house',
				data:{houseHref:$('#house-href').text()},
				success:function(data){
					var responseCode = data['responseCode'];
					if(responseCode == 1){
						$('#collect-this-house').css({'background-color':'#39AC6A'});
						$('#collect-this-house').text('收藏');
					}
				},
				error:function(){
					
				}
			})
		}
	})
})



