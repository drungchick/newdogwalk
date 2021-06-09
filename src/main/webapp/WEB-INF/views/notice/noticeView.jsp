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
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include>
<br>
<br>
<br>
<br>
<br>
<div class="container">
	<div id="content" align="center">
		<h1 align="center">Notice</h1>
		<br>
		<table class="table table-striped">
			<tr align="center">
      			<th scope="row">Subject</th>
		      	<td>${notice.nt_sbjt }</td>
    		</tr>
    		<tr align="center">
      			<th scope="row">Reporting Date</th>
		      	<td>${notice.nt_reg_dt }</td>
    		</tr>
    		<tr align="center">
      			<th scope="row">Content</th>
		      	<td><textarea rows="5" cols="40">${notice.nt_reg_dt }</textarea></td>
    		</tr>
		</table>
	</div>
</div>

<div align="center">
	<%-- <button onclick="location.href='noticeList.do?pageNum=${pageNum }'">목록</button> --%>
	<button type="button" class="btn btn-primary" onclick="location.href='noticeList.do?pageNum=${pageNum }'">list</button>
</div>

</body>
</html>