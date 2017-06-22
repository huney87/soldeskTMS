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
	<style>
		body {
			background-color: whitesmoke;
		}

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
		.type1{ background-color:black; 
		}
		.type2{ background-color:blue;
		}
		.type3{ background-color:red;
		}
		.type4{ background-color:#BDFF12; color:black;
		}
		.type0{ background-color:gray;
		}
		/*시트 레이아웃 끝*/
	</style>
</head>

<body>
<script>
 //좌석 만들어지고 나서 옵션
 var seatChoice = function(){
		/* 좌석 선택 */
		$(".seat").click(function () {
			var id = $(this).attr('id');
	
			// 남은 좌석이라면
			if ($(this).hasClass('left-seat')) {
				/* 예매 인원을 저장하는 변수 */
				var personNumber = parseInt($("#tickets option:selected").text());
				if (maxCheck(personNumber)) {
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
				if (sessionStorage.getItem('selectSeatId')) {
					var selectSeatIds = sessionStorage.getItem('selectSeatId').split(',');
					selectSeatIds.push(id);
					sessionStorage.setItem('selectSeatId', selectSeatIds.join(','));
					console.log(sessionStorage.getItem('selectSeatId'));
				} else {
					sessionStorage.setItem('selectSeatId', id);
					console.log(sessionStorage.getItem('selectSeatId'));
				}
	
				// 선택된 좌석이라면( 미완성, 위에꺼와 연동)
			} else if ($(this).hasClass('selected-seat')) {
				$(this).removeClass("selected-seat").addClass("left-seat");
				if (sessionStorage.getItem('selectSeatId')) {
					var selectSeatIds = sessionStorage.getItem('selectSeatId').split(',');
					selectSeatIds.splice(selectSeatIds.indexOf(id), 1);
					sessionStorage.setItem('selectSeatId', selectSeatIds.join(','));
					console.log(sessionStorage.getItem('selectSeatId'));
				}
			}
	
		});
	
		// 예매 인원 변경시(완료)
		$("#tickets").change(function () {
			$(".seat").each(function () {
				if ($(this).hasClass("selected-seat")) {
					$(this).removeClass("selected-seat").addClass("left-seat");
				}
			});
	
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

//좌석 초기셋팅.(세션에서 저장된 공연아이디를 가져오는것만 연동하면됨. 아래 perId에 값을 저장해야함.)
var seatInit = function () {	
	var perId = 1;//$("input:radio[name=radios]:checked").val();//가져올 공연아이디값(수정필요)
	var row=0;
	var col=0;
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
        		console.log(type);
        		if (seat.state == 1) {
        			seat = '<div class="seat reserved-seat '+type+'" id="'+seat.seatId+'"><span class="seat-number">' + seat.seatNumber + '</span></div>';
				} else if (seat.state == 0) {
					seat = '<div class="seat left-seat" id="'+seat.seatId+'"><span class="seat-number">' + seat.seatNumber + '</span></div>';
				}		        		
        		
        		// 좌석을 하나씩 출력, 줄이 바뀔경우 esle 내용.
        		if(tmp<=col){
   					$(".seat-row:last").append( seat );  					
        			tmp++;
        		}else{
        			tmp=2;
        			$(".seat-layout-wrapper").append(seatRow);
   					$(".seat-row:last").append( seat );		        			
        		}        		
        	});
        	
        	seatChoice();
        }
	});

	/* for (i = 0; i < row.length; i++) {
		$(".seat-layout-wrapper").append(row);
		for (j = 0; j < col.length; j++) {
			var seatId = seatLayout[i][j].split('-')[0];
			var seatNum = seatLayout[i][j].split('-')[1];
			var col = '<div class="seat" id="' + seatId + '"><span class="seat-number">' + seatNum + '</span></div>';
			$(".seat-row:last").append(col);

			var seatType = seatLayout[i][j].split('-')[2];
			var state = seatLayout[i][j].split('-')[3];

			if (seatType == 0) {
				$("#" + seatId).addClass("runway");
			} else if (seatType == 1) {
				$("#" + seatId).addClass("left-seat");
			}

			if (state == 1) {
				$("#" + seatId).removeClass("left-seat").addClass("reserved-seat");
			}

		}
	}; */
}

//예매인원 드롭박스(완료, 현재 최대인원 10명으로 수정.)
var ticketsInit = function () {
	var inputNum = 10;
	for (var i = 1; i <= inputNum; i++) {
		$("#tickets").append("<option>" + i + "</option>");
	}
}

// 도큐먼트 래디(화면 켜질때 시작.)
$(document).ready(function () {
	seatInit();
	ticketsInit();
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

</body>

</html>
