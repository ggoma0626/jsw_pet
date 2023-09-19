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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<link rel="stylesheet" href="./css/app-style.css"/>
<!-- <link rel="stylesheet" href="./css/notice.css"/> -->

<script src="https://kit.fontawesome.com/43368b31e8.js" crossorigin="anonymous"></script>


<script src="./js/lib/twbs-pagination.min.js"></script>
<script src="./js/detail-notice.js"></script>
</head>
<body>
	
	<!-- header 호출 -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
		
	<div class="info-container min-h" style="background: #fff;">
		<div>
		
			<input type="hidden" id="this-notice-idx" value="${notice.nt_idx}"/>
			
			<h4 style="font-size:24px; font-weight: 700;">${notice.title}</h4>
			<h5 style="font-size:13px; font-weight: 700; color: #999; margin-top: 30px;">${notice.created_date}</h5>
			
			<p style="margin-top: 40px; width: 60%; border-top: 1px solid #dedede;padding-top: 20px;">
				${notice.content}
			</p>
			
			<div class="reply-container" style="border-top: 1px solid #dedede; padding-top: 10px;margin-top: 50px;">
				
				<h6 style="color:#222; font-weight: 700; font-size: 14px;">댓글쓰기</h6>
				<textarea id="parent-reply-content" class="form-txtarea"></textarea>
				<div style="display: flex; justify-content: center; margin-top: 5px;">
					<button id= "add-parent-reply-btn" class= "form-btn" style="margin-left: 40px;" >등록</button>
					<button id= "cancel-btn" class= "form-btn" style="margin-left: 7px;">취소</button>
				</div>					

					

				<!-- 댓글 start -->
				<div id="reply-list" style="margin-top:40px;">
					<nav class="reply-box">
						<img src="https://www.kukinews.com/data/kuk/image/2023/03/01/kuk202303010100.494x.0.jpg"/>
						<div>
							<span class="nick">김태희</span>
							<p class="content">
								안녕하세요 김태희 입니다. 잘 부탁 드립니다.
							</p>
							<span class="add-btn">답글</span>
						</div>
					</nav>

					
				<!-- 답글 start -->
					<nav class="reply-box child">
						<img src="https://www.kukinews.com/data/kuk/image/2023/03/01/kuk202303010100.494x.0.jpg"/>
						<div>
							<span class="nick">김태희</span>
							<p class="content">
								안녕하세요 김태희 입니다. 잘 부탁 드립니다.
							</p>
						</div>
					</nav>							
				<!-- 답글 end -->																						
				</div>
									
			</div>
			  
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
</body>
</html>