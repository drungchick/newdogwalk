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
		<h3 align="center">견주 정보</h3>
		<table class="table table-hover">
			<tr>
				<th width="10%">등록번호</th>
				<th width="10%">ID</th>
				<th width="10%">이름</th>
				<th width="10%">생년월일</th>
			</tr>
			<c:if test="${empty list }"> <!-- 만약 DB에 데이터가 없어 list 애트리뷰트 안이 비었을 경우 -->
				<tr>
					<td colspan="4">등록된 회원 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="owner" items="${list }"> <!-- list 애트리뷰트의 정보를 notice 변수에 하나씩 받는다 -->			
					<tr>
						<c:set var="total" value="${total }"></c:set>
						
						<c:if test="${owner.own_del == 'Y' }">
							<th colspan="4">삭제된 회원입니다.</th>
						</c:if>
						
						<c:if test="${owner.own_del == 'N' }">
						<td>${owner.own_reg_no }</td>
									<!-- own_reg_no를 클릭 시 own_reg_no와 pageNum의 정보를 managerOwnerView.do로 보냄 -->
						<td><a href="managerOwnerView.do?own_id=${owner.own_id }&pageNum=${currentPage }">${owner.own_id }</a></td>
						<td>${owner.own_id }</td>
						<td>${owner.own_bth_dt }</td>
						</c:if>
					</tr>

				</c:forEach>		
			</c:if>
		</table>
		
		<div align="center">
			<c:if test="${startPage > pagePerBlock }">
				<button onclick="location.href='managerOwnerList.do?pageNum=${startPage - 1 }'">[이전]</button>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<button onclick="location.href='managerOwnerList.do?pageNum=${i }'">${i }</button>
			</c:forEach>
			<c:if test="${endPage < totPage }">
				<button onclick="location.href='managerOwnerList.do?pageNum=${endPage + 1 }'">[다음]</button>
			</c:if>
		</div>
		
		<div align="center">
			<button onclick="location.href='managerMain.do'">메인</button>
		</div>
		
</div>
</div>
</body>
</html>