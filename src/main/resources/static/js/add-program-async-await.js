$(document).ready(function() {
		
	/*
 	 firebase 기본 셋팅
	*/
	if (!firebase.apps.length) {
		firebase.initializeApp(firebaseConfig);
	}
	
	var storage = firebase.storage();
	var posterfile;
	
	
	
	//===========사진 여러장 올리기 START===============	
	$('#add-other-img-btn').on('click',function(){
		$('#other-file').trigger('click');
	});	
	
	$('#other-file').on('change',async function(){
		var selectedOtherFile = $(this)[0].files[0];
		
		var base64 = await config.getBase64(selectedOtherFile);
		
		$('#other-imgs-list').append(`
			<div class="f-one-img-box">					
				<img src="${base64}"/>
				<div class="del-btn">
					<i class="fa-solid fa-circle-minus"></i>	
				</div>				
			</div>		
		`);
		// 중복 파일 올릴 수 있도록 올리고 초기화
		$('#other-file').val('');
	});	
	//===========사진 여러장 올리기 END===============
	
	
	
	
	
	//===========사진 여러장 올린더 DELETE===============
	$(document).on('click', '.del-btn', function(){
		var con = confirm('사진을 삭제 하시겠습니까?');
		
		if(!con){
			return;
		}
		
		var parent = $(this).closest('.f-one-img-box');		
		parent.remove();
	});	
	
	//===========사진 여러장 올린더 DELETE===============
	
	
	//포스터 이미지 미리보기 클릭
	$('#poster-img').on('click',function(){
		$('#poster-file').trigger('click');
	});
	
	//포스터 이미지 파일 이벤트
	$('#poster-file').on('change',function(){
		posterfile = $(this)[0].files[0];		
		
		var mb = posterfile.size / 1000000;				
		
		if(mb < 2){
			config.getBase64(posterfile).then(function(base64){
				$('#poster-img').attr('src',base64);
			});
		}else {
			alert('파일사이즈가 큽니다.');
		}
	});
	
	
	
	
	$('#submit-btn').on('click', async function() {
		
		config.showLoading();
		
		var title = $('#title').val();
		var type = $('#type').val();
		var content = $('#content').val();
		
		if(title.length == 0) {
			alert("프로그램명을 입력 해주세요");
			return;
		}
		
		if(content.length == 0 ) {
			alert("프로그램 소개 내용을 입력 해주세요");
			return;
		}
		
		var poster_img_url = await uploadImgAndGetUrl(posterfile);
		
		/*
		other image base64 배열 > firebase url 배열로 변환
		원리 : base64 -> storage에 업로드 후 firebase url 받아오기 -> 이 로직을 반복문으로 !		
		*/
		
		var base64Array =[]; 
		
		var boxList = $('.f-one-img-box');
		
		
		// ui 에서 base64 에 뽑아서 base64Array배열로 만들기
		$.each(boxList, function(index, item){
			var oneBase64 = $(item).find('img').attr('src');					
			base64Array.push(oneBase64);
		});	
				
		
		
		var otherImgUrlArray = [];
		// 확보된 base64Array 박복문 처리 -> 1개씩 업로드
/*		$.each(base64Array, function(index, b64){
			var url = await uploadBase64AndGetUrl(b64);
			console.log(url);
			otherImgUrlArray.push(url);
		})*/
		
		for(var i=0; i<base64Array.length; i++) {
			var url = await uploadBase64AndGetUrl(base64Array[i]);
			console.log(url);
			otherImgUrlArray.push(url);
		}
		
		
		
		
		
		console.log('아더이미지 최종');
		console.log(otherImgUrlArray);
		
		$.ajax({
			url: './program/save',
			type: 'post',
			data: {
				title: title,
				type: type,
				content: content,
				poster_img_url: poster_img_url,
				other_img_url_list: otherImgUrlArray				
			},
			success:function(json){
				if(json == 'not') {
					alert('로그인이 필요한 화면입니다.')
					location.href='./login';
				}else if (json == 'ok') {
					alert('프로그램이 등록 되었습니다.')
					location.replace('./');
				}
			},
			errer:function(err){
				
			},
		})
	});
	
	
	
	function uploadBase64AndGetUrl(b64){
		return new Promise(function(resolve, reject){
			
			//현재시간을 밀리세컨즈로 구해줌 1997.01.01 부터 현재
			var fname = Date.now();
			
			var ref = storage.ref('program_images').child(fname+'.png');
			ref.putString(b64, 'data_url').then(function(snapshot){
				//업로드 완료 됐을 때
				ref.getDownloadURL().then(function(url){
					// url 다운로드 콜백함수
					
					resolve(url);
				})						
			}).catch(function(err){
				//업로드 실패 했을 때
				reject();
			})						
		})		
	}	
	
	
	function uploadImgAndGetUrl(file){
		return new Promise(function(resolve, reject){
			
			//현재시간을 밀리세컨즈로 구해줌 1997.01.01 부터 현재
			var fname = Date.now();
			
			var ref = storage.ref('program_images').child(fname+'.png');
			ref.put(file).then(function(snapshot){
				//업로드 완료 됐을 때
				ref.getDownloadURL().then(function(url){
					// url 다운로드 콜백함수
					resolve(url);
				})						
			}).catch(function(err){
				//업로드 실패 했을 때
				reject();
			})						
		})		
	}
});