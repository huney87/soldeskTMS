<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/login.css">
<title>티켓박스-회원가입</title>
<script src="//code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function() {	
        	
    //아이디 중복 확인
    $("#idOverLap").on("click", function(){
    	var userEmail = $("#str_email01").val() + "@" + $("#str_email02").val();
    	
    	console.log(userEmail);    	

    	$.ajax({
    	    url: "/user/checkUserEmail",
    	    data: {userEmail : userEmail},
    	    success : function(email) {
    	    	console.log(email.userEmail);  
    	    	if(email.userEmail) {
    	    		alert("중복 되어 있습니다.");
    	    		$("#str_email01").val("");
    	    		$("#str_email02").val("");
    	    	}
    	    	else alert("사용가능합니다.");    	     	    	       		    	       		
    	    },
    	    error: function(){
    	    	alert("확인해보세요.");
	        }
		});    	
    	
    });    
    
    var modal = $("#resultModal");  // 추가, 수정, 삭제 결과 창
    var msg = $("#msg");            // 결과 메세지
    // 회원가입 버튼 클릭
	$("#userAdd").on("click", function(){
		var userType = $(':radio[name="userTypeRadio"]:checked').val();	// 회원 가입 타입(판매자 - 1 , 사용자 - 2)
		var userEmail = $("#str_email01").val() + "@" + $("#str_email02").val();
		var userPw = $("#user_psw1").val();
		var userName = $("#name").val();
		var userBirthday = $("#user_year").val() + "-" + $("#user_month").val() + "-" + $("#user_day").val();
		var userPost = $("#postNumber").val();
		var userAddress = $("#address1").val() + $("#address2").val();
		var userPhone = $("#phone01").val() + $("#phone02").val() + $("#phone03").val();
		
		//회원가입 처리
		$.ajax({
            url: "/user/addUser",
            data:{	// 메소드가 실행한 데이터를 넘겨준다!
            	// 도메인 컬럼 : 명시된 변수명
            	userType : userType,
            	userEmail : userEmail,
            	userPw : userPw,
            	userName : userName,
            	userBirthday : userBirthday,
            	userPost : userPost,
            	userAddress : userAddress,
            	userPhone : userPhone,            	
            	},  
            	success:function(result){
                    if(result) msg.text("추가 성공");
                    else msg.text("추가 실패");
                },
                error:function(a, b, errMsg){
                    msg.text("추가 실패: " + errMsg);                
                },
                complete:function(){
                	/* $("#resultModal").modal('show'); */
                	alert("회원가입완료.");   
                    /* modal.modal('show'); */                	
                }        
        });
	});	
});
</script>


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
    height: 61px;
    margin: 0 auto;
    margin-bottom: 15px;
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

