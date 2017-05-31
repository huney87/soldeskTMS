<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>티켓박스 메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 기본 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 모달 팝업창 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<!-- 별 평점 -->
<link href="/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
<script src="/js/star-rating.js" type="text/javascript"></script>
<link href="/theme/krajee-svg/theme.css" media="all" rel="stylesheet" type="text/css" />
<script src="/theme/krajee-svg/theme.js"></script>
<script src="/js/locales/kr.js"></script>
<!-- 로그인 창 -->
<link rel="stylesheet" type="text/css" href="/css/login.css">
<!-- 공통 -->
<link href="/css/cacao.css" media="all" rel="stylesheet" type="text/css" />
<link href="/css/main.css" media="all" rel="stylesheet" type="text/css" />

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
	$.ajax({
		method : "post",
		url : "/login/check",
		data : user,
		dataType : "json",
		success : function(data){
			if(data.loginFlag == 1){
				swal({
					title : "로그인",
					text : "로그인 성공",
				},
				function(){
					window.location.reload();
				});
				
			}else {
				swal("아이디나 비밀번호를 확인하세요.");
			}
		},
		error : function(){
			swal("로그인 실패");
		}
	});
}

/* 이미지 없을 경우 */
function ImgError(source){
    source.src = "/img/noImg.png";
    source.onerror = "";
    return true;
}

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
		return false;
	});
});
</script>
</head>
<body>
	<div class="container-fluid" data-spy="affix" data-offset-top="1" style="border-bottom:1px solid #888;">
		<div class="row" id="topHeadAd">
		    <div class="container">
                <div class="row">
					<div class="col-sm-12 text-center" style="position: relative">
					   <button type="button" class="close" id="topAdClose"><span aria-hidden="true" class="btnTopAdClose">&times;</span><span class="sr-only">Close</span></button>
					    <img src="/img/main/topHeadAd.jpg">
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
							<!-- 로그인 / 로그아웃 표시 -->												
							<c:choose>
								<c:when test="${ login }">
									<a href="/login/logout" class="btn btn-default btn-lg">로그아웃</a>
								</c:when>
								<c:otherwise>
									<a class="btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown">로그인</a>
									<!-- 로그인 드롭다운창 -->
									<ul class="dropdown-menu" role="menu" style="top:48px;left:-130px;margin:0;padding:0;">
										<li>
											<div class="loginmodal-container" style="margin:0;">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h1>로그인</h1><br>													
												<form id="login-form">												
													<input type="text" class="id" name="email" placeholder="아이디">
													<input type="password" class="pw" name="pw" placeholder="비밀번호">
													<input type="submit" class="login loginmodal-submit" value="로그인">
												</form>												
												<div class="login-help">
													<a href="./sign/01.html">회원가입</a> - <a href="./finidpw/01.html">비밀번호를 잊어버리셨나요?</a>
												</div>
											</div>
										</li>
									</ul>
								</c:otherwise>
							</c:choose>
							<!-- 로그인 / 로그아웃 표시 끝 -->
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
				<img src="/img/main/carouselImg01.png" alt="image01" style="width: 100%;">
			</div>

			<div class="item">
				<img src="/img/main/carouselImg02.png" alt="image02" style="width: 100%;">
			</div>

			<div class="item">
				<img src="/img/main/carouselImg03.png" alt="image03" style="width: 100%;">
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
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<span class="glyphicon glyphicon-ok"></span><br><a href="./detail/01.html">상세정보</a>
										</div>
										<div class="moveInfoBtn2">
											<span class="glyphicon glyphicon-heart"></span><br><a name="booking_popup">예매하기</a>
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo2">
							<div style="float:left;width:35%">평점 4.5</div> 
							<div style="display:inline;width:65%">
								<input id="input-2" name="input-name" type="number" class="rating rating-loading" min=0 max=5 step=0.1 value=4.5 data-size="xs" data-show-clear="false" data-show-caption="false" data-rtl="false" data-readonly="true">
							</div>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 1
							</p>
							<div class="movieInfo3Txt">공연장</div>
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
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<span class="glyphicon glyphicon-ok"></span><br><a href="./detail/01.html">상세정보</a>
										</div>
										<div class="moveInfoBtn2">
											<span class="glyphicon glyphicon-heart"></span><br><a name="booking_popup">예매하기</a>
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo2">
							<div style="float:left;width:35%">평점 3.2</div> 
							<div style="display:inline;width:65%">
								<input id="input-2" name="input-name" type="number" class="rating rating-loading" min=0 max=5 step=0.1 value=3.2 data-size="xs" data-show-clear="false" data-show-caption="false" data-rtl="false" data-readonly="true">
							</div>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 2
							</p>
							<div class="movieInfo3Txt">공연장</div>
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
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<span class="glyphicon glyphicon-ok"></span><br><a href="./detail/01.html">상세정보</a>
										</div>
										<div class="moveInfoBtn2">
											<span class="glyphicon glyphicon-heart"></span><br><a name="booking_popup">예매하기</a>
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo2">
							2017.05.31 <span class="dDay">D-3</span>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 3
							</p>
							<div class="movieInfo3Txt">공연장</div>
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
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<span class="glyphicon glyphicon-ok"></span><br><a href="./detail/01.html">상세정보</a>
										</div>
										<div class="moveInfoBtn2">
											<span class="glyphicon glyphicon-heart"></span><br><a name="booking_popup">예매하기</a>
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo2">
							2017.05.30 <span class="dDay">D-1</span>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 4
							</p>
							<div class="movieInfo3Txt">공연장</div>
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
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<span class="glyphicon glyphicon-ok"></span><br><a href="./detail/01.html">상세정보</a>
										</div>
										<div class="moveInfoBtn2">
											<span class="glyphicon glyphicon-heart"></span><br><a name="booking_popup">예매하기</a>
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo2">
							<div style="float:left;width:35%">평점 4.7</div> 
							<div style="display:inline;width:65%">
								<input id="input-2" name="input-name" type="number" class="rating rating-loading" min=0 max=5 step=0.1 value=4.7 data-size="xs" data-show-clear="false" data-show-caption="false" data-rtl="false" data-readonly="true">
							</div>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 5
							</p>
							<div class="movieInfo3Txt">공연장</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/frames/footer.jsp" flush="false"/>
