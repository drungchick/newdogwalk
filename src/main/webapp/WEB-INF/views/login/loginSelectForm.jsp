<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer_box {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: grey;
	height: 400px;
	width: 500px;
}
#member {
	text-align: center;
	font-size: 30pt;
	margin-top: 50px;
	margin-bottom: 100px;
}
#inner_owner {
	display: inline-block;
	height: 80px;
	width: 100px;
	margin-left: 60px;
	background: aqua;
	text-align: center;
	font-size: 20pt;
	cursor:pointer;
}
#inner_walker {
	display: inline-block;
	height: 80px;
	width: 100px;
	margin-left: 170px;
	background: aqua;
	text-align: center;
	font-size: 20pt;
	cursor:pointer;
}
</style>
</head>
<body>
<div class="outer_box">
		<div id="member">회원 로그인</div>
		<div id="inner_owner" onclick="location.href='ownLoginForm.do'">견주 로그인</div>
		<div id="inner_walker" onclick="location.href='wkrLoginForm.do'">도우미 로그인</div>
	</div>

<button onclick="location.href='joinChoice.do'">회원가입</button>
</body>
</html>