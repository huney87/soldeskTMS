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
<title>booking</title>

<style>
	html, body { overflow: hidden; }
	.container{
		width : 1000px;
		height : 600px;	
		border : 0px dotted black;
	}
	.info-wrapper{
		height : 10%;
	}
	.info-panel {
		height : 100%;
		width : 100%;
		border : 0px dotted black;
		text-align: center;
	}
	.booking-wrapper{
		height : 90%;
		border : 0px dotted black;
		padding : 2rem;
	}
	.select-body{
		height: 100%;
		border : 0px dotted black;
		padding: 0px;
	}
	.control-body{
		height : 100%;
		border : 0px dotted black;
		
	}
	.control-panel{
		height : 85%;
		border : 0px dotted black;
	}
	.btn-panel{
		height : 15%;
		border : 0px dotted black;
		text-align: center;
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
    	left: 791px;
    }
	.a{
		color:red;
	}
    
    th {
		text-align: center;
		color:#fff;
		background-color:#337ab7;
		font-size: 1.8rem;
    }
    td {
        text-align: center;
		font-size: 1.8rem;
    }
</style>
<script>
$(document).ready(function () {
	var ticketTitle = sessionStorage.getItem('title');
	var ticketPlace = sessionStorage.getItem('place');
	var ticketDate = sessionStorage.getItem('ticketDate');
    var ticketTime = sessionStorage.getItem('ticketTime');
    var ticketCnt = sessionStorage.getItem('ticketCnt');
    var bank = sessionStorage.getItem('bank');
    var ticketPrice = sessionStorage.getItem('totalPrice');
    var ticketSeatVal = sessionStorage.getItem('seatVal')
    
    $("#title").text(ticketTitle);
    $("#place").text(ticketPlace);
    $("#seats").text(ticketSeatVal);
    $("#date").text(ticketDate+" "+ticketTime);
    $("#ticketTime").text(ticketTime);
    if(ticketPrice) $("#price").text(ticketPrice+"원");
    $("#bank").text(bank);
    
    
	$('.btn-before').click(function(){
            forwardForm(5);
            return true;
       });	
	$("#nextBtn").on("click", function(){
		window.opener.top.location.href="/"
		window.close()
	});		
});
</script>
</head>

<body>
<div class="container">
	<div class="row info-wrapper">
		<div class="col-sm-12" style="height:100%;">
			<div class="info-panel">
				<img class="img-step fir" src="img/ticket/step_05_on.gif">
                    <img class="img-step" src="img/ticket/step_01_off.gif">
                    <img class="img-step" src="img/ticket/step_02_off.gif">
                    <img class="img-step" src="img/ticket/step_03_off.gif">
                    <img class="img-step" src="img/ticket/step_04_off.gif">
                    <img class="img-step" src="img/ticket/step_05_off.gif">
			</div>
		</div>
	</div>
	<div class="row booking-wrapper">
		<div class="container" style="margin-top:30px">
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">
					<table class="table table-bordered">
						<thead>
							<h3>예매 정보 확인</h3>
						</thead>
						<tr>
							<th>공연 제목</th>
							<td id="title"></td>
						</tr>
						<tr>
							<th>공연 장소</th>
							<td id="place"></td>
						</tr>
						<tr>
							<th>예매 일시</th>
							<td id="date"></td>
						</tr>
						<tr>
							<th>예매 좌석</th>
							<td id="seats"></td>
						</tr>
						<tr>
							<th>입금은행</th>
							<td id="bank"></td>
						</tr>
						<tr>
							<th>입금액</th>
							<td id="price"></td>
						</tr>
					</table>
				</div>
				<div class="col-sm-8 col-sm-offset-2 text-right">
					<button class="btn btn-lg btn-info" id="nextBtn">예매확인</button>
					<!-- <button class="btn btn-lg btn-danger">취소</button> -->
				</div>
			</div>
		</div>	
	</div>
</div>
<script>

<!--
function linkToOpener(URL){
if (window.opener && !window.opener.closed)
window.opener.location = URL;
window.close();
}
//-->
</script>
</body>
</html>