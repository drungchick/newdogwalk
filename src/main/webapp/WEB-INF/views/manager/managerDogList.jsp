<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
	@import url("common.css");
</style>
</head>
<body>
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
						<td><a href="managerDogView.do?dog_no=${dog.dog_no }&pageNum=${currentPage}">${dog.dog_name }</a></td>
						<td>${dog.dog_gdr }</td>
						<td>${dog.dog_age }</td>
					</tr>
				</c:forEach>		
			</c:if>
		</table>
		
		<div align="center">
			<c:if test="${startPage > pagePerBlock }">
				<button onclick="location.href='managerDogList.do?pageNum=${startPage - 1 }'">[이전]</button>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<button onclick="location.href='managerDogList.do?pageNum=${i }'">${i }</button>
			</c:forEach>
			<c:if test="${endPage < totPage }">
				<button onclick="location.href='managerDogList.do?pageNum=${endPage + 1 }'">[다음]</button>
			</c:if>
		</div>
		
		<div align="center">
			<button onclick="location.href='managerMain.do'">메인</button>
		</div>
		
</div>
</body>
</html>