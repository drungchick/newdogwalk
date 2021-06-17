<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="sessionChk.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<script type="text/javascript">
		function goBack() {
			history.back();	
		}
	</script>
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
<div class="container">
	<div id="content" align="center">
		<h1 align="center">Walk!</h1>
		<br>
		<table class="table table-striped">
			<tr align="center">
      			<th scope="row">Writer</th>
		      	<td>${mboard.own_id }</td>
    		</tr>
    		<tr align="center">
      			<th scope="row">Subject</th>
		      	<td>${mboard.mbd_sbjt }</td>
    		</tr>
    		<tr align="center">
      			<th scope="row">Registration Date</th>
		      	<td>${mboard.mbd_reg_dt }</td>
    		</tr>
    		<tr align="center">
      			<th scope="row">Start Date</th>
		      	<td>${mboard.mbd_str_dt }</td>
    		</tr>
    		<tr align="center">
      			<th scope="row">End Date</th>
		      	<td>${mboard.mbd_fn_dt }</td>
    		</tr>
    		<tr align="center">
      			<th class="align-middle" scope="row">Content</th>
		      	<td><textarea rows="5" cols="70" style="border:none;" readonly="readonly">${mboard.mbd_cont }</textarea></td>
    		</tr>
    		<tr align="center">
    			<th class="align-middle" scope="row">Profile</th>
    			<td>
    				<a href="mbDogProfileView.do?own_id=${mboard.own_id }&pageNum=${currentPage}" class="btn btn-primary btn-lg" role="button">Dog</a>
    				<a href="ownerProfileView.do?own_id=${mboard.own_id }" class="btn btn-secondary btn-lg" role="button">Owner</a>
    			</td>
    		</tr>
    		<%-- <c:if test="${mboard.own_id == sessionScope.own_id }">
    		<tr align="center">
    			<th class="align-middle" scope="row">Update/Delete</th>
    			<td>
    				<a href="mbUpdateForm.do?mbd_no=${mboard.mbd_no }&pageNum=${pageNum}" class="btn btn-primary btn-sm" role="button">Update</a>
    				<a href="mbDelete.do?mbd_no=${mboard.mbd_no }" class="btn btn-secondary btn-sm" role="button">Delete</a>
    			</td>
    		</tr>
    		</c:if> --%>
		</table>
		
		<div class="container">
			<div id="content" align="center">
			<c:if test="${mboard.own_id == sessionScope.own_id }">
				<a href="mbUpdateForm.do?mbd_no=${mboard.mbd_no }&pageNum=${pageNum}" class="btn btn-warning btn-lg" role="button">Update</a>
    			<a href="mbDelete.do?mbd_no=${mboard.mbd_no }" class="btn btn-danger btn-lg" role="button">Delete</a>
    		</c:if>
    		<button type="button" class="btn btn-primary btn-lg" onclick="goBack();">Back</button>
			</div>
		</div>
		
		<c:if test="${mboard.own_id == sessionScope.own_id }">
			<div id="content" align="center">
				<br>
				<h3 align="center">[Applicant]</h3>
				<table class="table table-hover">
					<thead>
					    <tr align="center">
					      <th scope="col" align="center">Bk.No</th>
					      <th scope="col" align="center">Applicant</th>
					      <th scope="col" align="center">Profile</th>
					      <th scope="col" align="center">Matching</th>
					    </tr>
					</thead>
					<c:if test="${empty booking }"> <!-- 만약 DB에 데이터가 없어 list 애트리뷰트 안이 비었을 경우 -->
						<tr class="table-danger" align="center">
			      			<th scope="row" colspan="4">신청자가 없습니다.</th>
			    		</tr>
		    		</c:if>
		    		<c:if test="${not empty booking }">
						<c:forEach var="bookinglist" items="${booking }"> <!-- list 애트리뷰트의 정보를 notice 변수에 하나씩 받는다 -->
							<tr align="center">			
								<td>${bookinglist.bk_no }</td>
								<td>${bookinglist.wkr_id }</td>
								<td><a href="walkerProfileView.do?wkr_reg_no=${bookinglist.wkr_reg_no }">${bookinglist.wkr_id }</a></td>
								<td>
			                        <c:choose>
			                           <c:when test="${bookinglist.bk_mc_chk == 'N' and bookinglist.bk_chk == 'Y'}">
			                              <button type="button" class="btn btn-primary btn-sm" onclick="location.href='OwnBookingAccept.do?bk_no=${bookinglist.bk_no}&mbd_no=${bookinglist.mbd_no }'">수락</button>
			                              <button type="button" class="btn btn-primary btn-sm" onclick="location.href='OwnBookingDenyOne.do?bk_no=${bookinglist.bk_no}&mbd_no=${bookinglist.mbd_no }'">거절</button>
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
							</tr>
						</c:forEach>		
					</c:if>
				</table>
			</div>
		</c:if>
	
	</div>
</div>	
		
	-------------------------------
<%-- 	<div>
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
				<th colspan="2"><input type="button" value="강아지 프로필" onclick="location.href='mbDogProfileView.do?own_id=${mboard.own_id }'"></th>
			</tr>

		</table>
		</div>
		
		<div>
		
		<c:if test="${mboard.own_id == sessionScope.own_id }">
		<table>
			<h3>예약 신청자</h3>
			<tr>
				<th>예약번호</th>
				<th>신청자</th>
				<th>매칭여부</th>
			</tr>
			
			<c:if test="${empty booking }">
			<tr>
				<th colspan="3">신청자가 없습니다.</th>
			</tr>
			</c:if>
			
			<c:if test="${not empty booking }">
				<c:forEach var="bookinglist" items="${booking }">
					<tr>
						<td>${bookinglist.bk_no }</td>
						<td><a href="walkerProfileView.do?wkr_reg_no=${bookinglist.wkr_reg_no }">${bookinglist.wkr_id }</a></td>
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
                  	</tr>
				</c:forEach>
			</c:if>
		</table>
		</c:if>
		</div>
		
		<div align="center">
			<a href="mbList.do">매칭게시판</a>
		
		<c:if test="${mboard.own_id == sessionScope.own_id }">
			<a href="mbUpdateForm.do?mbd_no=${mboard.mbd_no }&pageNum=${pageNum} onclick=">내용수정</a>
		</c:if>
		<c:if test="${mboard.own_id == sessionScope.own_id }">
			<a href="mbDelete.do?mbd_no=${mboard.mbd_no }">요청삭제</a>
		</c:if>	
			<a href="logout.do">로그아웃</a>
		</div> --%>
</body>
</html>