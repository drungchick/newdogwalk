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
	<script type="text/javascript">
		function goBack() {
			history.back();	
		}
	</script>
</head>
<body>
<div class="container">
	<div id="content align="center>
		<h1 align="center">${owner.own_id } Profile</h1>
		<br>
		<table class="table table-striped">
			<tr align="center">
				<th scope="row">ID</th>
				<td>${owner.own_id }</td>
			</tr>
			<tr align="center">
				<th scope="row">Name</th>
				<td>${owner.own_name }</td>
			</tr>
			<tr align="center">
				<th scope="row">Gender</th>
				<td>${owner.own_gdr }</td>
			</tr>
			<tr align="center">
				<th scope="row">Birthday</th>
				<td>${owner.own_bth_dt }</td>
			</tr>
			<tr align="center">
				<th scope="row">Address</th>
				<td>${owner.own_addr }</td>
			</tr>
			<tr align="center">
				<th scope="row">Email</th>
				<td>${owner.own_email }</td>
			</tr>
			<tr align="center">
				<th scope="row">Phone</th>
				<td>${owner.own_tel }</td>
			</tr>
			<tr align="center">
				<th scope="row">Registration</th>
				<td>${owner.own_reg_dt }</td>
			</tr>
		</table>
	</div>
	
	<br>
	
	<div align="center">
		<button type="button" class="btn btn-primary btn-lg" onclick="goBack();">Back</button>
	</div>

</div>

<br>
<br>
<br>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
   integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
   integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>