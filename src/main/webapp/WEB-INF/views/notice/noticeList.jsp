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
<div class="container">
	<div id="content" align="center">
		<h3 align="center">공지사항</h3>
		<table class="table table-hover">
			<tr>
				<th width="10%">번호</th>
				<th width="10%">제목</th>
				<th width="10%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
			<c:if test="${empty list }"> <!-- 만약 DB에 데이터가 없어 list 애트리뷰트 안이 비었을 경우 -->
			<tr>
				<td colspan="4">등록된 공지사항이 없습니다.</td>
			</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="notice" items="${list }"> <!-- list 애트리뷰트의 정보를 notice 변수에 하나씩 받는다 -->
					<tr>
						
						<c:set var="total" value="${total }"></c:set>
						
						<c:if test="${notice.nt_del == 'Y' }">
							<th colspan="4">삭제된 공지사항입니다.</th>
						</c:if>
						
						<c:if test="${notice.nt_del == 'N' }">
						<td>${total }<c:set var="total" value="${total-1 }" /></td>
									<!-- nt_sbjt를 클릭 시 nt_no와 pageNum의 정보를 noticeView.do로 보냄 -->
						<td><a href="noticeView.do?nt_no=${notice.nt_no }&pageNum=${currentPage}">${notice.nt_sbjt }</a></td>
						<td>${notice.nt_reg_dt }</td>
						<td>${notice.nt_rd_cnt }</td>
						</c:if>
					</tr>
				</c:forEach>		
			</c:if>
		</table>
		
		<div align="center">
			<c:if test="${startPage > pagePerBlock }">
				<%-- <a href="noticeList.do?pageNum=${startPage - 1 }">[이전]</a> --%>
				<button onclick="location.href='noticeList.do?pageNum=${startPage - 1 }'">[이전]</button>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<%-- <a href="noticeList.do?pageNum=${i }">${i }</a> --%>
				<button onclick="location.href='noticeList.do?pageNum=${i }'">${i }</button>
			</c:forEach>
			<c:if test="${endPage < totPage }">
				<%-- <a href="noticeList.do?pageNum=${endPage + 1 }">[다음]</a> --%>
				<button onclick="location.href='noticeList.do?pageNum=${endPage + 1 }'">[다음]</button>
			</c:if>
		</div>
		
		<div align="center">
			<!-- <a href="dogProfileList.do">반려견 프로필</a> -->
			<button onclick="location.href='dogProfileList.do'">반려견 프로필</button>
		</div>
		<div align="center">
			<!-- <a href="walkerProfileList.do">도우미 프로필</a> -->
			<button onclick="location.href='walkerProfileList.do'">도우미 프로필</button>
		</div>
</div>
</div>
</body>
</html>