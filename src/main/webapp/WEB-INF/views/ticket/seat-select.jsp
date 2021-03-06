<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

	<style>

		#seat-window {
			width: 718px;
			height: 536px;
			text-align: center;
		}

		.stage {
			width: 300px;
			height: 80px;
			border: 1px solid black;
			background-color: white;
			margin: auto;
			margin-top: 2rem;
			margin-bottom: 3rem;
			background-image: url('/img/ticket/stage.png');
			background-repeat: no-repeat;
			background-position: center center;
		}

		.pick-number {
			position: absolute;
			right: 1rem;
			top: 1rem;
			text-align: right;
			border: 1px solid skyblue;
			padding: 1rem;
			background-color: white;
		}

		.legend {
			position: absolute;
			left: 1rem;
			top: 1rem;
			border: 1px solid skyblue;
			text-align: left;
			padding: 1rem;
			background-color: white;
		}

		.legend-seat {
			display: inline-block;
			cursor: default;
			margin-right: 0.5rem;
			width: 1rem;
			height: 1rem;
		}
		.legend2 {
			position: absolute;
			left: 1rem;
			top: 1rem;
			border: 1px solid skyblue;
			text-align: left;
			padding: 1rem;
			background-color: white;
		}

		.legend-seat2 {
			display: inline-block;
			cursor: default;
			margin-right: 0.5rem;
			width: 1rem;
			height: 1rem;
		}
		/*시트 레이아웃 시작*/

		.seat-layout-wrapper {
			padding: 3rem;
			display: inline-block;
			margin: auto;
			text-align: center;
			background-color: white;
		}

		.seat-row {
			margin-bottom: 0.5rem;
		}

		.seat {
			-ms-user-select: none;
			-moz-user-select: -moz-none;
			-khtml-user-select: none;
			-webkit-user-select: none;
			user-select: none;
			display: inline-block;
			cursor: default;
			margin-right: 0.5rem;
			width: 2.5rem;
			height: 2.5rem;
			font-size: 1rem;
			line-height: 2.1rem;
		}

		/* .left-seat:hover {
			background-color: gray;
		} */

		.left-seat {
			border: 2px solid blue;
		}

		.selected-seat {
			border: 2px solid red;
		}

		.reserved-seat {
			border: 2px dotted red;
		}

		.runway {
			border: 2px solid white;
			background-color: white;
			color: white;
		}
		.type1{ background-color:black; color:white; 
		}
		.type2{ background-color:blue; color:white;
		}
		.type3{ background-color:red; color:white;
		}
		.type4{ background-color:#BDFF12; color:black;
		}
		.type0{ background-color:gray; 
		}
		/*시트 레이아웃 끝*/
	</style>

