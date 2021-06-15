<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="sessionChk.jsp" %> --%>
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
	<div>
		<table>
			<caption>산책대행 요청정보</caption>
			<tr>
				<th>작성자</th>
				<td>${mboard.own_id }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${mboard.mbd_sbjt }</td>
			</tr>
			<tr>
				<th>작성일시</th>
				<td>${mboard.mbd_reg_dt }</td>
			</tr>
			<tr>
				<th>산책대행 시작희망일시</th>
				<td>${mboard.mbd_str_dt }</td>
			</tr>
			<tr>
				<th>산책대행 종료희망일시</th>
				<td>${mboard.mbd_fn_dt }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${mboard.mbd_cont }</td>
			</tr>



			<tr>
				<th colspan="2"><input type="button" value="강아지 프로필"
					onclick="location.href='dpView.do'"></th>
			</tr>

		</table>
		</div>
		
		<div>
		<table>
			<h3>예약 신청자</h3>
			<tr>
				<th>예약번호</th>
				<th>신청자</th>
				<th>매칭여부</th>
			</tr>
			
			<c:if test="${empty booking }">
			<tr>
				<th colspan="3">게시글이 없습니다.</th>
			</tr>
			</c:if>
			
			<c:if test="${not empty booking }">
				<c:forEach var="bookinglist" items="${booking }">
					<tr>
						<td>${bookinglist.bk_no }</td>
						<td><a href="walkerProfileView.do?wkr_reg_no='${bookinglist.wkr_reg_no }'">${bookinglist.wkr_id }</a></td>
						<td>
	                        <c:choose>
	                           <c:when test="${bookinglist.bk_mc_chk == 'N' and bookinglist.bk_chk == 'Y'}">
	                              <button type="button" onclick="location.href='OwnBookingAccept.do?bk_no=${bookinglist.bk_no}&mbd_no=${bookinglist.mbd_no }'">수락</button>
	                              <button type="button" onclick="location.href='OwnBookingDenyOne.do?bk_no=${bookinglist.bk_no}&mbd_no=${bookinglist.mbd_no }'">거절</button>
	                           </c:when>
	                           <c:when test="${bookinglist.bk_mc_chk == 'Y' and bookinglist.bk_chk == 'Y' }">
	                              매칭 성공
	                           </c:when>
	                           <c:when test="${bookinglist.bk_mc_chk == 'N' and bookinglist.bk_chk == 'N' }">
	                              거절
	                           </c:when>
	                           <c:otherwise>${bookinglist.bk_mc_chk}, ${bookinglist.bk_chk}</c:otherwise>
	                        </c:choose>
                  		</td>
				</c:forEach>
			</c:if>
		</table>
		</div>
		
		<div align="center">
			<a href="mbList.do">매칭게시판</a> <a
				href="mbUpdateForm.do?mbd_no=${mboard.mbd_no }&pageNum=${pageNum}">내용수정</a>

			<a href="mbDelete.do?mbd_no=${mboard.mbd_no }">요청삭제</a> <a
				href="logout.do">로그아웃</a>
		</div>
</body>
</html>