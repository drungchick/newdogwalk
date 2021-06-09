<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>Insert title here</title>
<!-- <link href="../../css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="../../js/jquery.js"></script>
<script src="../../js/bootstrap.min.js"></script> -->
<style type="text/css">
	@import url("common.css");
</style>
</head>
<body>
<div align="center">
	<h3>도우미 검색</h3>
	<!-- <form action="walkerProfileList.do"> -->
	<form action="walkerProfileSearchList.do">
		<fieldset>
				<select name="type">
						<c:forTokens var="name"  items="wkr_name,wkr_rs_cnt,wkr_gd" delims="," varStatus="i">
							<c:if test="${type==name }">
								<option value="${type }" selected="selected">${tt[i.index] }</option>
							</c:if>
							<c:if test="${type!=name }">
								<option value="${name }">${tt[i.index] }</option>
							</c:if>
						</c:forTokens>
				</select>
				<input type="text" name="search" >
				<input type="submit" value="검색">
		</fieldset>
	</form>
</div>

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
						<td><a href="walkerProfileView.do?wkr_reg_no=${walker.wkr_reg_no }&pageNum=${currentPage}">${walker.wkr_name }</a></td>
						<td>${walker.wkr_rs_ex }</td>
						<td>${walker.wkr_gd }</td>
					</tr>
				</c:forEach>		
			</c:if>
		</table>
		
		<div align="center">
			<c:if test="${startPage > pagePerBlock }">
				<%-- <a href="walkerProfileSearchList.do?pageNum=${startPage - 1 }&type=${type}&search=${search}">[이전]</a> --%>
				<button onclick="location.href='walkerProfileSearchList.do?pageNum=${startPage - 1 }&type=${type}&search=${search}'">[이전]</button>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<%-- <a href="walkerProfileSearchList.do?pageNum=${i }&type=${type}&search=${search}">${i }</a> --%>
				<button onclick="location.href='walkerProfileSearchList.do?pageNum=${i }&type=${type}&search=${search}'">${i }</button>
			</c:forEach>
			<c:if test="${endPage < totPage }">
				<%-- <a href="walkerProfileSearchList.do?pageNum=${endPage + 1 }&type=${type}&search=${search}">[다음]</a> --%>
				<button onclick="location.href='walkerProfileSearchList.do?pageNum=${endPage + 1 }&type=${type}&search=${search}'">[다음]</button>
			</c:if>
		
		</div>
		
		<div align="center">
				<%-- <a href="dogProfileList.do?pageNum=${currentPage }">전체목록</a> --%>
				<button onclick="location.href='dogProfileList.do?pageNum=${currentPage }'">전체목록</button>
				
		</div>
		
</div>
</div>
</body>
</html>