<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./image/logo.png"/>
<title>회원가입</title>

<link rel="stylesheet" href="./css/all.min.css" />

<!-- 메인 home 화면 css -->
<link rel="stylesheet" href="./css/app-style.css" />

<!-- login 화면 css -->
<link rel="stylesheet" href="./css/form.css" />

<!-- signup 화면 css-->
<link rel="stylesheet" href="./css/signup.css" />

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>

<!-- firebase 셋팅 -->
<script src="https://www.gstatic.com/firebasejs/3.2.0/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.3.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-storage.js"></script>

<script src="./js/config.js"></script>
<script src="./js/add-program-async-await.js"></script>

</head>
<body>




	<div style="width: 400px; margin: 0 auto;">
		<div align="center">
			<img src="./image/logo.png" />
		</div>
		

		<div style="width: 400px; margin-top: 20px;">
		
			
			<span class="text">관심(전문)분야</span>
			<select id = "type" class="select-box">				
				<option value="반려견 간식">반려견 간식</option>
				<option value="반려견 놀이">반려견 놀이</option>
				<option value="반려견 훈련">반려견 훈련</option>
				<option value="반려견 건강">반려견 건강</option>
				<option value="반려견 교육">반려견 교육</option>				
			</select>	
			
			<span class="text">프로그램명</span>			
			<div style="justify-content: space-between; display: flex;">
				<input id="title" class="signup-input" placeholder="프로그램명" />				
			</div>
			
			<span class="text">프로그램 소개내용</span>
			<div style="margin-top: 10px;">
				<textarea id = "content" class="form-txtarea" placeholder="반려견 프로그램에 대한 소개를 적어주세요."></textarea>
			</div>
			
			<div class="text">프로그램 포스터 이미지 (600px * 600px, 2mb 이하 사진)</div>
			<img id="poster-img" style="cursor: pointer; margin-top: 10px; width: 200px; height: 200px; object-fit:cover;" src="./image/pro.png"/>
			<input style="display: none;" id="poster-file" type="file">
							
			<div class="text">프로그램 설명 이미지</div>
			<div id="other-imgs-list" style="border: 1px solid #dedede; padding: 10px; border-radius: 10px; display: flex; flex-wrap: wrap;">
			<!-- 사진 여러장 올리기 -->
			<input type="file" id="other-file" style="display: none;"/>						
				<div id="add-other-img-btn" class="f-img-add-btn">
					<i class="fa-solid fa-plus"></i>
				</div>																	
			</div>
			
			<button id="submit-btn"class="form-btn">프로그램 등록</button>
		</div>
	</div>
	
			
	 <footer style="display: flex; justify-content: center;align-items:center;margin-top:30px;width:100%;height:100px;background:#f2f2f2;">
			<span>이용약관 | 서비스 소개 | 개인정보처리방침 | 고객센터</span>
	</footer>
	
	
	
</body>
</html>