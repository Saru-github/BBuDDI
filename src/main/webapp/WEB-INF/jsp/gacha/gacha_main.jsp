<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>가챠메인</title>


<style>
*{
text-align: center;
}

.a {
	font-size: xx-large;
	display: inline-block;
	float: left;
	margin-left: 200px;
}

.gacha {
	margin-top: 100px;
	display: inline-block;
	font-size: xx-large;
}

nav {
	display: inline-block;
	margin-left: 50px;
}


</style>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	
</script>

</head>

<body>
	<div class="a">
		오늘의 포켓몬은 뭘까용? <Br>
		<h2>${mon.pName}</h2>
		<Br>
		<div id="mon">
			<img src="../upload/poketmon/${mon.pNum}.png" width="400" height="500">
		</div>
	</div>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class = "gacha">
		<label>포켓몬 이름: </label> ${mon.pName} 
		<br><br> <label>포켓몬등급: </label> ${mon.pGrade} 
		<br><br> <label>포켓몬 타입: </label> ${mon.pType}
		<br><br> <label>포켓몬 시세: </label> 천만원
		<br><br>
			<nav>
			<a href = "/buddi/gogacha?strCount=11" >11회뽑기</a>
			<a href = "/buddi/gogacha?strCount=1" >1회뽑기</a>
			</nav>
	</div>


</body>
</html>