<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- jsp tel -->



<script src="./js/header.js"></script>
<header>

	<img id="home-btn" style="cursor: pointer;" src="./image/logo.png"/>
	
	<div>
		<span class="hd-btn" data-page="./intro">훈련사님 소개</span>
		<span class="hd-btn" data-page="./info">공지&문의사항</span>
		<span class="hd-btn" data-page="./map">오시는 길</span>			
		<span class="hd-btn" data-page="https://section.blog.naver.com/Search/Post.naver?pageNo=1&rangeType=ALL&orderBy=sim&keyword=%EB%B0%98%EB%A0%A4%EA%B2%AC%20%ED%9B%88%EB%A0%A8">블로그</span>
		<span class="hd-btn" data-page="./program" style="margin-right: 200px" >반려견 프로그램</span>
		
		<c:if test="${empty sessionScope.me}">
			<button class="border-1-btn go-login-btn">login</button>
		</c:if> <!-- 값이 비어있냐? -->			
		
		<c:if test="${not empty sessionScope.me}">
			<span id="go-mypage-btn" style="cursor: pointer;">${sessionScope.me.nickname}</span>
			<c:if test="${sessionScope.me.type eq 't'}">
				<button class="border-1-btn go-add-program-btn">프로그램 등록</button>
			</c:if>			
			<a id="logout-btn" href="#" style="color: #999; margin-left: 10px;">로그아웃</a>
		</c:if>
		
	</div>
</header>