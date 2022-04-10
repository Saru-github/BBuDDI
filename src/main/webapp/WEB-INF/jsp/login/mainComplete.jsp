<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=divice-width, initial-scale=1.0">
<title>로그인</title>

<style>
* {
	margin: 0;
	padding: 0;
}
.container {
	whidth: 96%;
	margin: 0 auto;
	display: grid;
	align-content: space-around;
	justify-content: space-around;
	justify-items: stretch; 
	grid-template-areas: "header header header" "   a    main    b   "
		"   c    main    d   " "footer footer footer";
	grid-template-columns: 400px 1000px auto;
	grid-template-rows: repeat(3, minmax(100px, auto));
	overflow: hidden;
	justify-content: space-around;
	justify-items: stretch;
	grid
}

.header {
	grid-area: header;
	width: 100%;
	border: 3px solid black;
	font-size: xx-large;
	text-align: center;
	height: 100px;
	border: 3px solid black;
}

#ball {
	text-align: center;
}

.footer {
	grid-area: footer;
	border: 3px solid black;
	font-size: xx-large;
	text-align: center;
	height: 100px;
	width: 100%;
}

.a {
	grid-area: a;
	border: 3px solid black;
	font-size: xx-large;
	text-align: center;
	}
.gacha{
	border: 1px solid black;
	font-size: large;
	text-align: right;
}


.b {
	right: auto;
	grid-area: b;
	justify-content: center;
	align-items: center;
	border: 1px solid lightgrey;
	border-radius: 5px;
	border: 3px solid black;
	width: 340px;
}

#detail {
	font-size: x-large;
	font-weight: bold;
	width: fit-content;
	margin: 0 auto;
}

#logo {
	text-align: center;
	margin-bottom: 80px;
}

.logout {
	width: fit-content;
	text-align: left;
	margin: 0 auto;
}

.main {
	height: 800px;
	grid-area: main;
	border: 3px solid black;
	font-size: xx-large;
	text-align: center;
	background-image: url(../upload/main.png);
	background-size: cover;
}

.c {
	grid-area: c;
	border: 3px solid black;
	font-size: xx-large;
	text-align: center;
}

.d {
	grid-area: d;
	border: 3px solid black;
}

.button {
	display: inline-block;
	float: right;
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
<script type="text/javascript">
	var g_webSocket = null;
	window.onload = function() {
		//host = "152.70.92.222";   /* 배포시에 호스트 주소로 변경 */
		host = "localhost";
		g_webSocket = new WebSocket("ws://" + host + "/websocket");

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

		if (inputMsgBox == null || inputMsgBox.value == null
				|| inputMsgBox.value.length == 0) {
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
</script>
</head>
<body>
	<div class="container">
		<div class="header">Header</div>
		<div class="a">오늘의 포켓몬은 뭘까용?
		<Br>
		<h2> ${mon.pName}</h2>
		<Br>
		[<a id="gacha" href="/buddi/gacha">자세히보기</a>]
		<div id = "mon">
		<img src="../upload/poketmon/${today}.png" width="250" height="250">
		</div>
		<br>
		<label>포켓몬 이름: </label> ${mon.pName}
		<br>
		<label>포켓몬 등급: </label> ${mon.pGrade}
		<br>
		<label>포켓몬 타입: </label> ${mon.pType}
		<br>
		<label>포켓몬 시세: </label> 천만원
		</div>
		<div class="b">
			<h1 id="logo">로그인된 후 회원정보</h1>

			<div id=detail>
				<div>
					<label>유저번호: </label> ${user.uNum}
				</div>
				<div>
					<label>아이디: </label> ${user.uid}
				</div>
				<div>
					<label>유저등급: </label> ${user.uGrade}
				</div>
				<div id="ball">
					<img src="../upload/ball.jpg" width="50" height="50">&nbsp;&nbsp;&nbsp;X${user.mBall}
				</div>
			</div>

			<div class="logout">
				[<a href="/buddi/logout">정보수정</a>] [<a href="/buddi/logout">로그아웃</a>]<Br>
				[<a href="/buddi/detail">상세회원정보</a>]
			</div>

		</div>

		<div class="main"></div>
		<div class="c">c</div>
		<div class="d">
			<h1 class="logo">채팅프로그램</h1>
			<input id="inputMsgBox" style="width: 300px;" type="text" onkeypress="inputMsgBox_onkeypress()">
			<div class="button">
				<input id="sendButton" value="Send" type="button" onclick="sendButton_onclick()"> <input id="disconnectButton" value="Disconnect" type="button" onclick="disconnectButton_onclick()"> <br />
			</div>
			<textarea id="chatBoxArea" rows="10" cols="100" readonly="readonly"></textarea>
		</div>
		<div class="footer">footer</div>
	</div>
</body>
</html>