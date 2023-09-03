<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./image/logo.png"/>
<title>lgoin</title>
<%@ include file="/WEB-INF/views/include/lib.jsp" %>

<link rel="stylesheet" href="./css/app-style.css"/> 	<!-- 메인 home 화면 css -->
<link rel="stylesheet" href="./css/signup.css"/> 		<!-- signup 화면 css-->	
<link rel="stylesheet" href="./css/form.css"/> 			<!-- login 화면 css -->

<script src="./js/login.js"></script>

</head>

<body>

	<div class="center-body">
		<img id="home-btn" style="cursor: pointer;" src="./image/logo.png"/>
		 
		<div style="width:230px; margin-top: 20px;">
			<input value="zxczxc" id="id" class="form-input" placeholder="아이디"/>
			<input value="123123" id="pw" class="form-input" type="password" placeholder="비밀번호"/>	
			
			<div class="txt-btn-group">
				<span id="go-findId-btn" class="go-finduser-btn" style="margin-right: 8px;">아이디 찾기</span>
				<span id="go-findPw-btn" class="go-finduser-btn" style="margin-right: 8px;">비밀번호 찾기</span>
				<span id="go-signup-btn">회원가입</span>				
			</div>	
			
			<button id="login-btn" class="form-btn">
				로그인
			</button>
		</div>

	</div>
</body>
</html>