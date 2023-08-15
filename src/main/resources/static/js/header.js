$(document).ready(function() {
	
	$('#go-mypage-btn').on('click',function(){		
		location.href='./mypage';			
	});
	
	$('#home-btn').on('click',function(){		
		location.href='./';			
	});
	
	$('.hd-btn').on('click',function() {
		var page = $(this).data('page');
		location.href=page;
	})
	
	$('.go-add-program-btn').on('click',function() {
		location.href = './add-program';
	});		
	
		/*on > 이벤트랑 이벤트를 연겨랳주는 함수*/
	$('.go-login-btn').on('click',function() {
		location.href = './login';
	});		
	
	$('#logout-btn').on('click',function() {
		var con = confirm('로그아웃 하시겠습니까?');
		
		if(!con) {
			return;
		}
		
		$.ajax({
			url: './user/logout',
			type: 'post',
			data: {				},
			success:function(json){
				if(json == 'ok') {
					alert('로그아웃 되었습니다');
					location.replace('./');
				}
			},
			error:function(){
				console.log(err);
			}
		})	
	});	
})