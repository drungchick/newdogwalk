<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Main Main Main
		<table>
			<tr>
				<td><button onclick="location.href='view.do'">회원정보 조회</button></td>
			</tr>
			<tr>
				<td><button onclick="location.href='updateForm.do'">회원정보
						수정</button></td>
			</tr>
			<tr>
				<td><button onclick="del()">회원탈퇴</button></td>
			</tr>
			<tr>
				<td><button onclick="location.href='logout.do'">로그아웃</button></td>
			</tr>

		</table>
</body>
</html>