<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


#type {
	background-color: red;
	margin: 1px;
	border-radius: 5px;
	display: inline-block;
	width: 45px;
	text-align: center;
	color: window;
}

#wrap {
    width: 1000px;
	margin:auto;
}
table{
    width: 100%;
    border-collapse: collapse;
    line-height: 24px;
}
#bbs {
    border-top:1px solid black;
    border-bottom:1px solid black;
    border-collapse: collapse;
    text-align: center;
    padding: 10px;
}
th {
	background: rgb(221, 221, 221);
}
a{
    text-decoration: none;
    color: blue;
}
a:hover{
    text-decoration: underline;
}


.container {
	whidth: 100%;
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

.allbbs {
	text-align: right;
	margin-right: 30px;
	font-size: large;
}

.header {
	grid-area: header;
	width: 99%;
	border: 3px solid black;
	font-size: xx-large;
	text-align: center;
	height: 100px;
	border: 3px solid black;
}

#topMenu {
	grid-area: header;
	width: 100%;
	border: 3px solid black;
	font-size: xx-large;
	text-align: center;
	height: 100px;
	border: 3px solid black;
}

#topMenu ul{
	width:100%;
	text-align:center;
	vertical-align:middle;
}

#topMenu ul li { 
	list-style:none;  color:white; 
	background-color:#2d2d2d; 
	float:left; 
	margin-top: 50px;
	line-height:50px; 
	vertical-align:middle; 
	text-align:center; 
	}
#all{
	margin-bottom:20px;
}	



#topMenu .menuLink { 
	text-decoration:none; color:white;
	display:block;
	width:320px; font-size:12px; 
	font-weight:bold; font-family:"Trebuchet MS", Dotum, Arial;
	
}

#topMenu .menuLink:hover { 
	color:red; background-color:#4d4d4d;
}

.din {
	margin-top: 20px;
}

div>h2 {
	margin-bottom: 20px;
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
	font-size: x-large;
	text-align: center;
	height: 500px;
}

.gacha {
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
	width: 400px;
	height: 500px;
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
	height: 900px;
	grid-area: main;
	border: 3px solid black;
	font-size: xx-large;
	background-image: url(../upload/main.png);
	background-size: cover;
}

.c {
	grid-area: c;
	height: 400px;
	border: 3px solid black;
}

.d {
	grid-area: d;
	border: 3px solid black;
	text-align: center;
	height: 500px;
	width: 400px;
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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

	function login() {
		var serData = $('#loginForm').serialize();
		$.ajax({
			url : '/buddi/login',
			method : 'post',
			cache : false,
			data : serData,
			dataType : 'json',
			success : function(res) {
				alert(res.ok ? '로그인 성공' : '로그인 실패');
				if (res.ok)
					location.href = "/buddi/mainc";
			},
			error : function(xhr, status, err) {
				alert('에러:' + err);
			}
		});
		return false;
	}
</script>
</head>
<body>
	<div class="container">
		<div class = "header">
		<nav id="topMenu">
			<ul>
				<li><a class="menuLink" href="buddi/join">회원가입</a></li>
				<li><a class="menuLink" href="buddi/bbs/list">거래게시판</a></li>
				<li><a class="menuLink" href="buddi/chat">거래채팅</a></li>
				<li><a class="menuLink" href="buddi/gacha">포켓몬뽑기</a></li>
				<li><a class="menuLink" href="#">포켓몬자랑</a></li>
				<li><a class="menuLink" href="buddi/detail">회원정보수정</a></li>
			</ul>

		</nav>
		</div>
		<div class="a">
			<h3>오늘의 포켓몬은 뭘까용?</h3>
			<h2>No. ${mon.dNum}</h2>
			<div id="mon">
				<img src="../upload/poketmon/${mon.dNum}.gif" width="150px" height="200px">
			</div>

	<div class="7" style="width: 100%;">
		<table class="1" style="background-color: #FFFFFF; width: 100%; border: 2px solid #dc3165;">
			<tr>
			</tr>
			<tr style="background-color: #dc3165; color: white; ">
				<td class="1" colspan="1" style="text-align: center; width:10%; ">
					<div>번호</div>
				</td>
				<td rowspan="1" style="text-align: center; width:40%;">
					<div>이름</div>
				</td>
				<td rowspan="1" style="text-align: center; width:20%;">
					<div>등급</div>
				</td>
				<td rowspan="1" style="text-align: center; width:30%; ">
					<div>
						<span style="color: white">타입</span>
					</div>
				</td>
			</tr>
			<tr>
				<td style="text-align: center; border-right: 1px solid #dc3165;">${mon.dNum}</td>
				<td style="text-align: center; border-right: 1px solid #dc3165;">${mon.pName}</td>
				<td style="text-align: center; border-right: 1px solid #dc3165;">${mon.pGrade}</td>
				<td style="text-align: center;">
					<div id="typefont" style= "font-size: large">
					<div id="type"
					style= "background-color: 
			<c:if test="${mon.type_num == 1}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 2}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 3}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 4}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 5}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 6}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 7}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 8}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 9}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 10}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 11}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 12}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 13}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 14}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 15}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 16}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 17}">${mon.rgb};</c:if>
			<c:if test="${mon.type_num == 18}">${mon.rgb};</c:if>
			"
					>${mon.type_name}
					</div>
					</div>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
			
			<br> [<a id="gacha" href="/buddi/gacha">자세히보기</a>]
		</div>

		<div class="b">
			<h1 class="logo">로그인</h1>
			<form id="loginForm" onsubmit="return login();">
				<input type="text" id="uid" name="uid" value="Admin"> <br> <input type="password" id="pwd" name="pwd" value="0"> <br>
				<div id="button">
					<button type="submit">로그인</button>
					<button type="reset">취 소</button>
				</div>
			</form>
		</div>
		<div class="main"></div>
		<div class="c">
			<h1 class="logo">채팅프로그램</h1>
			<input id="inputMsgBox" style="width: 200px;" type="text" onkeypress="inputMsgBox_onkeypress()">
			<div class="button">
				<input id="sendButton" value="Send" type="button" onclick="sendButton_onclick()"> <input id="disconnectButton" value="Disconnect" type="button" onclick="disconnectButton_onclick()"> <br />
			</div>
			<textarea id="chatBoxArea" rows="10" cols="55" readonly="readonly"></textarea>
		</div>
		<div class="d">
			<div class="din">
				<h2>게시판</h2>
				<div class="allbbs">
				<div id="bbswrap">
		<table>
			<tr>
				<td colspan="5" style="border: white; text-align: right;">
					<div id= "all">
					<a href="/buddi/bbs/add">전체보기</a>
					</div>
				</td>
			</tr>
			<tr id="bbs">
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
			</tr>
			<c:forEach var="b" begin="0" end="10" items="${list }">
				<tr id="bbs">
					<td>${b.num }</td>
					<td>
						<a href="/buddi/bbs/detail?num=${b.num}">${b.title}</a>
					</td>
					<td>${b.author}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</div>
	</div>
	</div>
		<div class="footer">footer</div>
	</div>
</body>
</html>