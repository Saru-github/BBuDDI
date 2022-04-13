<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>뽑기결과</title>
<style>




.container{
	border: 1px solid black;

}

#num{
	border-radius:20px;
	width:50px;
	height:20px;
	margin-left: 20px;
	background-color:white;
	
}

#type{
	margin:1px;
	border-radius:5px;
	display:inline-block;
	width:55px;
	text-align:center;
	color:window;
	
}


nav{
	text-align: right;
}

#numcon{
	font-weight: bold;
	margin-bottom: 10px;
	text-align: center;
}

html, body {
    font-family: 'Rajdhani', sans-serif;
    min-height: 100vh;
/*     margin: 0; */
    padding: 0;
    overflow: auto;
    position: relative;
}
* {
  font-family: 'Rajdhani', sans-serif;
}

h1 {
  margin-top:0;
}
h2 {
  text-transform:uppercase;
}
.card {
	position: relative;
	display: inline-block;
	-webkit-transition: 0.6s;
	transition: 0.6s;
	text-align: center;
	-webkit-transform-style: preserve-3d;
	transform-style: preserve-3d;
	width: 270px;
	height: 300px;
	padding: 0;
	margin: 0.8%;
	margin-bottom: 18px;
}

.card .front, .card .back {
	height: inherit;
	width: inherit;
	overflow: hidden;
	position: absolute;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
	width: 100%;
	height: 100%;
	background-color: white;
	border-radius: 2px;
	box-shadow: 0px 1px 2px rgba(0,0,0, 0.2);
}
.card .front:hover, .card .back:hover {
	box-shadow: 0px 1px 6px rgba(0,0,0, 0.4);
}

.card .front .flipButton, .card .back .flipButton {
	/* Add the Flip button */
	position: absolute;
	bottom: 0px;
	cursor: pointer;
	width: 100%;
	line-height: 300px;
	display: block;
	text-align: center;
    color:#fff;
	background-color: rgba(0,0,0, 0.4);
}
.card .front span svg, .card .back span svg {
	fill: #2c3e50;
}
.card .front {
  
  background-image: url("../upload/back.jpg");
  color:#4e2f07;
	z-index: 2;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
}
.card .back {
	-webkit-transform: rotateY(180deg);
	transform: rotateY(180deg);
  color: #fff;
color: black;
}
.card.flip {
	/* CSS to make element flip on click */
	-webkit-transform: rotateY(180deg);
	transform: rotateY(180deg);
}
.card section {
	/* Content Setup */
	padding: 25px 10px;	
}
/* Wrapper and card positioning. Not required for card */
.wrapper {
	position: relative;
	width: 70%;
	height: auto;
	margin: 2.5%;
	background: #eee;
	padding: 2.5%;
      border-radius: 2px;
    box-shadow: 0px 1px 2px rgba(0,0,0, 0.2);
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>

jQuery(document).ready(function($){
	
	  $( ".card .flipButton" ).click(function() {
	    $( this ).closest(".card").toggleClass( "flip" );
	  });
	  
	  $("#allButton").click(function(){
		  $(".card").addClass("flip")
		});
	  
	});
	
	
</script>
</head>
<body>
<section class="wrapper">
  <h1>뽑기결과</h1> <h1 id="regacha"></h1>
  <div class ="container">
<!-- Card Html -->
<c:forEach var="b" items="${result}">
    <div class="card">
      <div class="front">
        <span class="flipButton">뽑기</span>
        <section>
        </section>        
      </div>
      <div class="back">
        <span class="flipButton"></span>
        <section>
			<div id="mon">
							<div id="num">
							
								<div id="numcon">${b.pNum}</div>
							</div>
							<img src="../upload/poketmon/${b.pNum}.gif" width="100" height="100">
			</div>
			<br> 
			<br> 
			
			
			
			<div class="a" style="width: 100%;">
		<table class="1" style="background-color: #FFFFFF; width: 100%; border: 2px solid #dc3165;">
			<tr>
			</tr>
			<tr style="background-color: #dc3165; color: white; ">
				<td class="1" colspan="1" style="text-align: center; width:10%; ">
					<div>번호</div>
				</td>
				<td rowspan="1" style="text-align: center; width:45%;">
					<div>이름</div>
				</td>
				<td rowspan="1" style="text-align: center; width:20%;">
					<div>등급</div>
				</td>
				<td rowspan="1" style="text-align: center; width:20%; ">
					<div>
						<span style="color: white">타입</span>
					</div>
				</td>
			</tr>
			<tr>
				<td style="text-align: center; border-right: 1px solid #dc3165;">${b.pNum}</td>
				<td style="text-align: center; border-right: 1px solid #dc3165;">${b.pName}</td>
				<td style="text-align: center; border-right: 1px solid #dc3165;">${b.pGrade}</td>
				<td style="text-align: center;">
					<div id="type"
						style="background-color: 
			<c:if test="${b.pType eq '불꽃'}">rgb(240, 128, 48);</c:if>
			<c:if test="${b.pType eq '격투'}">rgb(192, 48, 40);</c:if>
			<c:if test="${b.pType eq '에스퍼'}">rgb(220, 49, 101</c:if>
			<c:if test="${b.pType eq '바위'}">rgb(158, 134, 61);</c:if>
			<c:if test="${b.pType eq '물'}">rgb(2, 103, 194);</c:if>
			<c:if test="${b.pType eq '땅'}">rgb(224, 192, 104);</c:if>
			<c:if test="${b.pType eq '드래곤'}">rgb(78, 59, 164);</c:if>
			<c:if test="${b.pType eq '독'}">rgb(107, 36, 110);</c:if>
			<c:if test="${b.pType eq '노말'}">rgb(173, 165, 148);</c:if>
			<c:if test="${b.pType eq '강철'}">rgb(142, 142, 159);</c:if>
			<c:if test="${b.pType eq '벌레'}">rgb(136, 140, 14);</c:if>
			<c:if test="${b.pType eq '고스트'}">rgb(105, 85, 130);</c:if>
			<c:if test="${b.pType eq '악'}">rgb(60, 45, 35);</c:if>
			<c:if test="${b.pType eq '비행'}">rgb(93, 115, 212);</c:if>
			<c:if test="${b.pType eq '얼음'}">6dd3f5;</c:if>
			<c:if test="${b.pType eq '전기'}">rgb(237, 169, 0);</c:if>
			<c:if test="${b.pType eq '페어리'}">rgb(224, 142, 224);</c:if>
			<c:if test="${b.pType eq '풀'}">rgb(56, 154, 2);</c:if>
			"
					>${b.pType}
					</div>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
			
			
			
			
        </section> 
      </div>
    </div> 
    
    
  </c:forEach>
  
  <button type="button" id="allButton">돌려돌려</button>
  <nav>
  <img src="../upload/ball.jpg" width="50" height="50">&nbsp;&nbsp;&nbsp;X${user.mBall}
  <a href = "/buddi/gogacha?strCount=11" >10+1회뽑기</a><br>
  <a href = "/buddi/gogacha?strCount=1" >1회뽑기</a><br>
  <a href = "/buddi/mainc" >메인으로</a>
  </nav>
  </div>
</section>

</body>
</html>