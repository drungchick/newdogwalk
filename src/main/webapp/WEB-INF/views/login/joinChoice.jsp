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
#inner_dog {
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
		<div id="member">회원 가입</div>
		<div id="inner_dog" onclick="location.href='joinFormOwner.do'">견주</div>
		<div id="inner_walker" onclick="location.href='joinFormWalker.do'">도우미</div>
	</div>
</body>
</html>