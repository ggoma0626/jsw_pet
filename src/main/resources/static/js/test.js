

$(document).ready(function(){
/*	$('#btn').on('click',async function(){
		await test1();
		await test2();
	});*/
	
	
/*	$('#btn').on('click',function(){
		test1()
		.then(function(){
			test2();
		})
		.catch(function(){
			console.log('실패');
		})
	});*/
	
	$('#btn').on('click',function(){
		var parr = [test1(), test2()];
		
		Promise.all(parr).then(function(){
			console.log('완료');
		})
	});
		
});

function test1(){
	
	return new Promise(function(resolve, reject){
		setTimeout(function(){
			console.log('ok 1');
			resolve();
		},2000);		
	});
	

}

function test2(){
	return new Promise(function(resolve, reject){
		setTimeout(function(){
			console.log('ok 2');
			resolve();
		},1000);		
	});
}