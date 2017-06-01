<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
#button1{
    background-color:black; 
    color:white;
}
</style>
</head>
<body>
<ul class="nav nav-pills nav-stacked menu">
	<h3>판매자 페이지</h3><br><br><br><br>
	<li id="menu1"><a href="sellerMain.jsp">&nbsp;</a></li>
	<li id="menu2"><a href="sellerPerAdd.jsp">&nbsp;</a></li>
	<li id="menu3"><a href="sellerMain.jsp">&nbsp;</a></li>
</ul>
<ul class="nav nav-pills nav-stacked menuName">
	<br><br><br><br><br><br><br><br>
	<li id="menu11"><h4>공연장관리</h4></li>
	<li id="menu22"><h4>공연관리</h4></li>
	<li id="menu33"><h4>Q&A답변</h4></li>
</ul>
</body>
</html>