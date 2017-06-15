<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<ul class="nav nav-pills nav-stacked menu">
	<h3>판매자 페이지</h3><br><br><br><br>
	<li id="menu1"><a href="/hallManage">&nbsp;</a></li>
	<li id="menu2"><a href="/seller/perMain">&nbsp;</a></li>
	<li id="menu3"><a href="/">&nbsp;</a></li>
</ul>
<ul class="nav nav-pills nav-stacked menuName">
	<br><br><br><br><br><br><br><br>
	<li id="menu11"><h4>공연장관리</h4></li>
	<li id="menu22"><h4>공연관리</h4></li>
	<li id="menu33"><h4>메인으로 이동</h4></li>
</ul>
