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
<script src="./js/notice.js"></script>
</head>
<body>
	
	<!-- header 호출 -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
		
	<div class="info-container" style="background: #fff;">
		<div>
			<h4 style="font-size:17px; font-weight: 700;">공지사항 제목</h4>
			  
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
</body>
</html>