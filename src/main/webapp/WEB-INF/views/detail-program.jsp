<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- jsp tel -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./image/logo.png"/>
<title>반려견 프로그램 상세화면</title>
<%@ include file="/WEB-INF/views/include/lib.jsp" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<link rel="stylesheet" href="./css/app-style.css"/>
<link rel="stylesheet" href="./css/program.css"/>

<script src="https://kit.fontawesome.com/43368b31e8.js" crossorigin="anonymous"></script>

<!-- jquery cdn  -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="./js/detail-program.js"></script>
</head>
<body>
	
	<!-- header 호출 -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	
	<input type="hidden" id="pro-user-idx" value="${petProgram.user_idx}"/>
	<input type="hidden" id="my-user-idx" value="${sessionScope.me.user_idx}"/>
	
		
	<div class="info-container">
		<div style="width: 900px;">
			<div class="two-row-box">
				<section class="row-sec">
					<img id="poster-img" class="img" src="${petProgram.poster_img_url}"/>
				</section>
					
				<section class="row-sec">
					<div id="title" class="title">
						${petProgram.title}
					</div>
					
					<div class="info">
						<span>강의 종류</span>
						<span id="type">${petProgram.type}</span>			
					</div>
					
					<div class="info">
						<span>훈련 강사</span>						
						<span id="name">${petProgram.name}</span>			
					</div>
					
					<div class="info">
						<span>프로그램 소개</span>		
						<span id="content">${petProgram.content}</span>	
					</div>
					
					<c:if test="${isBuy eq 'n'}">
						<button id="buy-program" class="request-program-btn">
							프로그램 신청하기
						</button>
					</c:if>
					
					<c:if test="${isBuy eq 'y'}">
						<button class="request-program-btn" style="background:#f2f2f2;color:#222;">
							이미 신청했습니다.
						</button>
					</c:if> 
					
					
				</section>

			</div>
			
			<div class="more-info-box">
				<div class="title">프로그램 교육 현장</div>
				<div class="other-imgs">
				
<%-- 				<c:forEach var="item" items="${OtherImg_list}">
					<img src="${item.other_img_url}"/>				
				</c:forEach> --%>
				
				</div>
			</div>
			
			
			<div class="more-info-box">
				<div class="title">신청자 현황</div>
				
				
				<div id="join-users">
