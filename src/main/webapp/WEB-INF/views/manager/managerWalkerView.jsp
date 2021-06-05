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
<h3 align="center">${walker.wkr_name }의 정보</h3>
<hr>
<table border="1">
	<tr>
		<th>ID</th>
		<td>${walker.wkr_id }</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${walker.wkr_name }</td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td>${walker.wkr_bth_dt }</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${walker.wkr_addr }</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${walker.wkr_email }</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${walker.wkr_tel }</td>
	</tr>
	<tr>
		<th>양육년수</th>
		<td>${walker.wkr_rs_cnt }</td>
	</tr>
	<tr>
		<th>양육경험</th>
		<td>${walker.wkr_rs_ex }</td>
	</tr>
	<tr>
		<th>경력사항</th>
		<td>${walker.wkr_career }</td>
	</tr>
	<tr>
		<th>가입일</th>
		<td>${walker.wkr_reg_dt }</td>
	</tr>
</table>

<div align="center">
	<input type="button" value="뒤로" onclick="goBack();" />
</div>

</body>
</html>