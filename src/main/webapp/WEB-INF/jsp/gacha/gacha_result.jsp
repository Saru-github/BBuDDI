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


#gachanum{
	font-weight:  bold;
}

#num{
	border-radius:20px;
	width:50px;
	height:20px;
	margin-left: 20px;
	color:window;
}

#type{
	margin:1px;
	border-radius:5px;
	width:55px;
	text-align:center;
	color:window;
	
}


nav{
	text-align: right;
	f
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
        	<div id ="gachanum" style = "text-align: right; magin-right:20px;">
        	
        	<c:if test="${b.gachaNum!=11}">${b.gachaNum}번째 뽑기</c:if>
        	<c:if test="${b.gachaNum==11}">${b.gachaNum-1}+1번째 뽑기</c:if>
        	
        	</div>
			<div id="mon">
							<div id="num" style="background-color:
			<c:if test="${b.type_num == 1}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 2}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 3}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 4}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 5}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 6}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 7}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 8}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 9}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 10}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 11}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 12}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 13}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 14}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 15}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 16}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 17}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 18}">${b.rgb};</c:if>
			">
								<div id="numcon">
								${b.dNum}</div> 
							</div>
							
							<img src="../upload/poketmon/${b.dNum}.gif" width="100" height="90">
			</div>
			<br> 
			
			
			
			<div class="a" style="width: 100%;">
		<table class="1" style="background-color: #FFFFFF; width: 100%; border: 2px solid ${b.rgb};">
			<tr>
			</tr>
			<tr style="background-color: ${b.rgb}; color: white; ">
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
			
			<tr style="height: 12px;">
				<td style="text-align: center; border-right: 1px solid ${b.rgb};">${b.dNum}</td>
				<td style="text-align: center; border-right: 1px solid ${b.rgb};">${b.pName}</td>
				<td style="text-align: center; border-right: 1px solid ${b.rgb};">${b.pGrade}</td>
				<td style="text-align: center; height: 40px;">
					<div id ="type" style="background-color: 
			<c:if test="${b.type_num == 1}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 2}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 3}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 4}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 5}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 6}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 7}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 8}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 9}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 10}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 11}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 12}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 13}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 14}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 15}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 16}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 17}">${b.rgb};</c:if>
			<c:if test="${b.type_num == 18}">${b.rgb};</c:if>
			">
					${b.type_name}
			</div>
			<c:if test="${b.subType_num != null}">
			<div id= "type" style="background-color: 
			<c:if test="${b.subType_num == 1}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 2}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 3}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 4}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 5}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 6}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 7}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 8}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 9}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 10}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 11}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 12}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 13}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 14}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 15}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 16}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 17}">${b.subRgb};</c:if>
			<c:if test="${b.subType_num == 18}">${b.subRgb};</c:if>
			">
					${b.subType_name}
					</div>
			</c:if>
			
				</td>
			</tr>
			</tbody>
		</table>
	</div>
			
			
			
			
      </div>
    </div> 
    
    
  </c:forEach>
  
  <button type="button" id="allButton">돌려돌려</button>
        </section> 
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