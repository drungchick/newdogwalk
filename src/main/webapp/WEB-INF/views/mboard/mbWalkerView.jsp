<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="sessionChk.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<script type="text/javascript">
		function goBack() {
			history.back();	
		}
	</script>
</head>
<body>
<div class="container">
	<div id="content" align="center">
		<h1 align="center">Walk!</h1>
		<br>
		<table class="table table-striped">
			<tr align="center">
      			<th scope="row">Writer</th>
		      	<td>${mboard.own_id }</td>
    		</tr>
    		<tr align="center">
      			<th scope="row">Subject</th>
		      	<td>${mboard.mbd_sbjt }</td>
    		</tr>
    		<tr align="center">
      			<th scope="row">Registration Date</th>
		      	<td>${mboard.mbd_reg_dt }</td>
    		</tr>
    		<tr align="center">
      			<th scope="row">Start Date</th>
		      	<td>${mboard.mbd_str_dt }</td>
    		</tr>
    		<tr align="center">
      			<th scope="row">End Date</th>
		      	<td>${mboard.mbd_fn_dt }</td>
    		</tr>
    		<tr align="center">
      			<th class="align-middle" scope="row">Content</th>
		      	<td><textarea rows="5" cols="70" style="border:none;">${mboard.mbd_cont }</textarea></td>
    		</tr>
    		<tr align="center">
    			<th class="align-middle" scope="row">Profile</th>
    			<td>
    				<a href="mbDogProfileView.do?own_id=${mboard.own_id }&pageNum=${currentPage}" class="btn btn-primary btn-lg" role="button">Dog</a>
    				<a href="ownerProfileView.do?own_id=${mboard.own_id }" class="btn btn-secondary btn-lg" role="button">Owner</a>
    			</td>
    		</tr>
    		<%-- <c:if test="${mboard.own_id == sessionScope.own_id }">
    		<tr align="center">
    			<th class="align-middle" scope="row">Update/Delete</th>
    			<td>
    				<a href="mbUpdateForm.do?mbd_no=${mboard.mbd_no }&pageNum=${pageNum}" class="btn btn-primary btn-sm" role="button">Update</a>
    				<a href="mbDelete.do?mbd_no=${mboard.mbd_no }" class="btn btn-secondary btn-sm" role="button">Delete</a>
    			</td>
    		</tr>
    		</c:if> --%>
		</table>
		
		<div class="container">
			<div id="content" align="center">
				<a href="WkrBookingAction.do?mbd_no=${mboard.mbd_no }&wkr_reg_no=${wkr_reg_no }&wkr_id=${wkr_id }" class="btn btn-info btn-lg" role="button">Apply</a>
    			<button type="button" class="btn btn-primary btn-lg" onclick="goBack();">Back</button>
			</div>
		</div>
		
	</div>
</div>


<%-- <table>
	<caption>산책대행 요청정보</caption>
	<tr>
		<th>작성자</th>
		<td>${mboard.own_id }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${mboard.mbd_sbjt }</td>
	</tr>
	<tr>
		<th>작성일시</th>
		<td>${mboard.mbd_reg_dt }</td>
	</tr>
	<tr>
		<th>산책대행 시작희망일시</th>
		<td>${mboard.mbd_str_dt }</td>
	</tr>
	<tr>
		<th>산책대행 종료희망일시</th>
		<td>${mboard.mbd_fn_dt }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${mboard.mbd_cont }</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="button" value="강아지 프로필" onclick="location.href='mbDogProfileView.do?own_id=${mboard.own_id }'">
			<input type="button" value="신청" onclick="location.href='WkrBookingAction.do?mbd_no=${mboard.mbd_no }&wkr_reg_no=${wkr_reg_no }&wkr_id=${wkr_id }'">
			<input type="button" value="신청" onclick="location.href='bookingAction.do?mbd_no=${mboard.mbd_no }&wkr_reg_no=${sessionScope.wkr_reg_no }&wkr_id=${sessionScope.wkr_id }'">
		</th>
	</tr>
</table>
<div align="center">
			<a href="mbList.do">매칭게시판</a>
			<a href="logout.do">로그아웃</a>
</div> --%>
</body>
</html>