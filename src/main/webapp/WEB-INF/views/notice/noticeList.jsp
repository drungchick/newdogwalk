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
<jsp:include page="../main/mainNav.jsp"></jsp:include>
<br>
<br>
<br>
<br>
<br>
<div class="container">
	<div id="content" align="center">
		<h1 align="center">공지사항</h1>
		<table class="table table-striped">
			  <thead>
			    <tr align="center">
			      <th scope="col" align="center">번호</th>
			      <th scope="col" align="center">제목</th>
			      <th scope="col" align="center">작성일</th>
			      <th scope="col" align="center">조회수</th>
			    </tr>
			  </thead> 
			<c:if test="${empty list }"> <!-- 만약 DB에 데이터가 없어 list 애트리뷰트 안이 비었을 경우 -->
			<tr class="table-danger" align="center">
      			<th scope="row" colspan="4">등록된 공지사항이 없습니다.</th>
    		</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="notice" items="${list }"> <!-- list 애트리뷰트의 정보를 notice 변수에 하나씩 받는다 -->
					<tr align="center">			
						<c:set var="total" value="${total }"></c:set>
						
						<c:if test="${notice.nt_del == 'Y' }">
							<th colspan="4" scope="row">삭제된 공지사항입니다.</th>
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
	</div>
	<br>	
	<div align="center" class="a">
	  <ul class="pagination pagination-lg" class="a">
	    <c:if test="${startPage > pagePerBlock }">
	    <li class="page-item">
	      <a class="page-link" href="noticeList.do?pageNum=${startPage - 1 }">&laquo;</a>
	    </li>
	    </c:if>
	    <c:forEach var="i" begin="${startPage }" end="${endPage }">
	    <li class="page-item">
	      <a class="page-link" href="noticeList.do?pageNum=${i }">${i }</a>
	    </li>
	    </c:forEach>
	    <c:if test="${endPage < totPage }">
	    <li class="page-item">
	      <a class="page-link" href="noticeList.do?pageNum=${endPage + 1 }">&raquo;</a>
	    </li>
	    </c:if>
	  </ul>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
   integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
   integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>