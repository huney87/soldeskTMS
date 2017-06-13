<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC>
	<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

		<title>Insert title here</title>
	</head>

	<body>
		<script>
			var logincheck = function () {
				var userid = $('input.id').val();
				var userpw = $('input.pw').val();
				console.log(userid + ' ' + userpw);
				var user = {
					"email": userid,
					"pw": userpw,
				};
				$.ajax({
					method: "post",
					url: "/login/check",
					data: user,
					dataType: "json",
					success: function (data) {
						console.log(data);
						alert("성공");
					},
					error: function () {
						alert("실패");
					}
				});
			}
			
			var seatinfo = function(perfid){
				$.ajax({
					method:"post",
					url: "/ticket/getseatinfo",
					data: {
						"performance_id" : perfid, 
					},
					dataType : "json",
					success : function (seatinfo) {
						console.log(seatinfo);
						alert("시트성공");
					}
				});
			}
			$(document).ready(function () {
				$('.login').submit(function () {
					logincheck();
				});
				
				$('.seatinfo').click(function () {
					seatinfo(1);
				});
			});
		</script>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<form class="login">
						<input type="text" class='id' placeholder="ID"><br>
						<input type="password" class='pw' placeholder="PW"><br>
						<button type="submit">제출</button>
						<br>
					</form>

					<form class="ticket" method="post" action="/ticket">		
						<input name="step" value="02" type="hidden">

						<button type="submit">티켓시험</button>
					</form>
					<br>
					<button class="seatinfo">시트시험</button>

				</div>
			</div>
		</div>

	</body>

	</html>