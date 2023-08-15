<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./image/logo.png"/>
<title>회원가입</title>
<script src="https://kit.fontawesome.com/43368b31e8.js"
	crossorigin="anonymous"></script>

<!-- 메인 home 화면 css -->
<link rel="stylesheet" href="./css/app-style.css" />

<!-- login 화면 css -->
<link rel="stylesheet" href="./css/form.css" />

<!-- signup 화면 css-->
<link rel="stylesheet" href="./css/signup.css" />

<!-- firebase 셋팅 -->
<script src="https://www.gstatic.com/firebasejs/3.2.0/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.3.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-storage.js"></script>

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="./js/config.js"></script>
<script src="./js/signup.js"></script>

</head>
<body>



	<div style="width: 400px; margin: 0 auto;">
		<div align="center">
			<img id="home-btn" style="cursor: pointer;" src="./image/logo.png"/>
		</div>
		

		<div style="width: 400px; margin-top: 20px;">
		
			
			<div id="type" class="type-container">
				<div data-value="u" class="type-box active">일반회원</div>
				<div data-value="t" class="type-box" style="margin-left: 20px;">전문가</div>
			</div>
			
			
			<span class="text">프로필 이미지</span>	
			<div align="center">
				<img id="preview-img" style="width: 150px; height: 150px; border-radius: 50%; cursor: pointer; object-fit: cover;"  src="./image/pro.png">
			</div>
			
			<div style="display: none">
				<input id="upload-file" type="file"/>
				<button id="upload-btn">파일 업로드</button>
			</div>
			
			
			<span class="text">아이디</span>			
			<div style="justify-content: space-between; display: flex;">
				<input id="id" class="signup-input" placeholder="아이디" />				
			</div>
			<div id="id-txt" class="form-txt"></div>
						
						
			<span  class="text">비밀번호</span> 
			<input id="pw" class="signup-input" type="password" placeholder="비밀번호"/>
			
			
			<span class="text">비밀번호 재확인</span>			
			<input id="pw-chk" class="signup-input" type="password" placeholder="비밀번호 재확인" />
			<div id="pw-txt" class="form-txt"></div>
			
			
			
			<span class="text">닉네임</span>			
			<div style="justify-content: space-between; display: flex;">
				<input id = "nickname" class="signup-input" placeholder="닉네임" />
			</div>
			<div id = "nickname-txt" class="form-txt"></div>
			  
			  
			<span class="text">이름</span>				
			<input id = "name" class="signup-input" placeholder="이름"/>
			 
			<span class="text">생년월일</span>
			<input id = "birth" class="signup-input" type="date" placeholder="생년월일" />
			
			 			
			<span class="text">성별</span>
			<select id = "gender" class="select-box">				
				<option value="m">남자</option>
				<option value="w">여자</option>
			</select>				
			
			<span class="text">관심(전문)분야</span>
			<select id = "like-type" class="select-box">
				<option value="선택">선택</option>				
				<option value="반려견 간식">반려견 수제간식 만들기</option>
				<option value="반려견 놀이">반려견과 함께하는 놀이</option>
				<option value="반려견 건강">반려견 건강</option>
				<option value="반려견 훈련">반려견 훈련</option>			
				<option value="반려견 교육">반려견 필수교육</option>				
			</select>		
				
			<span class="text">휴대전화</span>			
			<div style="justify-content: space-between; display: flex;">
				<input type="tel" id = "tel" class="signup-input" placeholder="010-1234-5678" />
				<button  id = "send-msg-btn" class="certification-btn">인증번호 받기</button>
			</div>

			<input id="number-chk" class="signup-input" placeholder="인증번호 입력" />
			<div id="tel-txt" class="form-txt">인증 되었습니다</div>

			<button id="submit-btn"class="form-btn">가입하기</button>
		</div>
	</div>
			
	 <footer style="display: flex; justify-content: center;align-items:center;margin-top:30px;width:100%;height:100px;background:#f2f2f2;">
			<span>이용약관 | 서비스 소개 | 개인정보처리방침 | 고객센터</span>
	</footer>
	
</body>
</html>