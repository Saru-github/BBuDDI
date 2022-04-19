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
text-align: center;
position : center;
}

#album{
width:120px;
height:170px;
float: left;
margin-right:20px;
}


#detail {
width: 800px;
height: 800px;
float: left;
display: inline-block;

}

#box{
width: 800px;
hegiht: 800px;
float: left;
}
#ea {
float:right;
font-weight:bold; 
}

#name{
text-align:center;
font-wegiht:bold;
}
#grade{
float: left;
font-wegiht:bold;
}

</style>
</head>
<body>
<div id="container">
<div id="detail">
<h2>유저정보</h2>
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
			<div class="logout">
				[<a href="/buddi/logout">정보수정</a>] [<a href="/buddi/logout">로그아웃</a>]
			</div>
			</div>

<div id="box">
<c:forEach var="b" items="${own}" >
<div id="album">
	<div id= "grade"> ${b.pGrade}</div>
	<div id= "ea"> ${b.po_ea}</div>
	<br>
	<img src="../upload/poketmon/${b.dNum}.gif" width="100" height="80">
	<br>
	<div id = "name">${b.dNum} ${b.pName} </div>
</div>	
</c:forEach>
</div>
</div>


</body>
</html>