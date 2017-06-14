<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<script type="text/javascript">

var booking_popup = function(){
	var popup_url = "/ticket";
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
	
	$("#btnSign").click(function(){
	<c:choose>
		<c:when test="${user_type == 1}">
			window.location.assign("/admin");
	    </c:when>
	    <c:when test="${user_type == 2}">
	    	window.location.assign("/seller");
	    </c:when>
	    <c:when test="${user_type == 3}">
	    	window.location.assign("/mypage");
	    </c:when>
		<c:otherwise>
			window.location.assign("/user");
		</c:otherwise>
	</c:choose>		
    });	
	
	$('#login-form').submit(function(e){
		e.preventDefault();
		logincheck( $( this ).serialize() );
		return false;
	});
	
	$(".question").click(function(e){
 		e.preventDefault();
 		$('#answer'+$(this).attr('data-prod-answer')).toggle();   
 	});
 	
 	//글자수 제한
 	var showChar = 150; 
    var ellipsestext = "...";
     
     $('.more').each(function() {
         var content = $(this).html();
  
         if(content.length > showChar) {
             var c = content.substr(0, showChar);
             var h = content.substr(showChar, content.length - showChar);
             var html = c + '<span class="moreellipses">' + ellipsestext+ 
             '&nbsp;</span><span class="morecontent"><span>';
  
             $(this).html(html);
         }
     });
     
     $("#my-calendar").zabuto_calendar({
     	language: "kr",
	  	data: eventData,
        action: function () {
            return myDateFunction(this.id, false);
       	},
	 });
     
     $('#input-2').rating({'size':'xs'});
     $('#sideMenu').affix({offset: {top: 10} });
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
					    <a href="/" class="btn">
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
							<a href="./category2" class="btn btn-default btn-lg">뮤지컬</a> 
							<a href="./category2" class="btn btn-default btn-lg">콘서트</a> 
							<a href="./category2" class="btn btn-default btn-lg">연극</a>
							<div class="btn-group">
							<!-- 로그인 / 로그아웃 표시 -->												
							<c:choose>
								<c:when test="${login}">
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
													<a href="/user">회원가입</a> - <a href="./finidpw/01.html">비밀번호를 잊어버리셨나요?</a>
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

	<div class="row header-btn-wrap"> 
        <div class="container">
        	<div class="row">
				<div class="col-sm-6">
					<button type="button" class="btn btn-info btn-xs btn_menu_all"><i class="glyphicon glyphicon-menu-hamburger"></i> 전체메뉴</button>
					<div class="btn_social">
					    <a class="film_society" href="./04.html" title="지역 바로가기">지역</a>
					    <i class="split"></i>
					    <a class="classic_society" href="./05.html" title="공연장 바로가기">공연장</a>
					</div>
				</div>
				
				<div class="col-sm-6">
					<div class="btn_theater">
					<!-- <span class="membership_link">
					        <a class="membership_txt" title="관리자 바로가기" href="/admin">관리자</a>
					    </span> -->
					<c:choose>
						<c:when test="${user_type == 1}">
					    <button type="button" class="btn btn-info btn-xs" id="btnSign">관리자</button>
					    </c:when>
					    <c:when test="${user_type == 2}">
				 		<button type="button" class="btn btn-info btn-xs" id="btnSign">판매자</button>
					    </c:when>
					    <c:when test="${user_type == 3}">
					    <button type="button" class="btn btn-info btn-xs" id="btnSign">마이페이지</button>
					    </c:when>
						<c:otherwise>
						<button type="button" class="btn btn-info btn-xs" id="btnSign">회원가입</button>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
            </div>
        </div>
    </div>
    <div class="row middle-btn-wrap" id="middle-menu"> 
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