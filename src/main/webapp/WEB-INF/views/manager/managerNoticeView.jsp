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
<script type="text/javascript">
	function chk() {
		if(confirm("정말로 삭제하시겠습니까?")) {
			location.href="managerNoticeDelete.do?nt_no=${notice.nt_no }&pageNum=${pageNum }"
		} else {
			return false;
		}
	}
</script>
</head>
<body>
<h3 align="center">공지사항</h3>
<hr>
	<table border="1">
		<caption>상세 내용</caption>
		<tr>
			<th>제목</th>
			<td>${notice.nt_sbjt }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${notice.nt_reg_dt }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${notice.nt_cont }</td>
		</tr>
	</table>

	<div align="center">
		<button onclick="location.href='managerNoticeUpdateForm.do?nt_no=${notice.nt_no }&pageNum=${pageNum }'">수정</button>
	</div>
	
	<div align="center">
		<button onclick="return chk()">삭제</button>
	</div>
	
	<div align="center">
		<button onclick="location.href='managerNoticeList.do?pageNum=${pageNum }'">목록</button>
	</div>
	
</body>
</html>