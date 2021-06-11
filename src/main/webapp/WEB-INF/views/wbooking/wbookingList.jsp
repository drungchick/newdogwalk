<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
</head>
<body>
	<table>
		<caption>예약 내역</caption>
		<tr>
			<th>신청번호</th>
			<th>요청글번호</th>
			<th>제목</th>
			<th>예약상태</th>
		</tr>
		
		<!-- 게시글이 없는 경우. -->
		<c:if test="${empty list }">
			<tr>
				<th colspan="5">예약이 없습니다.</th>
			</tr>
		</c:if>
		
		<c:if test="${not empty list}">
			<c:forEach var="wbooking" items="${list }">
				<tr>
						<td>${wbooking.bk_no }<c:set var="bk_no" value="${wbooking.bk_no}"></c:set></td>
						<td>
							${wbooking.mbd_no }
						</td>
						<td>
							${wbooking.mbd_sbjt }
						</td>
						<td>
								<c:choose>
									<c:when test="${wbooking.bk_mc_chk == 'N' and wbooking.bk_chk == 'Y'}">
										매칭 진행 중
									</c:when>
									<c:when test="${wbooking.bk_mc_chk == 'Y' and wbooking.bk_chk == 'Y' }">
										매칭 성공
									</c:when>
									<c:when test="${wbooking.bk_mc_chk == 'N' and wbooking.bk_chk == 'N' }">
										매칭 실패
									</c:when>
								</c:choose>
						</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
<!-- 페이징 -->	
<div align="center"><br>
	<c:if test="${startPage > PAGE_PER_BLOCK}">
		<button onclick="location.href='wbookingList.do?pageNum=${startPage - 1}'">이전</button>	
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<button onclick="location.href='wbookingList.do?pageNum=${i}'">${i }</button>
	</c:forEach>
	<c:if test="${startPage< totalPage}">
		<button onclick="location.href='wbookingList.do?pageNum=${endPage + 1 }'">다음</button>	
	</c:if>
</div>
<div align="center"><br>
	<button onclick="location.href='main.do'">메인화면</button>
	<button onclick="location.href='mbList.do'">요청목록</button>
	<button onclick="history.back()">이전화면</button>
</div>
</body>
</html>