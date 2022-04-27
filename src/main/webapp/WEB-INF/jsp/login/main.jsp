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
html, body{
	height:100%;
	
}
 
.container {
	
	whidth: 100%;
	height: 100%;
	margin: 0 auto;
	display: grid;
	align-content: space-around;
	justify-content: space-around;
	justify-items: stretch;
	grid-template-areas: "header header header header" 
						 "  a   	b   main  	 c	 "
						 "	a	 	b	main	 g	 "
						 "  d	 	e	main 	 f	 "
						 "	d   	e   main   	 f 	 "
						"footer footer footer footer"; 
	grid-template-columns: 18% 18% 50% 14%;
	grid-template-rows: 9% 20% 21% 20% 21% 9%;

	justify-content: space-around;
	justify-items: stretch;
	overflow: 
}


.header {

	grid-area: header;
	width: 100%;
	font-size: xx-large;
	text-align: center;
}


#topMenu {
	grid-area: header;
	width: 100%;
	font-size: xx-large;
	text-align: center;
	height: 100%;
	
}

#topMenu ul{
	
	height: 100%;
	width:100%;
	text-align:center;
	vertical-align:middle;
}

#topMenu ul li { 
	list-style:none;  color:white; 
	background-color:#2d2d2d; 
	float:left; 
	vertical-align:middle; 
	text-align:center; 
	width:20%;
	margin-top:53.2px;
	line-height: 53px;
	}
	
	
#topMenu .menuLink { 
	text-decoration:none; color:white;
	display:block;
	font-size:20px; 
	font-weight:bold; font-family:"Trebuchet MS", Dotum, Arial;
}

#topMenu .menuLink:hover { 
	color:red; background-color:#4d4d4d;
}

.a{
	grid-area: a;
	border: 1px solid black;
	width: 99.5%;
}

#info{
font-size: 20px;

}

#ran{
	float: left;
	margin-left:25px;
}

#random{
	float: left;
	margin-left:25px;
}
.b {
	grid-area: b;
	text-align: center;
	display: flex;
 	justify-content: center;
  	align-items: center;
}

table{
    width: 99%;
    border-collapse: collapse;
    line-height: 24px;
    
}
#bbs {
	width: 99%;
    border:1px solid black;
    border-collapse: collapse;
    text-align: center;
}
th {
	background: rgb(221, 221, 221);
	
}

#all{
	margin-bottom:10px;
	margin-right: 10px;
}	


.allbbs {
	margin-top: 0px;
	width: 100%;
	
 }
 
a{
    text-decoration: none;
    color: blue;
}
a:hover{
    text-decoration: underline;
}

.b>div>h2 {
	margin-bottom: 20px;
}


.main {
	width : 100%;
	grid-area: main;
	border: 1px solid black;
	font-size: xx-large;
	background-image: url(../upload/main.jpg);
	background-size: cover;
	
}

.c {
	grid-area: c;
	border: 1px solid black;
	display: flex;
 	justify-content: center;
  	align-items: center;
}

.d {
	grid-area: d;
	border: 1px solid black;
	text-align: center;
	display: flex;
 	justify-content: center;
  	align-items: center;
}

.container2{
		width: 100%;
		margin: 0 auto;
	}
.container2 h1{
		text-align: center;
		color: #000;
	}
.chating{
		background-color: #000;
		width: 100%;
		height: 400px;
	}
.chating p{
		color: #fff;
		text-align: left;
	}
input{
		width: 100%;
 		height: 25px;
	}
#yourMsg{
		display: none;
	}

.e{
	grid-area: e;
	font-size: xx-large;
	text-align: center;
	border-top: 3px solid black;
}

.f {
	grid-area: f;
	border: 1px solid black; 
	text-align: center;
	
}

#type{
	margin:1px;
	border-radius:5px;
	width:55px;
	text-align:center;
	color:window;
	margin-left: 8px;
}

.g{
	grid-area: g;
	border: 1px solid black;
}

