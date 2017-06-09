<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>관리자 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
	regBtns();
});

var regBtns=function(){
	var userList=$("#userList");
	var tr;
	
	userList.empty();
	
	$.ajax({
		url:"admin/listUsers",
		success:function(users){
			$(users).each(function(idx, user){
				tr=$("<tr></tr>");
				td=$("<td><input type='radio' name='user_id' value='"+user.user_id+"' onClick='showUser(this)'/>"
						+user.user_id+"</td><td>"
						+user.user_name+"</td><td>"
						+user.user_email+"</td><td>"
						+user.user_address+"</td><td>"
						+user.birth+"</td><td>"
						+user.user_type+"</td>");
				userList.append(tr.append(td));
			});
		}
	});
}
</script>
</head>
<body>
<div class="container">
    <div class="container">
      <table class="table">
        <thead>
          <tr>
            <th>번호</th>
            <th>이름</th>
            <th>이메일</th>
            <th>주소</th>
            <th>생년월일</th>
            <th>회원유형</th>
            <th>
          </tr>
        </thead>
        <tbody id="userList">
 
        </tbody>
      </table>
    </div>
</div>
</body>
</html>