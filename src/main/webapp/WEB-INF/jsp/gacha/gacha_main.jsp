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
			<img src="../upload/poketmon/${mon.dNum}.gif" width="300" height="400">
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
				<td style="text-align: center; border-right: 1px solid #dc3165;">${mon.dNum}</td>
				<td style="text-align: center; border-right: 1px solid #dc3165;">${mon.pName}</td>
				<td style="text-align: center; border-right: 1px solid #dc3165;">${mon.pGrade}</td>
				<td style="text-align: center;">
					
					<div id="type"
						style="background-color: 
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
					<c:forEach var= "b" items ="${mon.type_name}" >
					${b}
					</c:forEach>
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



