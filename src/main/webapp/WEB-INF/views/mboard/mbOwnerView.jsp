<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="sessionChk.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
</head>
<body>
<table>
	<caption>산책대행 요청정보</caption>
	<tr>
		<th>작성자</th>
		<td>${mboard.own_id }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${mboard.mbd_sbjt }</td>
	</tr>
	<tr>
		<th>작성일시</th>
		<td>${mboard.mbd_reg_dt }</td>
	</tr>
	<tr>
		<th>산책대행 시작희망일시</th>
		<td>${mboard.mbd_str_dt }</td>
	</tr>
	<tr>
		<th>산책대행 종료희망일시</th>
		<td>${mboard.mbd_fn_dt }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${mboard.mbd_cont }</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="button" value="강아지 프로필" onclick="location.href='dpView.do'">
		</th>
	</tr>
	
</table>
<div align="center">
			<a href="mbList.do">매칭게시판</a>
			
			<a href="mbUpdateForm.do?mbd_no=${mboard.mbd_no }&pageNum=${pageNum}">내용수정</a>
	
			<a href="mbDelete.do?mbd_no=${mboard.mbd_no }">요청삭제</a>
	
			<a href="logout.do">로그아웃</a>
</div>
</body>
</html>