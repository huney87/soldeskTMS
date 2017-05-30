<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>티켓박스 메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
<script src="/js/star-rating.js" type="text/javascript"></script>
<link href="/theme/krajee-svg/theme.css" media="all" rel="stylesheet" type="text/css" />
<script src="/theme/krajee-svg/theme.js"></script>
<script src="/js/locales/kr.js"></script>
<link rel="stylesheet" type="text/css" href="/css/login.css">
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
    top:0.5rem;
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
    width:2.3rem;
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

/* 상단 고정메뉴 */
.affix {
      top: 0;
      width: 100%;
      z-index: 999 !important;
}
.affix + .container-fluid {
      padding-top: 124px;
}

/* 상단 중간 메뉴 */
.header-btn-wrap {
    width: 100%;
    height: 61px;
    position: relative;
    margin: 0 auto;
    margin-bottom: 15px;
    z-index: 20;
}
.btn_menu_all {
    margin-top: 18px;
    height: 32px;
    width: 98px;
    font-size: 14px;
    background-position: 0 0;
    vertical-align: middle;
}
.btn_social {
    position: absolute;
    top: 23px;
    left: 117px;
}
.btn_social a.film_society, .btn_social a.classic_society {
    font-weight: bold;
    font-size: 14px;
    color: #fff;
    text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
    line-height: 13px;
}
.btn_social a {
    height: 13px;
}
.btn_theater {
    position: absolute;
    top: 18px;
    right: 0;
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
    color: #fff;
    text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
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
    float: left;
    height: 32px;
    width: 113px;
    font-size: 14px;
    background-position: 0 0;
    vertical-align: middle;
}


/* 메인 슬라이드 */
#myCarousel {
    margin-top:-7.6rem;
}

