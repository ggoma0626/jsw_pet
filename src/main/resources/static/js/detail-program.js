$(document).ready(function(){
	
	//https://www.sitepoint.com/get-url-parameters-with-javascript/
	var queryString = window.location.search;
	var urlParams = new URLSearchParams(queryString);
	var proIdx = urlParams.get('pro_idx')
	

	var thisProgram;
	
	var isMine = false;
	
	/* 로그인 한 사람 , 상세보기로 들어 온 사람의 idx를 비교 */
	if($('#pro-user-idx').val() == $('#my-user-idx').val()) {
		isMine = true;
	}
	
	/* 프고그램 신청하기 */
	$('#buy-program').on('click', function(){
		var con = confirm(`${thisProgram.title} 프로그램을 신청 하시겠습니까?`);
		
		if(!con) {
			return;
		}
		
		$.ajax({
		url:'./bp/buy',
		type:'post',
		data:{
			pro_idx:proIdx
		},
		success:function(json){
			if(json == 'no-user') {
				alert('로그인이 필요한 서비스 입니다.');
				location.href='./login';
			}else if(json == 'ok') {
				alert('프로그램이 신청 되었습니다')
				window.location.reload();
			}
		},					
		error:function(err){
			
		}	
	});
});

	
	/* 상세보기 정보 ajax 방식 */	
	$.ajax({
		url:'./program/findByIdx',
		type:'get',
		data:{
			pro_idx:proIdx
		},
		success:function(json){
			
			thisProgram = json;
			
			$('#poster-img').attr('src',json.poster_img_url);			
			$('#title').html(json.title);
			$('#type').html(json.type);
			$('#name').html(json.name);
			$('#content').html(json.content);
			
/*			$('#buy-program').on('click', function(){
			var con = confirm(`${json.title} 프로그램을 신청 하시겠습니까?`);
			});*/
		},
		error:function(err){
			
		}
		
	});
	
	/* 프로그램 교육현장 상세 이미지 불러오기*/	
	$.ajax({
		url:'./poi/getImgsByProgram',
		type:'get',
		data:{
			pro_idx:proIdx
		},
		success:function(jsonList){
			/* 일반적인 반복문
			for(var i=0;i<jsonList.length;i++){
				var item = jsonList[i];
			}*/
			
			$.each(jsonList , function(index, item){
				$('.other-imgs').append(`
					<img src="${item.other_img_url}"/>
				`);
			});
		},
		error:function(err){
			
		}		
	})
	
	/* 신청자 현황 불러오기 */
	$.ajax({
		url : './bp/getByProgram',
		type : 'get',
		data : {
			pro_idx:proIdx
		},
		success:function(jsonList){
			$.each(jsonList, function(index, item) {
				
				var telHtml;
				
				if(isMine) {
					telHtml = `<div class="date">${item.tel}</div>`;
				}else {
					telHtml = `<div class="date">010-****-****</div>`;
				}
				
				$('#join-users').append(`
					<nav class="join-user-box">
						<img src="${item.user_img_url}"/>
						<div>
							<div class="nick">${item.nickname}</div>
							${telHtml}							
							<div class="date">${item.created_date.split(' ')[0]}</div>
						</div>			
					<nav>		
				`)
			})
		},
		error:function(err){
			
		}
		
	})
	
})