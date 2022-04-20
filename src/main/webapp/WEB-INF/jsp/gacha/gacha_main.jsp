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
				<td rowspan="1" style="text-align: center; width:25%; ">
					<div>
						<span style="color: white">타입</span>
					</div>
				</td>
			</tr>
			
			<tr style="height: 30px; font-size:large;">
				<td style="text-align: center; border-right: 1px solid ${mon.rgb};">${mon.dNum}</td>
				<td style="text-align: center; border-right: 1px solid ${mon.rgb};">${mon.pName}</td>
				<td style="text-align: center; border-right: 1px solid ${mon.rgb};">${mon.pGrade}</td>
				<td style="text-align: center; height: 40px;">
					<div id ="type" style="margin:2px; background-color: 
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
			<br>
			<c:if test="${mon.subType_num != null}">
			<div id= "type" style=" margin:2px; background-color: 
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



