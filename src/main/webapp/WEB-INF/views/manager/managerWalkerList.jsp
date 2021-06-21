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
		<h3 align="center">도우미 프로필</h3>
		<table class="table table-hover">
			<tr>
				<th width="10%">등록번호</th>
				<th width="10%">이름</th>
				<th width="10%">양육년수</th>
				<th width="10%">등급</th>
			</tr>
			<c:if test="${empty list }">
			<tr>
				<td colspan="4">등록된 도우미가 없습니다.</td>
			</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="walker" items="${list }">
					<tr>
						<c:set var="total" value="${total }"></c:set>
						<td>${total }<c:set var="total" value="${total-1 }" /></td>
						<td><a href="managerWalkerView.do?wkr_reg_no=${walker.wkr_reg_no }&pageNum=${currentPage}">${walker.wkr_name }</a></td>
						<td>${walker.wkr_rs_ex }</td>
						<td>${walker.wkr_gd }</td>
					</tr>
				</c:forEach>		
			</c:if>
		</table>
		
		<div align="center">
			<c:if test="${startPage > pagePerBlock }">
				<button onclick="location.href='managerWalkerList.do?pageNum=${startPage - 1 }'">[이전]</button>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<button onclick="location.href='managerWalkerList.do?pageNum=${i }'">${i }</button>
			</c:forEach>
			<c:if test="${endPage < totPage }">
				<button onclick="location.href='managerWalkerList.do?pageNum=${endPage + 1 }'">[다음]</button>
			</c:if>
		</div>
		
		<div align="center">
			<button onclick="location.href='managerMain.do'">메인</button>	
		</div>
</div>
</div>
</body>
</html>