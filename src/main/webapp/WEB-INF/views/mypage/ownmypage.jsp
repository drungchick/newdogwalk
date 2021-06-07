<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="MypageDog.do">반려견 정보</a><br>
<a href="#">회원탈퇴</a><br>
	<table>
		<caption>회원정보</caption>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="own_id" value="${owner.own_id }" readonly="readonly">
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="own_name" value="${owner.own_name }" readonly="readonly">
		</tr>
		<tr>
			<th>생년월일</th>
			<td id="own_bth_dt">${owner.own_bth_dt }</td>
		</tr>
		<tr>
			<th>성별</th>
			<c:if test="${owner.own_gdr eq 'M' }">
				<td>남성</td>
			</c:if>
			<c:if test="${owner.own_gdr eq 'F' }">
				<td>여성</td>
			</c:if>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="own_addr" value="${owner.own_addr }" readonly="readonly" >
			</td>
		</tr>

		<!-- title="전화형식 3-3,4-4" : 에러가 발생하면 보여줄 메세지에 추가
	 pattern="\d{3}-\d{3,4}-\d{4}" : 	숫자3-숫자3또는4-숫자4자리
	 placeholder="010-1111-1111" : 초기화면에 보여주고 데이터 입력하면 사라져라	 -->
		<tr>
			<th>전화번호</th>
			<td><input type="tel" name="own_tel" value="${owner.own_tel }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name="own_email" value="${owner.own_email }" readonly="readonly"></td>
		</tr>
		<tr>
			<th colspan="3"><button onclick ="location.href = 'updateFormOwner.do'" >정보 수정</button></th>
		</tr>
	</table>
</body>
</html>