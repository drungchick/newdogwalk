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
<form action="mbUpdate.do" method="post" name="frm" onsubmit="return chk2()">
	<input type="hidden" name="mbd_no" value="${mboard.mbd_no }">
	<table>
		<caption>회원정보 수정</caption>
		<tr>
			<th>작성자</th>
			<td>
				${mboard.own_id }
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="mbd_sbjt" required="required" value="${mboard.mbd_sbjt }">
			</td>
		</tr>
		<tr>
			<th>산책대행 시작희망일시</th>
			<td>
				<input type="date" name="mbd_str_dt" required="required" value="${mboard.mbd_str_dt }">
			</td>
		</tr>
		<tr>
			<th>산책대행 종료희망일시</th>
			<td>
				<input type="date" name="mbd_fn_dt" required="required" value="${mboard.mbd_fn_dt }">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<input type="text" name="mbd_cont" required="required" value="${mboard.mbd_cont }">
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="history.back()">
			</th>
		</tr>
	</table>
</form>
</body>
</html>