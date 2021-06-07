<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견주 가입</title>
<style>
.container {
	text-align: center;
}

.title_outer {
	text-align: center;
	width: 500px;e
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
</style>
<!-- jquery 경로 지정 주의!!! -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	// ID 중복 체크기능
	// 헷갈릴 수 있으니 id-> own_id로 통일할 것!
	function idchk() {
			if (!frm.own_id.value) {
				alert('아이디를 입력하고 체크하세요.');
				frm.own_id.focus();
				return false;
			}
			$.post("confirmOwner.do", "own_id=" + frm.own_id.value, function(data) {
				$("#id_check").html(data);
			})
		}
	// jquery 적용한 비밀번호 중복확인 기능
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
	<form action="joinOwner.do" method="post" enctype="multipart/form-data"
		name="frm">
		<div class="container">
			<div class="form_box">
				<table>
					<caption>견주 정보입력</caption>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="own_id" required="required"
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
				</table>
			</div>
			<div class="form_box">
				<table>
					<caption>반려견 정보입력</caption>
					<tr>
						<th>반려견 이름</th>
						<td><input type="text" name="dog_name" required="required"
							autofocus="autofocus"></td>
					</tr>
					<tr>
						<th>반려견 성별</th>
						<td><input type="radio" id="dog_male" name="dog_gdr"
							value="M" required="required"> <label for="dog_male">수컷</label>
							<input type="radio" id="dog_female" name="dog_gdr" value="F">
							<label for="dog_female">암컷</label></td>
					</tr>
					<tr>
						<th>품종</th>
						<td><input type="text" name="dog_kind" required="required"></td>
					</tr>
					<tr>
						<th>분류</th>
						<td><input type="radio" id="dog_small" name="dog_size"
							value="SMALL" required="required"> <label for="dog_small">소형</label>
							<input type="radio" id="dog_medium" name="dog_size"
							value="MEDIUM" required="required"> <label
							for="dog_medium">중형</label> <input type="radio" id="dog_big"
							name="dog_size" value="BIG" required="required"> <label
							for="dog_big">대형</label></td>
					</tr>
					<tr>
						<th>나이</th>
						<td><input type="number" name="dog_age" required="required"
							max="50" min="0">년</td>
					</tr>
					<tr>
						<th>길이</th>
						<td><input type="number" name="dog_len" required="required"
							max="3.00" min="0.00" step="0.01">m</td>
					</tr>
					<tr>
						<th>몸무게</th>
						<td><input type="number" name="dog_wgt" required="required"
							max="100.00" min="0.0" step="0.1">kg</td>
					</tr>
					<tr>
						<th>중성화 여부</th>
						<td><input type="radio" id="dog_ntl_y" name="dog_ntl_chk"
							value="Y" required="required"> <label for="dog_ntl_y">O</label>
							<input type="radio" id="dog_ntl_n" name="dog_ntl_chk" value="N">
							<label for="dog_ntl_n">X</label></td>
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
						<td><textarea name="dog_md_hst"
								placeholder="병력사항이 있다면 기재해주세요."></textarea></td>
					</tr>
					<tr>
						<th>강아지 사진</th>
						<td><input type="file" name="dog_image"></td>
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