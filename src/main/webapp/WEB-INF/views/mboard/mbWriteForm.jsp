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
<form action="mbWrite.do" method="post" name="frm">
<input type="hidden" name="mbd_no" value="${mboard.mbd_no}">
<input type="hidden" name="own_id" value="${member.own_id}">
<input type="hidden" name="pageNum" value="${pageNum}">
	<table>
		<caption>산책 요청 작성</caption>
		<!-- 작성자, 작성자 등록일은 히든으로 받아서 넘길 예정. -->
		<tr>
			<th>작성자</th>
			<td>${mboard.own_id }</td>
			<td>
				<input type="text" name="own_id" required="required">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="mbd_sbjt" required="required" autofocus="autofocus">
			</td>
		</tr>
		<tr>
			<th>산책대행 시작희망일시</th>
			<td>
				<input type="date" name="mbd_str_dt" required="required">
			</td>
		</tr>
		<tr>
			<th>산책대행 종료희망일시</th>
			<td>
				<input type="date" name="mbd_fn_dt" required="required">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="5" cols="40" name="mbd_cont" required="required"></textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="확인">
			</th>
		</tr>
	</table>
</form>
</body>
</html>