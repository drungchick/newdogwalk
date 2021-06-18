<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
<!-- jquery 경로 지정 주의!!! -->
<script type="text/javascript" src="js/jquery.js"></script>
<script>
	var jb = jQuery.noConflict(); // bootstrap의 jquery 와 버전 충돌로 해당 버전에서 사용할 jquery 선택자 변수 지정
</script>
<script type="text/javascript">
	
	// 자격증 중복체크
	function lcchk() {		
		jb.post("confirmLicense.do", "lc_cd=" + frm.lc_cd.value, function(data) {
			jb("#lc_check").html(data);
		})
	}
	// ID 중복 체크기능
	function idchk() {
		if (!frm.wkr_id.value) {
			alert('아이디를 입력하고 체크하세요.');
			frm.wkr_id.focus();
			return false;
		}
		jb.post("confirmWalker.do", "wkr_id=" + frm.wkr_id.value, function(data) {
			jb("#id_check").html(data);
		})
	}

	// jquery 적용한 비밀번호 중복확인 기능
	jb(function() {
		jb("#alert-success").hide();
		jb("#alert-danger").hide();
		jb(".passchk").keyup(function() {
			var pass = jb("#pass").val();
			var confirmPass = jb("#confirmPass").val();
			if (pass != "" || confirmPass != "") {
				if (pass == confirmPass) {
					jb("#alert-success").show();
					jb("#alert-danger").hide();
					jb("#submit").removeAttr("disabled");
				} else {
					jb("#alert-success").hide();
					jb("#alert-danger").show();
					jb("#submit").attr("disabled", "disabled");
				}
			}
		});
	});

	// jquery 적용한 버튼 추가 기능
	jb(function() {
		jb('#btnAdd').click(function() { // 각 입력자 추가
			jb('#lc_add').append('<tr class="lc_row"><td><input type="text" class="form-control" name="lc_cd" required="required" maxlength="9" onkeyup="lcchk()"></td><td><input type="text" class="form-control" name="lc_name" required="required"></td><td><input type="text" class="form-control" name="lc_iss_ogz" required="required"></td></tr>');
			jb('#btnDel').on('click', function() { // 각 입력자 삭제
				jb('.lc_row').last().remove();
			});
		});
	});
