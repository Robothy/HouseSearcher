$(document).ready(function() {
	$('#sub').click(function() {
		
		var loginFaild = function(){
			alert("登录失败！");
		}
		
		$.ajax({
			type:'POST',
			url:'/HouseSearcher/user/login',
			data:{phone:$('#phone').val(),pwd:$('#pwd').val()},
			success:function(data){
				if(data['responseCode'] == 1){
					window.history.go(-1);
				}else {
					loginFaild();
				}
			},
			error:loginFaild
		})
	})
})