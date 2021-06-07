<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	도우미 메인
		<h2>${wkr_id }님 안녕하세요</h2>
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