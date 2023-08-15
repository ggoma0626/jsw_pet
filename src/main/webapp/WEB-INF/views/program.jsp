<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- jsp tel -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./image/logo.png"/>
<title>CRoom-반려견아카데미</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<link rel="stylesheet" href="./css/app-style.css"/>
<link rel="stylesheet" href="./css/program.css"/>

<script src="https://kit.fontawesome.com/43368b31e8.js" crossorigin="anonymous"></script>

<!-- jquery cdn  -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="./js/program.js"></script>
</head>
<body>
	
	<!-- header 호출 -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
		
	<div class="info-container" style="background: #fff;">
		<div>
			<h4 style="font-size:17px; font-weight: 700;">프로그램 리스트</h4>
			
			<div id="program-list" class="row">
<!-- 				<div class="col-3" style="padding: 10px;">
					<div class="program-card">
						<img class="poster-img" src="https://cdn.imweb.me/upload/S201807025b39d1981b0b0/5ca7151769e55.png"/>
						<span class="txt1">반려견 훈련</span>
						<div class="txt2">반려견 기초훈련 10가지</div>
						
						<div style="margin-top: 20px;">
							<img class="user-img" src="https://bodeum.co.kr/data/trainerImages/1505121345_TRAINER.jpg"/>
							<span class="name">강형욱</span>							
						</div>												
					</div>
				</div>	 -->																						
			</div>
			
			<button id="more-btn" class="more-btn">더 보기</button>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
</body>
</html>