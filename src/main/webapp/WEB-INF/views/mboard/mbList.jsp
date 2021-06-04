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
	<!-- 매칭 게시판에 표시될 항목들 
	게시글번호, 시작날짜,     종료날짜,     제목,      내용,
	MBD_NO, MBD_STR_DT, MBD_FN_DT, MBD_SBJT, MBD_CONT,
	작성일,       조회수,       삭제여부,   견주등록번호,   견주ID
	MBD_REG_DT, MBD_RD_CNT, MBD_DEL, OWN_REG_NO, OWN_ID
	 -->
	<table>
		<caption>요청 목록</caption>
		
		<!-- 리스트에 표시될 내용 -->
		<tr>
			<th>요청글번호</th>
			<th>제목</th>
			<th>작성자(견주)</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		
		<!-- 게시글이 없는 경우. -->
		<c:if test="${empty list }">
			<tr>
				<th colspan="5">게시글이 없습니다.</th>
			</tr>
		</c:if>
		
		<c:if test="${not empty list }">
			<c:forEach var="mboard" items="${list }">
				<tr>
					<td>${mboard.mbd_no }<c:set var="mbd_no" value="${mboard.mbd_no - 1 }"></c:set></td>
					<c:if test="${mboard.mbd_del == 'Y' }">
						<th colspan="4">삭제된 게시글입니다.</th>
					</c:if>
					<!-- 작성일과 현재날짜 비교 후 2 미만 차이나면 new 아이콘 표시로 바꿀 예정. -->
					<c:if test="${mboard.mbd_del != 'Y' }">
						<td title="${mboard.mbd_cont }">
							<a href="mbView.do?mbd_no=${mboard.mbd_no }&pageNum=${currentPage}">${mboard.mbd_sbjt }</a>
							<c:if test="${mboard.mbd_rd_cnt < 1 }">
								<img alt="" src="images/hot.gif">
							</c:if>
						</td>
						<td>
							${mboard.own_id }
						</td>
						<td>
							${mboard.mbd_reg_dt }
						</td>
						<td>
							${mboard.mbd_rd_cnt }
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>
<!-- 페이징 -->	
<div align="center"><br>
	<c:if test="${startPage > PAGE_PER_BLOCK}">
		<button onclick="location.href='mbList.do?pageNum=${startPage - 1}'">이전</button>	
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<button onclick="location.href='mbList.do?pageNum=${i}'">${i }</button>
	</c:forEach>
	<c:if test="${startPage< totalPage}">
		<button onclick="location.href='mbList.do?pageNum=${endPage + 1 }'">다음</button>	
	</c:if>
</div>
<div align="center"><br>
	<button onclick="location.href='mbWriteForm.do?mbd_no=0&pageNum=1'">글쓰기</button>
	<button onclick="location.href='main.do'">메인화면</button>
</div>
</body>
</html>