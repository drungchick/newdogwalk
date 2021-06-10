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
<form action="ownLogin.do">
	<div class="SelectOuterWrapper">
		<div class="LoginInnerWrapper" >
			<h3 align="center">Owner Login</h3>
		    <br>
		    <div class="form-group">
		      <label for="id">ID</label>
		      <input type="text" class="form-control" id="id" name="own_id" required="required" autofocus="autofocus">
		    </div>
		    <div class="form-group">
		      <label for="password">Password</label>
		      <input type="password" class="form-control" id="password" name="own_pwd" required="required">
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