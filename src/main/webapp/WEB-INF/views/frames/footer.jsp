<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	            <div class="col-sm-8">
                    <div class="row">
		                <!-- <div class="row footerDiv2">
		                   회사소개 | 채용정보 | 제휴/광고/부대사업 문의 | 이용약관 | 개인정보 처리방침 | 고객센터
		                </div> -->
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
	        if ($(this).scrollTop() > 120) {
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
	});
	</script>
</body>
</html>