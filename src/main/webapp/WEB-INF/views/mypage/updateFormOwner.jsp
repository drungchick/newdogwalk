<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- css 연결 -->
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function () {
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$(".passchk").keyup(function(){
		var pass = $("#pass").val();
		var confirmPass = $("#confirmPass").val();
		if(pass != "" || confirmPass != ""){ 
			if(pass == confirmPass){ 
				$("#alert-success").show(); 
				$("#alert-danger").hide(); 
				$("#submit").removeAttr("disabled"); 
			}else{ 
				$("#alert-success").hide(); 
				$("#alert-danger").show(); 
				$("#submit").attr("disabled", "disabled"); 
			} 
		}
	});
});
</script>
</head>
<body>
<a href="MypageDog.do">반려견 정보</a><br>
<a href="deleteOwner.do">회원탈퇴</a><br>
<form action="updateOwner.do" name="updtfrm" method="post" onsubmit="return pwchk()">
<div class="container">
	<div id="content" align="center">
	<h1 align="center">회원정보</h1>
	<br>
	<table class="table table-striped">
		<tr align="center">
			<th scope="row">ID</th>
			<td><input class="form-control" type="text" name="own_id" value="${owner.own_id }" readonly="readonly">
			</td>
		</tr>
		<tr align="center">
			<th scope="row">Password</th>
			<td><input type="password" name="password" id="pass" class="form-control passchk" required="required" autofocus="autofocus">
			</td>
		</tr>
		<tr align="center">
			<th scope="row">변경할 암호 확인</th>
			<td><input type="password" name="confirmPass" id="confirmPass" class="form-control passchk" required="required"></td>
		</tr>
		<tr align="center">
			<th scope="row"></th>
			<td>
				<div class="alert_msg" id="alert-success">변경한 암호가 일치합니다.</div>
				<div class="alert_msg" id="alert-danger">변경한 암호가 일치하지 않습니다.</div>
			</td>
		</tr>
		<tr align="center">
			<th scope="row">Name</th>
			<td><input class="form-control" type="text" name="own_name" value="${owner.own_name }" readonly="readonly">
		</tr>
		<tr align="center">
			<th scope="row">Brithday</th>
			<td id="own_bth_dt" align="left">${owner.own_bth_dt }</td>
		</tr>
		<tr align="center">
			<th scope="row">Gender</th>
			<c:if test="${owner.own_gdr eq 'M' }">
				<td align="left">Male</td>
			</c:if>
			<c:if test="${owner.own_gdr eq 'F' }">
				<td align="left">Female</td>
			</c:if>
		</tr>
		<tr align="center">
			<th scope="row">Address</th>
			<td><input class="form-control" type="text" name="own_addr" value="${owner.own_addr }" required="required">
			</td>
		</tr>
		<tr align="center">
			<th scope="row">Tel</th>
			<td><input class="form-control" type="tel" name="own_tel" title="전화형식 3-3,4-4"
							required="required" pattern="\d{3}-\d{3,4}-\d{4}" value="${owner.own_tel }"></td>
		</tr>
		<tr align="center">
			<th scope="row">E-mail</th>
			<td><input class="form-control" type="email" name="own_email" value="${owner.own_email }" required="required">
			</td>
		</tr>
	</table>
	</div>
	<br>	
	<div align="center">
		<button type="submit" class="btn btn-primary btn-lg" id="submit">Submit</button>
		<button type="reset" class="btn btn-primary btn-lg" onclick="history.go(-1)">Cancel</button>
	</div>
</div>
</form>
</body>
</html>

<%-- 	<table>
		<caption>회원정보</caption>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="own_id" value="${owner.own_id }" readonly="readonly">
		</tr>
		<tr>
			<th>변경할 암호</th>
			<td colspan="3"><input type="password" name="password" id="pass" class="passchk" required="required" autofocus="autofocus">
			</td>
		</tr>
		<tr>
			<th>변경할 암호 확인</th>
			<td colspan="3"><input type="password" name="confirmPass" id="confirmPass" class="passchk" required="required"></td>
		</tr>
		<tr>
			<th></th>
			<td>
				<div class="alert_msg" id="alert-success">변경한 암호가 일치합니다.</div>
				<div class="alert_msg" id="alert-danger">변경한 암호가 일치하지 않습니다.</div>
			</td>
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
			<td><input type="text" name="own_addr" value="${owner.own_addr }" required="required">
			</td>
		</tr>

		<!-- title="전화형식 3-3,4-4" : 에러가 발생하면 보여줄 메세지에 추가
	 pattern="\d{3}-\d{3,4}-\d{4}" : 	숫자3-숫자3또는4-숫자4자리
	 placeholder="010-1111-1111" : 초기화면에 보여주고 데이터 입력하면 사라져라	 -->
		<tr>
			<th>전화번호</th>
			<td><input type="tel" name="own_tel" title="전화형식 3-3,4-4"
							required="required" pattern="\d{3}-\d{3,4}-\d{4}" value="${owner.own_tel }"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name="own_email" value="${owner.own_email }" required="required"></td>
		</tr>
		<tr>
			<th colspan="2"><input type="submit" id="submit" value="정보수정 확인">
				<input type="reset" id="reset" value="정보수정 취소">
			</th>
		</tr>
	</table> --%>