<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/sessionChk.jsp" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
%>
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
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
	<div class="container">
		<h1 align="center">Walker Profile</h1>
		<br>
		<div align="center">
			<form action="walkerProfileSearchList.do">
				<fieldset>
					<select name="type" class="btn btn-primary">
						<option value="wkr_id" class="btn btn-outline-primary">ID</option>
						<option value="wkr_rs_cnt" class="btn btn-outline-primary">Rearing
							Period</option>
						<option value="wkr_gd" class="btn btn-outline-primary">Grade</option>
					</select> <input type="text" name="search" class="btn btn-outline-primary">
					<input type="submit" value="Search" class="btn btn-primary">
				</fieldset>
			</form>
		</div>
		<table class="table table-hover">
			<br>
			<c:if test="${empty list }">
				<tr class="table-danger" align="center">
					<td colspan="3">등록된 도우미가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="walker" items="${list }" varStatus="thumnails">
					<c:if test="${thumnails.index / 3 == 0 }">
						<tr align="center">
							<td>
								<div class="row">
					</c:if>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img src="/Dogwalk/walkerimg/${walker.wkr_pht_nm }" width="300" height="350" alt="${walker.wkr_pht_nm}">
							<div class="caption">
								<h3>${walker.wkr_id }</h3>
								<p>${walker.wkr_name }/${walker.wkr_rs_cnt }/${walker.wkr_gd }</p>
								<p>
									<a href="walkerProfileView.do?wkr_reg_no=${walker.wkr_reg_no }&pageNum=${currentPage}" class="btn btn-secondary btn-lg" role="button">Walker</a>
								</p>
							</div>
						</div>
					</div>
					<c:if test="${thumnails.index / 3 == 3 }">
						</div>
						</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<br>
	<div align="center" class="pageMiddle">
		<ul class="pagination pagination-lg" class="a">
			<c:if test="${startPage > pagePerBlock }">
				<li class="page-item"><a class="page-link"
					href="walkerProfileList.do?pageNum=${startPage - 1 }">&laquo;</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<li class="page-item"><a class="page-link"
					href="walkerProfileList.do?pageNum=${i }">${i }</a></li>
			</c:forEach>
			<c:if test="${endPage < totPage }">
				<li class="page-item"><a class="page-link"
					href="walkerProfileList.do?pageNum=${endPage + 1 }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>