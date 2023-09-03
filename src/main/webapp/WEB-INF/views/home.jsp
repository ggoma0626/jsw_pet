<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- jsp tel -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./image/logo.png"/>
<title>CRoom-반려견아카데미</title>
<%@ include file="/WEB-INF/views/include/lib.jsp" %>

<link rel="stylesheet" href="./css/app-style.css"/>
<script src="https://kit.fontawesome.com/43368b31e8.js" crossorigin="anonymous"></script>

<script src="./js/home.js"></script>
</head>
<body>

	<!-- header 호출 -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<div class="top-container">
		<div>
			<div style="margin-top: 50px; color: var(--main-color); font-weight: 700; font-size: 16px;">
				100% SatisFaction Guarantee
			</div>
			<div style="margin-top: 30px; color: #000; font-weight: 700; font-size: 40px;">
				반려견<br/>
				전문 아카데미<br/>
				CRoom 입니다.<br/> 
			</div>
			
			<div style="margin-top: 20px; color: #999; font-weight: 700; font-size: 12px;">
				안녕하세요 두번째 테스트입니다<br/>
				안녕하세요 두번째 테스트입니다<br/>
			</div>
			
			<div style="margin-top: 30px">
				<button class="border-2-btn go-login-btn">Get Started</button>
				<button class="border-2-btn white" style="margin-left: 10px">Learn More</button>
			</div>
		</div>
	 		<img src="./image/img3.jpg" style="width: 600px; object-fit: cover;"/> 
	</div>
	
	
	<div class="info-container">
		<div>
			<section>
				<div class="div1">
					<div class="t">
						실전 경험이 우수한<br/>
						반려견 전문가 구성
					</div>
					
					<div class="c">
						부산벡스코에서 열린 케이펫부산에서 행사장에서 
						반려동물 보호자가 반려견매트, 반려견방석등 
						구매를 위해 상담을 하는동안 함께 온 반려견이 먼저 체험을 하고 있다. 
					</div>
				</div>
					
				<div class="div2">
					<div class="box">
						<div class="icon-box">
							<i class="fa-regular fa-clock"></i>
						</div>		
						
						<div class="t">
							100%자유로운 수업
						</div>			
						
						<div class="c">												 
							반려동물 보호자가 반려견매트, 반려견방석등 
							구매를 위해 상담을 하는동안 함께 온 반려견이 먼저 체험을 하고 있다. 
						</div>															
					</div>
				
				<div class="box">
						<div class="icon-box">
							<i class="fa-solid fa-paw"></i>
						</div>		
						
						<div class="t">
							오로지 반려견 중심 수업
						</div>			
						
						<div class="c">												 
							반려동물 보호자가 반려견매트, 반려견방석등 
							구매를 위해 상담을 하는동안 함께 온 반려견이 먼저 체험을 하고 있다. 
						</div>															
					</div>
					
				</div>				
			</section>	
			
			<section>
				<div class="div1">
					<div class="t">
						온라인, 오프라인<br/>
						양방향 수업 지원
					</div>
					
					<div class="c">
						부산벡스코에서 열린 케이펫부산에서 행사장에서 
						반려동물 보호자가 반려견매트, 반려견방석등 
						구매를 위해 상담을 하는동안 함께 온 반려견이 먼저 체험을 하고 있다. 
					</div>
				</div>
					
				<div class="div2">
					<div class="box">
						<div class="icon-box">
							<i class="fa-regular fa-clock"></i>
						</div>		
						
						<div class="t">
							100%자유로운 수업
						</div>			
						
						<div class="c">												 
							반려동물 보호자가 반려견매트, 반려견방석등 
							구매를 위해 상담을 하는동안 함께 온 반려견이 먼저 체험을 하고 있다. 
						</div>															
					</div>
				
				<div class="box">
						<div class="icon-box">
							<i class="fa-solid fa-paw"></i>
						</div>		
						
						<div class="t">
							오로지 반려견 중심 수업
						</div>			
						
						<div class="c">												 
							반려동물 보호자가 반려견매트, 반려견방석등 
							구매를 위해 상담을 하는동안 함께 온 반려견이 먼저 체험을 하고 있다. 
						</div>															
					</div>
					
				</div>				
			</section>								
		</div>
	</div>
	
	
	<div class="info-container" style="background: #fff;">
		<div>
			<h2>최근 등록된 전문가들</h2>
			<div class="teacher-list">				
				<c:forEach items="${teachers}" var="t">
					<div class="teacher-box">
						<img src="${t.user_img_url}">
						<div class="t">${t.name} 전문가</div>
						<div class="c">${t.like_type}</div>
					</div>	
				</c:forEach> 
			</div>
			
<!-- 			<h2>최근 등록된 전문가들</h2>
			<div id="t-list" class="teacher-list"></div> -->								
			
		</div>			
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>