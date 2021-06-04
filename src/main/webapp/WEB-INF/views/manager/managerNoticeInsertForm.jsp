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
<script type="text/javascript">
	function goBack() {
		history.back();	
	}
</script>
</head>
<body>
<h3 align="center">공지사항</h3>
<hr>
<form action="managerNoticeInsert.do" method="post">
	<table border="1">
		<caption>공지사항 등록</caption>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="nt_sbjt" required="required" autofocus="autofocus">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<textarea rows="10" cols="30" name="nt_cont" required="required"></textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="등록">
				<input type="button" value="뒤로" onclick="goBack();" />
			</th>
		</tr>
	</table>
</form>
</body>
</html>