$(document).ready(function() {
	
	/*on > 이벤트랑 이벤트를 연겨랳주는 함수*/
	$('#go-signup-btn').on('click',function() {
		location.href = './signup';
	});
	
	$('#home-btn').on('click',function(){		
		location.href='./';			
	});		
	
	$('#login-btn').on('click',function() {

		var id = $('#id').val();
		var pw = $('#pw').val();
		
		$.ajax({
			url:'./user/login',
			type:'get',
			data:{
				id: id,
				pw: pw
			},
			success:function(json){
				if(json == '') {
					alert('가입된 계정이 없습니다.');
				}else {
					location.replace('./');	
				}
			},
			error:function(){
				console.log(err);
			}		
		})
		
	});	
});




/*

var a = '';


var arr = ['a','b','c'];

arr[1]


var obj = {
	name:'정민',
	address:'부산',
	now:2023
}


obj['name']
obj.name



let b = 20;

b = 30;


const key = 'sdgsdg';





function add(num1, num2){
	var sum = num1+num2;
	
	return sum;
}



var result = add(10,20);



if(result==10 ){
	
}else if(result==20){
	
}else{
	
}


for(var i=0;i<100;i++){
	console.log(i); 
}*/


