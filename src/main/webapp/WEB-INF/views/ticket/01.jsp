<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String perId = request.getParameter("perf_id");
		session.setAttribute("perId", perId);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/zabuto_calendar.min.css">
    <script src="/js/zabuto_calendar.min.js"></script>

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
            text-align: center;
        }
        
        .select-body {
            height: 100%;
            border: 0px dotted black;
            padding: 20px 15px;
            text-align: left;
            background-color: #f1eeec;
        }
        
        .control-body {
            height: 100%;
            border: 0px dotted black;
        }
        
        .control-panel {
            height: 85%;
            width: 100%;
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
        	left: 15px;
        }
        
        .text-center {
            text-align: center;
        }
        
        .selectDate {
            font-size: 1.5rem;
            height: 1.5rem;
            line-height: 1rem;
        }
        .btn1{
        	border : #888 1px solid ;
        	background: #fefefe;
        	margin:0.3rem;
        	padding:0.3rem;
        	display:none;
        }
    </style>
  
    <script type="application/javascript"> 
        var initCalender = function( data ) {       
            var eventData = [];
            for( i = 0 ; i < data.length ;){   
            	var skddate = {
            			"date": data[i].roundDate,
            			"time1": data[i].roundTime,
            			"time2": data[i+1].roundTime,
            			"roundId1": data[i].roundId,
            			"roundId2": data[i+1].roundId
            			};            	
                eventData.push(skddate);   
                i = i+2;
            }            
        	
            $('#show-calender').zabuto_calendar({
                language: "kr",
                data: eventData,
                action: function() {
                	clickCalender(this.id, eventData);
                },
            });
        }

        var clickCalender = function(id, eventData) {
            var date = $("#" + id).data("date");
            var time2 = eventData;
            var hasEvent = $("#" + id).data("hasEvent");
            if (hasEvent) {
                $(".selectDate").text(date);
                $("#ticketDate").text(date);
                sessionStorage.setItem('ticketDate', date);
            }
            
            for(var i=0 ; i<time2.length ; i++){
            	if(time2[i].date == date){
           			$("#roundTime1").val(time2[i].time1);
               		$("#roundTime11").text(time2[i].time1);
               		$("#roundTime1").data("roundId",time2[i].roundId1);
               		$("#roundTime2").val(time2[i].time2);
               		$("#roundTime22").text(time2[i].time2);
               		$("#roundTime2").data("roundId",time2[i].roundId2);
               		sessionStorage.setItem('ticketTime1', time2[i].time1);
               		sessionStorage.setItem('ticketTime2', time2[i].time2);
               		sessionStorage.setItem('roundId1', time2[i].roundId1);
               		sessionStorage.setItem('roundId2', time2[i].roundId2);            			
            	}
            }
            $('.btn1').show();
        }

        var initBtn = function() {
			$('[name="roundTimeBtn"]').on('click',function(){
				var time = $(this).val();
				var roundId = $(this).data(roundId);
				console.log(roundId);
				sessionStorage.setItem('ticketTime', time);
				sessionStorage.setItem('roundId', roundId);
		        $("#ticketTime").text(time);
			});
        	
        	$('.btn-next').click(function() {
                if (!sessionStorage.getItem('ticketDate')) {
                    alert("날짜를 선택해주세요.");
                    return false;
                } 
                if(!sessionStorage.getItem('ticketTime')) {
                    alert("시간을 선택해주세요.");
                    return false;
                } else {
                    forwardForm(2);
                    return true;
                }
            });
        }        
        

        $(document).ready(function() {
        	
        	if (sessionStorage.getItem('perId')) ;
        	else sessionStorage.setItem("perId",$("#a").val()); //세션에 공연 아이디 저장.
        	
        	var perfId = sessionStorage.getItem('perId');
            
        	$.ajax({
                url: '/ticket/getskd',
                data : {
                	"performance_id" : perfId
                },
                dataType: 'json',
                success : function(data) {
                    initCalender(data);
                }
		    });           
            
            if (sessionStorage.getItem('ticketDate')) {
            	var date = sessionStorage.getItem('ticketDate');
            	$(".selectDate").text(date);
            	if (sessionStorage.getItem('ticketTime')) {
            		var ticketTime = sessionStorage.getItem('ticketTime');
            		var ticketTime1 = sessionStorage.getItem('ticketTime1');
            		var ticketTime2 = sessionStorage.getItem('ticketTime2');
            		var ticketRound1 = sessionStorage.getItem('roundId1');
        			var ticketRound2 = sessionStorage.getItem('roundId2');
        			
            		$('.btn1').show();
            		$("#roundTime1").val(ticketTime1);
            		$("#roundTime11").text(ticketTime1);
            		$("#roundTime1").data("roundId",ticketRound1);
            		$("#roundTime2").val(ticketTime2);
            		$("#roundTime22").text(ticketTime2);
            		$("#roundTime2").data("roundId",ticketRound2);
            		
            		if(ticketTime == ticketTime1){
            			$("#roundTime1").prop({checked: true});
            		}else {
            			$("#roundTime2").prop({checked: true});
            		};
                }
            };
            
            initBtn();
        });
       
    </script>
    
</head>
<body>
	<input type="hidden" id="a" value="<%=perId%>"></input>
    <div class="container">
        <div class="row info-wrapper">
            <div class="col-sm-12" style="height:100%;">
                <div class="info-panel">
                    <img class="img-step fir" src="img/ticket/step_01_on.gif">
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
                <div class="seat-layout-wrapper">
                    <div class="row">
                        <div class="col-sm-6">
                            <div id="show-calender"></div>
                        </div>
                        <div class="col-sm-2 text-center">
                            <h4>선택한 날짜</h4>
                            <div class='selectDate'><span>&nbsp; &nbsp;  -&nbsp; &nbsp; - &nbsp; &nbsp; </span></div>

                            <h4>시간 선택</h4>
                            <div class="btn1">
	                            <input type="radio" class="btn btn-default btn-sm" name="roundTimeBtn" id="roundTime1"/>&nbsp; &nbsp;<span id="roundTime11"></span><br>
	                        </div>
	                        <div class="btn1">
	                            <input type="radio" class="btn btn-default btn-sm" name="roundTimeBtn" id="roundTime2"/>&nbsp; &nbsp;<span id="roundTime22"></span>
	                        </div>
                        </div>
                        <div class="col-sm-4">
                            <h5>좌석등급/ 잔여석</h5>
                            <ul>
                                <li> VIP 잔여좌석 30석</li>
                                <li> R 잔여좌석 50석</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-12" style="margin-top:30px;background-color:#e6e6e6;">
                        <h5>유의 사항</h5>
                        <p>해당되는 날짜에만 선택하세요</p>
                        <p>관람일 전일까지만 취소 가능합니다. 또한, 당일 예매 하시는 경우 취소가 불가능 합니다.</p>
                        <p>동일 상품 좌석 이동을 원하시는 경우에는 기존의 예매 건을 취소하시고 재예매해야합니다</p>
                        <p>이 경우 취소 시점에 따라 추가 취소 수수료가 부과 될 수있으니 이점 유의하시기 바랍니다.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-3 control-body">
                <div class="control-panel">
                    <!-- <iframe src="/ticket/panel" scrolling="no"></iframe> -->
                    <jsp:include page="/WEB-INF/views/ticket/control-panel2.jsp" flush="false"/>
                </div>
                <div class="btn-panel" style="margin-top:30px">
                    <button class="btn btn-info btn-block btn-next">다음으로<i class="glyphicon glyphicon-chevron-right"></i></button>
                </div>
            </div>
        </div>

    </div>

</body>

</html>