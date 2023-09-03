<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- jsp tel -->


<script src="./js/header.js"></script>
<header>

	<img id="home-btn" style="cursor: pointer;" src="./image/logo.png"/>
	
	<div>
		<span class="hd-btn" data-page="./intro">훈련사님 소개</span>
		<span class="hd-btn" data-page="./notice">공지사항</span>			
		<span class="hd-btn" data-page="https://section.blog.naver.com/Search/Post.naver?pageNo=1&rangeType=ALL&orderBy=sim&keyword=%EB%B0%98%EB%A0%A4%EA%B2%AC%20%ED%9B%88%EB%A0%A8">블로그</span>
		<span class="hd-btn" data-page="./program" style="margin-right: 200px" >반려견 프로그램</span>
		
		<c:if test="${empty sessionScope.me}">
			<button class="border-1-btn go-login-btn">login</button>
		</c:if> <!-- 값이 비어있냐? -->			
		
		<c:if test="${not empty sessionScope.me}">
			<span id="go-mypage-btn" style="cursor: pointer;">${sessionScope.me.nickname}</span>
			<c:if test="${sessionScope.me.type eq 't' && sessionScope.me.auth_type eq 'u'}">
				<button class="border-1-btn go-add-program-btn">프로그램 등록</button>
			</c:if>
			
			<!-- admin으로 로그인 했을 때 공지사항 등록 보여주기 -->
			<c:if test ="${ sessionScope.me.auth_type eq 'a'}">
				<!-- Model을 이용한 공지사항 등록 -->
				<button type="button" class="btn btn-link" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				  공지사항 등록
				</button>						
			</c:if>
						
			<a id="logout-btn" href="#" style="color: #999; margin-left: 10px;">로그아웃</a>
		</c:if>		
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">공지사항 등록</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      
			<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">제목</label>
			  <input id="nt-title" type="text" class="form-control" id="exampleFormControlInput1">
			</div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">공지내용</label>
			  <textarea id="nt-content"class="form-control" id="exampleFormControlTextarea1" rows="10"></textarea>
			</div>
				        
	      </div>
	      <div class="modal-footer">
	        <button id="nt-close-modal-btn" type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button id="add-notice-btn" type="button" class="btn btn-primary">등록하기</button>
	      </div>
	    </div>
	  </div>
	</div>	
</header>