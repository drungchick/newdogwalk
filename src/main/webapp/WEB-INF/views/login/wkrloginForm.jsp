<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="wkrLogin.do">
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
<button onclick="location.href='joinChoiceForm.do'">회원가입</button>
</form>
</body>
</html>