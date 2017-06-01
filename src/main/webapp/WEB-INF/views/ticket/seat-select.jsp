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
body{
	background-color: whitesmoke;
}
#seat-window{
	width : 718px;
	height : 536px;	
	text-align: center;
}
.stage{
	width : 300px;
	height: 80px;
	border: 1px solid black;
	background-color: white;
	margin: auto;
	margin-top: 2rem;
	margin-bottom: 3rem;
	background-image:url('/img/ticket/stage.png');
	background-repeat: no-repeat;
	background-position: center center;
}
.pick-number{
	position: absolute;
	right: 1rem;
	top: 1rem;	
	text-align: right;
	border: 1px solid skyblue;
	padding: 1rem;
	background-color: white;
}
.legend{
	position: absolute;
	left: 1rem;
	top: 1rem;
	border: 1px solid skyblue;
	text-align: left;
	padding: 1rem;
	background-color: white;
}
.legend-seat{
	display: inline-block;
	cursor: default;
	margin-right: 0.5rem;
	width: 1rem;
	height: 1rem;
}
.legend-item{
}

/*시트 레이아웃 시작*/
.seat-layout-wrapper{
	padding: 3rem;
	display: inline-block;
	margin: auto;
	text-align: center;
	background-color: white;
}
.seat-row{
	margin-bottom: 0.5rem;
}
.seat{
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
.left-seat:hover{
	background-color: gray;
}

.left-seat{
	border: 2px solid blue;
}
.selected-seat{
	border : 2px solid red;
}
.reserved-seat{
	border: 2px dotted red;
}
.runway{
	border : 2px solid white;
	background-color: white;
	color: white;
}
/*시트 레이아웃 끝*/
</style>

</head>

<body>
<script>
	
	// 시트 설정부
	var seatInit = function (layout) {
		var seatLayout = layout;
		var selectCnt = function () {
			var selectCnt = 0;
			for (var i = 0; i < seatLayout.length; i++) {
				for (j = 0; j < seatLayout[i].length; j++) {
					if (seatLayout[i][j] == 0) selectCnt++;
				}
			}
			return selectCnt;
		}
		var maxCheck = function (max) {
			var selectNum = selectCnt();

			if (selectNum >= max) {
				return true;
			} else return false;
		}

		var row = '<div class="seat-row">	</div>';
		var seatNum = 1;
		for (i = 0; i < seatLayout.length; i++) {
			$(".seat-layout-wrapper").append(row);
			for (j = 0; j < seatLayout[i].length; j++) {
				var seatId = i + "-" + j;
				var col = '<div class="seat" id="' + seatId + '"><span class="seat-number">' + seatNum + '</span></div>';
				$(".seat-row:last").append(col);

				if (seatLayout[i][j] == 9) {
					$("#" + seatId).addClass("runway");
				} else if (seatLayout[i][j] == 1) {
					$("#" + seatId).addClass("left-seat");
					seatNum++;
				} else if (seatLayout[i][j] == 2) {
					$("#" + seatId).addClass("reserved-seat");
					seatNum++;
				}
			}
		};

		/* 동작 설정 */
		$(".seat").click(function () {
			/* 예매 인원을 저장하는 변수 */
			var personNumber = parseInt($("#tickets option:selected").text());

			var id = $(this).attr('id').split('-');
			var seatStat = seatLayout[id[0]][id[1]];
			if (seatStat == 1) {
				if (maxCheck(personNumber)) {
					swal({
						type: "error",
						text: '예매 인원수 ' + personNumber + '명을 넘게 선택하셨습니다.'
					});
					return false;
				}
				seatLayout[id[0]][id[1]] = 0;
				$(this).removeClass("left-seat").addClass("selected-seat");
			} else if (seatStat == 0) {
				seatLayout[id[0]][id[1]] = 1;
				$(this).removeClass("selected-seat").addClass("left-seat");
			}

			sessionStorage.setItem('ticketCnt', selectCnt());
		});

		$("#tickets").change(function () {
			$(".seat").each(function () {
				var id = $(this).attr('id').split('-');
				if (seatLayout[id[0]][id[1]] == 0) seatLayout[id[0]][id[1]] = 1;
				if ($(this).hasClass("selected-seat")) {
					$(this).removeClass("selected-seat").addClass("left-seat");
				}
			});
		});
	}

	var ticketsInit = function () {
		var inputNum = 20;
		for (var i = 1; i <= inputNum; i++) {
			$("#tickets").append("<option>" + i + "</option>");
		}
	};

	// 도큐먼트 래디
	$(document).ready(function () {
		$.ajax({
			url: '/ticket/getlayout',
			dataType: 'json',
			success: function (data) {
				seatInit(data);
			}
		});

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

