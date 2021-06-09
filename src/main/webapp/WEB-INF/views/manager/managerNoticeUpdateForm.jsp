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
<script type="text/javascript">
	function goBack() {
		history.back();	
	}
</script>
</head>
<body>
<h3 align="center">공지사항 수정</h3>
<hr>
<form action="managerNoticeUpdate.do" method="post" name="frm" onsubmit="return chk()">
<input type="hidden" name="nt_no" value="${notice.nt_no }">
<input type="hidden" name="pageNum" value="${pageNum }">
	<table border="1">
		<caption>수정</caption>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="nt_sbjt" required="required" autofocus="autofocus" value="${notice.nt_sbjt }">
			</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${notice.nt_reg_dt }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="10" cols="30" name="nt_cont" required="required">${notice.nt_cont }</textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="수정">
				<input type="button" value="뒤로" onclick="goBack();" />
			</th>
		</tr>
	</table>
</form>
</body>
</html>