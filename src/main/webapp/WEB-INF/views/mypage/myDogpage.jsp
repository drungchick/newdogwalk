<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려견 정보 수정</title>
</head>
<body>
<a href="Mypage.do">견주회원 정보</a><br>
<a href="#">회원탈퇴</a><br>
	<table>
		<caption>반려견 정보</caption>
		<tr>
			<th>반려견 이름</th>
			<td><input type="text" name="dog_name" value="${dog.dog_name}" readonly="readonly">
		</tr>
		<tr>
			<th>성별</th>
			<c:if test="${dog.dog_gdr eq 'M' }">
				<td>암컷</td>
			</c:if>
			<c:if test="${dog.dog_gdr eq 'F' }">
				<td>수컷</td>
			</c:if>
		</tr>
		<tr>
			<th>품종</th>
			<td>${dog.dog_kind}</td>
		</tr>
		<tr>
			<th>나이</th>
			<td>${dog.dog_age} 년</td>
		</tr>
		<tr>
			<th>길이</th>
			<td>${dog.dog_len} m</td>
		</tr>
		<tr>
			<th>몸무게</th>
			<td>${dog.dog_wgt} kg</td>
		</tr>
		<tr>
			<th>중성화 여부</th>
			<td>
			<c:if test="${dog.dog_ntl_chk eq 'Y' }">
				<input type="radio" id="dog_ntl_y" readonly="readonly" checked="checked"> 
				<label for="dog_ntl_y">O</label>
			</c:if>
			<c:if test="${dog.dog_ntl_chk eq 'N' }">
				<input type="radio" id="dog_ntl_n" readonly="readonly" checked="checked"> 
				<label for="dog_ntl_n">X</label>
			</c:if>
			</td>
		</tr>
		<tr>
			<th>공격성</th>
			<td>			
			<c:if test="${dog.dog_agg eq 'LOW' }">
				<input type="radio" id="dog_agg_low" readonly="readonly" checked="checked">
				<label for="dog_agg_low">낮음</label>
			</c:if>
			<c:if test="${dog.dog_agg eq 'AVERAGE' }">
				<input type="radio" id="dog_agg_average" readonly="readonly" checked="checked">
				<label for="dog_agg_average">보통</label>
			</c:if>
			<c:if test="${dog.dog_agg eq 'HIGH' }">
				<input type="radio" id="dog_agg_high" readonly="readonly" checked="checked">
				<label for="dog_agg_high">높음</label>
			</c:if>
			</td>
		</tr>
		<tr>
			<th>병력사항</th>
			<td><textarea name="dog_md_hst" readonly="readonly">${dog.dog_md_hst }</textarea></td>
		</tr>
		<tr>
			<th colspan="3"><button onclick ="location.href = 'updateFormDog.do'" >정보 수정</button></th>
		</tr>
	</table>
</body>
</html>