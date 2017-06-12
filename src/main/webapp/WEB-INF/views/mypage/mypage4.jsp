<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
/* 마이페이지 */
.mypageBtn{
	font-size:1.8rem;
	font-weight:bold;
	padding:2rem 0 1.5rem 0;
	text-decoration:none;
}
.mypageBtn span{
	font-size:5rem;
	margin-bottom:1rem;
	text-decoration:none;
}
</style>
<script type="text/javascript">
function ImgError(source){
    source.src = "../img/noImg.png";
    source.onerror = "";
    return true;
}
$(function() { $("#postcodify_search_button").postcodifyPopUp(); });
</script>
</head>
<body>
<div class="container-fluid" data-spy="affix" data-offset-top="1" style="border-bottom:1px solid #888;">
		<div class="row" id="top-btn-wrap"> 
		    <div class="container">
				<div class="row">
				    <div class="col-sm-3 topLogoDiv">
					    <a href="../main/main2.html" class="btn" style="width:10%;">
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
						<a href="../category/01.html" class="btn btn-default btn-lg">뮤지컬</a> 
						<a href="../category/02.html" class="btn btn-default btn-lg">콘서트</a> 
						<a href="../category/03.html" class="btn btn-default btn-lg">연극</a>
						<a href="../main.html" class="btn btn-default btn-lg">로그아웃</a>
					</div>
					</div>
				</div>
			</div>
		</div> 
	</div>
	<div class="row header-btn-wrap"> 
        <div class="container">
        	<div class="row">
				<div class="col-sm-2">
					<button type="button" class="btn btn-info btn-xs btn_menu_all"><i class="glyphicon glyphicon-menu-hamburger"></i> 전체메뉴</button>
					<div class="btn_social">
					    <a class="film_society" href="../category/04.html" title="지역 바로가기">지역</a>
					</div>
				</div>
				<!-- 검색창 -->
				<div class="col-sm-6">
					<div class="header_search text-center">
						<form class="form-inline form-group-lg" id="searchlist" role="search" action="#">
							<select class="form-control" id="sel" name="search">
								<option value="all">통합검색</option>
								<option value="date">날짜별</option>
								<option value="cate">장르별</option>
								<option value="local">지역벌</option>
							</select>
							<input type="text" class="form-control" id="search" name="searchDetail"/>
							<button type="submit" id="search-btn" class="btn btn-default btn-lg">검색</button>
							<a href="#"><button type="button" class="btn btn-default btn-lg" id="rank">순위별</button></a>
						</form>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="btn_theater">
					    <span class="membership_link">
					        <a class="membership_txt" title="회원가입 바로가기" href="../mypage/01.html">마이페이지</a>
							<i class="split"></i>
							<a class="membership_txt" title="회원가입 바로가기" href="../seller/01.html">판매자</a>
							<i class="split"></i>
							<a class="membership_txt" title="회원가입 바로가기" href="../admin/01.html">관리자</a>
					    </span>
					    <button type="button" class="btn btn-info btn-xs" name="booking_popup">빠른예매</button>
					</div>
				</div>
            </div>
        </div>
    </div>
<div class="container" style="padding:2rem 0;">
	<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
			<div class="btn-group btn-group-justified">
		  		<a href="../mypage/01.html" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-user"></span><br>개인정보수정</a>
		  		<a href="../mypage/02.html" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-check"></span><br>예매확인/취소</a>
		  		<a href="../mypage/03.html" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-erase"></span><br>관람내역</a>
		  		<a href="../mypage/04.html" class="btn btn-primary mypageBtn"><span class="glyphicon glyphicon-remove-sign"></span><br>회원탈퇴</a>
			</div>
	
	<div class="page-header">
  		<h1>회원탈퇴</h1>
	</div>

	<form action="#">
	<div class="list-group">
  		<li class="list-group-item active">개선사항</li>
  		<li class="list-group-item">
  			<div class="radio">
  				<label><input type="radio" name="#">서비스 장애가 잦아서</label>
			</div>
			<div class="radio">
  				<label><input type="radio" name="#">이벤트 및 무료서비스 혜택이 적어서</label>
			</div>
			<div class="radio">
  				<label><input type="radio" name="#">불만 및 불편 사항에 대해 고객 응대가 나빠서</label>
			</div>
			<div class="radio">
  				<label><input type="radio" name="#">탈퇴 후 재가입을 위해</label>
			</div>
			<div class="radio">
  				<label><input type="radio" name="#">기타</label>
			</div>
  		</li>
  		<li class="list-group-item active">비밀번호 확인</li>
  		<li class="list-group-item">
  			<input type="password" name="#" class="form-control" placeholder="비밀번호를 입력해주세요." required/>
  		</li>
	</div>
	<div class="clearfix"></div>
	<div class="col-sm-4 col-sm-offset-4 text-center">
		<a href="#" class="btn btn-danger btn-block btn-lg" role="submit">탈 퇴</a>
	</div>
	</form>
</div>
</div>
</div>
<div id="MOVE_TOP_BTN">
    <span class="glyphicon glyphicon-circle-arrow-up" title="맨위로"></span>
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