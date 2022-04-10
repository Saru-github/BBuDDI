<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>가챠메인</title>


<style>
.a {
	border: 3px solid black;
	font-size: xx-large;
	text-align: center;
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
			<img src="../upload/poketmon/${today}.png" width="250" height="250">
		</div>
		<br> <label>포켓몬 이름: </label> ${mon.pName} <br> <label>포켓몬
			등급: </label> ${mon.pGrade} <br> <label>포켓몬 타입: </label> ${mon.pType} <br>
		<label>포켓몬 시세: </label> 천만원

	<div class = "gacha">
			<a href = "/buddi/gogacha?strCount=11" >11회뽑기</a>
			<a href = "/buddi/gogacha?strCount=1" >1회뽑기</a>
	</div>
	</div>


</body>
</html>