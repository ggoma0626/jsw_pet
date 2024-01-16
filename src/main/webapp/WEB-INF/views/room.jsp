<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>
    개발자 수다방
</title>

<!-- bootstript cdn -->
<link rel="stylesheet" 
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/noto-sans-kr@0.1.1/styles.min.css">

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous">
</script>

<!-- socket.io cdn -->
<script src="https://cdn.socket.io/4.6.0/socket.io.min.js" 
integrity="sha384-c79GN5VsunZvi+Q/WObgk2in0CbZsHnjEqvFxC5DxHn9lTfNce2WW6h2pH6u/kF+" 
crossorigin="anonymous"></script>

</head>

<style>
    body {
        font-family: "Noto Sans Korean", sans-serif;
    }

    .center-body{
        width: 100%;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
    }

</style>

<body>

    <div class="center-body">
        <div style="width: 350px;">
            <select id="rooms-select" class="form-select form-select-lg mb-3" aria-label="Large select example">
                <option value="frontend" selected>프론트 개발자 수다방</option>
                <option value="backend">백엔드 개발자 수다방</option>
                <option value="db">DBA 개발자 수다방</option>
                <option value="server">서버 개발자 수다방</option>
            </select>
            <input id ="nick" class="form-control form-control-lg" type="text" placeholder="닉네임" aria-label=".form-control-lg example">
            <button id="go-chat-btn" style="width: 100%;margin-top: 20px;font-weight: 700;" type="button" class="btn btn-primary btn-lg">수다방 접속하기</button>
        </div>

    </div>



</body>

<script src="./js/chat/room.js"></script>



</html>