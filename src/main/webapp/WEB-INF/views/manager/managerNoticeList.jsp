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
		<h3 align="center">공지사항(매니저)</h3>
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
						<td><a href="managerNoticeView.do?nt_no=${notice.nt_no }&pageNum=${currentPage }">${notice.nt_sbjt }</a></td>
						<td>${notice.nt_reg_dt }</td>
						<td>${notice.nt_rd_cnt }</td>
						</c:if>
					</tr>

				</c:forEach>		
			</c:if>
		</table>
		
		<div align="center">
			<c:if test="${startPage > pagePerBlock }">
				<button onclick="location.href='managerNoticeList.do?pageNum=${startPage - 1 }'">[이전]</button>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<button onclick="location.href='managerNoticeList.do?pageNum=${i }'">${i }</button>
			</c:forEach>
			<c:if test="${endPage < totPage }">
				<button onclick="location.href='managerNoticeList.do?pageNum=${endPage + 1 }'">[다음]</button>
			</c:if>
		</div>
		
		<div align="center">
			<button onclick="location.href='managerNoticeWriteForm.do?mng_id=${sessionScope.mng_id }&pageNum=${currentPage }'">등록</button>
		</div>
		
		<div align="center">
			<button onclick="location.href='managerMain.do'">메인</button>
		</div>
		
</div>
</div>
</body>
</html>