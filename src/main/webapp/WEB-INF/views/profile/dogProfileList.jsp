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
<div class="container">
<div align="center">
	<h3>반려견 검색</h3>
	<!-- <form action="dogProfileList.do"> -->
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
</div>

<div class="container">
	<div id="content" align="center">
		<h3 align="center">반려견 프로필</h3>
		<table class="table table-hover">
			<tr>
				<th width="10%">등록번호</th>
				<th width="10%">이름</th>
				<th width="10%">성별</th>
				<th width="10%">나이</th>
			</tr>
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
				</c:forEach>		
			</c:if>
		</table>
		
		<div align="center">
			<c:if test="${startPage > pagePerBlock }">
				<%-- <a href="dogProfileList.do?pageNum=${startPage - 1 }">[이전]</a> --%>
				<button onclick="location.href='dogProfileList.do?pageNum=${startPage - 1 }'">[이전]</button>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<%-- <a href="dogProfileList.do?pageNum=${i }">${i }</a> --%>
				<button onclick="location.href='dogProfileList.do?pageNum=${i }'">${i }</button>
			</c:forEach>
			<c:if test="${endPage < totPage }">
				<%-- <a href="dogProfileList.do?pageNum=${endPage + 1 }">[다음]</a> --%>
				<button onclick="location.href='dogProfileList.do?pageNum=${endPage + 1 }'">[다음]</button>
			</c:if>
		</div>
		
		<div align="center">
			<!-- <a href="noticeList.do">공지사항</a> -->
			<button onclick="location.href='noticeList.do'">공지사항</button>
		</div>
		<div align="center">
			<!-- <a href="walkerProfileList.do">도우미 프로필</a> -->
			<button onclick="location.href='walkerProfileList.do'">도우미 프로필</button>
		</div>
</div>
</body>
</html>