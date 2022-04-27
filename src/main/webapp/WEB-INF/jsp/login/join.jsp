<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>트레이너 등록</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
body {
	min-height: 100vh;
	
	background-image: url("../upload/backg.jpg");
	background-size: 30%;
	background-repeat: repeat;
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}
</style>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h3 class="mb-3">트레이너 등록</h3>
				<br>
				<form class="validation-form" novalidate>
					<div class="row">
						<div class="col-md-6 mb-2">
							<label for="name">이름</label> <input type="text" class="form-control" id="name" placeholder="" value="" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label>프로필사진</label> <input type="file" id="upImgFile" onChange="uploadImgPreview();" accept="image/*">
						</div>
					</div>


					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="nickname">비밀번호</label> <input type="text" class="form-control" id="nickname" placeholder="" value="" required>
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
						<div class ="col-ma-6 mb-4">
						</div>
						<canvas id="canvas"></canvas>
					</div>
					
					<div class="mb-3">
						<label for="email">이메일</label> <input type="email" class="form-control" id="email" placeholder="you@example.com" required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="address">주소</label> <input type="text" class="form-control" id="address" placeholder="서울특별시 강남구" required>
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="birth">생일<span class="text-muted">&nbsp;(필수 아님)</span></label>
						<input type="date" class="form-control" id="birth" placeholder="생일을 입력해주세요.">
					</div>
					<div class="row">
						<div class="col-md-8 mb-3">
							<label for="gym">체육관 선택</label>
							<select class="custom-select d-block w-100" id="root">
								<option value="s1" selected>1. 불 체육관</option>
								<option>2. 격투 체육관</option>
								<option>3. 에스퍼 체육관</option>
								<option>4. 바위 체육관</option>
								<option>5. 물 체육관</option>
								<option>6. 땅 체육관</option>
								<option>7. 드래곤 체육관</option>
								<option>8. 독 체육관</option>
								<option>9. 노말 체육관</option>
								<option>10. 강철 체육관</option>
								<option>11. 벌레 체육관</option>
								<option>12. 고스트 체육관</option>
								<option>13. 악 체육관</option>
								<option>14. 비행 체육관</option>
								<option>15. 얼음 체육관</option>
								<option>16. 전기 체육관</option>
								<option>17. 페어리 체육관</option>
								<option>18. 풀 체육관</option>
							</select>
						</div>
						<div class="col-md-4 mb-3" style="font-size:20px;">
							<label for="code">성별</label> <Br>
							<input style="margin-left:30px;" type="radio" name="gender" value="m" checked>남&nbsp;&nbsp; <input type="radio" name="gender" value="f">여
						</div>
					</div>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement" required> <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">전송</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small"> </footer>
	</div>
	<script> window.addEventListener('load', () => { const forms = document.getElementsByClassName('validation-form'); Array.prototype.filter.call(forms, (form) => { form.addEventListener('submit', function (event) { if (form.checkValidity() === false) { event.preventDefault(); event.stopPropagation(); } form.classList.add('was-validated'); }, false); }); }, false); </script>

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


</body>
</html>

