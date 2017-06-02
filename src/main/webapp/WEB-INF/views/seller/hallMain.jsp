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
<script>
// 사이드 네비  
$(function() {
    //메인메뉴 1
    $('#menu11').hover(
	    function () {
	    $('#menu1 > a').stop().animate({'marginLeft':'-2rem'},200);},
	    function () {
	    $('#menu1 > a').stop().animate({'marginLeft':'-24rem'},200);
    });
    //메인메뉴2
    $('#menu22').hover(
	    function () {
	    $('#menu2 > a').stop().animate({'marginLeft':'-2rem'},200);},
	    function () {
	    $('#menu2 > a').stop().animate({'marginLeft':'-24rem'},200);
    });
    //메뉴3
    $('#menu33').hover(
	    function () {
	    $('#menu3 > a').stop().animate({'marginLeft':'-2rem'},200);},
	    function () {
	    $('#menu3 > a').stop().animate({'marginLeft':'-24rem'},200);
    });
});
</script>
</head>
<body>
<div class="container-fluid">
    <div class="row content">
        <!--사이드 네비바-->
        <div class="col-sm-2 sidenav">
            <jsp:include page="sellerNav.jsp"/>
        </div>
        <div class="col-sm-10">
        	<jsp:include page="hallNav.jsp"/>
        </div>
	</div>
</div>
</body>
</html>