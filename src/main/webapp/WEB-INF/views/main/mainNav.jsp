<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 연결 -->
<link rel="stylesheet" href="css/bootstrap.css">

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
  <div class="container">
  <a class="navbar-brand" href="">산책하개!</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="noticeList.do">공지사항</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="mbList.do">산책하개</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">프로필</a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="dogProfileList.do">반려견 프로필</a>
          <a class="dropdown-item" href="walkerProfileList.do">도우미 프로필</a>
        </div>
      </li>
      <li class="nav-item">
      	<a class="nav-link" href="loginForm.do">내 예약</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">이용하기</a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="loginForm.do">로그인</a>
          <a class="dropdown-item" href="joinChoice.do">회원가입</a>
        </div>
      </li>
    </ul>
  </div>
</div>
</nav>
</body>
</html>