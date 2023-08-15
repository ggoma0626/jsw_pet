$(document).ready(function() {
		
	//파일 업로드 테스트
	
	/*
 	 firebase 기본 셋팅
	*/
	if (!firebase.apps.length) {
		firebase.initializeApp(firebaseConfig);
	}
	
	var storage = firebase.storage();
	var file;

	$('#preview-img').on('click',function(){
		$('#upload-file').trigger('click');
	});
	
	$('#upload-file').on('change',function(){
		file = $(this)[0].files[0];		
		getBase64(file).then(function(base64){
			$('#preview-img').attr('src',base64);
		});
	});

	/*
 	 이미지 삽입 (파일 업로드)
	*/	
	$('#upload-btn').on('click',function(){		
		var ref = storage.ref('test_path').child('img.png');
		ref.put(file).then(function(snapshot){
			//업로드 완료 됐을 때
			ref.getDownloadURL().then(function(url){
				alert('업로드완료' +url);
			})						
		}).catch(function(err){
			//업로드 실패 했을 때
		})			
	});
	
	function uploadImgAndGetUrl(){
		return new Promise(function(resolve, reject){
			
			//현재시간을 밀리세컨즈로 구해줌 1997.01.01 부터 현재
			var fname = Date.now();
			
			var ref = storage.ref('user_images').child(fname+'.png');
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
	
	
	
	
	
	/*
	 로고 이미지 클릭시 home으로 이동
	*/	
	$('#home-btn').on('click',function(){		
		location.href='./';			
	});
	

		
	
	var enableId = false;
	var enableNickname = false;
	var enableTel = false;
	var enablePw = false;
	var currentType = 'u';
	var number6 = '';
	
	/*
 	 아이디 중복체크  
	*/
	$('#id').on('focusout',function() {
		var uid = $("#id").val();
			
			if(uid.length > 3) {
				$.ajax({
					url: './user/getById',
					type: 'get',
					data: {
						id: uid
					},
					success:function(json){
						if(json == '') {
							// 중복체크 통과
							buildTextForIdCheck('사용 가능한 아이디 입니다.', true);
							enableId = true;
						} else {
							// 다른아이디로 가입 유도
							buildTextForIdCheck('중복된 아이디 입니다.', false);
							enableId = false; 
						}
					},
					error:function(err){
						
					}
				})			 			
			} else {
				buildTextForIdCheck('4글자 이상의 아이디를 입력 해주세요.', false);
				enableId = false;
			}		
	})
	
	/*
 	 닉네임 중복체크  
	*/
	$('#nickname').on('focusout',function(){
		
		var unickname = $("#nickname").val();
			
			if(unickname.length > 2) {
				$.ajax({
					url: './user/getByNickname',
					type: 'get',
					data: {
						nickname: unickname	//RequestParam value에 있는 nickname이 들어가는거임
					},
					success:function(json){
						if(json == '') {
							buildTextForNinameCheck('사용 가능한 닉네임 입니다.', true);
							enableNickname = true;
						} else {
							buildTextForNinameCheck('중복된 닉네임 입니다.', false);
							enableNickname = false; 
						}
					},
					error:function(err){
						
					}
				})			 			
			} else {
				buildTextForNinameCheck('3글자 이상의 닉네임을 입력 해주세요.', false);
				enableNickname = false;
			}		
	})
	
	
	/*
	 휴대전화 인증번호 6자리 난수 생성		
	*/
	$('#send-msg-btn').on('click',function() {
		//6자리 난수
		var tel = $('#tel').val();
		if(telValidator(tel)) {
			number6 = generateRandomCode(6);
			alert(`인증번호를 발송 했습니다. (${number6})`);
		} else {
			alert('올바른 형식의 전화번호를 입력하세요');
		}

	});
	
	/*
	 난수 생성 후 인증번호 일치 or 불일치
	*/
	$('#number-chk').on('keyup',function() {
		var num6 = $(this).val();
		
		if(number6 == num6) {
			//인증번호 일치
			buildTextForTelCheck('인증되었습니다', true);
			$('#number-chk').css('background','#f2f2f2');
			$('#number-chk').attr('readonly',true);
			enableTel = true;
		}else {
			//불일치
			buildTextForTelCheck('인증번호가 불일치합니다', false);
			enableTel = false;
		}
		
	});
	
	/*
	 비밀번호 재확인
	*/	
	$('#pw-chk').on('keyup',function(){
		var pw = $('#pw').val();
		var pwChk = $('#pw-chk').val();
		
		if(pw == pwChk) {
			buildTextForPwCheck('비밀번호가 일치합니다', true);
			enablePw = true;
			
		} else {
			buildTextForPwCheck('비밀번호가 일치하지 않습니다.', false);
			enablePw = false;
		}
	})
	
	
	/*
 	 회원가입 버튼 클릭  
	*/
	$('#submit-btn').on('click',function() {
		
		if(!enableId) {
			alert('아이디 인증을 진행해주세요');
			return;
		};
		
		if(!enableNickname) {
			alert('닉네임 인증을 진행해주세요');
			return;
		};
		
		var type 		= currentType;
		var id 			= $('#id').val();
		var pw 			= $('#pw').val();
		var pwChk		= $('#pw-chk').val();
		var nickname	= $('#nickname').val();
		var name 		= $('#name').val();
		var birth 		= $('#birth').val();
		var gender 		= $('#gender').val();
		var tel 		= $('#tel').val();
		var likeType    = $('#like-type').val();
		
		
		if(pw.length == 0) {
			alert('비밀번호를 입력하세요');
			return;
		}
		
		if(pwChk.length == 0) {
			alert('비밀번호를 확인하세요');
			return;
		}
		
		
		if(name.length == 0) {
			alert('이름을 입력하세요');
			return;
		}
		
		if(birth.length == 0) {
			alert('생년월일을 입력하세요');
			return;
		}				
		
		config.showLoading();		
		uploadImgAndGetUrl().then(function(img_url){
			$.ajax({
				url: './user/create',
				type: 'post',
				data: {
					id		 : id,
					pw		 : pw,
					nickname : nickname,
					img_url  : img_url,
					name	 : name,
					birth    : birth,
					gender   : gender,
					tel		 : tel,
					type	 : type,
					lty      : likeType	
				},
				success:function(json){
					if(json=='ok') {
						alert('회원가입이 완료 되었습니다');
						location.replace('./');  //전에있던 기록 안남기고 이동
					}			
				},			
				error:function(err){}			
			});			
		});
	});
	
	$('.type-box').on('click',function() {
		var v = $(this).data('value');
		currentType = v;				
		$('.type-box').attr('class','type-box');
		
		$(".type-box[data-value='"+v+"']").attr('class','type-box active');
		
	})
});

/*
 패스워드 체크 keyup text
*/
function buildTextForPwCheck(text, isOk) {
	$('#pw-txt').css('opacity','1');
	$('#pw-txt').html(text);
	
	if(isOk) {
		$('#pw-txt').attr('class','form-txt ok');	
		
	} else {
		$('#pw-txt').attr('class','form-txt');
	}
	 
}

/*
 닉네임 체크 keyup text
*/
function buildTextForNinameCheck(text, isOk) {
	$('#nickname-txt').css('opacity','1');
	$('#nickname-txt').html(text);
	
	if(isOk) {
		$('#nickname-txt').attr('class','form-txt ok');	
	} else {
		$('#nickname-txt').attr('class','form-txt');
	}
	 
}

/*
 인증번호 체크 keyup text
*/
function buildTextForTelCheck(text, isOk) {
	$('#tel-txt').css('opacity','1');
	$('#tel-txt').html(text);
	
	if(isOk) {
		$('#tel-txt').attr('class','form-txt ok');	
	} else {
		$('#tel-txt').attr('class','form-txt');
	}
	 
}

/*
 아이디 체크 keyup text
*/
function buildTextForIdCheck(text, isOk) {
	$('#id-txt').css('opacity','1');
	$('#id-txt').html(text);
	
	if(isOk) {
		$('#id-txt').attr('class','form-txt ok');	
	} else {
		$('#id-txt').attr('class','form-txt');
	}
	 
}

/*
 6자리 난수 생성
*/
function generateRandomCode(n) {
  let str = ''
  for (let i = 0; i < n; i++) {
    str += Math.floor(Math.random() * 10)
  }
  return str
}

/*
 번호 유효성검사
*/
function telValidator(args) {
    const msg = '유효하지 않는 전화번호입니다.';
    // IE 브라우저에서는 당연히 var msg로 변경
    
    if (/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/.test(args)) {
        return true;
    }
    return false;
}

/* 
 이미지 선택 시 미리보기 
*/
function getBase64(file) {
   return new Promise(function(resolve, reject){
	   var reader = new FileReader();
	   reader.readAsDataURL(file);
	   reader.onload = function () {
		   resolve(reader.result);
	   };
	   reader.onerror = function (error) {
		   reject('Error: ', error);
	   };
   });
   
}