</script>
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
<form action="joinWalker.do" method="post" enctype="multipart/form-data" name="frm">
	<div class="JoinWrapper">
		<div class="form-group">
			<fieldset>
				<h1 align="center">Walker Profile</h1>
				<br>
				<div class="form-group">
      				<h4><label for="id">Walker ID</label></h4>
      				<input type="text" class="form-control" id="id" name="wkr_id" required="required" autofocus="autofocus">
      				<button type="button" class="btn btn-outline-primary" onclick="idchk()">Check</button>
      				<div id="id_check"></div>
    			</div>
    			
    			<div class="form-group">
				    <h4><label for="pass">Password</label></h4>
				    <input type="password" class="form-control passchk" id="pass" name="password" required="required">
    			</div>
  
    			<div class="form-group">
				    <h4><label for="confirmPass">Password(Confirm)</label></h4>
				    <input type="password" class="form-control passchk" id="confirmPass" name="confirmPass" required="required">
				    <div class="alert_msg" id="alert-success">비밀번호가 일치합니다.</div>
					<div class="alert_msg" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
    			</div>
    			
    			<div class="form-group">
      				<h4><label for="name">Name</label></h4>
      				<input type="text" class="form-control" id="name" name="name" required="required">
    			</div>
    			
    			<div class="form-group">
      				<h4><label for="birth">Birth Date</label></h4>
      				<input type="date" class="form-control" id="birth" name="birth_date" required="required">
    			</div>
    			
    			<br>
    			<fieldset class="form-group">
			      	<h4>Gender</h4>
			      		<div class="form-check">
			        		<label class="form-check-label">
			          		<input type="radio" class="form-check-input" name="gender" id="male" value="M">Man</label>
			      		</div>
			      		<div class="form-check">
			        		<label class="form-check-label">
			          		<input type="radio" class="form-check-input" name="gender" id="female" value="F">Woman</label>
			      		</div>
    			</fieldset>
    			<br>
    			
    			<div class="form-group">
      				<h4><label for="addr">Address</label></h4>
      				<input type="text" class="form-control" id="addr" name="address" required="required">
    			</div>
    			
    			<div class="form-group">
      				<h4><label for="email">E-mail</label></h4>
      				<input type="text" class="form-control" id="email" name="email" required="required">
    			</div>
    			
    			<div class="form-group">
      				<h4><label for="tel">Tel</label></h4>
      				<input type="tel" class="form-control" id="tel" name="tel" required="required" 
      				title="전화형식 3-3,4-4" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="010-1111-1111">
    			</div>
    			
    			<div class="form-group">
    				<h4>License</h4>
    				<table class="table table-hover">
						<thead>
					    	<tr class="lc_info" align="center">
					      		<th scope="col">LC.NO</th>
					      		<th scope="col">LC.NAME</th>
					      		<th scope="col">ISSUER</th>
					      		<th scope="col">ADD/DELETE</th>
					    	</tr>
  						</thead>
  						<tbody id="lc_add">
  							<tr align="center">
							    <td>
							    	<input type="text" class="form-control" name="lc_cd" maxlength="9" required="required" onkeyup="lcchk()"> <!--  lcalert()" -->
							    </td>
							    <td>
							    	<input type="text" class="form-control" name="lc_name" required="required">
							    </td>
							    <td>
							    	<input type="text" class="form-control" name="lc_iss_ogz" required="required">
							    </td>
							    <td>
									<div class="btn-group mr-2" role="group" aria-label="Second group">
										<button type="button" class="btn btn-outline-primary" id="btnAdd" value="추가">+</button>
										<button type="button" class="btn btn-outline-primary"id="btnDel" value="삭제">-</button>
									</div>
							    </td>
   							</tr>
  						</tbody>
  						<tr>
							<th colspan="4">
							<div id="lc_check"></div>
							</th>
						</tr>
  					</table>
    			</div>
    			
    			<div class="form-group">
      				<h4><label for="rp">Rearing Period(Year)</label></h4>
      				<input type="number" class="form-control" id="rp" name="wkr_rs_cnt" max="100" min="0" required="required">
    			</div>
    			
    			<div class="form-group">
      				<h4><label for="re">Rearing Experience</label></h4>
      				<textarea class="form-control" name="wkr_rs_ex" id="re" rows="8" placeholder="Rearing Experience"></textarea>
    			</div>
    			
    			<div class="form-group">
      				<h4><label for="career">Walker Career</label></h4>
      				<textarea class="form-control" name="wkr_career" id="career" rows="8" placeholder="Career"></textarea>
    			</div>
    			
    			<div class="form-group">
			      	<h4><label for="picture">Walker Picture</label></h4>
			      	<input type="file" class="form-control-file" name="walker_image" id="picture" required="required" aria-describedby="fileHelp">
					 <small id="fileHelp" class="form-text text-muted">This is some placeholder block-level help text for the above input.</small>
   				</div>
   				
   				<br>
   				<br>
   				
   				<div align="center">
   					<button type="submit" class="btn btn-primary btn-lg">Submit</button>
   				</div>
    			
			</fieldset>
		</div>
	</div>
</form>

	<!-- <form action="joinWalker.do" method="post"
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


					title="전화형식 3-3,4-4" : 에러가 발생하면 보여줄 메세지에 추가
	 pattern="\d{3}-\d{3,4}-\d{4}" : 	숫자3-숫자3또는4-숫자4자리
	 placeholder="010-1111-1111" : 초기화면에 보여주고 데이터 입력하면 사라져라	
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
	</form> -->
</body>
</html>