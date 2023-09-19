$(document).ready(function(){
	
	
	$('#cancel-btn').on('click',function(){
		
		var con = confirm('작성하시던 댓글이 모두 지워집니다. 취소하시겠습니까?');
		if(!con) {
			return;			
		}
		document.getElementById("parent-reply-content").value='';				
	})
	
	
	$.ajax({
		url: './ntrp/findByIdx',
		type: 'get',
		data: {
			nt_idx: $('#this-notice-idx').val(),
		},
		async : false,
		success:function(json){},
		error:function(err){
			console.log(err);
		}		
	})	
		
	
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
			success: function(jeon){},
			error: function(err){}
		})
	})
})