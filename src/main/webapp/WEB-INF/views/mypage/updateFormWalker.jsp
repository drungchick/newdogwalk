<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function pwchk() {
		if (updtfrm.password.value != updtfrm.confirmPass.value) {
			alret("암호와 암호확인이 다릅니다.");
			updtfrm.password.focus();
			return false;
		}
	}
	$(function() {
		$('#btnAdd').click(function() { // 각 입력자 추가
			$('#lc_add').append('<tr class="lc_row"><td><input type="text" name="lc_cd"></td><td><input type="text" name="lc_name"></td><td><input type="text" name="lc_iss_ogz"></td></tr>');
		$('#btnDel').click(function() { // 각 입력자 삭제
			$('.lc_row').last().remove();
			});
		});
	});
</script>
</head>
<body>
<form action="updateWalker.do" name="updtfrm" method="post" onsubmit="return pwchk()">
<a href="#">회원탈퇴</a><br>
	<table>
		<caption>회원정보</caption>
		<tr>
			<td colspan="4">
			<img src="/walkerimg/ ${walker.wkr_pht_nm }" width="500" height="300">
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td colspan="3"><input type="text" name="wkr_id" value="${walker.wkr_id }" readonly="readonly">
		</tr>
		<tr>
			<th>변경할 암호</th>
			<td colspan="3"><input type="password" name="password" required="required" autofocus="autofocus">
			</td>
		</tr>
		<tr>
			<th>변경할 암호 확인</th>
			<td colspan="3"><input type="password" name="confirmPass" required="required"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td colspan="3"><input type="text" name="wkr_name" value="${walker.wkr_name }" required="required">
		</tr>
		<tr>
			<th>생년월일</th>
			<td id="wkr_bth_dt"  colspan="3" >${walker.wkr_bth_dt }</td>
		</tr>
		<tr>
			<th>성별</th>
			<c:if test="${walker.wkr_gdr eq 'M' }">
				<td colspan="3">남성</td>
			</c:if>
			<c:if test="${walker.wkr_gdr eq 'F' }">
				<td colspan="3">여성</td>
			</c:if>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="3"><input type="text" name="wkr_addr" value="${walker.wkr_addr }" required="required">
			</td>
		</tr>

		<!-- title="전화형식 3-3,4-4" : 에러가 발생하면 보여줄 메세지에 추가
	 pattern="\d{3}-\d{3,4}-\d{4}" : 	숫자3-숫자3또는4-숫자4자리
	 placeholder="010-1111-1111" : 초기화면에 보여주고 데이터 입력하면 사라져라	 -->
		<tr>
			<th>전화번호</th>
			<td colspan="3"><input type="tel" name="wkr_tel" value="${walker.wkr_tel }" required="required"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td colspan="3"><input type="email" name="wkr_email" value="${walker.wkr_email }" required="required"></td>
		</tr>
		<tr>
			<th>양육경험</th>
			<td colspan="3"><textarea name="wkr_rs_ex">${walker.wkr_rs_ex }</textarea></td>
		<tr>
		<tr>
			<th>양육년수</th>
			<td colspan="3"><input type="number" name="wkr_rs_cnt" value="${walker.wkr_rs_cnt }" required="required"></td>
		<tr>
		<tr>
			<th>경력사항</th>
			<td colspan="3"><textarea name="wkr_career">${walker.wkr_career }</textarea></td>
		</tr>
		<tr>
			<th colspan="4">자격증 정보</th>
		</tr>
		<tr class="lc_info">
			<th>자격증번호</th>
			<th>자격증명</th>
			<th>발급기관</th>
			<th>추가/삭제</th>
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
			<td>
			</td>
		</tr>
		</c:forEach>
		<tbody id="lc_add">
		<tr>					
			<td><input type="text" name="lc_cd"></td>
			<td><input type="text" name="lc_name"></td>
			<td><input type="text" name="lc_iss_ogz"></td>
			<td><button id="btnAdd">+</button>
			<button id="btnDel">-</button></td>						
		</tr>
		</tbody>
		<tr>
			<th colspan="4"><input type="submit" value="정보수정 확인"></th>
		</tr>
	</table>
</form>
</body>
</html>