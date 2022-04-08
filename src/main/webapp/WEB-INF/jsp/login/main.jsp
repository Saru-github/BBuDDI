<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
<title>로그인</title>
<style>

	*{
	margin: 0;
	padding: 0;
	}

	.container {
	whidth:96%;
	margin: 0 auto;
    display: grid;
    align-content: space-around;
    justify-content : space-around;
    justify-items: stretch;
    
	grid-template-areas:
		"header header header"
		"   a    main    b   "
		"   c    main    d   "
		"footer footer footer";
		grid-template-columns: repeat(3, 1fr);
		grid-template-rows: repeat(3, minmax(100px, auto));
		overflow : hidden;
		grid
	}	
	.header {
	grid-area: header;
	width: 100%;
	border: 3px solid black;
	font-size: xx-large;
	text-align: center;
	height: 100px;
	}
	
	
	.footer {
	grid-area: footer;
	border: 3px solid black;
	font-size: xx-large;
	text-align: center;
	height: 100px;
	width: 100%;
	}
	
	.
	
	.a{
	grid-area: a;
	border: 3px solid black;
	font-size: xx-large;
	text-align: center;
	
	}
	
	.b {
	right: auto;
    grid-area: b;
    justify-content: center;
    align-items: center;
    border: 1px solid lightgrey;
    border-radius: 5px;
    border: 3px solid black;
	}
	
	.main {
	width : 800px;
	height : 800px;
	grid-area : main;
	border: 3px solid black;
	font-size: xx-large;
	text-align: center;
	background-image: url(../upload/main.png);
	background-size: cover;
	
	
	}
	
	.c{
	grid-area: c;
	border: 3px solid black;
	font-size: xx-large;
	text-align: center;
	}
	.d{
	grid-area: d;
	border: 3px solid black;
	}
	
	.button {
		display: inline-block; float: right;
	}


.logo {
	text-align: center;
    margin-top: 0px;
    margin-bottom: 20px;
}

#login {
    width: 100%;
    background-color: skyblue;
    border-color: transparent;
    color: white;
}

.account {
    display: block;
    margin-bottom: 3px;
    padding: 3px;
    border: 1px solid lightgray;
    border-radius: 3px;
    width: 80%;
}

#alert {
    border-color: transparent;
}


 </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
var g_webSocket = null;
window.onload = function() {
    //host = "152.70.92.222";   /* 배포시에 호스트 주소로 변경 */
   host = "localhost";
    g_webSocket = new WebSocket("ws://"+host+"/websocket");
    
    
    /* 웹소켓 접속 성공시 실행 */
    g_webSocket.onopen = function(message) {
        addLineToChatBox("Server is connected.");
    };
    
    
    /* 웹소켓 서버로부터 메시지 수신시 실행 */
    g_webSocket.onmessage = function(message) {
        addLineToChatBox(message.data);
    };

    /* 웹소켓 이용자가 연결을 해제하는 경우 실행 */
    g_webSocket.onclose = function(message) {
        addLineToChatBox("Server is disconnected.");
    };

    /* 웹소켓 에러 발생시 실행 */
    g_webSocket.onerror = function(message) {
        addLineToChatBox("Error!");
    };
}

/* 채팅 메시지를 화면에 표시 */
function addLineToChatBox(_line) {
    if (_line == null) {
        _line = "";
    }
    
    var chatBoxArea = document.getElementById("chatBoxArea");
    chatBoxArea.value += _line + "\n";
    chatBoxArea.scrollTop = chatBoxArea.scrollHeight;    
}

/* Send 버튼 클릭하면 서버로 메시지 전송 */
function sendButton_onclick() {
    var inputMsgBox = document.getElementById("inputMsgBox");
    // $('inputMsgBox').val(); 
    
    if (inputMsgBox == null || inputMsgBox.value == null || inputMsgBox.value.length == 0) {
        return false;
    }
    
    var chatBoxArea = document.getElementById("chatBoxArea");
    
    if (g_webSocket == null || g_webSocket.readyState == 3) {
        chatBoxArea.value += "Server is disconnected.\n";
        return false;
    }
    
    // 서버로 메시지 전송
    g_webSocket.send(inputMsgBox.value);
    inputMsgBox.value = "";
    inputMsgBox.focus();
    
    return true;
}

/* Disconnect 버튼 클릭하는 경우 호출 */
function disconnectButton_onclick() {
    if (g_webSocket != null) {
        g_webSocket.close();    
    }
}

/* inputMsgBox 키 입력하는 경우 호출 */
function inputMsgBox_onkeypress() {
    if (event == null) {
        return false;
    }
    
    // 엔터키 누를 경우 서버로 메시지 전송
    var keyCode = event.keyCode || event.which;
    if (keyCode == 13) {
        sendButton_onclick();
    }
}



function login()
{
	var serData = $('#loginForm').serialize();
	$.ajax({
		url:'/buddi/login',
		method:'post',
		cache:false,
		data:serData,
		dataType:'json',
		success:function(res){
			alert(res.ok ? '로그인 성공' : '로그인 실패');
			if(res.ok) location.href="/buddi/mainc";
		},
		error:function(xhr,status,err){
			alert('에러:'+err);
		}
	});
	return false;
}
</script>
</head>
<body>
	<div class ="container">
		<div class ="header">Header</div>
		<div class = "a">a</div>
        <div class="b">
        	<h1 class="logo">로그인</h1>
        		<form id="loginForm" onsubmit="return login();">
					<input type="text" id="uid" name="uid" value="Admin">
			<br>
			<input type="password" id="pwd" name="pwd" value="0">
			<br>
			<div id="button">
			<button type="submit" >로그인</button>
			<button type="reset" >취 소</button>
			</div>
			</form>
		</div>
		<div class = "main">main</div>
		<div class = "c">c</div>
		<div class ="d">
			<input id="inputMsgBox" style="width: 300px;" type="text" onkeypress="inputMsgBox_onkeypress()">
    		<div class = "button">
    		<input id="sendButton" value="Send" type="button" onclick="sendButton_onclick()">
    		<input id="disconnectButton" value="Disconnect" type="button" onclick="disconnectButton_onclick()">
    		<br/>
    		</div>
    		<textarea id="chatBoxArea" rows="10" cols="100" readonly="readonly"></textarea>
    	</div>
    	<div class ="footer">footer</div>
    </div>   
    
</body>
</html>