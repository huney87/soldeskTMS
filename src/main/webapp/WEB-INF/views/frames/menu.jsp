<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

<script type="text/javascript">

var booking_popup = function(perf_id){
	var popup_url = "/ticket?perf_id="+perf_id;
	var popup_name = "예매하기";
	cw=screen.availWidth;     //화면 넓이
	ch=screen.availHeight;    //화면 높이

	sw=1000;    //띄울 창의 넓이
	sh=600;    //띄울 창의 높이

	ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
	mt=(ch-sh)/2-100;         //가운데 띄우기위한 창의 y위치
	openWin = window.open( popup_url , popup_name, 
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
	$("[name='booking_popup']").click(function(){                
		var perf_id = $("#perf_id"+$(this).attr('data-perf_id')).val();
		booking_popup(perf_id);
	});
	
	$("#topAdClose").click(function(){
        $("#topHeadAd").hide();
    });	
	
	$("#btnSign").click(function(){
	<c:choose>
		<c:when test="${user_type == 1}">
			location.href='/admin';
	    </c:when>
	    <c:when test="${user_type == 2}">
	    	location.href='/seller';
	    </c:when>
	    <c:when test="${user_type == 3}">
	    	location.href='/mypage';
	    </c:when>
		<c:otherwise>
			location.href='/user';
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
     
     $('#sideMenu').affix({offset: {top: 10} });
     
     function buttonClicked(e) {
    	 var v = e.data.genid;
    	 console.log(v);
    	 location.href='/category?genid='+v;
     }
     
     $('#genBtn1').on('click', {genid:1}, buttonClicked);
     $('#genBtn2').on('click', {genid:2}, buttonClicked);
     $('#genBtn3').on('click', {genid:3}, buttonClicked);
    
     <c:if test='${genpid >= 1}'>
     	$('#genBtn'+<c:out value="${genpid}"/>).addClass('active');
     </c:if>
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
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-lg" id="genBtn1">뮤지컬</button>
							</div>
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-lg" id="genBtn2">콘서트</button>
							</div>
							<div class="btn-group"> 
								<button type="button" class="btn btn-default btn-lg" id="genBtn3">연극</button>
							</div>
							<div class="btn-group">
							<!-- 로그인 / 로그아웃 표시 -->												
							<c:choose>
								<c:when test="${user_type >= 1}">
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
													<a href="/user">회원가입</a> - <a href="/user/find">비밀번호를 잊어버리셨나요?</a>
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
					    <a class="film_society" href="/category2?locid=all" title="지역 바로가기">지역</a>
					    <i class="split"></i>
					    <a class="classic_society" href="/category2?hid=all" title="공연장 바로가기">공연장</a>
					</div>
				</div>
				
				<div class="col-sm-6">
					<div class="btn_theater">
					<c:if test="${user_type >= 2}">
						<span class="membership_link">
					        <a class="membership_txt" title="마이페이지 바로가기" href="/mypage">${email}</a>
					    </span>
					</c:if>
					<c:choose>
						<c:when test="${user_type eq 1}">
					    <button type="button" class="btn btn-info btn-xs" id="btnSign">관리자</button>
					    </c:when>
					    <c:when test="${user_type eq 2}">
				 		<button type="button" class="btn btn-info btn-xs" id="btnSign">판매자</button>
					    </c:when>
					    <c:when test="${user_type eq 3}">
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
						<li class="title">지역</li>
						<li class="active"><a href="#">전체</a></li>
						<li><a href="#">서울북부</a></li>
						<li><a href="#">서울남부</a></li>
						<li><a href="#">경기북부</a></li>
						<li><a href="#">경기남부</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>