<!-- 					<nav class="join-user-box">
						<img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxIQEhAQDxAQFRAQFQ8QDw8QFRAPEBUPFRUXFxUVFRUYHSggGBolGxUVITEhJiktLi4uFx8zODMsNygtLisBCgoKDg0OGhAQGisdHx0tLS0rLS0rLS0tLS0tLzctKy0tLS0tLS0tLS0tKy0tLS0tLSstKy0tLS0tLS0tKy0tLf/AABEIALMBGQMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAAAQIDBAUGBwj/xAA9EAACAQIEAwUFBgQFBQAAAAAAAQIDEQQSITEFQVEGImFxgRMUkaGxByMywdHwUnLh8SRCYoKiM1OSssL/xAAZAQEBAAMBAAAAAAAAAAAAAAAAAQIDBAX/xAAlEQEAAgICAgIBBQEAAAAAAAAAARECAxIhMUEEIlEUMmFxgRP/2gAMAwEAAhEDEQA/APZgADFkBiGADEMBgAAMAABgABAAAAwAAAhDmVY3HUqEc9epCnC6WapJRjd7as4Tjv2rYWhnjhoTr1Enlmvu6Ge6snJ6teKT20A9DRF7nk1X7Y7Q7uG7+mrl3L311328N2vM5XiH2mcQrO8asKSc4yjGnHZLl3m7q9nrq2umhbH0KB5L2b+12llnTxVKrmi705wtUcoaZs97Wku8+ljt+ynbLDcRVqOaNRQVSdKeXMouTjyb5r5rqB0YxAAAAwEMUkLlqAnF3KnTs731b2b0JVari4/w65vyZJTUoqS1T70X9GQSGhJ3syTKEyDjzexNEZv+oCypJtvTd+AXXVFdao9IpXTdpeT6B7AlqYAMBDEADGIYDAQwGAhgMBDCAAABnm/bv7SHhpyw3D1CdaDy1681npU5c4JJrNNc+Sut9jafaR2xhgKE6VOTeLqJQpxipPIp/wCdtbOydlvex4DjcTJqMZS70mrq1ko8l8gMvjPGauJqutWqynVlKV6krWSslaCWkV4I09bEXf8ApV/6Ea8tfLp4lLhfTlq2FWqo2lfdvT8wc2/jZEbfovL+5bGH4fBBFM5tac/zM7g/FKuGlUdGWWVSnOjN7/dzcW7a6SvFWfKxgve/MIPf4eoV9KfZ32l974fRnKalWpZcNVu7ydaK0k+esbS+J2KPlfsZxyWGxFCalJU1VoyqwX4ZQi2tVztGUvifU1GqpxjOLvGaUovrFq6fwKiQNie4r8/oAXfgO75ojv8ApsPIgBpPTrp6FMKag0lez06+Rfb1+o5Jc9kQQSt5E2xRkns7oaRQXElzYyM5W1evRAKK5/AeoU6ikr/u5K4FIABFAAADQAMAGIYAMQwAYhhAartNxaODw1avKVskXlbi5rPtG6VuduaNqeR/brxZP3fBRlqv8RVinot4083zaXqB5nxPi9XFynLETnUcpKcZTk9H6WW3gjEWFzO/JKy0ulzdvjzJwptXj8b/AL3Ov7L8D9prJu3T9TXnnUW24Ycppx0cA731+pkUODyk9j1ylwKCS7q8DJp8Ppx2gjn/AFE/h0x8eHjtXgU0m8rsimvgJRto9Uv1+h7RLAQd1lWpqK/ZtOTsk07K3Rb6GWG+/LHL49eHkNTCu+nLd+OxRKi1Z20PZV2RpW7yvotOXkabjnZGLi/ZrXobP+sMP0808ww0N0/G68Nj6S+yzjjxGCpwrVIOvTdSOVSTn7GLtFyjy3t6HgvEuE1MPq4v11TO5+xfiqjipUHJNVYXhSnKSeeK1yaZXJRvu02r72NsTfhoyxnHy9yzdOW5GLa21XJimtLRdm9bojDDpXd3q22ltdlYp/VliIxhYkUQqOzT5cyM3m0T/v8AoWtAkShCmvRrdFiItc1uEWA5Mg/m/oSkxRXMophQyvT9sts/AmBIgtSAAFAAADQxIYAMQwAYhgAAAQz5++1Cq6vFK6vdU/ZQsraZY5nt4y/eh9AngfaChm4njnJOzq21Vu7+Lbyt53vzJlPTLGO3O4bDXklzb16edj0/shhlGnrvu297nMywKTTW/RaeCu/nc7bgFO1NfU5tk3Dp1xUs6S6lUki2r4GM7+Jyy68YO3Qtox36lMS2ErGWKytauYNdGXOVjCqNmWcmMNPx/h0alKemtm15nnvZWhl4jg46r7+CdrJ3b0303seqVleEr9GeYVqaji6Uo8q1J38faJp9EbtE+nN8mOrfSihYkAHW4QAAAAAABCWj8H9SYpq6JIjMkiMdSZQDEMCgAAigAABjEhgAxDABgAAAAA0eCcSf+Oxsm7/f1tX09D2DjXFZU6tOhT3ks85L8SjeyS8dDy3j/D6lHFTz9516meM+bezulzuac9kXxb8dOURGUtxwThTq2nNfd8l1OlrSjTjyUV8Eh4Oj7OnGP8KVwxME7RSTfjy8jmu3TEU53E9oMrdqcmuXO6uQp9oKjemGlbm3pb0M/ieNwuGajWrU4Ttmyt3klzbiru3iY+F4phsQm6FaE8u+V6p+Kepf8ZR/bY4DHKe8WvqZdRRdmjV0qlmW1MRZXMeXptplzrwj+OSXmYk8RSbtGcXu9PA19an7X8SunyMXEdm4q1Sl3Gv4dmWKljNw2tXWMkua0PPJ0/8AFUdNVXp6cr5kzseGUKlKWWVnTls1q0/0MepwxPieCgrZaklVmvCndv8AI26orJz7+8XsCAGB1uEAAEAAAUAAAAAAADEAFIABFAAADQAhgAxDABiGADEAHLcctTxNSrJ2Sp0bX/ibkvyNHXlDFSw+S7dKvKMsyWbLkcr+R0PbPh8q0IqDSno430Tab0v6mq4LQUY0YW+8pVKsa1tbVXG9789JR1ODPrZL0sJidMT7bWasjAxD3u5675ZOLt56NfE2VVamHiKJjTLGnPY3heEnCVNQcFNxlP2bUc0ou6lLq9Xq+pi0+GUYQjRoynG0nUVRKMqmd6d5vdW0torHQ1IeQrWWyMoymOmfCLtRQopW053LMVBO22t0ZWFgtXf03KcXFZUujZEvtzfFqde0oUHlnpafd3vsr7ac7czH4dhOJ04OTm6krxy0a7hkyf55OcVeLfJLTQ6LEYJVUm7xmlpNb+vUjSwk1ZKpJrx0M7qPCTjc3Z4Oop2dnGW06c7KUZc14rxWjFOOTiXD6qSdqdaFmte/OMNOjtLcyI03He76X1Zkww+evhbbxaa6WUlKXyRcJmJYbMYmO3aAAHa8wAAAADABAMAEAwAQDAIoAAIyAAADQxIYAMSGAwEMAGIAKcbTzQdldq0o9bp/3Ofp6y6d5yfwa1OnMXH0k4t2V1Z3525mnbr5fb8N2rbxjjPtqXuYeMqmRip2VzVY+t3M3VXOPlTuwjti4rGZdb2/UrwVRVpSjms4q+pq4XnLM1ryXJItqYOaeaLs7aNNpl89t1x4dFBWWsrv0uQq2cFeSu21Y5CPEsRRn3nng9LSvf8A2ytv5mXLiOJqf9GnBc3Ko7q3lEyhjTcvESp210v4GfQxMZpbXOZlOc0lVccy17iajf1bHw3GOM3Te+68Yi5xXjEumkrmZwug5VqVlpTvOT5JWaXxZrsNO+p0nBe7Td0k5Nu+l3FJJX+Zt1RcuXflxxbUCr268Pihe8Lw+KOu4edS4Cn3heHxQe8LqvihcLS4Cj3ldV8UHvK6r4oXBS8Cj3ldV8Q96XVfEXBS8DH96XVfEPel1XzFwUyAMf3pdV8/0D3ldV8xcFAYARQAAA0AIAGMQwAYhgAACAZCrG6a8H9A9orpc2YnEcd7OCla7qTjSpx6uXNvokm/QkzFER21OIV0a+VFOCT5XRnVHyKLfM82Xp4uL7TcCrzSqYSrKnUjpZOylF7rwZLgFKi6eTE1Zwr3pRvVm7ubbUsr5+XLmdbKlyMbF4aMovRZtr9V4meMxVSyv+aULgEHGrKlik8jcU1KEle0XaT2/wAyIYrgeJpXyVlKKUW01leaTatZeV7lMJZFk7rSSiozhColGO0Y3Wi8COIpqpqnq1lap0402oXUkr+DSa8Tb9aXjuvzEudxHH3Gu8NKhOpJaOdKzSfR9OvqbnC4G7U9brb1toZfDeGwpq+VZnu/0M7TY1ZrdMjhFDPVhDldX8lq/odnkXRGo7O4LLF1Zbz0j/J19fyN0denGse3nb8+WXXpD2a6IMi6ImBtaEci6IMi6IkAEcq6BlQxhUcqDKSABZQsMAFYLDAIoAACmAAA0AInkYERpEsqFUd1dcuQQeZCpUS9diurL8MvRkcQ7wv0ZjMrS32gqbvIriydF6r1JZSmEruT6vKvJK/6GB2hf3mFjyi6s/8Axior/wBjNpuyX80vyMHj/wD1aD/0Vvm4GvZP0lt1/vhg1mQhUI1ZFa1OGJd9MySuYWLgNVWjDxeJtu/UzSPLDxOGbejZbSwjS1k2VxxaLaeLu7c/yMr6bLZUV15GZwfBqtUak9IJTlHm020l4K6MCVXkja9ktauInySpQ9byf5fMz1xE5REtG2ZjGZh1EZLTl0XgSKghLWx3PPpcArjIgAAAQwAKAAAAAAAAACKAJZQyhSJRjcFEvjG2gpLRjG36hckyLKiM1zXqhX58noyadiuorPwZFUVI2zR9UKlrFonU1Sf+1+hCk7MxmGXpRRetjJob+VzHxMbSuvMuw73fUiyqa7vlJ/Nf0MPjyv7Gf88filL/AOTPy92XhZmHxCOahPrTaqL/AG7/APG5hnF4zDLCayiWiryI0ZEasimFSx570WTWNbXluZdWoYFTUtlKvZp/uxk0qKitFuRpQL7GVlIvRXOi7GUrYd1P+9OdS/8ApXcj8ot+py2ObaUIfjm4wh/PJqMfm0egYTDRpU6dKP4acYU4+UUlf5XOj4+Pcy5/kZdUu/f0I033n4JfEcdr+pDDvd9WdjjXRepKMiC2YovUC4ZBMmpBiADMgzIAAMwZgAAzBmAAHmDMBTlDKguFwLaUeZYCQIIGiCZMhUXNboCLfL4EZ6x8hTlfUcHuvAMlN911V/VERt/hfR29HoDRiyV4hXFRlYsqLQhl2JIuoxvmXVMw6E7Oz2e6+qMzDy1MKcLSkujuSSHKV/u6lSg96btG/Ok9YP4aeaZiVGbrtZgb+zxUVrTtSq+NNvuv0k/+RopO6PP24ccnfqy5YiVVkFUItElE1t1LqcyxzMeBdZ8k23ZRit3J6JLzZlHaSz+zWD9riVUf4MMs/h7aacYL0jmfrE7Go9DE4Lw/3ekoaObbnVktnVlvbwVkl4JGXW5I9HXhxxp52zPllZrYqw70ZfbQporc2MF8tEQpdR1noiVNFQxRY27i28+QRJSt1LEyuJJBEwI3fQNegEgI69A16ASC5HXoGvQIrsSgtUABVwufoABDZFbiACh7sdP9QAjOfCma7sv3zLJLUAAjILABAIhXX3gAAp0oyjKMleMlJNPZpo4OlFWXoAHL8jxDp+N7Dgug8iADmdnpKnBG87PUYuq20rwg5R8JNqLfnZteoAbtMfaGrfP0l0yRBrUQHdLz03sQprUAEh1d0WS2ACgSI838AAIkhjAqK5Sd9xZ31ADXKjO+oZ31AAozvqGd9QAD/9k="/>
						<div>
							<div class="nick">닉네임</div>
							<div class="date">신청일 2023-07-18</div>
						</div>
					</nav> -->														
																					
				</div>
			</div>
						
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
</body>
</html>