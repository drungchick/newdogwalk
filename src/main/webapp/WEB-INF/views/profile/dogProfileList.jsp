<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<h1 align="center">Dog Profile</h1>
		<br>

		<div align="center">
			<form action="dogProfileSearchList.do">
				<fieldset>
					<select name="type" class="btn btn-primary">
						<option value="dog_name" class="btn btn-outline-primary">Name</option>
						<option value="dog_gdr" class="btn btn-outline-primary">Gender</option>
						<option value="dog_kind" class="btn btn-outline-primary">Kind</option>
					</select> <input type="text" name="search" class="btn btn-outline-primary">
					<input type="submit" value="Search" class="btn btn-primary">
				</fieldset>
			</form>
		</div>

		<!-- <div class="container"> -->
		<table class="table table-hover">
			<br>
			<c:if test="${empty list }">
				<tr class="table-danger" align="center">
					<td colspan="3">등록된 반려견이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="dog" items="${list }" varStatus="thumnails">
					<c:if test="${thumnails.index / 3 == 0 }">
						<tr align="center">
							<td>
								<div class="row">
					</c:if>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img src="/Dogwalk/dogimg/${dog.dog_pht_nm }" width="300" height="350" alt="${dog.dog_pht_nm}">
							<div class="caption">
								<h3>${dog.dog_name }</h3>
								<p>${dog.dog_gdr }/${dog.dog_age }/${dog.dog_kind }</p>
								<p>
									<a
										href="dogProfileView.do?dog_no=${dog.dog_no }&pageNum=${currentPage}"
										class="btn btn-primary btn-lg" role="button">Dog</a> <a
										href="ownerProfileView.do?own_id=${dog.own_id }"
										class="btn btn-secondary btn-lg" role="button">Owner</a>
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
					href="dogProfileList.do?pageNum=${startPage - 1 }">&laquo;</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<li class="page-item"><a class="page-link"
					href="dogProfileList.do?pageNum=${i }">${i }</a></li>
			</c:forEach>
			<c:if test="${endPage < totPage }">
				<li class="page-item"><a class="page-link"
					href="dogProfileList.do?pageNum=${endPage + 1 }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>

	<%-- 
	<div id="content" align="center">
		<h3 align="center">Dog Profile</h3>
		<table class="table table-hover">
			<c:if test="${empty list }">
			<tr>
				<td colspan="4">등록된 반려견이 없습니다.</td>
			</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="dog" items="${list }">
					<tr>
						<c:set var="total" value="${total }"></c:set>
						<td>${total }<c:set var="total" value="${total-1 }" /></td>
						<td><a href="dogProfileView.do?dog_no=${dog.dog_no }&pageNum=${currentPage}">${dog.dog_name }</a></td>
						<td>${dog.dog_gdr }</td>
						<td>${dog.dog_age }</td>
					</tr>
					<div class="row">
					  <div class="col-sm-6 col-md-4">
					    <div class="thumbnail">
					      <img src="..." alt="...">
					      <div class="caption">
					        <h3>Thumbnail label</h3>
					        <p>...</p>
					        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
					      </div>
					    </div>
					  </div>
					</div>
				</c:forEach>		
			</c:if>
		</table> --%>
</body>
</html>