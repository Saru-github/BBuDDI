<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>User Detail</title>
<style type="text/css">

#container{
width:100%;
display : inline-block;
position : center;
margin : 0 auto;
}

#usercon{

}

#album{
width:20%;
height:250px;
float: left;
margin-right:20px;
}


#detail {
margin-top:200px;
margin-left:10%;
width: 30%;
height: 800px;
float: left;
display: inline-block;

}


#detail > h2{
text-align: center;
}

#info{
font-size: x-large;
font-weight: bold;
}

lable{
margin-left : 20px;
}

#box{
width: 50%;
hegiht: 800px;
float: left;
text-align: center;
}
#ea {
float:right;
font-weight:bold; 
}

#name{
text-align:center;
font-weight:bold;
}
#grade{
float: left;
font-weight:bold;
}

#profile{
	float: left;
	text-align: center;
}

#dogam{
margin-right : 100px;
margin-top : 50px;
margin-bottom: 50px;
}

.red{color:red;}
.black{color:black;}
div#num { 
width:fit-content; margin-left: 40%; margin-top:20px;
 }

</style>
</head>
<body>
<div id="container">
<div id="detail">
<h2>유저정보</h2>
				<div id ="usercon">
				<div id= "profile" style="padding-right:30px;">
				
				<img src="../upload/${user.uid}.jpg" width="300" height="300" margin>
				</div>
				
				<div id = "info"  style="margin-top:50px; padding:30px;">
				<div >
					<label>아이디: </label> ${user.uid}
				</div>
				<br>
				<div>
					<label>유저번호: </label> ${user.uNum}
				</div>
				<br>
				<div>
					<label>유저등급: </label> ${user.uGrade}
				</div>
				</div>
				<div id="ball">
					<img src="../upload/ball.jpg" width="50" height="50">&nbsp;&nbsp;&nbsp;X${user.mBall}
				</div>
			<div class="logout">
				[<a href="/buddi/logout">정보수정</a>] [<a href="/buddi/logout">로그아웃</a>]
			</div>
			</div>
				</div>

<div id="box">
<div id="dogam">
<h1>포켓몬 도감</h1>
</div>
<c:forEach var="b" items="${pu.list}" >
<div id="album">
	<div id= "grade"> ${b.pGrade}</div>
	<div id= "ea"> 보유: ${b.po_ea}</div>
	<br>
	<div id = "poimg" style="margin-top:20px;">
	<img src="../upload/poketmon/${b.dNum}.gif" width="100" height="120">
	</div>
	<br>
	<div id = "name">${b.dNum} ${b.pName} </div>
</div>	
</c:forEach>
<div id="num">
<c:forEach var="n" items="${pu.navLinks}">  <!-- list = getList(); -->
	<c:if test ="${n==pu.currPage}">
		<c:set var ="cls" value="red"/> 
	</c:if>
	<c:if test ="${n!=pu.currPage}">
		<c:set var ="cls" value="black"/>
	</c:if> 
	<a class="${cls}" href="/buddi/detail?page=${n}">[${n}]</a>

</c:forEach>
</div>

</div>
</div>

</body>
</html>