<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>티켓박스-뮤지컬</title>
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
    height: 86px;
    margin: 0 auto;
    background-color: #fff; 
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
    border-bottom:3px solid #503396;
    z-index: 20;
}
.middle-btn-wrap .nav-pills>li.title {
	height: 47px;
	color:#503396;
	font-size:2rem;
	font-weight:bold;
	background-color:transparent;
	vertical-align: middle;
}
.middle-btn-wrap .nav-justified li a{
	height: 47px;
	color:#111;
	font-size:1.8rem;
	font-weight:bold;
	text-align:left;
	background-color:transparent;
	vertical-align: middle;
}
.middle-btn-wrap .nav-justified li a:hover{
	color:#503396;
	background-color:transparent;
}
.middle-btn-wrap .nav-pills>li.active>a {
	height: 47px;
	color:#503396;
	font-size:1.8rem;
	background-color:transparent;
	vertical-align: middle;
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

/* 이미지 없을 경우 */
function ImgError(source){
    source.src = "../img/noImg.png";
    source.onerror = "";
    return true;
}
</script>
</head>
<body>
	<div class="container-fluid" data-spy="affix" data-offset-top="1" style="border-bottom:1px solid #ccc;">
		<div class="row" id="top-btn-wrap"> 
		    <div class="container">
				<div class="row">
				    <div class="col-sm-3 topLogoDiv">
					    <a href="../main.html" class="btn">
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
							<a class="btn btn-default btn-lg" id="musical">뮤지컬</a> 
							<a class="btn btn-default btn-lg" id="concert">콘서트</a> 
							<a class="btn btn-default btn-lg" id="shows">연극</a>
							<div class="btn-group">
								<a href="./01.html" class="btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown">로그인</a>
								<!-- 로그인 드롭다운창 -->
								<ul class="dropdown-menu" role="menu" style="top:48px;left:-130px;margin:0;padding:0;">
									<li>
										<div class="loginmodal-container" style="margin:0;">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h1>로그인</h1><br>
											<form action="main2.html">
												<input type="text" name="#" placeholder="아이디">
												<input type="password" name="#" placeholder="비밀번호">
												<input type="submit" name="#" class="login loginmodal-submit" value="로그인">
											</form>
												
											<div class="login-help">
												<a href="../sign/01.html">회원가입</a> - <a href="../finidpw/01.html">비밀번호를 잊어버리셨나요?</a>
											</div>
										</div>
									</li>
								</ul>
							</div>  
						</div>
					</div>
				</div>
			</div>
		</div> 
	</div>
	<div class="row header-btn-wrap"> 
        <div class="container">
        	<div class="row">
				<div class="col-sm-3">
					<button type="button" class="btn btn-info btn-xs btn_menu_all"><i class="glyphicon glyphicon-menu-hamburger"></i> 전체메뉴</button>
					<div class="btn_social">
					    <a class="film_society" href="./04.html" title="지역 바로가기">지역</a>
					    <i class="split"></i>
					    <a class="classic_society" href="./05.html" title="공연장 바로가기">공연장</a>
					</div>
				</div>
				<div class="col-sm-offset-6 col-sm-3">
					<div class="btn_theater">
					    <span class="membership_link">
					        <a class="membership_txt" title="회원가입 바로가기" href="../sign/01.html">회원가입</a>
					    </span>
					    <button type="button" class="btn btn-info btn-xs" name="booking_popup">빠른예매</button>
					</div>
				</div>
            </div>
        </div>
    </div>
    <div class="row middle-btn-wrap"> 
        <div class="container">
        	<div class="row">
				<div class="col-sm-12">
					<ul class="nav nav-pills nav-justified">
						<li class="title">뮤지컬</li>
						<li class="active"><a href="#">전체</a></li>
						<li><a href="#">내한공연</a></li>
						<li><a href="#">오리지널</a></li>
						<li><a href="#">라이센스</a></li>
						<li><a href="#">창작뮤지컬</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 공연들 -->
	<div class="container" id="container">
		<!-- <div class="row">
			<div class="col-md-12">
				<h2>뮤지컬</h2>
			</div>
		</div> -->
<script>
$(document).ready(function(){
	
	var regBtns=function(){
		var musical=$("#musical");
		var concert=$("#concert");
		var shows=$("#shows");
		var cateList = $("#cate");
		
		var perId;
		
		cateList.empty();

		$.ajax({
			url:"/category",
			data:"performance",
			success:function(select){
				$(select).each(function(idx, performance, hall){
					var category = '<div class="frame1">'
						+'<div class="card">'
						+'<img src="'+performance.per_image'" onerror="ImgError(this)" />'
						+'</div>'
						+'<div class="card back">'
						+'<img class="backPost" src="'+performance.per_image'" onerror="ImgError(this)" />'
						+'<article id="movieInfo">'
						+'<div class="moveInfoBtn">'
						+'<div class="moveInfoBtn1">'
						+'<a href="/detail"><span class="glyphicon glyphicon-ok"></span><br>상세정보</a>'
						+'</div>'
						+'<div class="moveInfoBtn2">'
						+'<a name="booking_popup"><span class="glyphicon glyphicon-heart"></span><br>예매하기</a>'
						+'</div>'
						+'</div>'
						+'</article>'
						+'</div>'
						+'</div>'
						+'<div class="movieInfo2">'
						+'<div style="float:left;width:35%">평점 4.5</div>' 
						+'<div style="display:inline;width:65%">'
						+'<input id="input-2" name="input-name" type="number" class="rating rating-loading" min=0 max=5 step=0.1 value=4.5 data-size="xs" data-show-clear="false" data-show-caption="false" data-rtl="false" data-readonly="true">'
						+'</div>'
						+'<div class="movieInfo3">'
						+'<p>'
						+'<span class="age">12</span>'+performance.per_title''
						+'</p>'
						+'<div class="movieInfo3Txt">'hall.hallName'</div>'
						+'</div>'
						+'</div>';
			$("#cate").append(category);
				});
		
			}
		});
	};
});
	var musical = function(){
		
			
			
			/* var div1=$("<div class='frame1'></div>");
			var div2=$("<div class='card'></div>");
			var div3=$("<div class='card back'></div>");
			var div4=$("<div class='moveInfoBtn'></div>");
			var div5=$("<div class='moveInfoBtn1'></div>");
			var div6=$("<div class='moveInfoBtn2'></div>");
			var div7=$("<div class='movieInfo2'></div>");
			var div8=$("<div style='float:left;width:35%'>평점 4.5</div>");
			var div9=$("<div style='display:inline;width:65%'></div>");
			var div10=$("<div class='movieInfo3'></div>");
			var div11=$("<div class='movieInfo3Txt'>공연장</div>");
			
			var img1=$("<img src='./img/에어리언.jpg' onerror='ImgError(this)' />");
			var img2=$("<img class='backPost' src='./img/에어리언.jpg' onerror='ImgError(this)' />");
			
			var art1=$("<article id='movieInfo'></article>");
			var a1=$("<a href='/detail'><span class='glyphicon glyphicon-ok'></span><br>상세정보</a>")
			var a2=$("<a name='booking_popup'><span class='glyphicon glyphicon-heart'></span><br>예매하기</a>");
			
			var input=$("<input id='input-2' name='input-name' type='number' class='rating rating-loading' min=0 max=5 step=0.1 value=4.5 data-size='xs' data-show-clear='false' data-show-caption='false' data-rtl='false' data-readonly='true'>");
			
			var span3=$("<p> <span class='age'>12</span> 공연1 </p>");
		
			
		$("#cate").append(div1.append(div2.append(img1)).append(div3.append(img2+art1.append(div4.append(div5.append(a1)+div6.append(a2)))))
				+div7.append(div8+div9.append(input))
				+div10.append(span3)+div11); */
		};	
</script>
		<div class="row">
			<div class="col-md-12 frameDiv">
				<div class="frame" id="cate">
				</div>
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
	
	$(function(){
		
	})
	</script>
</body>
</html>