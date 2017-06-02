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
    background:gray;
} 
h4{
	color:white;
}
.mainBtn{
	margin-left: 1rem;
	margin-right: 1rem;
	margin-bottom: 1.5rem;
	margin-top: 1.5rem;
}
.hallNav{
	background-color: #1a1a1a;
	border: 0.1rem solid #4d4dff;
	text-align: center;
}
</style>
</head>
<body>
<div class="row">
	<div class="col-sm-12 hallNav">
		<div class="col-sm-2" style="color:white;">
		  <h3>공연장 관리</h3>
		</div>
		<div class="col-sm-2">
			<a href="/hallManage/cenAdd" class="btn btn-md btn-default mainBtn" id="search">회관 등록</a>
		</div>
		<div class="col-sm-8">			
		<input type="text" id="searchHall" placeholder="공연장 이름 작성">
		<button type="button" class="btn btn-md btn-default mainBtn" id="search">공연장 검색</button>
		<button type="button" class="btn btn-md btn-default mainBtn" id="searchAll">전체검색</button>
		<a href="/hallManage/hallAdd" class="btn btn-md btn-default mainBtn" id="resistHall">공연장 등록</a>
		</div>			
	</div>
</div>
</body>
</html>