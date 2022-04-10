<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>

<head>

<title>:: JavaScript 캔버스 - 뷰 ::</title>

<style type="text/css">
table {
	border: 1px solid #444444;
	border-collapse: collapse;
}

table th {
	border: 1px solid #444444;
	padding: 5px 10px 5px 10px;
	text-align: center;
	font-weight: bold;
}

table td {
	border: 1px solid #444444;
	padding: 10px;
	text-align: center;
}
</style>

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

	<!-- @breif accept 태그는 파일 업로드시 그것을 이미지 파일로 제한한다. -->

	<input type="file" id="upImgFile" onChange="uploadImgPreview();" accept="image/*">

	<hr />

	<canvas id="canvas"></canvas>


</body>

</html>
