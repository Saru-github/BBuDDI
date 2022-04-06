<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<style type="text/css">

	.container {
    display: grid;
	grid-template-areas:
		"header header header"
		"   a    main    b   "
		"   .     .      .   "
		"footer footer footer";
		grid-template-columns: 1fr 1fr 1fr;
		grid-template-rows: 1fr 1fr 1fr;
	}	
	.header {
	grid-area: header;
	border: 1px solid lrightgrey;
	font-size: xx-large;
	text-align: center;
	}	
	.footer {
	grid-area: footer;
	border: 1px solid lrightgrey;
	font-size: xx-large;
	text-align: center;
	}
	.b {
	right: auto;
	width: 200px;
    height: 200px;
    grid-area: b;
    justify-content: center;
    align-items: center;
    border: 1px solid lightgrey;
    border-radius: 5px;
	}


.logo {
	text-align: center;
    margin-top: 0px;
    margin-bottom: 20px;
}

#login {
    width: 100%;
    background-color: skyblue;
    border-color: transparent;
    color: white;
}

.account {
    display: block;
    margin-bottom: 3px;
    padding: 3px;
    border: 1px solid lightgray;
    border-radius: 3px;
}

#alert {
    border-color: transparent;
}10px; border-radius:3px; }
 </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
function login()
{
	var serData = $('#loginForm').serialize();
	$.ajax({
		url:'/buddi/login',
		method:'post',
		cache:false,
		data:serData,
		dataType:'json',
		success:function(res){
			alert(res.ok ? '로그인 성공' : '로그인 실패');
			if(res.ok) location.href="/buddi/list";
		},
		error:function(xhr,status,err){
			alert('에러:'+err);
		}
	});
	return false;
}
</script>
</head>
<body>
	<div class ="container">
	<div class ="header">Header</div>
        <div class="b">
        <h1 class="logo">로그인</h1>
        <div class="con">
            <input type="text" placeholder="ID" id="id" class="account">
            <input type="password" placeholder="Password" id="password" class="account">
            <button id="login" class="account">login</button>
            <p id="alert" class="account"> </p>
        </div>
    </div>   
    <script src="script.js"></script>
	<div class ="1">영역1</div>
	<div class ="2">영역2</div>
    <script src="script.js"></script>
    <div class ="footer">footer</div>
    
    </div>
</body>
</html>