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
<!-- <form action="wkrLogin.do">
<table>
	<caption>도우미 로그인</caption>
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" name="wkr_id" required="required" autofocus="autofocus">
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" name="wkr_pwd" required="required">
	</tr>
	<tr>
		<th colspan="2"><input type="submit" value="확인"></th>
	</tr>
</table>
<button onclick="location.href='joinChoice.do'">회원가입</button>
</form> -->
<form action="wkrLogin.do">
	<div class="SelectOuterWrapper">
		<div class="LoginInnerWrapper" >
			<h3 align="center">Walker Login</h3>
		    <br>
		    <div class="form-group">
		      <label for="id">ID</label>
		      <input type="text" class="form-control" id="id" name="wkr_id" required="required" autofocus="autofocus">
		    </div>
		    <div class="form-group">
		      <label for="password">Password</label>
		      <input type="password" class="form-control" id="password" name="wkr_pwd" required="required">
		    </div>
		    <br>
		    <button type="submit" class="btn btn-primary">Log in</button>
		</div>
	</div>
</form>
	<div align="left">
		<button type="button" class="btn btn-outline-primary" onclick="location.href='main.do'">Main</button>
		<button type="button" class="btn btn-primary" onclick="location.href='joinChoice.do'">Join</button>
	</div>
</body>
</html>