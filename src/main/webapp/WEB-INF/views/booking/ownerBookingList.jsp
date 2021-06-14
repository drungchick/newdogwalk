<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("common.css");
</style>
</head>
<body>
	<table>
		<caption>예약 내역</caption>
		<tr>
			<th>게시글번호</th>
			<th>제목</th>
			<th>도우미 ID</th>
			<th>예약상태</th>
		</tr>
		
		<!-- 게시글이 없는 경우. -->
		<c:if test="${empty ownlist }">
			<tr>
				<th colspan="5">예약이 없습니다.</th>
			</tr>
		</c:if>
		
		<c:if test="${not empty ownlist}">
			<c:forEach var="booking" items="${ownlist }">
				<tr>
						<td>${booking.mbd_no }</td>
						<td><!-- 요청 상세보기 -->
							<a href="mbView.do?mbd_no=${booking.mbd_no }&pageNum=${currentPage}">${booking.mbd_sbjt }</a>
						</td>
						<td><!-- 도우미 프로필 상세보기 -->
							<a href="wpView.do?wkr_reg_no=${booking.wkr_reg_no }">${booking.wkr_id }</a>
						</td>
						<td>
								<c:choose>
									<c:when test="${booking.bk_mc_chk == 'N' and booking.bk_chk == 'Y'}">
										<button type="button" onclick="location.href='bookingAccept.do?bk_no=${bk_no}'">수락</button>
										<button type="button" onclick="location.href='bookingDeny.do?bk_no=${bk_no}'">거절</button>
									</c:when>
									<c:when test="${booking.bk_mc_chk == 'Y' and booking.bk_chk == 'Y' }">
										매칭 성공
									</c:when>
									<c:when test="${booking.bk_mc_chk == 'Y' and booking.bk_chk == 'N' }">
										거절
									</c:when>
									<c:otherwise>${booking.bk_mc_chk}, ${booking.bk_chk}</c:otherwise>
								</c:choose>
						</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
<!-- 페이징 -->	
<div align="center"><br>
	<c:if test="${startPage > PAGE_PER_BLOCK}">
		<button onclick="location.href='bookingList.do?pageNum=${startPage - 1}'">이전</button>	
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<button onclick="location.href='bookingList.do?pageNum=${i}'">${i }</button>
	</c:forEach>
	<c:if test="${startPage< totalPage}">
		<button onclick="location.href='bookingList.do?pageNum=${endPage + 1 }'">다음</button>	
	</c:if>
</div>
<div align="center"><br>
	<button onclick="location.href='Membermain.do'">메인화면</button>
	<button onclick="history.back()">이전화면</button>
</div>
</body>
</html>