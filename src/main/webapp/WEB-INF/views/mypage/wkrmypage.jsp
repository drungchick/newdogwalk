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
<a href="#">회원탈퇴</a><br>
	<table>
		<caption>회원정보</caption>
		<tr>
			<td colspan="3">
			<img src="/walkerimg/${walker.wkr_pht_nm }" width="500" height="300">
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="wkr_id" value="${walker.wkr_id }" readonly="readonly">
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="wkr_name" value="${walker.wkr_name }" readonly="readonly">
		</tr>
		<tr>
			<th>생년월일</th>
			<td id="wkr_bth_dt">${walker.wkr_bth_dt }</td>
		</tr>
		<tr>
			<th>성별</th>
			<c:if test="${walker.wkr_gdr eq 'M' }">
				<td>남성</td>
			</c:if>
			<c:if test="${walker.wkr_gdr eq 'F' }">
				<td>여성</td>
			</c:if>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="wkr_addr" value="${walker.wkr_addr }" readonly="readonly" >
			</td>
		</tr>

		<!-- title="전화형식 3-3,4-4" : 에러가 발생하면 보여줄 메세지에 추가
	 pattern="\d{3}-\d{3,4}-\d{4}" : 	숫자3-숫자3또는4-숫자4자리
	 placeholder="010-1111-1111" : 초기화면에 보여주고 데이터 입력하면 사라져라	 -->
		<tr>
			<th>전화번호</th>
			<td><input type="tel" name="wkr_tel" value="${walker.wkr_tel }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name="wkr_email" value="${walker.wkr_email }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>양육경험</th>
			<td><textarea name="wkr_rs_ex" readonly="readonly">${walker.wkr_rs_ex }</textarea></td>
		<tr>
		<tr>
			<th>양육년수</th>
			<td><input type="number" name="wkr_rs_cnt" readonly="readonly" value="${walker.wkr_rs_cnt }"></td>
		<tr>
		<tr>
			<th>경력사항</th>
			<td><textarea name="wkr_career" readonly="readonly">${walker.wkr_career }</textarea></td>
		</tr>
		<tr>
			<th>자격증 정보</th>
		</tr>
		<tr class="lc_info">
			<th>자격증번호</th>
			<th>자격증명</th>
			<th>발급기관</th>
		</tr>
		<c:forEach var="lc_list" items="${licenselst }">
		<tr>
			<td>
				${lc_list.lc_cd }
			</td>
			<td>
				${lc_list.lc_name }
			</td>
			<td>
				${lc_list.lc_iss_ogz }
			</td>
		</tr>
		</c:forEach>
		<tr>
			<th colspan="3"><button onclick ="location.href = 'updateFormWalker.do'" >정보 수정</button></th>
		</tr>
	</table>
</body>
</html>