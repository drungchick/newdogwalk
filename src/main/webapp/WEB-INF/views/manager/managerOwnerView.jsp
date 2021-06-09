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
<h3 align="center">${owner.own_id }의 정보</h3>
<hr>
<table border="1">
	<tr>
		<th>ID</th>
		<td>${owner.own_id }</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${owner.own_name }</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>${owner.own_gdr }</td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td>${owner.own_bth_dt }</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${owner.own_addr }</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${owner.own_email }</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${owner.own_tel }</td>
	</tr>
	<tr>
		<th>가입일</th>
		<td>${owner.own_reg_dt }</td>
	</tr>
</table>

<div align="center">
	<input type="button" value="뒤로" onclick="goBack();" />
</div>

</body>
</html>