<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<div id=detail>
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
			</div>

			<div class="logout">
				[<a href="/buddi/logout">정보수정</a>] [<a href="/buddi/logout">로그아웃</a>]
			</div>


</body>
</html>