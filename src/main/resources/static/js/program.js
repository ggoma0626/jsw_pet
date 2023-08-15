
var enableLoadMore = true;
$(document).ready(function() {
	
	var start = 0;
	
	getPrograms(start);

	$(document).on('click','.program-card',function(){
		var idx = $(this).data('proidx');		
		location.href= './detail-program?pro_idx='+idx;			
	})
	
	$('#more-btn').on('click',function(){
		
		if(enableLoadMore) {
			enableLoadMore = false;
			start = start+16;
			getPrograms(start);			
		}	
	})
	
})

function getPrograms(start) {
	$.ajax({
		url: './program/getChunk',
		type: 'get',
		data: {
			start: start,
			cnt: 16
		},
		success:function(json){			
			$.each(json, function(index, item){
				
				var date = item.created_date.split(' ')[0] + ' 등록';
				
				$('#program-list').append(`
					<div class="col-3" style="padding: 10px;">
						<div class="program-card" data-proidx = "${item.pro_idx}">
							<img class="poster-img" src="${item.poster_img_url}"/>
							<span class="txt1">${item.type}</span>
							<div class="txt2">${item.title}</div>
														
							<div style="margin-top: 20px;">
								<img class="user-img" src="${item.user_img_url}"/>
								<span class="name">${item.name}</span>							
							</div>					
							<div style="font-size:10px; color: #999; margin-top: 5px;">${date}</div>					
		
						</div>
					</div>					
				`);
				enableLoadMore = true;
			})
		},
		error:function(err){			
		}
	})
}