<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도우미 가입</title>
<style>
.container {
	text-align: center;
}

.title_outer {
	text-align: center;
	width: 500px;
	height: 150px;
	background: gray;
}

.title_inner {
	display: inline-block;
	width: 400px;
	height: 100px;
	background: white;
}

textarea {
	width: 80%;
	height: 100px;
}

#alert-success {
	color: blue;
}

#alert-danger {
	color: red;
}

#id_check {
	color: red;
}

.lc_box {
	width: 30%
}

.lc_add_box {
	width: 10%
}
</style>
<!-- jquery 경로 지정 주의!!! -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	// ID 중복 체크기능
	function idchk() {
		if (!frm.wkr_id.value) {
			alert('아이디를 입력하고 체크하세요.');
			frm.wkr_id.focus();
			return false;
		}
		$.post("confirmWalker.do", "wkr_id=" + frm.wkr_id.value, function(data) {
			$("#id_check").html(data);
		})
	}

	// jquery 적용한 비밀번호 중복확인 기능
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$(".passchk").keyup(function() {
			var pass = $("#pass").val();
			var confirmPass = $("#confirmPass").val();
			if (pass != "" || confirmPass != "") {
				if (pass == confirmPass) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});

	// jquery 적용한 버튼 추가 기능
	$(function() {
		$('#btnAdd').click(function() { // 각 입력자 추가
			$('#lc_add').append('<tr class="lc_row"><td><input type="text" name="lc_cd" required="required"></td><td><input type="text" name="lc_name" required="required"></td><td><input type="text" name="lc_iss_ogz" required="required"></td></tr>');
		$('#btnDel').on('click', function() { // 각 입력자 삭제
			$('.lc_row').last().remove();
			});
		});
	});
</script>
</head>
<body>
	<form action="joinWalker.do" method="post"
		enctype="multipart/form-data" name="frm">
		<div class="container">
			<div class="form_box">
				<table>
					<caption>도우미 정보입력</caption>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="wkr_id" required="required"
							autofocus="autofocus"> <input type="button" value="중복체크"
							onclick="idchk()">
					</tr>
					<tr>
						<th></th>
						<td>
							<div id="id_check"></div>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="password" class="passchk"
							id="pass" required="required"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="confirmPass" class="passchk"
							id="confirmPass" required="required"></td>
					</tr>
					<tr>
						<th></th>
						<td>
							<div class="alert_msg" id="alert-success">비밀번호가 일치합니다.</div>
							<div class="alert_msg" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
						</td>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" required="required">
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="date" name="birth_date" required="required">
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td><input type="radio" id="male" name="gender" value="M"
							required="required"> <label for="male">남성</label> <input
							type="radio" id="female" name="gender" value="F"> <label
							for="female">여성</label></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="address" required="required">
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="email" required="required">
						</td>
					</tr>


					<!-- title="전화형식 3-3,4-4" : 에러가 발생하면 보여줄 메세지에 추가
	 pattern="\d{3}-\d{3,4}-\d{4}" : 	숫자3-숫자3또는4-숫자4자리
	 placeholder="010-1111-1111" : 초기화면에 보여주고 데이터 입력하면 사라져라	 -->
					<tr>
						<th>전화번호</th>
						<td><input type="tel" name="tel" title="전화형식 3-3,4-4"
							required="required" pattern="\d{3}-\d{3,4}-\d{4}"
							placeholder="010-1111-1111"></td>
					</tr>
					<tr>
						<th>자격증 정보
						</th>
					</tr>
						<tr class="lc_info">
							<th>자격증번호</th>
							<th>자격증명</th>
							<th>발급기관</th>
							<th>추가/삭제</th>
						</tr>
					<tbody id="lc_add">
						<tr>					
							<td><input type="text" name="lc_cd" required="required"></td>
							<td><input type="text" name="lc_name" required="required"></td>
							<td><input type="text" name="lc_iss_ogz" required="required"></td>
							<td><input type="button" id="btnAdd" value="추가">
								<input type="button" id="btnDel" value="삭제">
							</td>						
						</tr>
					</tbody>
					<tr>
						<th>양육경험</th>
						<td><textarea name="wkr_rs_ex"
								placeholder="양육경험이 있다면 기재해주세요."></textarea></td>
					<tr>
						<th>양육년수</th>
						<td><input type="number" name="wkr_rs_cnt"
							required="required" max="100" min="0">년</td>
					</tr>
					<tr>
						<th>경력사항</th>
						<td><textarea name="wkr_career"
								placeholder="경력사항이 있다면 작성해주세요."></textarea></td>
					<tr>
					<tr>
						<th>도우미 사진</th>
						<td><input type="file" name="walker_image"></td>
					</tr>
					<tr>
						<td colspan="5"><input type="submit" value="제출" id="submit">
							<input type="reset" value="취소"></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>