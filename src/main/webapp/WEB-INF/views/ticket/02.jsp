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
    
    <script src="/js/ticket/ticket.js"></script>
    
    <title>공연 예매</title>

    <style>
        html,
        body {
            overflow: hidden;
        }
        
        .container {
            width: 1000px;
            height: 600px;
            border: 0px dotted black;
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
            $('.btn-before').click(function(){
                forwardForm(1);
                return true;
            });			
			$('.btn-next').click(function() {
			    if (!sessionStorage.getItem('ticketCnt')) {
			        alert("좌석을 선택해주세요.");
			        return false;
			    } else {
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
                <iframe src="/ticket/layout" scrolling="no"></iframe>
            </div>
            <div class="col-sm-3 control-body">
                <div class="control-panel">
                    <iframe src="/ticket/panel" scrolling="no"></iframe>
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