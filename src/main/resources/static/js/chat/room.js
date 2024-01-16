$(document).ready(function(){
    $('#go-chat-btn').on('click',function(){
        var nick = $('#nick').val();
        var roomName = $('#rooms-select').val();
        if(nick.length == 0){
            alert('닉네임을 입력해주세요');
            return;
        }

        location.href=`./chat?nick=${nick}&room=${roomName}`;
    });
});