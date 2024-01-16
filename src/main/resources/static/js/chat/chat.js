
const socketServerAddress = 'http://127.0.0.1:3000';

$(document).ready(function(){
    let searchParams = new URLSearchParams(window.location.search);
    //닉네임
    let nickName = searchParams.get('nick');

    //채팅방 이름
    let roomName = searchParams.get('room');

    //socket 연결 , 채팅연결
    var socket = io(socketServerAddress); 
    socket.emit('join',roomName);
    
    // 메시지 수신
    socket.on('recv',(data)=>{
        console.log(`${data.from} 이 ${data.value} 를 보냄`);

        
        if(data.from == nickName){
            //내가 보낸거
            $('#chat-box').append(`
                <div class="msg-box right">
                    <div>
                        <div class="bubble">${data.value}</div>
                    </div>
                </div> 
            `);
        }else{
            //상대방이 보낸거
            $('#chat-box').append(`
                <div class = "msg-box left">
                    <div>                            
                        <div class="nick-tag">${data.from}</div>
                        <div class="bubble">${data.value}</div>
                    </div>                
                </div>                
            `);
        }
        
        // 메시지 스크롤 이동 ( 가장 최근에 보낸곳으로 )
        $('#chat-box').scrollTop($('#chat-box')[0].scrollHeight);


        //$('#msg-list').append(`<div>${data}</div>`);
    });

    //메시지 엔터전송
    $('#msg-input').on('keyup',function(e){
        if(e.keyCode == 13){
            $('#send-btn').trigger('click');
        }            
    })

    // 메시지 보내기
    $('#send-btn').on('click',function(){
        var value = $('#msg-input').val();

        if(value.length==0){
            return;
        }

        //메시지 전송 후 msg box안에 있는 문자 초기화
        $('#msg-input').val('');

         socket.emit('msg',{
            'from':nickName,
            'value':value
         });
    });        

});
