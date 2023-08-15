<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- jsp tel -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./image/logo.png"/>
<title>CRoom-반려견아카데미</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"/>

<link rel="stylesheet" href="./css/app-style.css"/>
<link rel="stylesheet" href="./css/mypage.css"/>
<link rel="stylesheet" href="./css/signup.css"/>
<link rel="stylesheet" href="./css/form.css" />

<script src="https://kit.fontawesome.com/43368b31e8.js" crossorigin="anonymous"></script>

<!-- jquery cdn  -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

<script src="./js/mypage.js"></script>
</head>
<body>
	
	<!-- header 호출 -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
		
	<div class="info-container" style="background: #fff;">
	
		<!-- js에서 user_idx 세션값 받아오기위함 hidden으로 숨겨준다-->
		<input type="hidden" id="me-user-idx" value="${ sessionScope.me.user_idx }"> 
		<!---->
		
		<div>
			<h4 style="font-size:17px; font-weight: 700;">내 정보</h4>	
			<div style="background: #fff; display: flex; position: relative;">
				<div class="mp-container" style="flex:1; height: 100%; background: #fff; margin-top: 0;">
					<label class="title">아이디</label>
					<div class="content">${sessionScope.me.id}</div>
					
					<label class="title">닉네임</label>
					<div class="content">${sessionScope.me.nickname}</div>
					
					<label class="title">이름</label>
					<div class="content">${sessionScope.me.name}</div>
					
					<label class="title">생일</label>
					<div class="content">${sessionScope.me.birth}</div>
															
					<label class="title">전화번호</label>
					<div class="content">${sessionScope.me.tel}</div>															
									
				</div>
				
				<div class="mp-container" style="flex:1; height: 100%; background: #fff; margin-top: 0;">
					<label class="title">회원구분</label>
					<div class="content">
						<c:if test="${sessionScope.me.type eq 't'}">
							강사
						</c:if>
						<c:if test="${sessionScope.me.type eq 'u'}">
							일반회원
						</c:if>						
					</div>
					
					<label class="title">성별</label>
					<div class="content">
						<c:if test="${sessionScope.me.gender eq 'm'}">
							남성
						</c:if>
						<c:if test="${sessionScope.me.gender eq 'w'}">
							여성
						</c:if>						
					</div>					
					
					<label class="title">관심분야</label>
					<div class="content">${sessionScope.me.like_type}</div>
					
					<label class="title">가입 날짜</label>
					<div class="content">${sessionScope.me.created_date}</div>											
				</div>
										
				
				<!-- <button id="open-wind-btn" style="position: absolute; bottom: 0; right: 0;">수정</button> -->
				<button id="open-wind-btn" style="position: absolute; bottom: 0; right: 0;" class="btn btn-success btn-sm">수정</button>	
				
				
			</div>
			
			<h4 style="font-size:17px; font-weight: 700; margin-top: 30px;">내가 신청한 프로그램</h4>
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">프로그램</th>
			      <th scope="col">프로그램명</th>
			      <th scope="col">종류</th>
			      <th scope="col">강사</th>
			      <th scope="col">신청날짜</th>
			    </tr>
			  </thead>
			  <tbody>
			  
			  <c:forEach items="${ulist}" var="p">			  
			    <tr class="program-box" style= "cursor: pointer"data-pro-idx="${p.pro_idx}">
			      <td>
			       	<img style="width: 70px; height: 70px;" src="${p.poster_img_url}"/>
			      </td>
			      <td style="vertical-align: middle">${p.title}</td>
			      <td style="vertical-align: middle">${p.type }</td>
			      <td style="vertical-align: middle">${p.name }</td>
			      <td style="vertical-align: middle">${p.created_date }</td>				      	     
			    </tr>			  
			  </c:forEach>
			    
			  </tbody>
			</table>			


			<h4 style="font-size:17px; font-weight: 700; margin-top: 30px;">내가 만든 프로그램</h4>
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">프로그램</th>
			      <th scope="col">프로그램명</th>
			      <th scope="col">종류</th>
			      <th scope="col">강사</th>
			      <th scope="col">신청날짜</th>
			    </tr>
			  </thead>
			  <tbody id="t-list">			  			   
			  </tbody>
			</table>						
								
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
	<!-- Model 정보수정 화면 띄우기  -->
	<div id="edit-user-window" class="window-container" style="display: none;">
		<div style="height: auto;">
			<i class="fa-solid fa-xmark close-btn"></i>
			<div>내정보 수정</div>
										
			<label class="text">이름</label>
			<input id="u-name" class="signup-input" value="${sessionScope.me.name}"/>
			
			<label class="title">생일</label>
			<input id="u-birth" class="signup-input" value="${sessionScope.me.birth}"/>
			
			<label class="title">전화번호</label>
			<input id="u-tel" class="signup-input" value="${sessionScope.me.tel}"/>
			
			<label class="title">성별</label>
			<select id="u-gender" class="select-box" >
				<option value="m" <c:if test="${sessionScope.me.gender eq 'm'}">selected</c:if>>남성</option>				
				<option value="w" <c:if test="${sessionScope.me.gender eq 'w'}">selected</c:if>>여성</option>
			</select>
			
			<label class="title">관심분야</label>
			<select id="u-like_type" class="select-box" >															
				<option value="반려견 간식" <c:if test="${sessionScope.me.like_type eq '반려견 간식'}">selected</c:if>>반려견 수제간식 만들기</option>
				<option value="반려견 놀이" <c:if test="${sessionScope.me.like_type eq '반려견 놀이'}">selected</c:if>>반려견 놀이</option>
				<option value="반려견 건강" <c:if test="${sessionScope.me.like_type eq '반려견 건강'}">selected</c:if>>반려견 건강</option>
				<option value="반려견 훈련" <c:if test="${sessionScope.me.like_type eq '반려견 훈련'}">selected</c:if>>반려견 훈련</option>
				<option value="반려견 교육" <c:if test="${sessionScope.me.like_type eq '반려견 교육'}">selected</c:if>>반려견 교육</option>										
			</select>		
			
					
			<button id="update-btn" class="form-btn" style="margin-top: 20px">수정하기</button>						
									
		</div>
	</div>
	

	
</body>
</html>