.g > h3{
font-size: xx-large;}

.footer {
	grid-area: footer;
	border: 1px solid black;
	width: 100%;
}




</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
var ws;

function wsOpen(){
	ws = new WebSocket("ws://" + location.host + "/chating");
	wsEvt();
}
	
function wsEvt() {
	ws.onopen = function(data){
		//소켓이 열리면 초기화 세팅하기
	}
	
	ws.onmessage = function(data) {
		var msg = data.data;
		if(msg != null && msg.trim() != ''){
			$("#chating").append("<p>" + msg + "</p>");
		}
	}

	document.addEventListener("keypress", function(e){
		if(e.keyCode == 13){ //enter press
			send();
		}
	});
		
}

function enterkey() {
    if (window.event.keyCode == 13) {

    	chatName()
    }
}

function chatName(){
	var userName = $("#userName").val();
	if(userName == null || userName.trim() == ""){
		alert("사용자 이름을 입력해주세요.");
		$("#userName").focus();
		
	}else{
		wsOpen();
		$("#yourName").hide();
		$("#yourMsg").show();
	}
}

function send() {
	var uN = $("#userName").val();
	var msg = $("#chatting").val();
	ws.send(uN+" : "+msg);
	$('#chatting').val("");
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
	
	var imagepath = "../upload/poketmon/"
		NewImg = new Array (
		"1.gif",
		"2.gif",
		"3.gif",
		"4.gif",
		"5.gif",
		"6.gif",
		"7.gif",
		"8.gif",
		"9.gif",
		"10.gif",

		);
		var ImgNum = 0;
		var ImgLength = NewImg.length - 1;

		var delay = 5000; //자동전환시 시간설정(1000=1초)

		var lock = false;
		var run;

		function chgImg(direction) {
		    if (document.images) {
		        ImgNum = ImgNum + direction;
		    if (ImgNum > ImgLength) {
		        ImgNum = 0;
		    }
		    if (ImgNum < 0) {
		        ImgNum = ImgLength;
		    }
		    document.slideshow.src = imagepath+NewImg[ImgNum];
		   }
		}

		function auto() {
		    if (lock == true) {
		        lock = false;
		        window.clearInterval(run);
		    }
		    else if (lock == false) {
		        lock = true;
		        run = setInterval("chgImg(1)", delay);
		   }
		    
}
</script>
</head>
<body onLoad=auto();>
	<div class="container">
		<div class = "header">
			<div id="topMenu">
				<ul>
					<li><a class="menuLink" href="buddi/join">회원가입</a></li>
					<li><a class="menuLink" href="buddi/bbs/list">거래게시판</a></li>
					<li><a class="menuLink" href="buddi/chat">거래채팅</a></li>
					<li><a class="menuLink" href="buddi/gacha">포켓몬뽑기</a></li>
					<li><a class="menuLink" href="buddi/detail">회원정보수정</a></li>
				</ul>
			</div>
		</div>
		<div class="a">
			<div id ="1st" style="text-align:center; margin-top:10px;">
			<h2>*포켓몬 몬스터볼 랭킹*</h2>
			<img id="prize" src="../upload/1st.jpg" width="100px" height="100px" style="float:left; margin-top:30px"><br>
			<img id="ran" src="../upload/${ran.uid}.jpg" width="100px" height="120px">
			<div id ="info" style="font-size: 20px;" >
			<br>
			<br>
				ID: ${ran.uid}<br>
				<img id="ranball" src="../upload/ball.jpg" width="50px" height="50px" style="float:left; margin-left:30px;">
				<div style="margin-top:10px;"> ${ran.mBall}개
				</div>
				<br>
				<hr>
			</div>
			</div>
			<div id="23man" style=" text-align:center; font-weight: bold; float: left; margin-top:10px; margin-left: 10px;" >
			<div>
			<img id="prize" src="../upload/2nd.jpg" width="70px" height="70px"><br>
			</div>
			<br><br>
			<img id="prize" src="../upload/3rd.jpg" width="70px" height="70px"><br>
			
			</div>
			<div id="23th" style=" text-align:center;">
			<c:forEach var="b" begin="0" end="1" items="${random}">
			<div>
			<img id="random" src="../upload/${b.uid}.jpg" width="80px" height="100px" style="margin-top:5px;">
			<div id ="info">
				<br>
				ID: ${b.uid}<br>
				<img id="ranball" src="../upload/ball.jpg" width="40px" height="40px" style="float:left; margin-left:50px;" > ${b.mBall}개
				<Br>
				<Br>
				<Br>
			</div>
			</div>
		</c:forEach>
			</div>
			</div>
			<br>
			
		
		<div class="b">
			<div class="allbbs">
				<h1>게시판</h1>
				<br>
				<br>
				
		<table style="width:100%;">
			<tr>
				<td colspan="5" style="border: white;text-align: right;">
					<div id = "all" style=" margin-right:20px; ">
					<a href="/buddi/bbs/list">전체보기</a>
					<br>
					<br>
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
					<td>${b.num}</td>
					<td>
						<a href="/buddi/bbs/detail?num=${b.num}">${b.title}</a>
					</td>
					<td>${b.author}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</div>
		
		

		<div class="c">
			<h1 class="logo" style="margin-right:10px;">로그인</h1>
			<form id="loginForm" onsubmit="return login();">
				<input type="text" id="uid" name="uid" value="대영"> <br> <input type="password" id="pwd" name="pwd" value="0"> <br>
				<div id="button">
					<button type="submit" style="width:60px; font-size:15px;">로그인</button>
					<button type="reset" style="width:55px; font-size:15px;">취소</button>
					<button type="button" onclick="location.href='/buddi/join'" style="width:65px; font-size:15px;">회원가입</button>
				</div>
			</form>
		</div>
		<div class="main"></div>
		<div class="d">
			<div id="container2" class="container2">
			<h1>채팅</h1>
		<div id="chating" class="chating">
		</div>
		
		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<th><input  onkeyup="enterkey();" type="text" id="userName" placeholder="닉네임 설정"></th>
					<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
	</div>
	<div class="e">
	<h2>광 고</h2>
	
<iframe width="100%" height="350" src="https://www.youtube.com/embed/d9TnW7VQRPk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<!-- <div style = "margin-top:100px;">
<img src="../upload/poketmon/1.gif" name="slideshow" width=200 height=200>
<br>
<br>
<br>
<a href="javascript:chgImg(-1)"><--</a>
<a href="javascript:auto()">Auto/Stop</a>
<a href="javascript:chgImg(1)">--></a>
<!-- </div> -->
</div>
	
	<div class="f">
			<h2 style="margin-top:20px;">오늘의 포켓몬은 뭘까용?</h2>
			<h3 style="margin-top:10px; margin-bottom:30px;">No. ${mon.dNum}</h3>
			<div id="mon" style="margin-bottom:30px;">
				<img src="../upload/poketmon/${mon.dNum}.gif" width="100px" height="150px">
			</div>
			<div class="7" style="width: 100%;">
				<table class="1" style="background-color: #FFFFFF; width: 100%; border: 2px solid ${mon.rgb};">
					<tr>
					</tr>
			<tr style="background-color: ${mon.rgb}; color: white; font-size:large;">
				<td class="1" colspan="1" style="text-align: center; width:20%; ">
					<div>번호</div>
				</td>
				<td rowspan="1" style="text-align: center; width:40%;">
					<div>이름</div>
				</td>
				<td rowspan="1" style="text-align: center; width:15%;">
					<div>등급</div>
				</td>
				
				
				
				<td rowspan="1" style="text-align: center; width:20%; ">
					<div>
						<span style="color: white">타입</span>
					</div>
				</td>
			</tr>
			
			<tr style="height: 12px;">
				<td style="text-align: center; border-right: 1px solid ${mon.rgb};">${mon.dNum}</td>
				<td style="text-align: center; border-right: 1px solid ${mon.rgb};">${mon.pName}</td>
				<td style="text-align: center; border-right: 1px solid ${mon.rgb};">${mon.pGrade}</td>
				<td style="text-align: center; height: 45px;">
					<div id ="type" style="background-color: 
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
			">
					${mon.type_name}
			</div>
			<c:if test="${mon.subType_num != null}">
			<div id= "type" style="background-color: 
			<c:if test="${mon.subType_num == 1}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 2}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 3}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 4}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 5}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 6}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 7}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 8}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 9}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 10}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 11}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 12}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 13}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 14}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 15}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 16}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 17}">${mon.subRgb};</c:if>
			<c:if test="${mon.subType_num == 18}">${mon.subRgb};</c:if>
			">
					${mon.subType_name}
					</div>
			</c:if>
			
				</td>
			</tr>
			</tbody>
		</table>
	</div>
	<br>
			<div class = "gacha">
			[<a id="gacha" href="/buddi/gacha">자세히보기</a>]<br>
			</div>
		</div>
	
	
	
	<div class="g">
	<div align="center" dir="auto">
<strong><h1 style="margin-top:30px;" dir="auto"><g-emoji class="g-emoji" alias="email" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f4e7.png">📧</g-emoji>Contact Us<g-emoji class="g-emoji" alias="email" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f4e7.png">📧</g-emoji></h1></strong>
</div>
<br>
<br>
<div align="left" dir="auto" style="margin-left:20px ; font-weight: bold; font-size:18px;">
Google mail: <a href="mailto:glglzhzh22@gmail.com"><img style="height: 28px; max-width: 100%; margin-left:49px;" src="https://camo.githubusercontent.com/0d18630762d7b4380b46c672bc132f4212975fa18c2647f7ddfdd585030347d0/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f476d61696c2d6431343833363f7374796c653d666c61742d737175617265266c6f676f3d476d61696c266c6f676f436f6c6f723d7768697465266c696e6b3d" data-canonical-src="https://img.shields.io/badge/Gmail-d14836?style=flat-square&amp;logo=Gmail&amp;logoColor=white&amp;link="></a><br>
Naver mail: <a href="mailto:heo_dark@naver.com"><img style="height: 28px; max-width: 100%; margin-left:60px;" src="https://camo.githubusercontent.com/b027982dc090ccd577af1e99d5fadceb6fb9a3e4d5e801ef04547b234dcfb722/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f2d4e617665722d627269676874677265656e3f7374796c653d666c61742d737175617265266c6f676f3d4e61766572266c6f676f436f6c6f723d7768697465266c696e6b3d" data-canonical-src="https://img.shields.io/badge/-Naver-brightgreen?style=flat-square&amp;logo=Naver&amp;logoColor=white&amp;link="></a><br>
KaKao talk: <a href="https://open.kakao.com/o/sHmgwxbe" rel="nofollow"><img style="height: 28px; max-width: 100%; margin-left:60px;" src="https://camo.githubusercontent.com/ad4a24465ede82cef81fa757614d1b8b98520db5d35d84d89274d7386ef4dbe7/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4b616b616f54616c6b2d4637444631453f7374796c653d666c61742d737175617265266c6f676f3d4b616b616f54616c6b266c6f676f436f6c6f723d7768697465266c696e6b3d" data-canonical-src="https://img.shields.io/badge/KakaoTalk-F7DF1E?style=flat-square&amp;logo=KakaoTalk&amp;logoColor=white&amp;link="></a>
</div>
	</div>
	
	
		<div class="footer" style="text-align:center;">
		
		 <p style="margin-top:45px;">Copyright © 2022 saru.co.,Ltd. All rights reserved.</p>
    <address>Contact me for more information.
    call No. 010-7262-7548, <a href="https://github.com/Saru-github">https://github.com/Saru-github</a></address>
		
		
		</div>
	</div>
	
	
</body>
</html>