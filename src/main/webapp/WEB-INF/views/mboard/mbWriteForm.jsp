<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		//시작일
		$('#mbd_str_dt').datepicker({
			// showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
			dateFormat : "yy-mm-dd", // 날짜의 형식
			changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
			minDate: 0,  // 선택할수있는 최소날짜, (0: 오늘 이전 날짜 선택 불가)
			onClose : function(selectedDate) { // 시작일(fromDate) datepicker가 닫힐때
				// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				$("#mbd_fn_dt").datepicker("option", "minDate", selectedDate);
			}
		});
		//종료일
		$('#mbd_fn_dt').datepicker({
			// showOn : "both",
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			onClose : function(selectedDate) {
				// 종료일(toDate) datepicker가 닫힐때
				// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
				$("mbd_str_dt").datepicker("option", "maxDate", selectedDate);
			}
		});
	});
</script>
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
<form action="mbWrite.do" method="post" name="frm">
<input type="hidden" name="own_id" value="${own_id}">
<input type="hidden" name="own_reg_no" value="${own_reg_no}"> <!-- 추가 -->
<div class="JoinWrapper">
		<div class="form-group">
			<fieldset>
			<h1 align="center">Write</h1>
			<br>
			
			<%-- <div class="form-group">
				<h4><label for="writer">Writer</label></h4>
      			<input type="text" class="form-control" id="writer" name="own_id" value="${mboard.own_id }" readonly="readonly">
    		</div> --%>
    		
    		<div class="form-group">
				<h4><label for="subject">Subject</label></h4>
      			<input type="text" class="form-control" id="subject" name="mbd_sbjt" required="required" autofocus="autofocus">
    		</div>
    		
    		<div class="form-group">
    				<div id="datepicker">
      				<h4><label for="mbd_str_dt">Start Date</label></h4>
      				<input type="text" class="form-control" id="mbd_str_dt" name="mbd_str_dt" required="required" value="${mboard.mbd_str_dt }">
      				</div>
    		</div>
    		
    		<div class="form-group">
    				<div id="datepicker">
      				<h4><label for="mbd_fn_dt">End Date</label></h4>
      				<input type="text" class="form-control" id="mbd_fn_dt" name="mbd_fn_dt" required="required" value="${mboard.mbd_fn_dt }">
      				</div>
    		</div>
    		
    		<div class="form-group">
      				<h4><label for="cont">Content</label></h4>
      				<textarea class="form-control" name="mbd_cont" id="cont" rows="8" required="required">${mboard.mbd_cont }</textarea>
    		</div>
    		
			<div align="center">
				<button type="submit" class="btn btn-primary btn-lg">Write</button>
				<button type="button" class="btn btn-primary btn-lg" onclick="goBack();">Back</button>
			</div>
			</fieldset>
		</div>
	</div>


<%-- 	<table>
		<caption>산책 요청 작성</caption>
		<!-- 작성자, 작성자 등록일은 히든으로 받아서 넘길 예정. -->
		<tr>
			<th>작성자</th>
			<td>${own_id }</td>
			<!-- <td>
				<input type="text" name="own_id" required="required">
			</td> -->
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="mbd_sbjt" required="required" autofocus="autofocus">
			</td>
		</tr>
		<tr>
			<th>산책대행 시작희망일시</th>			
			<td>
				<div id="datepicker">
				<input type="text" name="mbd_str_dt" id="mbd_str_dt" required="required">
				</div>	
			</td>
			
		</tr>
		<tr>
			<th>산책대행 종료희망일시</th>
			<td>
				<div id="datepicker">
				<input type="text" name="mbd_fn_dt" id="mbd_fn_dt" required="required">
				</div>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="5" cols="40" name="mbd_cont" required="required"></textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="확인">
			</th>
		</tr>
	</table> --%>
</form>
</body>
</html>