/* 공연 포스트 */
#mainContent{
	background-color: #f2f2f2;
	padding-bottom: 3rem;
}

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
	border: 1px solid #d9d9d9;
	background-color:#fff;
}
.frame1 {
	position: relative;
	transform-style: preserve-3d;
	transition: all 0.5s linear;
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
	background-color: #000;
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
	font-size: 2.6rem;
	margin-bottom:0.5rem;
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
	border-bottom: 1px solid #d9d9d9;
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
</style>
<script type="text/javascript">
var booking_popup = function(){
	var popup_url = "./ticketing/01.html";
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

var logincheck = function(user){
	/*var user = {
		"email" : userid,
		"pw" : userpw,
	};*/
	$.ajax({
		method : "post",
		url : "/login/check",
		data : user,
		dataType : "json",
		success : function(data){
			if(data.loginFlag == 1){
				alert("로그인 성공");
				window.location.reload();
			}else {
				alert("아이디나 비밀번호를 확인하세요.");
			}
		},
		error : function(){
			alert("로그인 실패");
		}
	});
}

/*도큐먼트 레디*/
$(document).ready(function(){
	$("[name='booking_popup'").click(function(){                
		booking_popup();
	});
	
	$("#topAdClose").click(function(){
        $("#topHeadAd").hide();
    });	
	
	$('#login-form').submit(function(e){
		e.preventDefault();
		logincheck( $( this ).serialize() );
	});
});
/* 이미지 없을 경우 */
function ImgError(source){
    source.src = "./img/noImg.png";
    source.onerror = "";
    return true;
}
</script>
</head>
<body>
	<div class="container-fluid" data-spy="affix" data-offset-top="1" style="border-bottom:1px solid #888;">
		<div class="row" id="topHeadAd">
		    <div class="container">
                <div class="row">
					<div class="col-sm-12 text-center" style="position: relative">
					   <button type="button" class="close" id="topAdClose"><span aria-hidden="true" class="btnTopAdClose">&times;</span><span class="sr-only">Close</span></button>
					    <img src="./img/topHeadAd.jpg">
					</div>
				</div>
			</div>
		</div>
		<div class="row" id="top-btn-wrap"> 
		    <div class="container">
				<div class="row">
				    <div class="col-sm-3 topLogoDiv">
					    <a href="#" class="btn">
					    <span class="topLogo">T</span>
					    <span class="topLogo">I</span>
					    <span class="topLogo">C</span>
					    <span class="topLogo">K</span>
					    <span class="topLogo">E</span>
					    <span class="topLogo">T</span>
					    <span class="topLogo">B</span>
					    <span class="topLogo">O</span>
					    <span class="topLogo">X</span>
					    </a>
					</div>
					<div class="col-sm-9">
						<div class="btn-group btn-group-justified" id="nav">
							<a href="./category/01.html" class="btn btn-default btn-lg">뮤지컬</a> 
							<a href="./category/02.html" class="btn btn-default btn-lg">콘서트</a> 
							<a href="./category/03.html" class="btn btn-default btn-lg">연극</a>
							<div class="btn-group">
							<%
							if(session.getAttribute("email") != null && !session.getAttribute("email").equals("")){
							%>
								<a href="/login/logout" class="btn btn-default btn-lg">로그아웃</a>								
							<%}else{ %>
								<a class="btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown">로그인</a>
								<!-- 로그인 드롭다운창 -->
								<ul class="dropdown-menu" role="menu" style="top:48px;left:-130px;margin:0;padding:0;">
									<li>
										<div class="loginmodal-container" style="margin:0;">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h1>로그인</h1><br>
											<form id="login-form">
												<input type="text" name="email" placeholder="아이디">
												<input type="password" name="pw" placeholder="비밀번호">
												<input type="submit" name="login-btn" class="login loginmodal-submit" value="로그인">
											</form>
												
											<div class="login-help">
												<a href="./sign/01.html">회원가입</a> - <a href="./finidpw/01.html">비밀번호를 잊어버리셨나요?</a>
											</div>
										</div>
									</li>
								</ul>
							<%} %>
							</div>  
						</div>
					</div>
				</div>
			</div>
		</div> 
	</div>
	<div class="row" style="background-color: #fff;"> 
        <div class="container">
			<div class="header-btn-wrap">
				<button type="button" class="btn btn-info btn-xs btn_menu_all"><i class="glyphicon glyphicon-menu-hamburger"></i> 전체메뉴</button>
				<div class="btn_social">
				    <a class="film_society" href="#" title="지역 바로가기">지역</a>
				    <i class="split"></i>
				    <a class="classic_society" href="#" title="공연장 바로가기">공연장</a>
				</div>
				<div class="btn_theater">
				    <span class="membership_link">
				        <a class="membership_txt" title="회원가입 바로가기" href="./sign/01.html">회원가입</a>
				    </span>
				    <button type="button" class="btn btn-info btn-xs" name="booking_popup">빠른예매</button>
				</div>
            </div>
        </div>
    </div>
    
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">

			<div class="item active">
				<img src="./img/carouselImg01.png" alt="image01" style="width: 100%;">
			</div>

			<div class="item">
				<img src="./img/carouselImg02.png" alt="image02" style="width: 100%;">
			</div>

			<div class="item">
				<img src="./img/carouselImg03.png" alt="image03" style="width: 100%;">
			</div>

		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	
	<div class="container-fluid" id="mainContent">
		<div class="container" style="padding:2rem 0;">
	        <div class="row">
	            <div class="col-md-8 col-md-offset-2">
		            <div class="btn-group btn-group-justified">
		               <a href="#" class="btn btn-default btn-lg">뮤지컬</a> 
	                   <a href="#" class="btn btn-default btn-lg">콘서트</a> 
	                   <a href="#" class="btn btn-default btn-lg">연극</a>
		            </div>
	            </div>
	        </div>
	    </div>
		
		<!-- 공연들 -->
		<div class="container" id="container">
			<div class="row">
				<div class="col-md-12 frameDiv">
					<div class="frame">
						<div class="frame1">
							<div class="card">
								<img src="./img/에어리언.jpg" onerror="ImgError(this)" />
							</div>
							<div class="card back">
								<img class="backPost" src="../img/에어리언.jpg" onerror="ImgError(this)" />
								<article id="movieInfo">
									<input id="input-id" type="text" class="rating" data-size="xs" >
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<span class="glyphicon glyphicon-ok"></span><br> 본공연
										</div>
										<div class="moveInfoBtn2">
											<span class="glyphicon glyphicon-heart"></span><br> 보고싶어요
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo2">
							2017.05.25 <span class="dDay">D-1</span>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 1
							</p>
							<div class="movieInfo3Btn"><a href="./detail/01.html">상세정보</a></div>
							<div class="movieInfo3Btn"><a name="booking_popup">예매하기</a></div>
						</div>
					</div>
					<div class="frame">
						<div class="frame1">
							<div class="card">
								<img src="./img/titanic.jpg" onerror="ImgError(this)" />
							</div>
							<div class="card back">
								<img class="backPost" src="../img/titanic.jpg" onerror="ImgError(this)">
								<article id="movieInfo">
									<input id="input-id" type="text" class="rating" data-size="xs" >
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<span class="glyphicon glyphicon-ok"></span><br> 본공연
										</div>
										<div class="moveInfoBtn2">
											<span class="glyphicon glyphicon-heart"></span><br> 보고싶어요
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo2">
							2017.05.25 <span class="dDay">D-1</span>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 2
							</p>
							<div class="movieInfo3Btn"><a href="./detail/01.html">상세정보</a></div>
							<div class="movieInfo3Btn"><a name="booking_popup">예매하기</a></div>
						</div>
					</div>
					<div class="frame">
						<div class="frame1">
							<div class="card">
								<img src="./img/titanic.jpg" onerror="ImgError(this)" />
							</div>
							<div class="card back">
								<img class="backPost" src="../img/titanic.jpg" onerror="ImgError(this)">
								<article id="movieInfo">
									<input id="input-id" type="text" class="rating" data-size="xs" >
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<span class="glyphicon glyphicon-ok"></span><br> 본공연
										</div>
										<div class="moveInfoBtn2">
											<span class="glyphicon glyphicon-heart"></span><br> 보고싶어요
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo2">
							2017.05.25 <span class="dDay">D-1</span>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 3
							</p>
							<div class="movieInfo3Btn"><a href="./detail/01.html">상세정보</a></div>
							<div class="movieInfo3Btn"><a name="booking_popup">예매하기</a></div>
						</div>
					</div>
					<div class="frame">
						<div class="frame1">
							<div class="card">
								<img src="./img/titanic.jpg" onerror="ImgError(this)" />
							</div>
							<div class="card back">
								<img class="backPost" src="../img/titanic.jpg" onerror="ImgError(this)">
								<article id="movieInfo">
									<input id="input-id" type="text" class="rating" data-size="xs" >
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<span class="glyphicon glyphicon-ok"></span><br> 본공연
										</div>
										<div class="moveInfoBtn2">
											<span class="glyphicon glyphicon-heart"></span><br> 보고싶어요
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo2">
							2017.05.25 <span class="dDay">D-1</span>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 4
							</p>
							<div class="movieInfo3Btn"><a href="./detail/01.html">상세정보</a></div>
							<div class="movieInfo3Btn"><a name="booking_popup">예매하기</a></div>
						</div>
					</div>
					<div class="frame">
						<div class="frame1">
							<div class="card">
								<img src="./img/titanic.jpg" onerror="ImgError(this)" />
							</div>
							<div class="card back">
								<img class="backPost" src="../img/titanic.jpg" onerror="ImgError(this)">
								<article id="movieInfo">
									<input id="input-id" type="text" class="rating" data-size="xs" >
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<span class="glyphicon glyphicon-ok"></span><br> 본공연
										</div>
										<div class="moveInfoBtn2">
											<span class="glyphicon glyphicon-heart"></span><br> 보고싶어요
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo2">
							2017.05.25 <span class="dDay">D-1</span>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 5
							</p>
							<div class="movieInfo3Btn"><a href="./detail/01.html">상세정보</a></div>
							<div class="movieInfo3Btn"><a name="booking_popup">예매하기</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container-fluid" id="footer">
        <div class="row">
            <div class="container">
	            <div id="footerDiv" class="col-sm-2">
	            지역
	            </div>
	            <div id="footerSocial"class="col-sm-10">
	            강원 경기 경남 경북 광주 대구 대전 부산 서울 세종 울산 인천 전남 전북 제주 충남 충북
	            </div>
	            <div id="footerDiv" class="col-sm-2">
	            공연장
	            </div>
	            <div id="footerTheater" class="col-sm-10">
	            세종문화회관 예술의전당 충무아트센터 성남아트센터 경기도문화의전당 안산문화예술의전당
	            </div>
	        </div>
        </div>
    </div>
    <div class="container-fluid" id="footer2">
        <div class="row">
            <div class="container">
                <div class="col-sm-4">
					<a href="#" class="btn btn-link">
						<span class="topLogo">T</span>
						<span class="topLogo">I</span>
						<span class="topLogo">C</span>
						<span class="topLogo">K</span>
						<span class="topLogo">E</span>
						<span class="topLogo">T</span>
						<span class="topLogo">B</span>
						<span class="topLogo">O</span>
						<span class="topLogo">X</span>
					</a>
	            </div>
	            <div class="col-sm-8">
                    <div class="row">
		                <div class="row footerDiv2">
		                   회사소개 | 채용정보 | 제휴/광고/부대사업 문의 | 이용약관 | 개인정보 처리방침 | 고객센터
		                </div>
		                <div class="row footerDiv2">
			                        서울특별시 종로구 관철동 종로12길 15 / T : 02-6901-7022<br>
							대표자명 윤광재 | 개인정보보호 책임자 개발지원실 실장 유강현<br>
							사업자등록번호 000-00-00000 | 통신판매업신고번호 제 000호
						</div>
		                <div class="row footerDiv2">
		                    Copyright 2017 by TICKETBOX. All rights reserved
		                </div>
		            </div>
	            </div>
            </div>
        </div>
    </div>
    <div id="MOVE_TOP_BTN">
    <span class="glyphicon glyphicon-circle-arrow-up" title="맨위로"></span>
    </div>
	<script>
	$(function() {
	    $(window).scroll(function() {
	        if ($(this).scrollTop() > 200) {
	            $('#MOVE_TOP_BTN').fadeIn();
	        } else {
	            $('#MOVE_TOP_BTN').fadeOut();
	        }
	    });
	    
	    $("#MOVE_TOP_BTN").click(function() {
	        $('html, body').animate({
	            scrollTop : 0
	        }, 100);
	        return false;
	    });
	    
	    $("#input-id").rating({'size':'xs'});
	});
	</script>
</body>
</html>