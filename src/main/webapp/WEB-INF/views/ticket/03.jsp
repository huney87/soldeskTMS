<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="/js/ticket/ticket.js"></script>

    <title>공연 예매</title>
    <style>
        html, body {
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
            border: 1px dotted black;
        }

        /* .select-body {
            height: 100%;
            border: 0px dotted black;
            padding: 0px;
        } */
        
        .select-body {
            height: 100%;
            border: 0px dotted black;
            padding-left: 20px;
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
        	left: 403px;
        }

        th {
        	color:#fff;
            text-align: center;
			background-color:#337ab7;
			height:35px;
        }
        
        .table{
        	text-align:center;
        	color:black;
        }
        input{
        	border:none;
        	text-align:center;
        }
        tfoot td,tfoot th{
        	height:38px;
        	font-size:1.7rem;
        	vertical-align:baseline;
        }

    </style>
    <script type="text/javascript">
    var ticketCnt = sessionStorage.getItem('ticketCnt'); // 이전페이지의 티켓 총 수량 가져옴
    
    // 옵션선택시 할인가격 적용
    var discount = function(){
    	$(".seatGrades").on("click",function(){
    		var price = $(this).closest('tr').find('td').eq(3).text();
    		 
    		 // 체크한 값에 따라서 원래 가격에서 변동.
			if($(this).attr('id')=="kid"){
				price = price * 0.9;
			} 		
    		 
			$(this).closest('tr').find('td').eq(4).text(price);
			
			var totalPrice = 0;
			$(".lastPrice").each(function(){
				var tmp = $(this).text() *1;
				totalPrice += tmp;
				console.log(totalPrice);
			});
			$("#totalPrice2").val(totalPrice);	
			$("#ctotalPrice").text(totalPrice+"원");
    	});
    	
    }
    
    // 티켓 총 가격 계산
    var sumTotalPrice = function(){
    	var totalPrice = 0;
		$(".eachPrice").each(function(){
			var tmp = $(this).text() *1;
			totalPrice += tmp;
			console.log(totalPrice);
		});
		$("#totalPrice").val(totalPrice);	
    }
    
    // s_id 값 가져와서 초기 화면 설정해주기.
    var dataInit= function(){  	
        var tmp; // 임시변수, 좌석이름 저장용   // 좌석 옵션 가격
        var price = 10000; // 임시가격 강제 지정.
        var totalPrice=0; // 총 가격이 될 변수
        sessionStorage.setItem('seatVal','');
        for(var i =0;i<=ticketCnt;i++){
        	var j = 1;
        	tmp = 'selectedSeat'+i;
        	if(i>0){
        		
        		$.ajax({
        	           url: "/seller/seatinfoForTicket",
        	           data:{
        	        	   per_id:sessionStorage.getItem("perId"),
        	        	   seatId:sessionStorage.getItem(tmp)
        	           },          
        	           success:function(seatInfo){
			        		var tr1 = $("<tr></tr>");
			        		var td1 =$("<td>"+seatInfo.seatNumber+"</td>"); //좌석 아이디값
			        		var td2 = $("<td><input type='text' id='seat"+j+"' style='border:none;' value='"+seatInfo.grade+"등급'></td>");
			        		var td3 =$("<td><input type='radio' class='seatGrades' id='normal' name='ticket"+j+"'>일반&nbsp;&nbsp;&nbsp;"
			        	    		+"<input type='radio' class='seatGrades' id='kid' name='ticket"+j+"'>청소년할인10%</td>");
			        		var td4 =$("<td class='eachPrice'>"+seatInfo.price+"</td>"); // 좌석 가격 옵션
			        		var td5 =$("<td class='lastPrice'>"+seatInfo.price+"</td>"); // 최종 적용 가격
			        		
			        		totalPrice += seatInfo.price;
			        		 $("#totalPrice").val(totalPrice); // 총 가격 추가
			        		 $("#totalPrice2").val(totalPrice); // 총 가격 추가2
			        		
			        		tr1.append(td1).append(td2).append(td3).append(td4).append(td5);
							$("#selectTable").append(tr1);  // 테이블 바디 항목 추가
							
        					discount();//할인 선택 기능
        					
        					var ticketSeatVal = seatInfo.grade+'석 '+seatInfo.seatNumber+'번';
        					
        					if(sessionStorage.getItem('seatVal')){
        						sessionStorage.setItem('seatVal', sessionStorage.getItem('seatVal')+', '+ticketSeatVal);
        					}else{
        						sessionStorage.setItem('seatVal', ticketSeatVal)
        					}
        					j++;
        	           }
        		});
        	}
    	}
    }
    
    // 이미지 없을때 고정이미지 보여주기
	function ImgError(source) {
	    source.src = "/img/noImg.png";
	    source.onerror = "";
	    return true;
	}

	var initBtn = function () {
		// 이전 페이지로 이동
	    $('.btn-before').click(function () {
	        forwardForm(2);
	        return true;
	    });
		// 다음 페이지로 이동
	    $('.btn-next').click(function () {
	        sessionStorage.setItem('totalPrice', $("#totalPrice2").val());// 세션에 값 저장
            forwardForm(4);
            return true;
	    });
	}
	
	// 도큐먼트 레디
	$(document).ready(function () {
	    dataInit();
	    initBtn();
	});
    </script>
</head>
<body>
    <div class="container">
        <div class="row info-wrapper">
            <div class="col-sm-12" style="height:100%;">
                <div class="info-panel">
                    <img class="img-step fir" src="img/ticket/step_03_on.gif">
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
                    <h4>가격</h4>
                    <table class="table table-bordered table-condensed" id="tableTest">
                        <thead>
                            <tr>
                            	<th style="width:12%;">좌석번호</th>
                            	<th style="width:13%;">좌석등급</th>
                            	<th style="width:35%;">옵션 선택</th>
                            	<th style="width:20%;">가격</th>
                            	<th style="width:20%;">최종가격</th>
                            <tr>
                        </thead>
                       <tbody id="selectTable"></tbody>
                        <tfoot>
                        	<tr>
                        		<th colspan="3">total price</th><!-- <td><input type="text" id="totalPrice" readonly></td> -->
                        		<td colspan="2" class="info"><input type="text" id="totalPrice2" readonly></td>
                        	</tr>
                        </tfoot>
                    </table>
                </div>
                <div class="col-sm-12" style="margin-top:30px;background-color:#e6e6e6;">
                    <h5>유의 사항</h5>
                    <p>가격을 확인해주세요</p>
                    <p>관람일 전일까지만 취소 가능합니다. 또한, 당일 예매 하시는 경우 취소가 불가능 합니다.</p>
                    <p>동일 상품 좌석 이동을 원하시는 경우에는 기존의 예매 건을 취소하시고 재예매해야합니다</p>
                    <p>이 경우 취소 시점에 따라 추가 취소 수수료가 부과 될 수있으니 이점 유의하시기 바랍니다.</p>
                </div>
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