.movieInfo3Btn:HOVER {
	color: #00ace6;
	background-color: #fff;
	border: 1px solid #00ace6;
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
#inline{
	margin-top:10px;
}
</style>
</head>
<body>
	<div class="container-fluid" data-spy="affix" data-offset-top="1" style="border-bottom:1px solid #888;">
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
							<a href="../category/01.html" class="btn btn-default btn-lg">뮤지컬</a> 
							<a href="../category/02.html" class="btn btn-default btn-lg">콘서트</a> 
							<a href="../category/03.html" class="btn btn-default btn-lg">연극</a>
							<div class="btn-group">
								<a class="btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown">로그인</a>
								<!-- 로그인 드롭다운창 -->
								<ul class="dropdown-menu" role="menu" style="top:48px;left:-130px;margin:0;padding:0;">
									<li>
										<div class="loginmodal-container" style="margin:0;">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h1>로그인</h1><br>
											<form action="../main/main2.html">
												<input type="text" name="#" placeholder="아이디">
												<input type="password" name="#" placeholder="비밀번호">
												<input type="submit" name="#" class="login loginmodal-submit" value="로그인">
											</form>
												
											<div class="login-help">
												<a href="#">회원가입</a> - <a href="../finidpw/01.html">비밀번호를 잊어버리셨나요?</a>
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
	
	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="page-header">
		    		<h1><span class="glyphicon glyphicon-user"></span> 회원가입</h1>      
		  		</div>
				<form class="form-horizontal" action="../main.html">
					<div class="form-group">
						<div class="col-sm-offset-4">
							<div class="col-sm-4">
								<label class="radio-inline"><input type="radio" name="userTypeRadio" class="userType" value="2">일반 사용자</label>
							</div>
							<div class="col-sm-6">
								<label class="radio-inline"><input type="radio" name="userTypeRadio" class="userType" value="1">판매자</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="form-inline">
			  				<label class="control-label col-sm-2">이메일:</label>
			  				<input type="text" id="str_email01" name="str_email01" class="form-control" style="width:20%; margin-left:15px" required/>
							<label>@</label>	 
							<input type="text" id="str_email02" name="str_email02" class="form-control" value="" style="width:20%" required/>
							<select id="selectEmail" class="form-control">
				  				<option value="1" selected>직접입력</option>
				    			<option value="naver.com">naver.com</option>
				    			<option value="hanmail.net">hanmail.net</option>
				    			<option value="nate.com">nate.com</option>
				    			<option value="gmail.com">gmail.com</option>
				 			</select>
				 			<button type="button" id="idOverLap" class="btn btn-info">중복확인</button>
				 		</div>
			 		</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="psw">비밀번호:</label>
		 				<div class="col-sm-8"> 
							<input type="password" class="form-control" id="user_psw1" name="psw" placeholder="비밀번호">							
						</div>
					</div>
					<div class="form-group" id="check" style="display:none;">
						<div class="col-sm-12 text-center">
							<font name="check" color="red"></font>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="psw">비밀번호 확인:</label>
						<div class="col-sm-8"> 
							<input type="password" class="form-control" id="user_psw2" name="psw2" placeholder="비밀번호 확인">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="name">성명:</label>
						<div class="col-sm-8"> 
							<input type="text" class="form-control" id="name" name="name" placeholder="성명">
						</div>
					</div>
					<div class="form-group">
		    			<label class="control-label col-sm-2">생일:</label>
		    			<div class="col-sm-2"> 
		     				<input type="number" class="form-control" id="user_year" placeholder="년">
		     			</div>
		     			<div class="col-sm-2"> 
		     				<input type="number" class="form-control" id="user_month" placeholder="월">
		     			</div>
		     			<div class="col-sm-2"> 
		     				<input type="number" class="form-control" id="user_day" placeholder="일">
		     			</div>   					
		  			</div>
					<div class="form-inline">
						<label class="control-label col-sm-2" for="postCode">우편번호:</label>
						<input type="text" name="postCode" class="postcodify_postcode5 form-control" id="postNumber" value="" placeholder="우편번호 버튼을 누르세요." style="margin-left:7px" readonly/>
						<button type="button" id="postcodify_search_button" class="btn btn-info">우편번호찾기</button>
						<input type="text" id="address1" class="postcodify_address form-control" value="" style="margin-left:20px; width:32%" required readonly/>
					</div>
					<div class="form-group" id="inline">
						<label class="control-label col-sm-2">상세주소:</label>
						<div class="col-sm-8">
							<input type="text" id="address2" class="postcodify_details form-control" value="" placeholder="상세주소를 입력하세요." style=""required />
						</div>
						<!-- jQuery와 Postcodify를 로딩한다 -->
						<script src="http://d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				
						<!-- "우편번호찾기" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
						<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
					</div>
					<div class="form-inline">
		  				<label class="control-label col-sm-2">휴대폰:</label>
		  				<input type="number" id="phone01" class="form-control" style="width:10%;margin-left:5px"/>&nbsp;-
		  				<input type="number" id="phone02" class="form-control" style="width:15%"/>&nbsp;-
		  				<input type="number" id="phone03" class="form-control" style="width:15%"/>
		  			</div>
	  			
			 		<div class="form-group" style="margin-top:50px"> 
						<div class="col-sm-offset-2 col-sm-8 text-right">
							<button type="button" class="btn btn-primary btn-lg" id="userAdd">회원가입</button>
						</div>
					</div>
				</form>
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
					<a href="../main.html" class="btn btn-link">
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
	        if ($(this).scrollTop() > 500) {
	            $('#MOVE_TOP_BTN').fadeIn();
	        } else {
	            $('#MOVE_TOP_BTN').fadeOut();
	        }
	    });
	    
	    $("#MOVE_TOP_BTN").click(function() {
	        $('html, body').animate({
	            scrollTop : 0
	        }, 400);
	        return false;
	    });
	});
	</script>
