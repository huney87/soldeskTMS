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
.btn-next{
	/*Vertical Center Start*/
	position: relative;
	top: 50%;
	transform: translateY(-50%);
	/*Vertical Center End*/
}
iframe {
    background: #000;
    border: none;         /* Reset default border */
    height: 100%;        /* Viewport-relative units */
    width: 100%;
	overflow: hidden;
}
.img-step{
	display: inline-block;
	/*Vertical Center Start*/
	position: relative;
	top: 50%;
	transform: translateY(-50%);
	/*Vertical Center End*/
}
.a{
	color:red;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#selectBankBox").change(function(){
		$("#selectBankBox option:selected").each(function(){
			if($(this).val()=='1'){
				$("#selectBank").val('');
				$("#selectBank").attr("readonly", false);				
			}else{
				$("#selectBank").val($(this).text());
				$("#selectBank").attr("readonly", true);
				//$("#selectBank").attr("disabled", true);
			}			
		})		
	});
	
	//입금액 세션에서 읽어들이기
	var totalPrice = sessionStorage.getItem('totalPrice');
	$('#ticketPrice').text(totalPrice + "원");
	
	$("#beforeBtn").click(function () {
		forwardForm(4);
		return true;
	});  
	
	$("#nextBtn").on("click", function(){		
		window.opener.top.location.href="/ticket/payment"
		//window.opener.top.location.reload();//새로고침
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
				<img class="img-step" src="img/ticket/step_01.gif">
                <img class="img-step" src="img/ticket/step_02.gif">
                <img class="img-step" src="img/ticket/step_03.gif">
                <img class="img-step" src="img/ticket/step_04.gif">
                <img class="img-step" src="img/ticket/step_05.gif">
			</div>
		</div>
	</div>
	<div class="row booking-wrapper">
		<div class="col-sm-9 select-body">
			<h4>결재수단 입력</h4>
			<table class="table table-bordered">
				<tr>
					<th colspan="2">무통장입금</th>
				</tr>
				<tr>
					<th>입금액</th>
					<td id="ticketPrice"></td>
				</tr>
				<tr>
					<th>입금하실은행</th>
					<td>
					<input type="text" id="selectBank">
					
					<select id="selectBankBox">
						<option selected>입금하실 은행을 선택하세요</option>
						<option>신한은행</option>
						<option>농협은행</option>
						<option>우리은행</option>
						<option>하나은행</option>
						<option>외환은행</option>
						<option>기업은행</option>
						<option value="1">직접입력</option>
					</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<span class="a">은행에 따라 밤 11시 30분 이후로는<br>
						온라인 입금이 제한 될 수 있습니다.</span><br>
						선택한 은행의 입금하실 계좌번호는 예매확인 홈페이지에서<br>
						부여받으시게 됩니다.
					</td>
				</tr>
				<tr>
					<th>입금마감시간</th>
					<td>2017년 5월 30일 오후 23시 59분</td>
				</tr>
				<tr>
					<th>예금주명</th>
					<td>티켓박스</td>
				</tr>
			</table>
			<div class="col-sm-12" style="background-color:#e6e6e6">
				<h5>유의 사항</h5>
				<p>결재 수단 무통장일경우 결재 마감날을 잘 확인하세요</p>
				<p>관람일 전일까지만 취소 가능합니다. 또한, 당일 예매 하시는 경우 취소가 불가능 합니다.</p>
				<p>동일 상품 좌석 이동을 원하시는 경우에는 기존의 예매 건을 취소하시고 재예매해야합니다</p>
				<p>이 경우 취소 시점에 따라 추가 취소 수수료가 부과 될 수있으니 이점 유의하시기 바랍니다.</p>
			</div>		
		</div>
		<div class="col-sm-3 control-body">		
			<div class="control-panel">
				<iframe src="/ticket/panel" scrolling="no"></iframe>
			</div>	
			<div class="btn-panel" style="margin-top:40px">
				<div class="btn-group btn-group-justified">
					<a type="button" class="btn btn-danger" id="beforeBtn">< 이전으로</a>
					<a type="button" class="btn btn-info btn-next" id="nextBtn">결재확인</a>
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