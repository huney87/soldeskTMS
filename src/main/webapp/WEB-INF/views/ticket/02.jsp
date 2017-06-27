<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/6.6.2/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/sweetalert2/6.6.2/sweetalert2.min.js"></script>
    
    <script src="/js/ticket/ticket.js"></script>
    
    <title>공연 예매</title>

    <style>
        html,
        body {
            overflow: hidden;
            background: #f1eeec;
        }
        
        .container {
            width: 1000px;
            height: 600px;
            border: 0px dotted black;
            background-color:white;
        }
        
        .info-wrapper {
            height: 10%;
        }
        
        .info-panel {
            height: 100%;
            width: 100%;
            border: 0px dotted black;
            text-align: center;
        }
        
        .booking-wrapper {
            height: 90%;
            border: 0px dotted black;
        }
        
        .select-body {
            height: 100%;
            border: 0px dotted black;
            padding: 0px;
            background-color: whitesmoke;
        }
        
        .control-body {
            height: 100%;
            border: 0px dotted black;
        }
        
        .control-panel {
            height: 85%;
            border: 0px dotted black;
        }
        
        .btn-panel {
            height: 15%;
            border: 0px dotted black;
            text-align: center;
        }

        iframe {
            background: white;
            border: none;
            /* Reset default border */
            height: 100%;
            /* Viewport-relative units */
            width: 100%;
            overflow: hidden;
        }
        
        .img-step {
            display: inline-block;
            /*Vertical Center Start*/
            position: relative;
            top: 50%;
            transform: translateY(-50%);
            /*Vertical Center End*/
            float: left;
            width: 20%;
            margin:0;
            padding:0;
        }
        
        .fir {
        	position: absolute;
        	z-index: 3;
        	left: 209px;
        }
    </style>
    <script>
        var initBtn = function() {
        	var test =0;
        	$(".selected-seat").each(function(){
	    		console.log(test);
	    	});	
        	
        	
            $('.btn-before').click(function(){ // 이전페이지 버튼
                forwardForm(1);
                return true;
            });			
			$('.btn-next').click(function() { //다음페이지 버튼
			    if (!sessionStorage.getItem('ticketCnt')) {
			        alert("좌석을 선택해주세요.");
			        return false;
			    } else {
			    	// 다음 페이지 버튼을 누를시, 선택된 좌석값을 갯수에 맞춰 세션에 저장함. 
			    	// 가져오는 세션값은 좌석 예매수를 for 구문에 돌려서 selectedSeat뒤에 숫자를 붙여서 값을 가져오면됨.
			    	// 가져오는 값의 명칭은 1부터 예매한 숫자까지 임.
			    	var i=0;   	
			    	$(".selected-seat").each(function(){
			    		var tmp = 'selectedSeat'+i;
			    		sessionStorage.setItem(tmp,$(this).attr('id'));
			    		i++;
			    	});				    	
			        forwardForm(3);
			        return true;
			    }
			});
        }

        $(document).ready(function() {
            initBtn();
        });
    </script>
</head>

<body>

    <div class="container">
        <div class="row info-wrapper">
            <div class="col-sm-12" style="height:100%;">
                <div class="info-panel">
                    <img class="img-step fir" src="img/ticket/step_02_on.gif">
                    <img class="img-step" src="img/ticket/step_01_off.gif">
                    <img class="img-step" src="img/ticket/step_02_off.gif">
                    <img class="img-step" src="img/ticket/step_03_off.gif">
                    <img class="img-step" src="img/ticket/step_04_off.gif">
                    <img class="img-step" src="img/ticket/step_05_off.gif">
                </div>
            </div>
        </div>
        <div class="row booking-wrapper">
            <div class="col-sm-9 select-body">
                <!-- <iframe src="/ticket/layout" scrolling="no"></iframe> -->
                <jsp:include page="/WEB-INF/views/ticket/seat-select.jsp"/>
            </div>
            <div class="col-sm-3 control-body">
                <div class="control-panel">
                    <!-- <iframe src="/ticket/panel" scrolling="no"></iframe> -->
                    <jsp:include page="/WEB-INF/views/ticket/control-panel2.jsp" flush="false"/>
                </div>
                <div class="btn-panel" style="margin-top:30px">
                    <div class="btn-group btn-group-justified">
                        <a class="btn btn-danger btn-before"><i class="glyphicon glyphicon-chevron-left"></i>이전으로</a>
                        <a class="btn btn-info btn-next">다음으로<i class="glyphicon glyphicon-chevron-right"></i></a>
                    </div>
                </div>
            </div>
        </div>

    </div>

</body>

</html>