<script type="text/javascript">
		//이메일 입력방식 선택
		$('#selectEmail').change(function(){
			$("#selectEmail option:selected").each(function () {
     
 				if($(this).val()== '1'){ //직접입력일 경우
      				$("#str_email02").val('');                //값 초기화
      				$("#str_email02").attr("readonly",false); //활성화
 				}else{ //직접입력이 아닐경우
      				$("#str_email02").val($(this).text());    //선택값 입력
      				$("#str_email02").attr("readonly",true);  //비활성화
 				}
			});	
		});	
		
		//비밀번호 확인 - 보안코딩 기법 적용
		$(function(){			
			//비밀번호 조건 - 영어 대소문자 숫자 함께 사용, 6~14자리 까지
			var isValidPw = function(pw){
				var pattern = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,14}$/;
			    return pattern.test(pw);
			};
			
			// 비밀번호 조건확인 화면 출력
			$('#user_psw1').keyup(function(){
				$('#check').hide();
				$('font[name=check]').text('');
				var pw = $("input[name=psw]").val();
		        
			    if(isValidPw(pw)){
			    	$.ajax({
			        	method: "post",
			            data: {"pw":pw},
			            success: function(){
			            	$('#check').show();
							$('font[name=check]').html("사용 가능합니다.");
			            },
			            error: function(){
			            	$('#check').show();
							$('font[name=check]').html("Password가 잘못되었습니다. 영문, 숫자 혼용 6~14자만 입력하세요.");
			            }
			        });
			    }else{
			    	$('#check').show();
					$('font[name=check]').html("Password가 잘못되었습니다. 영문, 숫자 혼용  6~14자만 입력하세요.");
			    }
			});		
		
			/* 
			$(function(){
			// 비밀번호 6~14 자리수 인지 화면 표시
				$('#user_psw1').keyup(function(){
					$('#check').hide();
					$('font[name=check]').text('');
					if(($('#user_psw1').val().length < 6 || $('#user_psw1').val().length > 14) && $('#user_psw1').val().length != 0) {
						$('#check').show();
						$('font[name=check]').html("Password가 잘못되었습니다.6~14자만 입력하세요.");			  
				}
			});				
			 */
			
			// 비밀번호 와 비밀번호 확인이 같은지 확인
			$('#user_psw2').keyup(function(){
				if($('#user_psw1').val().length != 0 || $('#user_psw2').val().length != 0){
					$('#check').show();
		 	  		if($('#user_psw1').val()!=$('#user_psw2').val()){
		 	  			
		 	   			$('font[name=check]').text('');
		 	   			$('font[name=check]').html("두 글자가 다릅니다.");
		 	  		}else{
		 	   			$('font[name=check]').text('');
		 	   			$('font[name=check]').html("암호 확인 되었습니다.");
		 	  		}
				}
	 	 	});			
		});
</script>
	<!-- 결과값 모달 -->
	<div class="modal fade" id="resultModal">
	     <div class="modal-dialog">
	       <div class="modal-content">
	         <div class="modal-header">
	           <button type="button" class="close" data-dismiss="modal">&times;</button>
	           <h4 class="modal-title" id="msg" style="color:black;"></h4>
	         </div>            
	         <div class="modal-footer">
	           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	         </div>
	       </div>
	     </div>
	</div>
</body>
</html>