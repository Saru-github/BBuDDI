<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시판 글 쓰기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
function add() {
	
	 if(!confirm('정말로 저장하시겠습니까?')) {
		alert('정상적으로 취소했습니다.');
		return false;
	} 
	  var formData = new FormData($("#addForm")[0]); 
	  
	  
	$.ajax({
		url : '/buddi/bbs/add',
		method : 'post',
		enctype :'multipart/form-data',
		cache : false,
		data : formData,
		processData: false,
      	contentType: false,
		dataType : 'json',
		success : function(res) {
			 if(res.saved) {
				 alert('저장 성공!');
				 location.href = "/buddi/bbs/list"; 
			 } else {
				 alert('저장 실패');						 
			 }
		},
		
		error : function(xhr, status, err) {
			alert('err' + err);
		} 
	});
	return false; 
}
</script>
</head>
<body>
	<h3>게시판 글 쓰기</h3>
	<form id = "addForm" action="/buddi/bbs/add" enctype="multipart/form-data" onsubmit = "return add();"> 
		<div><label for="author">작성자</label><input type="text" name="author" value="관리자"></div>
		<div><label for="title">제 목</label><input type="text" name="title" value="게시판 테스트"></div>
		<div><label for="contents">내 용</label><textarea name="contents" cols="40" rows="5"></textarea></div>
		<div><label>첨부파일</label><input type="file" name="files" multiple></div>
		<div>
			<button type="submit">저장</button>
			<button type="reset">취소</button>
			<button type="button" 
					onclick="location.href='/buddi/bbs/list';">목록</button>
		</div>
</form>
</body>
</html>