<script>
 //좌석 만들어지고 나서 옵션 (자리선택하는것)
 var seatChoice = function(){
		/* 좌석 선택 */
		$(".seat").click(function () {
			var id = $(this).attr('id');//실행하게 해준 태그의 id 값을 jquery 변수에 저장해주기 위해 사용 (지금은 좌석 클릭했을 경우)
			console.log(id);
			// 남은 좌석이라면
			if ($(this).hasClass('left-seat')) {	//hasClass는 class를 검색하는 전용.
				/* 예매 인원을 저장하는 변수 */
				var personNumber = parseInt($("#tickets option:selected").text()); //예매인원 선택값
				if (maxCheck(personNumber)) { // 예매인원까지 선택할수 있게. (최대값)
					swal({
						type: "error",
						text: '예매 인원수 ' + personNumber + '명을 넘게 선택하셨습니다.'
					});
					return false;
				}
	
				$(this).removeClass("left-seat").addClass("selected-seat");
	
				// 선택 좌석 갯수를 session에 저장(완료)
				sessionStorage.setItem('ticketCnt', selectCnt());
				// 선택한 seat_id 를 session에 저장(seat_id를 이용해서 좌석의 등급과 가격을 가져와야함.)
				// 바로아랫줄에 selectSeatId를 어디서 가져오는지 모르겠음.
				
				//	세션으로 넘겨야할 필요 데이터
				//	예약 공연 좌석 번호, 예약 공연 좌석 등급, 가격, 인원, 공연아이디
				
				/* if (sessionStorage.getItem('selectSeatId')) {
					var selectSeatIds = sessionStorage.getItem('selectSeatId').split(',');
					selectSeatIds.push(id);
					//sessionStorage.setItem('selectSeatId', selectSeatIds.join(','));
					console.log(sessionStorage.getItem('selectSeatId'));
				} else {
					sessionStorage.setItem('selectSeatId', id);
					console.log(sessionStorage.getItem('selectSeatId'));
				} */
	
				// 선택된 좌석이라면( 미완성, 위에꺼와 연동)
			} else if ($(this).hasClass('selected-seat')) {
				$(this).removeClass("selected-seat").addClass("left-seat");
				/* if (sessionStorage.getItem('selectSeatId')) {
					var selectSeatIds = sessionStorage.getItem('selectSeatId').split(',');
					selectSeatIds.splice(selectSeatIds.indexOf(id), 1);
					sessionStorage.setItem('selectSeatId', selectSeatIds.join(','));
					console.log(sessionStorage.getItem('selectSeatId'));
				} */
			}
			
			var cnt = $("#tickets option:selected").text();
			$("#ticketCnt").text(selectCnt()+'/'+cnt);
	
		});
	
		// 예매 인원 변경시(완료)
		$("#tickets").change(function () {
			$(".seat").each(function () {
				if ($(this).hasClass("selected-seat")) {
					$(this).removeClass("selected-seat").addClass("left-seat");
				}
			});
			
			var cnt = $("#tickets option:selected").text();
			$("#ticketCnt").text(cnt);
		});
				
}

//좌석선택시 숫자 세주기(완료)
var selectCnt = function () {
	var selectNum = 0;
	$(".seat").each(function () {
		if ($(this).hasClass("selected-seat")) {
			selectNum++;
		}
	});
	return selectNum;
}

//예매인원수 체크해주는 기능.(완료)
var maxCheck = function (max) {
	if (selectCnt() >= max) {
		return true;
	} else return false;
}

//예매된 좌석 표기 바꾸기
var changeSeat = function(){
	var perId = sessionStorage.getItem("perId");
	var rndId = sessionStorage.getItem("roundId");
	
	$.ajax({
        url: "/seller/getResSeat",
        data:{
        	perId:perId,
        	roundId:rndId
        },
        success:function(results){
        	$(results).each(function(idx, result){
        		var seatId = result.seatId;
        		console.log(seatId);
        		$('#'+seatId).removeClass("left-seat").addClass("reserved-seat");
        	});
     	},
        error:function(a, b, errMsg){
        alert("실패");
        }
	});
	
}

//좌석 초기셋팅.(세션에서 저장된 공연아이디를 가져오는것만 연동하면됨. 아래 perId에 값을 저장해야함.)
var seatInit = function () {	
	var perId = sessionStorage.getItem("perId"); // 세션에 저장된 공연아이디값 가져오기
	var row=0;	//레이아웃 row 전체 크기
	var col=0;	//레이아웃 col 전체 크기
	var tmp=1;
	// 전체 레이아웃 크기 불러오기
	$.ajax({
           url: "/seller/getLayout",
           data:{per_id:perId},
           success:function(hall){
           	row=hall.hallRow;	
           	col=hall.hallCol;	
        }
	});				
	
	var seatRow = '<div class="seat-row">	</div>';
	//공연 레이아웃 가져오기
	$.ajax({
        url: "/seller/getPerLayout",
        data:{perId:perId},
        success:function(seats){
        	$(".seat-layout-wrapper").append(seatRow);
        	$(seats).each(function(idx, seat){	        		
        		//좌석이 팔렸는지 확인하여 클래스 추가.
        		var type = "type"+seat.seatType;
        		/* if (seat.state == 1) { // state 1 예약된 좌석
        			seat = '<div class="seat reserved-seat" id="'+seat.seatId+'"><span class="seat-number" id="num'+seat.seatNumber+'">' + seat.seatNumber + '</span></div>';
				} else if (seat.state == 0) { //state 0이  빈좌석 */
					seat = '<div class="seat left-seat '+type+'" id="'+seat.seatId+'" value="'+seat.price+'"><span class="seat-number" id="num'+seat.seatNumber+'">' + seat.seatNumber + '</span></div>';
				//}		        		
        		
        		// 좌석을 하나씩 출력, 줄이 바뀔경우 esle 내용.
        		if(tmp<=col){
   					$(".seat-row:last").append( seat );  					
        			tmp++;
        		}else{
        			tmp=2;
        			$(".seat-layout-wrapper").append(seatRow);	//줄바꿈(줄추가)
   					$(".seat-row:last").append( seat );		// 줄 바뀐것의 첫번째 기준이될 좌석 1개 추가        			
        		}   
        	});  	
        	changeSeat();       	
        	seatChoice();
        }
	});
}

