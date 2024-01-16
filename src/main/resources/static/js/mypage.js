$(document).ready(function() {


	//내가 만든 프로그램 가져오기
	$.ajax({
		url: './program/findByUserIdx',
		type: 'get',
		data: {
			/* Mypage.jsp 에서 user_idx hidden 처리함*/
			user_idx:$('#me-user-idx').val()
		},
		async : false,
		success:function(json){
			$.each(json,function(index, p){
				$('#t-list').append(`
				    <tr class="program-box" style= "cursor: pointer"data-pro-idx="${p.pro_idx}">
				      <td>
				       	<img style="width: 70px; height: 70px;" src="${p.poster_img_url}"/>
				      </td>
				      <td style="vertical-align: middle">${p.title}</td>
				      <td style="vertical-align: middle">${p.type }</td>
				      <td style="vertical-align: middle">${p.name }</td>
				      <td style="vertical-align: middle">${p.created_date }</td>				      	     
				    </tr>					
				`);
			});
		},
		error:function(err){
			console.log(err);
		}		
	})		
		
	//async 대신 $(document).on('click',function() 으로 할수도 있음	
	$('.program-box').on('click',function(){
		var proIdx = $(this).data('pro-idx');
		location.href = './detail-program?pro_idx=' + proIdx;
	})				
		
	$('#open-wind-btn').on('click',function(){
		$('#edit-user-window').css('display','flex')
	})
	
	$('.close-btn').on('click',function(){
		$('#edit-user-window').css('display','none')
	})		
	
	$('#update-btn').on('click', function(){
		
		
		var name = $('#u-name').val();
		var birth = $('#u-birth').val();
		var tel = $('#u-tel').val();
		var gender = $('#u-gender').val();
		var like_type = $('#u-like_type').val();
		
		if(name.length == 0) {
			alert('이름을 적어주세요');
			return;
		}
		
		if(birth.length == 0) {
			alert('이름을 적어주세요');
			return;
		}
		
		if(tel.length == 0) {
			alert('이름을 적어주세요');
			return;
		}
		
		if(gender.length == 0) {
			alert('이름을 적어주세요');
			return;
		}
		
		if(like_type.length == 0) {
			alert('이름을 적어주세요');
			return;
		}		
		
		var con = confirm('수정 하시겠습니까?');
		if(!con) {
			return;			
		}
		
		$.ajax({
			url: './user/updateUser',
			type: 'post',
			data: {
				name:name,
				birth:birth,
				tel:tel,
				gender:gender,
				like_type:like_type				
			},
			success:function(json){
				if(json == 'ok') {
					alert('수정 되었습니다');
					$('.close-btn').trigger('click');
					location.reload();
				}
			},
			error:function(err){
				console.log(err);
			}
		})		
	});
});