<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/frames/header.jsp" flush="false"/>

<title>페이지</title>
<!-- 날짜 입력 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" /> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>

<link href="/css/menu.css" media="all" rel="stylesheet" type="text/css" />

<style type="text/css">
/* 웹폰트 */
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
 * {
    box-sizing: border-box;
 }
 
body {
    font-family: 'NotoSansKR', 'Nanum Gothic', "Times New Roman", Times, sans-serif;
}

/* 최상단 광고창 */
#topHeadAd {
    text-align: center;
    background-color: #0e8eb9; 
    height: 96px;
}
#topHeadAd img{
    margin: auto;
    width:auto;
    height:auto;
    display: block;
}
.btnTopAdClose {
    position:absolute; 
    color:white;
    top:1rem;
    right:2rem;
    padding:0 0.5rem 0.1rem 0.5rem;
    opacity: 1.0;
    border:1px dashed white;
    font-size:3.8rem;
}
/* 상단 메뉴 */
#top-btn-wrap{
    background-color: #fff;
    padding-top:0.2rem;
}
#nav a{
    text-decoration: none;
}
/* 상단로고 */
.topLogo {
    display:inline-block; 
    width:2.6rem;
    padding:0.3rem;
    margin:0 -0.09rem;
    color: #fff;
    font-size:2rem;
    font-weight:bold;
    text-decoration: none;
    background-color: #555;
}

.topLogoDiv a span:HOVER {
	text-decoration: none;
}

/* 상단 중간 메뉴 */
.header-btn-wrap {
    width: 100%;
    height: 86px;
    margin: 0 auto;
    background-color: #fff; 
    border-bottom:1px solid #ccc;
    z-index: 20;
}
.btn_menu_all {
    margin-top: 28px;
    height: 32px;
    width: 98px;
    font-size: 14px;
    background-position: 0 0;
    vertical-align: middle;
}
.btn_social {
    position: absolute;
    top: 33px;
    left: 137px;
}
.btn_social a.film_society, .btn_social a.classic_society {
    font-weight: bold;
    font-size: 14px;
    color: #000;
    line-height: 13px;
}
.btn_social a {
    height: 23px;
}
.header_search{
	margin-top: 20px;
}
.btn_theater {
    float: right;
    margin-top: 28px;
}
.btn_social .split {
    margin: 0 12px;
    border-right: 1px solid #555;
    height: 13px;
    vertical-align: middle;
}
.btn_theater .membership_link {
    float: left;
    margin: 12px 24px;
}
.btn_theater .membership_link .membership_txt {
    font-weight: bold;
    font-size: 14px;
    color: #000;
    line-height: 13px;
}
.btn_theater .membership_link>* {
    float: left;
    height: 13px;
}
.btn_theater .membership_link .split {
    margin: 0 12px;
    border-left: 1px solid #000;
}
.btn_theater button {
    display: block;
    float: right;
    height: 32px;
    width: 113px;
    font-size: 14px;
    background-position: 0 0;
    vertical-align: middle;
}

/* 상단 고정메뉴 */
.affix {
      top: 0;
      width: 100%;
      z-index: 999 !important;
}
.affix + .container-fluid {
      padding-top: 124px;
}

/* 메인 슬라이드 */
#myCarousel {
    margin-top:-7.6rem;
}

/* 분류 하위메뉴 */
.middle-btn-wrap{
	width: 100%;
    height: 50px;
    margin: 0 auto;
    margin-bottom: 15px;
    background-color: #f2f2f2; 
    border-bottom:1px solid #ccc;
    z-index: 20;
}

