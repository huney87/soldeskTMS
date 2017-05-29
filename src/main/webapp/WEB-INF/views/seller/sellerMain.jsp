<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
body{
background-image: url('seller_background.jpg');
background-color: #cccccc;
background-attachment: fixed;
background-size:100%;
}
</style>
</head>
<body>
<!-- 판매자 메인 네비바 -->
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
       	   </button>
			<a class="navbar-brand" href="01.html">공연 티켓 판매자</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse"> <!-- nav 내용 시작 -->
			<ul class="nav navbar-nav">
                <li><a href="02.html">공연장관리</a></li>
                <li><a href="03.html">공연관리</a></li>
                <li><a href="04.html">Q&A답변</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">로그아웃</a></li>
				<li><a href="../main2.html">쇼핑몰</a></li>
			</ul>
		</div>
	</div>
</nav>
</body>
</html>