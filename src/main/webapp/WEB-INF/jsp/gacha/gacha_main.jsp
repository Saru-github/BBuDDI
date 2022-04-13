<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>가챠메인</title>


<style>
* {
	text-align: center;
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
.1{
	display: inline-block;
	width:40px;
}

.a {
	font-size: xx-large;
	display: inline-block;
	float: left;
	margin-left: 200px;
	height: 1000px;
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
		오늘의 포켓몬은 뭘까용?
		<h2>${mon.pName}</h2>
		<div id="mon">
			<img src="../upload/poketmon/${mon.pNum}.gif" width="300" height="400">
		</div>
	</div>

	<div class="a" style="width: 1000px;">
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
				<td style="text-align: center; border-right: 1px solid #dc3165;">${mon.pNum}</td>
				<td style="text-align: center; border-right: 1px solid #dc3165;">${mon.pName}</td>
				<td style="text-align: center; border-right: 1px solid #dc3165;">${mon.pGrade}</td>
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
					>${mon.pType}
					</div>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<div class = "gacha">
			<a href = "/buddi/gogacha?strCount=11" >11회뽑기</a>
			<a href = "/buddi/gogacha?strCount=1" >1회뽑기</a>
	</div>
</body>
</html>



