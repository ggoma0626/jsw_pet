$(document).ready(function() {


	const myModal = document.getElementById('staticBackdrop')
	myModal.addEventListener('shown.bs.modal', () => {
		//모달이 나올 때 이벤트 실행
		$('#nt-title').val('');
		$('#nt-content').val('');
	})
	
	
	//공지사항 등록버튼
	$('#add-notice-btn').on('click',function(){		
		
		var title = $('#nt-title').val();
		var content = $('#nt-content').val();
		
		if(title.length == 0) {
			alert('제목을 입력하세요');
		}
		
		if(content.length == 0) {
			alert('내용을 입력하세요');
		}
		
		var element = $(this);
		
		// 더블클릭 방지
		element.css('pointer-events', 'none')
		
		$.ajax({
			url: './notice/save',
			type: 'post',
			data: {
				title: title,
				content: content
			},
			success:function(json){	
				element.css('pointer-events', 'auto')					
				// Modal 닫기 클릭 트리거		
				if(json == 'ok') {
					alert('공지사항 등록 완료');
					$('#nt-close-modal-btn').trigger('click')
				}
			},
			error:function(){
				element.css('pointer-events', 'auto')									
			}
		})
	});






		
	
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