<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("common.css");
</style>
</head>
<body>
<form action="managerLogin.do">
<h1>관리자 로그인</h1>
<table>
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" name="mng_id" required="required" autofocus="autofocus">
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="text" name="mng_pwd" required="required">
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="로그인">
		</th>
</table>
</form>
</body>
</html>