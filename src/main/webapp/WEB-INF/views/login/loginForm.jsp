<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="login.do">
<table>
	<caption>로그인</caption>
	<tr>
		<th><input type="radio" name="mb_clf_cd" value="1">견주</th>
		<th><input type="radio" name="mb_clf_cd" value="2">도우미</th>
	</tr>
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" name="own_id" required="required" autofocus="autofocus">
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" name="own_pwd" required="required">
	</tr>
	<tr>
		<th colspan="2"><input type="submit" value="확인"></th>
	</tr>
</table>
</form>
<button onclick="location.href='joinForm.do'">회원가입</button>
</body>
</html>