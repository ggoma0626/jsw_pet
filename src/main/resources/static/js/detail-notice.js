$(document).ready(function(){
	
	//댓글조회
	$.ajax({
		url: './ntrp/fineByNtIdx',
		type: 'get',
		data: {
			nt_idx: $('#this-notice-idx').val(),
		},
		async : false,
		success:function(jsonArr){
			
			$.each(jsonArr,function(index, item){				
				//댓글 배치 , not_idc == 0은 ? 부모 댓글 일 때
				if(item.parent_nt_rp_idx == 0){
					$('#reply-list').append(`
						<nav class="reply-box" data-nt-rp-idx="${item.nt_rp_idx}">
							<img src="${item.user_img_url}"/>
							<div>
								<span class="nick">${item.nickname}</span>
								<p class="content">
									${item.content}
								</p>							
								<span class="open-child-reply-btn">답글</span>							
							</div>
						</nav>								
					`);					
				}															
			});
			
			
			//답글 배치, not_idc != 0은 ? 자식 댓글 일 때
			$.each(jsonArr,function(index, item){				
				if(item.parent_nt_rp_idx != 0){
					var parent = $(`.reply-box[data-nt-rp-idx="${item.parent_nt_rp_idx}"]`)
					parent.after(`
					<nav class="reply-box child">
						<img src="${item.user_img_url}"/>
						<div>
							<span class="nick">${item.nickname}</span>
							<p class="content">
								${item.content}					
							</p>
						</div>
					</nav>											
					`);
				}				
			})										
		},
		error:function(err){
			console.log(err);
		}		
	})	
	
	
	/* 답글 버튼 클릭 시 입력 창 */
	$(document).on('click','.open-child-reply-btn',function(){
		/* 답글버튼 연속 클릭 안되게 , pointer-events */
		$(this).css('pointer-events','none');
		$(this).after(`		
			<br/>
			<textarea style="width :300px; heigth: 60px; resize: none; fone-size: 13px"></textarea>
			<br/>
			<button class= "form-btn add-child-reply-btn" style="margin-left: 260px;" >등록</button>				
		`					
		);
	});
	
	
	
	//답글 등록 버튼
	$(document).on('click','.add-child-reply-btn',function(){
		var con = confirm('답글을 등록 하시겠습니까?')
		if(!con){
			return;
		}			
		
		var parent_nt_rp_idx = $(this).closest('.reply-box').data('nt-rp-idx');
		var content = $(this).closest('.reply-box').find('textarea').val();
		
		
		
		$.ajax({
			url: './ntrp/save',
			type: 'post',
			data: {
				nt_idx: $('#this-notice-idx').val(),				
				parent_nt_rp_idx: parent_nt_rp_idx,
				content: content
			},
			success: function(json){
				if(json =='ok'){
					alert('답글이 등록 되었습니다.');
					location.reload();
				}	
			},
			error: function(err){}
		})
		
	});
	
		
	//댓글 등록 버튼
	$('#add-parent-reply-btn').on('click',function(){		
		
		var con = confirm('댓글을 등록 하시겠습니까?');
		if(!con) {
			return;			
		}		
		var content = $('#parent-reply-content').val();
		
		$.ajax({
			url: './ntrp/save',
			type: 'post',
			data: {
				nt_idx: $('#this-notice-idx').val(),				
				parent_nt_rp_idx: 0,
				content: content
			},
			success: function(json){
				if(json =='ok'){
					alert('등록 되었습니다.');
					location.reload();
				}	
			},
			error: function(err){}
		})
	})
	
	
	
	//댓글 지우기 버튼
	$('#cancel-btn').on('click',function(){		
		var con = confirm('작성하시던 댓글이 모두 지워집니다. 취소하시겠습니까?');
		if(!con) {
			return;			
		}
		$("#parent-reply-content").val('');					
	})
		
})