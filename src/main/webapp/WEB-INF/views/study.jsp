<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트 공부</title>
<!-- 부트스트랩 cdn  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<link rel="stylesheet" href="./css/app-style.css"/>
<script src="https://kit.fontawesome.com/43368b31e8.js" crossorigin="anonymous"></script>

<!-- jquery cdn  -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="./js/study.js"></script>

</head>
<body>

	<header>
		<img src="./image/logo.png"/>
		
		<div>
			<span class="hd-btn">훈련사님 소개</span>
			<span class="hd-btn">공지&문의사항</span>
			<span class="hd-btn">오시는 길</span>			
			<span class="hd-btn" style="margin-right: 200px">교육사례</span>
			
			<button class="border-1-btn go-login-btn">login</button>
		</div>
	</header><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
	<input id="inp"/>
	<span id="txt">hello</span>
	<button id="my-btn">헤더 색상변경</button>
	<br/>
	
	<input id="name" placeholder="이름"/>
	<input id="age" type="number" placeholder="나이"/>
	<input id="address" placeholder="주소"/>
	<button id="add-user-btn">회원 추가</button>
	<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">이름</th>
	      <th scope="col">나이</th>
	      <th scope="col">주소</th>
	    </tr>
	  </thead>
	  <tbody id="user-list">
	  
<!-- 	    <tr>
	      <th scope="row">1</th>
	      <td>홍길동</td>
	      <td>23</td>
	      <td>경기도</td>
	    </tr> -->
	  </tbody>
	</table>
	
	
	
	
	
	
</body>
</html>