/* 공연 포스트 */
.frameDiv {
	margin: 0.5rem 0;
	width: 100%;
	height: 450px;
}
.frame {
	float: left;
	position: relative;
	margin-right: 0.8rem;
	height: 450px;
	width: 19.13333%;
	border: 1px solid #888;
}
.frame1 {
	position: relative;
	transform-style: preserve-3d;
	transition: all 0.7s linear;
	width: 100%;
	height: 300px;
	perspactive: 300px;
}
.frame1:hover {
	transform: rotateY(180deg);
}
.card {
	position: absolute;
	backface-visibility: hidden;
}
.backPost {
	opacity: 0.3;
}
.card img {
	width: 100%;
	height: auto;
}
.card.back {
	background-color: #333;
	transform: rotateY(180deg);
}
#movieInfo {
	position: absolute;
	margin: auto;
	width: 100%;
	top: 100px;
	color: #eee;
	font-size: 15px;
	text-align: center;
}
.moveInfoBtn {
	width: 100%;
	margin-top: 65px;
	border-top: 1px solid #888;
	font-size: 15px;
}
.moveInfoBtn span {
	font-size: 3rem;
}
.moveInfoBtn1 {
	float: left;
	width: 50%;
	height: 78px;
	padding-top: 13px;
	background-color: #333;
	border-right: 1px solid #222;
}
.moveInfoBtn1:HOVER {
	background-color: #222;
}
.moveInfoBtn2 {
	float: left;
	width: 50%;
	height: 78px;
	padding-top: 13px;
	background-color: #333;
	border-left: 1px solid #888;
}
.moveInfoBtn2:HOVER {
	background-color: #222;
}
.movieInfo2 {
	text-align: center;
	font-size: 17px;
	padding: 10px;
	border-bottom: 1px solid #555;
}
.movieInfo2 .dDay {
	padding: 5px 25px;
	margin-left: 10px;
	color: white;
	text-align: center;
	font-size: 1.8rem;
	background-color: #00ace6;
	border-radius: 5px;
}
.movieInfo3 {
	text-align: center;
	font-size: 19px;
	font-weight: bold;
	padding: 10px;
}
.movieInfo3 .age {
	padding: 3px 2px;
	margin-right: 10px;
	color: white;
	text-align: center;
	font-size: 1.4rem;
	background-color: #00ace6;
	border-radius: 5px;
	font-weight: normal;
}
.movieInfo3Btn {
	float: left;
	width: 43%;
	padding: 10px;
	margin: 0 3.5% 0 3%;
	font-size: 1.35rem;
	color: #555;
	background-color: #eee;
	border: 1px solid #eee;
}
.movieInfo3Btn a{
	color: #555;
	cursor:pointer;
}
}
.movieInfo3Btn:HOVER {
	color: #00ace6;
	background-color: #fff;
	border: 1px solid #00ace6;
}
.movieInfo3Btn:HOVER a{
	color: #00ace6;
	text-decoration: none;
}

/* 공통하단 */
#footer {
    margin-top:2rem;
    padding:2rem;
    background-color: #555;
}
#footerDiv {
    color:#fff;
    padding: 1rem;
}
#footerSocial {
    text-decoration: none;
    word-spacing: 20px;
    color:#fff;
    padding: 1rem;
}
#footerTheater {
    text-decoration: none;
    word-spacing: 20px;
    color:#fff;
    padding: 1rem;
}
#footer2 {
    padding:2rem;
    background-color: #222;
}
#footer2 .footerDiv2 {
    padding:0.8rem 1rem;
    color:#ccc;
}
/* 고정 탑 메뉴 */
#MOVE_TOP_BTN{
    color: #00ace6;
    font-size: 5rem;
    position: fixed; 
    bottom: 10px; 
    right: 10px; 
    z-index: 100; 
    cursor: pointer; 
    display: block;
}
table{
	font-size:2em;
}
</style>
<script type="text/javascript">
var booking_popup = function(){
	var popup_url = "../ticketing/01.html";
	var popup_name = "예매하기";
	cw=screen.availWidth;     //화면 넓이
	ch=screen.availHeight;    //화면 높이

	sw=1000;    //띄울 창의 넓이
	sh=600;    //띄울 창의 높이

	ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
	mt=(ch-sh)/2-100;         //가운데 띄우기위한 창의 y위치
	window.open( popup_url , popup_name, 
	'width='+sw+',height='+sh+',top='+mt+',left='+ml+'scrollbars=no, menubar=no, status=no, location=no, resizable=no');
}

/*도큐먼트 레디*/
$(document).ready(function(){
	$("[name='booking_popup'").click(function(){                
		booking_popup();
	});
	
	$("#topAdClose").click(function(){
        $("#topHeadAd").hide();
    });
});
function ImgError(source){
    source.src = "../img/noImg.png";
    source.onerror = "";
    return true;
}
</script>
<jsp:include page="/WEB-INF/views/frames/menu.jsp" flush="false"/>
</head>
<body>		
	<div class="container" style="margin-top:80px">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<table class="table table-bordered">
					<tr>
						<th>공연 제목</th>
						<td>20주년 특별공연 <라이어 스페셜></td>
					</tr>
					<tr>
						<th>장소</th>
						<td>동숭아트센터 동숭홀</td>
					</tr>
					<tr>
						<th>좌석</th>
						<td>R석 5열 1번, R석 5열 2번</td>
					</tr>
					<tr>
						<th>가격</th>
						<td>20,000원</td>
				</table>
			</div>
			<div class="col-sm-8 col-sm-offset-2 text-right">
				<a href="../main/main2.html"><button class="btn btn-lg btn-info">결재</button></a>
				<button class="btn btn-lg btn-danger">취소</button>
			</div>
		</div>
	</div>	
    <jsp:include page="/WEB-INF/views/frames/footer.jsp" flush="false"/>
</body>
</html>