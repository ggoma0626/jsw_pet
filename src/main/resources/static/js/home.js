$(document).ready(function() {
	
	//loadTeachers();
	
});



function loadTeachers() {
	$.ajax({
		url: './user/get4T',
		type: 'get',
		data: {},
		success:function(jsonList){
			console.log(jsonList);
			
			$.each(jsonList, function(index, item){
				$('#t-list').append(`				
				<div class="teacher-box">
					<img src="${item.user_img_url}"/>
					<div class="t">${item.name} 전문가1</div>
					<div class="c">${item.like_type}</div>
				</div>					
				`);
			});
				
		},
		errer:function(err){
			
		}
	})
}



