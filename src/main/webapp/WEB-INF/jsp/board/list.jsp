<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시판 목록 보기</title>
<style>
#wrap {
    width: 1000px;
	margin:auto;
}
table{
    width: 100%;
    border-collapse: collapse;
    line-height: 24px;
}
table td,th {
    border-top:1px solid black;
    border-bottom:1px solid black;
    border-collapse: collapse;
    text-align: center;
    padding: 10px;
}
th {
	background: rgb(221, 221, 221);
}
a{
    text-decoration: none;
    color: blue;
}
a:hover{
    text-decoration: underline;
}

</style>
</head>
<body>
	<div id="wrap">
		<h2>게시글 리스트</h2>
		<table>
			<tr>
				<td colspan="5" style="border: white; text-align: right;">
					<a href="/buddi/bbs/add">글 작성하기</a>
				</td>
			</tr>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<th>첨부파일</th>
			</tr>
			<c:forEach var="b" items="${list }">
				<tr>
					<td>${b.num }</td>
					<td>
						<a href="/buddi/bbs/detail?num=${b.num}">${b.title}</a>
					</td>
					<td>${b.author}</td>
					<td>${b.bdate}</td>
					<td>
					<c:forEach var="a" items="${b.attach}">
     	  		 	${a.num} ${a.filename} ${a.filesize}
      				</c:forEach>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>

