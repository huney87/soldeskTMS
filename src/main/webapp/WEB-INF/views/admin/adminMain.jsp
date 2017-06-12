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
$(function() {
	regBtns();
});

var regBtns=function(){
	var modal = $("#resultModal");
    var msg = $("#msg");  
	var userList=$("#userList");
	var tr;
	var type;
	var date;
	
	userList.empty();
	
	$.ajax({
		url:"admin/listUsers",
		success:function(users){
			$(users).each(function(idx, user){
				if(user.user_type==1) type="판매자";
				else if(user.user_type==2) type="회원";
				date=user.birth.toString();
				tr=$("<tr></tr>");
				td=$("<td><input type='radio' name='user_id' value='"+user.user_id+"'/>"
						+user.user_id+"</td><td>"
						+user.user_name+"</td><td>"
						+user.user_email+"</td><td>"
						+user.user_address+"</td><td>"
						+date+"</td><td>"
						+type+"</td>");
				userList.append(tr.append(td));
				td.find("input").data("user_name",user.user_name);
			});
		}
	});
	
	$("#searchBtn").bind("click",function(){
		if($(":input[name='name']").val()) {
			var name=$(":input[name='name']").val();
			userList.empty();
			$.ajax({
				url:"admin/getUser",
				data:{user_name:name},
				success:function(user){
					tr=$("<tr></tr>");
					td=$("<td><input type='radio' name='user_id' value='"+user.user_id+"'/>"
							+user.user_id+"</td><td>"
							+user.user_name+"</td><td>"
							+user.user_email+"</td><td>"
							+user.user_address+"</td><td>"
							+user.birth+"</td><td>"
							+user.user_type+"</td>");
					userList.append(tr.append(td));
				},
				error:function(a,b,errMsg){
					msg.text("검색 실패: "+errMsg);
				}
			});
		}else {
            msg.text("회원 이름을 입력하세요.");
            modal.modal("show");
        }
	});
	
	$("#delBtn").bind("click",function(){
		var user=$(":checked");
		if(user.size()){
			$.ajax({
				url:"admin/delete",
				data:{user_id:user.val()},
				success:function(result){
					if(result) msg.text("삭제 성공했습니다.");
					else msg.text("삭제 실패했습니다.");
					
				},
				error:function(a,b,errMsg){
					msg.text("삭제 실패: "+errMsg);
				},
				complete:function(){
					modal.modal("show");
				}
			});
		}else{
			msg.text("삭제할 회원을 선택해 주세요.");
			modal.modal("show");
		}
	});
}
</script>
</head>
<body>
<div class="container">
   <form>
     <div class="form-group">
       <input type="text" class="form-control" name="name" placeholder="name" >
     </div>
    <button type="button" class="btn btn-default" id="searchBtn">
       <span class="glyphicon glyphicon-search"></span> 검색
    </button>
	<button type="button" class="btn btn-default" id="delBtn">
       <span class="glyphicon glyphicon-remove"></span> 삭제
    </button>
    </form>
    
    <div class="modal fade" id="resultModal">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" onClick="history.go(0)">&times;</button>
              <h4 class="modal-title" id="msg"></h4>
            </div>            
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal" onClick="history.go(0)">Close</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    
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