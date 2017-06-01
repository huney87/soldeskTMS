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
/*************************사이드네비 속성*****************************/
.row.content {height: 100rem}
.sidenav {
    background-color:black;
    color: white;
    height: 100%;
}
.menu{
    position: fixed;
    margin: 0px;
    padding: 0px;
    list-style: none;
    z-index:9999;
}
.menuName{
    position: fixed;
    margin: 0px;
    padding: 0px;
    list-style: none;
    z-index:9999;
}
.menu li a{
    margin-left: -24rem;
    width: 25rem;
    height: 6rem;    
}
.menuName li{
    color:white;
    width: 25rem;
    height: 5rem; 
    text-align: center;
}
#menu1 a{
    background-color: red;   
}
#menu2 a{
    background-color: blue;   
}
#menu3 a{
    background-color:green;   
}
</style>
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
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <ul class="nav nav-pills nav-stacked menu">
        <h3>판매자 페이지</h3><br><br><br><br>
        <li id="menu1"><a href="#section1"><h4>&nbsp;</h4></a></li>
        <li id="menu2"><a href="#section2"><h4>&nbsp;</h4></a></li>
        <li id="menu3"><a href="#section3"><h4>&nbsp;</h4></a></li>
      </ul>
      <ul class="nav nav-pills nav-stacked menuName">
        <br><br><br><br><br><br><br><br>
        <li id="menu11"><h4>공연장관리</h4></li>
        <li id="menu22"><h4>공연관리</h4></li>
        <li id="menu33"><h4>Q&A답변</h4></li>
      </ul>
    </div>

    <div class="col-sm-10" id="">
        <div class="row" id="mainResult"></div> 
	    <div class="row" id="mainResult2"></div> 
    </div>

  </div>
</div>
</div>
</body>
</html>