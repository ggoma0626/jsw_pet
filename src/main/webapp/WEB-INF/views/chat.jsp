<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>
    HTML 기본구조
</title>

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous">
</script>

<!-- socket.io cdn -->
<script src="https://cdn.socket.io/4.6.0/socket.io.min.js" 
integrity="sha384-c79GN5VsunZvi+Q/WObgk2in0CbZsHnjEqvFxC5DxHn9lTfNce2WW6h2pH6u/kF+" 
crossorigin="anonymous"></script>

<!-- bootstript cdn -->
<link rel="stylesheet" 
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<!-- font -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/noto-sans-kr@0.1.1/styles.min.css">

</head>

<style>
    *{
        font-family: "Noto Sans Korean", sans-serif;
    }

    body {
        font-family: "Noto Sans Korean", sans-serif;
    }

    .chat-container{
        width:400px;
        height: 100vh;
        margin: 0 auto;
    }

    #chat-box{
        height: calc(100% - 55px);
        background: #f2f2f2;
        box-sizing: border-box;
        padding: 8px;
        overflow-y: auto;
    }

    #input-box{
        height: 55px;
        display: flex;
        align-items: center;
    }

    .msg-box{
        display: flex;
        margin-bottom: 12px;
        
    }
    .msg-box.left{
        justify-content: flex-start;
    }
    .msg-box.right{
        justify-content: flex-end;        
    }

    .nick-tag{
        color: #333;
        font-size: 13px;
        font-weight: 700;
        margin-bottom: 5px;
    }

    .msg-box.left .bubble{
        padding: 10px;
        border-radius: 8px;
        background: #fff;
        font-size: 14px;
        border: 1px solid #dedede;
        max-width: 230px;
    }

    .msg-box.right .bubble{
        padding: 10px;
        border-radius: 8px;
        background: #f9e300;
        font-size: 14px;
        border: 1px solid #dedede;
        max-width: 230px;
    }

</style>

<body>
        
    <!-- 
        1. chat UI만들기
        2. 서버 연동
        3. 리눅스 서버 node js 설치 및 pm2(node.js 관리)
     -->
     
    <div class="chat-container">
        <div id="chat-box">
            <!-- <div class = "msg-box left">
                <div>
                    <div class="nick-tag">상대방</div>
                    <div class="bubble">안녕</div>
                </div>                
            </div>

            <div class = "msg-box right">
                <div>
                    <div class="bubble">네 안녕하세요</div>
                </div>                
            </div> -->
        </div>

        <div id="input-box">
            <input id="msg-input" style="width: 79%;height: 40px;" class="form-control" type="text" placeholder="메시지 입력" aria-label="default input example">
            <button id="send-btn" style="width: 19%;height: 40px;margin-left: 4px;font-weight: 700;" type="button" class="btn btn-dark">전송</button>
        </div>
    </div>

</body>

<script src="./js/chat/chat.js"></script>

</html>