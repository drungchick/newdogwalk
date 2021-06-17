<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>반려견 정보</title>
<!-- css 연결 -->
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<div class="container">
	<div id="content" align="center">
		<h1 align="center">반려견 정보</h1>
		<br>
		<table class="table table-striped">
			<tr align="center">
				<th scope="row" colspan="2">
				<img src="/Dogwalk/dogimg/${dog.dog_pht_nm }" alt="${dog.dog_pht_nm }"  width="400" height="400" >
				</th>
			</tr>
			<tr align="center">
				<th scope="row">Dog Name</th>
				<td><input class="form-control" type="text" name="dog_name" value="${dog.dog_name}" readonly="readonly">
			</tr>
			<tr align="center">
				<th scope="row">Dog Gender</th>
				<c:if test="${dog.dog_gdr eq 'M' }">
				<td align="left">Male</td>
				</c:if>
				<c:if test="${dog.dog_gdr eq 'F' }">
				<td align="left">Female</td>
				</c:if>
			</tr>
			<tr align="center">
				<th scope="row">Dog Kind</th>
				<td align="left">${dog.dog_kind}</td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Age</th>
				<td align="left">${dog.dog_age} 년</td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Length(Centimeter)</th>
				<td align="left">${dog.dog_len} cm</td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Weight(Kg)</th>
				<td align="left">${dog.dog_wgt} kg</td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Neutralization</th>
				<td>
					<input type="radio" id="dog_ntl_y" name="dog_ntl_chk" value="Y" readonly="readonly" <c:if test="${dog.dog_ntl_chk eq 'Y' }">checked</c:if>> 
					<label for="dog_ntl_y">YES</label>			
					<input type="radio" id="dog_ntl_n" name="dog_ntl_chk" value="N" readonly="readonly" <c:if test="${dog.dog_ntl_chk eq 'N' }">checked</c:if>> 
					<label for="dog_ntl_n">NO</label>
				</td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Aggression</th>
				<td>
					<input type="radio" id="dog_agg_low" name="dog_agg" value="LOW" readonly="readonly" <c:if test="${dog.dog_agg eq 'LOW' }">checked</c:if>>
					<label for="dog_agg_low">Low</label>		
					<input type="radio" id="dog_agg_average" name="dog_agg" value="AVERAGE" readonly="readonly" <c:if test="${dog.dog_agg eq 'AVERAGE' }">checked</c:if>>
					<label for="dog_agg_average">Average</label>			
					<input type="radio" id="dog_agg_high" name="dog_agg" value="HIGH" readonly="readonly" <c:if test="${dog.dog_agg eq 'HIGH' }">checked</c:if>>
					<label for="dog_agg_high">High</label>				
				</td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Character</th>
				<td><textarea class="form-control" name="dog_chr" readonly="readonly">${dog.dog_chr }</textarea></td>
			</tr>
			<tr align="center">
				<th scope="row">Medical History</th>
				<td><textarea class="form-control" name="dog_md_hst" readonly="readonly">${dog.dog_md_hst }</textarea></td>
			</tr>
		</table>
	</div>
	<br>
	<div align="center">
		<button type="button" class="btn btn-primary btn-lg" onclick ="location.href = 'updateFormDog.do'" >정보 수정</button>
	</div>
</div>
</body>
</html>
<%-- 	<table>
		<caption>반려견 정보</caption>
		<tr>
			<td colspan="2">
			<img src="/Dogwalk/dogimg/${dog.dog_pht_nm }" alt="${dog.dog_pht_nm }"  width="400" height="400">
			</td>
		</tr>
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
				<input type="radio" id="dog_ntl_y" name="dog_ntl_chk" value="Y" readonly="readonly" <c:if test="${dog.dog_ntl_chk eq 'Y' }">checked</c:if>> 
				<label for="dog_ntl_y">O</label>			
				<input type="radio" id="dog_ntl_n" name="dog_ntl_chk" value="N" readonly="readonly" <c:if test="${dog.dog_ntl_chk eq 'N' }">checked</c:if>> 
				<label for="dog_ntl_n">X</label>
			</td>
		</tr>
		<tr>
			<th>공격성</th>
			<td>
				<input type="radio" id="dog_agg_low" name="dog_agg" value="LOW" readonly="readonly" <c:if test="${dog.dog_agg eq 'LOW' }">checked</c:if>>
				<label for="dog_agg_low">낮음</label>		
				<input type="radio" id="dog_agg_average" name="dog_agg" value="AVERAGE" readonly="readonly" <c:if test="${dog.dog_agg eq 'AVERAGE' }">checked</c:if>>
				<label for="dog_agg_average">보통</label>			
				<input type="radio" id="dog_agg_high" name="dog_agg" value="HIGH" readonly="readonly" <c:if test="${dog.dog_agg eq 'HIGH' }">checked</c:if>>
				<label for="dog_agg_high">높음</label>
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
 --%>