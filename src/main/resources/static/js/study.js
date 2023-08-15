$(document).ready(function() {
	$('#my-btn').on('click',function() {
		
		var value = $('#inp').val();
		
		
		$('header').css('background',value);
		
		$('#txt').html(value);
		$('#txt').css('color','blue');
		$('#txt').css('font-size','23px');
		
	});
	
	var userCount = 0;
	
	$('#add-user-btn').on('click',function() {
		
		var name = $('#name').val();
		var age = $('#age').val();
		var address = $('#address').val();

		if(name.length > 0 && age > 0 && address.length > 0 ) {
			// 모든 입력창에 기입 완료 했을때만
			userCount++;
			$('#user-list').append(`
				<tr>
			      <th scope="row">${userCount}</th>
			      <td>${name}</td>
			      <td>${age}</td>
			      <td>${address}</td>
			    </tr>
			`);					
		} else {
			// 기입이 안되었을떄
			alert('모든 내용을 적어주세요');
		}



	});
	
	
});