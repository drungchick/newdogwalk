<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() { // 반려견이 중성화한 상태인 경우 'N' 라디오버튼 비활성화
		var dog_ntl_chk = "${dog.dog_ntl_chk}";
		if (dog_ntl_chk = "Y") {
			$("#dog_ntl_n").attr('disabled',true);
		}
	})
</script>

</head>
<body>
	<a href="Mypage.do">견주회원 정보</a>
	<br>
	<a href="#">회원탈퇴</a>
	<br>
	<form action="updateDog.do" method="post" name="updtfrm" method="post">
		<table>
			<caption>반려견 정보</caption>
			<tr>
				<td colspan="2">
				<img src="/Dogwalk/dogimg/${dog.dog_pht_nm }" alt="${dog.dog_pht_nm }"  width="400" height="400">
				</td>
			</tr>
			<tr>
				<th>반려견 이름</th>
				<td><input type="text" name="dog_name" value="${dog.dog_name}"
					readonly="readonly">
			</tr>
			<tr>
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
				<td><input type="number" name="dog_age" required="required"
					max="50" min="${dog.dog_age }">년</td>
			</tr>
			<tr>
				<th>길이</th>
				<td><input type="number" name="dog_len" required="required"
					max="3.00" min="${dog.dog_len }" step="0.01">m</td>
			</tr>
			<tr>
				<th>몸무게</th>
				<td><input type="number" name="dog_wgt" required="required"
					max="100.00" min="0.0" step="0.1">kg</td>
			</tr>
			<tr>
				<th>중성화 여부</th>
				<td>
					<input type="radio" id="dog_ntl_y" name="dog_ntl_chk" value="Y"
							required="required">
					<label for="dog_ntl_y">O</label>
					<input type="radio" id="dog_ntl_n" name="dog_ntl_chk" value="N">
					<label for="dog_ntl_n">X</label>
				</td>
			</tr>
			<tr>
				<th>공격성</th>
				<td><input type="radio" id="dog_agg_low" name="dog_agg"
					value="LOW" required="required"> <label for="dog_agg_low">낮음</label>
					<input type="radio" id="dog_agg_medium" name="dog_agg"
					value="AVERAGE" required="required"> <label
					for="dog_agg_medium">보통</label> <input type="radio"
					id="dog_agg_big" name="dog_agg" value="HIGH" required="required">
					<label for="dog_agg_big">높음</label></td>
			</tr>
			<tr>
				<th>병력사항</th>
				<td><textarea name="dog_md_hst">${dog.dog_md_hst }</textarea></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="정보수정 확인"></th>
			</tr>
		</table>
	</form>
</body>
</html>