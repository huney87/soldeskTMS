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
	var logincheck = function(){		
		var userid = $('input.id').val();
		var userpw = $('input.pw').val();
		console.log(userid + ' ' + userpw);
		var user = {
			"email" : userid,
			"pw" : userpw,
		};
		$.ajax({
			method : "post",
			url : "/login/check",
			data : user,
			dataType : "json",
			success : function(data){
				console.log(data);
				alert("성공");
			},
			error : function(){
				alert("실패");
			}
		});
	}
$(document).ready(function(){
	$(':submit').click(function(){
		logincheck();
	})
});
</script>
<div class="container">
<div class="row">
<div class="col-sm-12">
	<input type="text" class='id' placeholder="ID"><br>
	<input type="password" class='pw' placeholder="PW"><br>
	<button type="submit">제출</button>
</div>
</div>
</div>

</body>
</html>