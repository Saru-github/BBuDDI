<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입 폼</title>
<style>

.button{
	text-align: right;
}

h3 {
	width: fit-content;
	margin: 0 auto;
}

form {
	width: fit-content;
	margin: 1em auto;
}

form>div {
	margin-bottom: 0.5em;
}

form>div>label {
	font-weight: bolder;
	margin-right: 2em;
	display: inline-block;
	width: 6em;
	text-align: right;
}

.thumbnail {
	width: 200px;
	height: 200px;
}

form>div : last-child {
	margin-top: 2em;
	text-align: center;
}

form input[type=image]:hover {
	
}

#button {
	width: fit-content;
	margin: 0 auto;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script type="text/javascript">

function uploadImgPreview() {
	
	let fileInfo = document.getElementById("upImgFile").files[0];
	let reader = new FileReader();
	reader.onload = function() {
		console.log("INDEX #02");
		document.getElementById("canvas").src = reader.result;
		let tempImage = new Image(); 
		tempImage.src = reader.result;
		tempImage.addEventListener("load", function() {
			let canvas = document.getElementById("canvas");
			let canvasContext = canvas.getContext("2d");
			canvas.width = 200;
			canvas.height = 200;
			canvasContext.drawImage(
			this , 0 , 0 , 200 , 200 );
			canvasContext.stroke();
			let dataURI = canvas.toDataURL("image/jpeg");
			document.querySelector("#thumbnail").src = dataURI;

		});

	};

	if (fileInfo) {
		console.log("INDEX #01");
		reader.readAsDataURL(fileInfo);
	}
}
</script>


</head>
<body>

	<h3>회원 가입</h3>
	<form id="input_Form">
		<div>
			<label>아이디</label> <input type="text" name="uid" required>
		</div>
		<div>
			<label>암호</label> <input type="password" name="pass" required>
		</div>

		<div>
			<label>닉네임</label> <input type="text" name="uid" required>
		</div>

		<div>
			<label> 성별 </label>
			<!-- radio 단일선택, 같은 묶음(gender)여야 단일 선택이 된다. -->
			<input type="radio" name="gender" value="m" checked>남 <input type="radio" name="gender" value="f">여
		</div>
		<div>
			<label>체육관선택</label>
			<select name="gym">
				<option value="s1">전기 체육관</option>
				<option selected>풀 체육관</option>
				<option>땅 체육관</option>
				<option>물 체육관</option>
				<option>불 체육관</option>
			</select>
		</div>

		<div>
			<label>생일입력</label> <input type="date" name="birth">
		</div>
		<div>
			<label>Email</label> <input type="email" name="email">
		</div>
		<div>
			<label>프로필사진</label> 
			<input type="file" id="upImgFile" onChange="uploadImgPreview();" accept="image/*">
		</div>
			<div class="button">
			<button type = submit>전송</button>
			<button type = reset>전송</button>
			</div>
	
	
	<hr />


	<h4>프로필 사진 미리보기</h4>
	<canvas id="canvas"></canvas>
	</form>

</body>
</html>