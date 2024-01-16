$(document).ready(function() {
	
	const cnt = 10;
	var totalPageCount = 1;
		
	
	/* 공지사항 갯수 count 가져오기 */
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
	
	/* 페이지네이션 twbsPagination 라이브러리 많이사용 
		https://josecebe.github.io/twbs-pagination/
	*/
    $('#pagination-demo').twbsPagination({
        totalPages: totalPageCount,
        visiblePages: 5,	
		first:'처음',
		prev:'이전',
		next:'다음',
		last:'마지막',
		
		/* 페이지가 바뀔 때 */
        onPageClick: function (event, page) {	
	
			/* 공지사항 리스트 조회  Map 으로 받음*/
			$.ajax({
				url: './notice/findAll',
				type: 'get',
				data: {
					/* start = (page - 1) * cnt = 더보기랑 같다고 보면됨 page 1 , start 10  /  page 2 , start 20 */
					start: (page-1) * cnt,
					cnt: cnt,
				 },
				success:function(json){
					
					/* 얘 없으면 더보기일듯 , empty로 계속 비워줘야됨 전에 있던 list를 지우고 새로 띄워줘야되니까 */
					$('#notice-list').empty();
					
					/* for each 돌려서 리스트 넣기 */			
					$.each(json,function(index, item){
						$('#notice-list').append(`
						    <tr class="notice-box" data-nt-idx="${item.nt_idx}">
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


	/* 공지사항 상세보기 */
	$(document).on('click','.notice-box',function(){
		var noticeIdx = $(this).data('nt-idx')
		location.href = './detail-notice?nt_idx=' + noticeIdx;
	})
	
});