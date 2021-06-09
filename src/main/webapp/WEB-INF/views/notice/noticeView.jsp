<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<h3 align="center">공지사항</h3>
<hr>
<table border="1">
	<caption>상세 내용</caption>
	<tr>
		<th>제목</th>
		<td>${notice.nt_sbjt }</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${notice.nt_reg_dt }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${notice.nt_cont }</td>
	</tr>
</table>

<div align="center">
	<%-- <a href="noticeList.do?pageNum=${pageNum }">목록</a> --%>
	<button onclick="location.href='noticeList.do?pageNum=${pageNum }'">목록</button>
</div>

</body>
</html>