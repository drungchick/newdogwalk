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
<h3 align="center">${dog.dog_name }의 정보</h3>
<hr>
<table border="1">
	<tr>
		<th>반려견 이름</th>
		<td>${dog.dog_name }</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>${dog.dog_gdr }</td>
	</tr>
	<tr>
		<th>분류</th>
		<td>${dog.dog_size }</td>
	</tr>
	<tr>
		<th>나이</th>
		<td>${dog.dog_age }</td>
	</tr>
	<tr>
		<th>길이</th>
		<td>${dog.dog_len }</td>
	</tr>
	<tr>
		<th>분류</th>
		<td>${dog.dog_wgt }</td>
	</tr>
	<tr>
		<th>중성화</th>
		<td>${dog.dog_ntl_chk }</td>
	</tr>
	<tr>
		<th>공격성</th>
		<td>${dog.dog_agg }</td>
	</tr>
	<tr>
		<th>특징</th>
		<td>${dog.dog_chr }</td>
	</tr>
	<tr>
		<th>병력사항</th>
		<td>${dog.dog_md_hst }</td>
	</tr>
	<tr>
		<th>주인ID</th>
		<td><a href="managerOwnerView.do?own_id=${dog.own_id }">${dog.own_id }</a></td>
	</tr>
</table>

<div align="center">
	<input type="button" value="뒤로" onclick="goBack();" />
</div>

</body>
</html>