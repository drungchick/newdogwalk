<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
<div class="container">
	<div id="content" align="center">
		<h1 align="center">Walk!</h1>
		<br>
		<table class="table table-striped">
			<thead>
			    <tr align="center">
			      <th scope="col" align="center">No</th>
			      <th scope="col" align="center">Writer</th>
			      <th scope="col" align="center">Subject</th>
			      <th scope="col" align="center">Date</th>
			      <th scope="col" align="center">R.D</th>
			    </tr>
			  </thead>
			<c:if test="${empty list }"> <!-- 만약 DB에 데이터가 없어 list 애트리뷰트 안이 비었을 경우 -->
				<tr class="table-danger" align="center">
	      			<th scope="row" colspan="5">등록된 게시글이 없습니다.</th>
	    		</tr>
    		</c:if>
    		<c:if test="${not empty list }">
				<c:forEach var="mboard" items="${list }"> <!-- list 애트리뷰트의 정보를 notice 변수에 하나씩 받는다 -->
					<tr align="center">			
						<c:set var="total" value="${total }"></c:set>
						
						<c:if test="${mboard.mbd_del == 'Y' }">
							<th colspan="5" scope="row">삭제된 게시글입니다.</th>
						</c:if>
						
						<c:if test="${mboard.mbd_del == 'N' }">
						<td>${total }<c:set var="total" value="${total-1 }" /></td>
						<td>${mboard.own_id }</td>
						<td><a href="mbView.do?mbd_no=${mboard.mbd_no }&pageNum=${currentPage}">${mboard.mbd_sbjt }</a></td>
						<td>${mboard.mbd_reg_dt }</td>
						<td>${mboard.mbd_rd_cnt }</td>
						</c:if>
					</tr>
				</c:forEach>		
			</c:if>
		</table>
	</div>	
	<div align="center" class="pageMiddle">
	  <ul class="pagination pagination-lg" class="a">
	    <c:if test="${startPage > pagePerBlock }">
	    <li class="page-item">
	      <a class="page-link" href="mbList.do?pageNum=${startPage - 1}">&laquo;</a>
	    </li>
	    </c:if>
	    <c:forEach var="i" begin="${startPage }" end="${endPage }">
	    <li class="page-item">
	      <a class="page-link" href="mbList.do?pageNum=${i}">${i }</a>
	    </li>
	    </c:forEach>
	    <c:if test="${endPage < totPage }">
	    <li class="page-item">
	      <a class="page-link" href="mbList.do?pageNum=${endPage + 1 }">&raquo;</a>
	    </li>
	    </c:if>
	  </ul>
	</div>
	<c:if test="${sessionScope.mb_clf_cd == 1 }">
	<div align="center" class="pageMiddle">
		<button type="button" class="btn btn-primary btn-lg" onclick="location.href='mbWriteCheck.do?mb_clf_cd=${sessionScope.mb_clf_cd }'">Write</button>
	</div>
	</c:if>
	<br>
</div>

	
	
	<%-- <table>
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
							<c:if test="${mboard.mbd_rd_cnt > 500 }">
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
	<button onclick="location.href='mbWriteForm.do?mbd_no=${mboard.mbd_no}&pageNum=1'">글쓰기</button>
	<!-- 도우미는 글을 쓸 수 없도록 check 필요 -->
	<!-- <button onclick="location.href='mbWriteCheck.do'">글쓰기</button> --> <!-- 수정전  여기 멤버코드 보내는 로직 없음, 글작성자 세션보내는 코드가 없음 -->
	<button onclick="location.href='mbWriteCheck.do?mb_clf_cd=${sessionScope.mb_clf_cd }'">글쓰기</button> <!-- 여기 멤버코드 보내는 로직 없음, 글작성자 세션보내는 코드가 없음? -->
	<button onclick="location.href='mbWriteCheck.do?mb_clf_cd=${sessionScope.mb_clf_cd }&own_id=${sessionScope.own_id }&own_reg_no=${session }'">글쓰기</button>
	<button onclick="location.href='Membermain.do'">메인화면</button>
</div> --%>
</body>
</html>