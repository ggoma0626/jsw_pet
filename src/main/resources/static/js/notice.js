$(document).ready(function() {
	
	var cnt = 10;
	var totalPageCount = 1;
	
	
	
	
	$.ajax({
		url: './notice/getCount',
		type: 'get',
		data: {},
		async:false,
		success:function(count){
			totalPageCount = Math.ceil(count/cnt);
		},
		error:function(err){
			
		}
	})
	
	
    $('#pagination-demo').twbsPagination({
        totalPages: totalPageCount,
        visiblePages: 5,	
		first:'처음',
		prev:'이전',
		last:'마지막',
		next:'다음',
        onPageClick: function (event, page) {
	
			$.ajax({
				url: './notice/findAll',
				type: 'get',
				data: {
					start: (page-1) * cnt,
					cnt: cnt,
				 },
				success:function(json){
					
					$('#notice-list').empty();
								
					$.each(json,function(index, item){
						$('#notice-list').append(`
						    <tr class="notice-box">
						      <th scope="row">${item.nt_idx}</th>
						      <td>${item.title}</td>
						      <td>${item.created_date}</td>
						    </tr>				
						`);								
					});
				},
				error:function(err){
								
				}
			})            
        }
    });	


	$(document).on('click','.notice-box',function(){
		location.href = './detail-notice';
	})
	
	
	

	
});