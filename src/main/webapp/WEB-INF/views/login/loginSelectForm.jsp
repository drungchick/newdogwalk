<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
	<div class="SelectOuterWrapper">
		<div class="SelectInnerWrapper" >
			<h3 align="center">Login</h3>
			<br>
			<br>
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='ownLoginForm.do'">Owner</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='wkrLoginForm.do'">Walker</button>
		</div>
	</div>
	<!-- <div align="left">
		<button type="button" class="btn btn-outline-primary" onclick="location.href='main.do'">Main</button>
		<button type="button" class="btn btn-primary" onclick="location.href='joinChoice.do'">Join</button>
	</div> -->
</body>
</html>