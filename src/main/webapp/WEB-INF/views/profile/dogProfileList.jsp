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
	<!-- <div class="container">
<div align="center">
	<h3>반려견 검색</h3>
	<form action="dogProfileList.do">
	<form action="dogProfileSearchList.do">
		<fieldset>
				<select name="type">
					<option value = "dog_name">이름</option>
					<option value = "dog_gdr">성별</option>
					<option value = "dog_age">나이</option>
				</select>
				<input type="text" name="search" >
				<input type="submit" value="검색">
		</fieldset>
	</form>
</div>
</div> -->

	<div class="container">
		<h1 align="center">Dog Profile</h1>
		<table class="table table-hover">
		<br>
			<c:if test="${empty list }">
				<tr class="table-danger">
					<td colspan="3">등록된 반려견이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="dog" items="${list }" varStatus="thumnails">
					<c:if test="${thumnails.index / 3 == 0 }">
						<div class="row">
					</c:if>
						<!-- <div class="row"> -->
							<div class="col-sm-6 col-md-4">
								<div class="thumbnail">
									<img src="..." alt="...">
									<div class="caption">
										<h3>Thumbnail label</h3>
										<p>...</p>
										<p>
											<a href="#" class="btn btn-primary" role="button">Button</a>
											<a href="#" class="btn btn-default" role="button">Button</a>
										</p>
									</div>
								</div>
							</div>
					<c:if test="${thumnails.index / 3 == 3 }">
						</div>
					</c:if>
				</c:forEach>
			</c:if>
		</table>
		<br>
		<div align="center" class="pageMiddle">
		  <ul class="pagination pagination-lg" class="a">
		    <c:if test="${startPage > pagePerBlock }">
		    <li class="page-item">
		      <a class="page-link" href="dogProfileList.do?pageNum=${startPage - 1 }">&laquo;</a>
		    </li>
		    </c:if>
		    <c:forEach var="i" begin="${startPage }" end="${endPage }">
		    <li class="page-item">
		      <a class="page-link" href="dogProfileList.do?pageNum=${i }">${i }</a>
		    </li>
		    </c:forEach>
		    <c:if test="${endPage < totPage }">
		    <li class="page-item">
		      <a class="page-link" href="dogProfileList.do?pageNum=${endPage + 1 }">&raquo;</a>
		    </li>
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
	</div>s
</body>
</html>