//예매인원 드롭박스(완료, 현재 최대인원 10명으로 수정.)
var ticketsInit = function () {
	var inputNum = 10;
	var ticketCnt = sessionStorage.getItem('ticketCnt');
	for (var i = 1; i <= inputNum; i++) {
		if(i == ticketCnt)
			$("#tickets").append("<option selected>" + i + "</option>");
		else
			$("#tickets").append("<option>" + i + "</option>");
	}
}

//	티켓 등급 및 가격
var ticketGrade = function(){
	var perId = sessionStorage.getItem("perId");
   	$.ajax({
        url: "/ticket/getPerSeatInfo",
        data:{
        	performanceID : perId
        },
        dataType: 'json',
        success:function(pif){
        	var pifSeatList = pif.seatList;
        	$.each(pifSeatList,function(){
                var divHtml = '<div class="legend-seat type'+this['seatType']+'"></div>'
                divHtml += '<span>'+this['grade']+'석:&nbsp;'+this['price'].toLocaleString()+'원</span><br>';
                $('#ticketGrade').append(divHtml);
            });
   		}
   	});
}

// 도큐먼트 래디(화면 켜질때 시작.)
$(document).ready(function () {
	seatInit();	//	시트 정보 DB에서 가져와서 시작하는 펑션
	ticketsInit();	//	티켓 초기화 펑션
	ticketGrade();	//	티켓 등급 가격
});
</script>

	<div id="seat-window">
		<div class="legend">
			<div class="legend-item">
				<div class="legend-seat left-seat"></div><span>남은 좌석</span>
			</div>
			<div class="legend-item">
				<div class="legend-seat selected-seat"></div><span>선택한 좌석</span>
			</div>
			<div class="legend-item">
				<div class="legend-seat reserved-seat"></div><span>예약된 좌석</span>
			</div>
			<div>
				<div>-------------------</div>
			</div>
			<div class="legend-item" id="ticketGrade">
				<!-- <div class="legend-seat type1" id="ticketGrade1"></div><span></span> -->
			</div>	
		</div>
		
		<div class="stage">

		</div>
		<div class="pick-number form-group">
			<label for="tickets">예매 인원</label>
			<select class="form-control" id="tickets"></select>
		</div>

		<div class="seat-layout-wrapper">


		</div>
	</div>
<!-- 
	<div id="seat-window">
		<div class="legend">
			<div class="legend-item">
				<div class="legend-seat left-seat"></div><span>남은 좌석</span>
			</div>
			<div class="legend-item">
				<div class="legend-seat selected-seat"></div><span>선택한 좌석</span>
			</div>
			<div class="legend-item">
				<div class="legend-seat reserved-seat"></div><span>예약된 좌석</span>
			</div>
		</div>
		<div class="stage">

		</div>
		<div class="pick-number form-group">
			<label for="tickets">예매 인원</label>
			<select class="form-control" id="tickets">
		</select>
		</div>

		<div class="seat-layout-wrapper">

		</div>
	</div>
 -->

