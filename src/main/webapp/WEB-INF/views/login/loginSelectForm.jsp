<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- <div class="container">
		<div id="member">Select</div>
		<div id="inner_owner" onclick="location.href='ownLoginForm.do'">견주 로그인</div>
		<div id="inner_walker" onclick="location.href='wkrLoginForm.do'">도우미 로그인</div>
		<button type="button" class="btn btn-outline-primary" onclick="location.href='ownLoginForm.do'">Owner</button>
		<button type="button" class="btn btn-outline-primary" onclick="location.href='wkrLoginForm.do'">Walker</button>
	</div> -->
	
	<body>
	<div class="container"> 
		<div id="content" align="center">
		<div class="row">
	
		<!-- md : pc 크기의 컬럼을 2개 차지 -->
		<div class="col-md-3"></div>
		<div class="col-md-5">
		<h3>로그인</h3>
		<form role="form" class="form-horizontal" action="login.do" name="frm" method="post">  
		    <div class="form-group">   
		        <label for="Name"  class="col-xs-2 col-lg-2 control-label">아이디</label>
		        <div class="col-xs-10 col-lg-10">
		            <input type="text" class="form-control" placeholder="아이디" name="id" required="required" autofocus="autofocus"> 
		        </div>
		    </div>       
	    	<div class="form-group">  
		        <label for="Passward"  class="col-xs-2 col-lg-2 control-label">암호</label>
	    	    <div class="col-xs-10 col-lg-10">
		            <input type="password" class="form-control" placeholder="암호" name="pass" required="required" > 
		        </div> 
	    	</div> 
	  		 <div class="form-group"> 
	  		 	<div class="row"> 
		  		 	<div class="col-md-2"></div>
		  		 	<div class="col-md-4">   
		        	<button type="submit"  class="btn btn-default"> 로그인</button>   
		        	<button type="button"  class="btn btn-default" onclick="history.go(-1)"> 취소</button>
		        	</div>
		        	<div class="col-md-1"></div>
		        	<div class="col-md-5">   
		        	<button type="button"  class="btn btn-default" onclick="findId()"> 아이디찾기</button>
		        	<button type="button"  class="btn btn-default" onclick="findPass()"> 암호찾기</button>
		        	</div>
		        	<!-- <div class="col-md-1"></div> 
	        	</div> -->
	    	</div>              
	    </form> 
	    </div>
	    <div class="col-md-4"></div>
	</div>
	</div>
	</div>

<!-- <button onclick="location.href='joinChoice.do'">회원가입</button> -->

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
   integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
   integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>