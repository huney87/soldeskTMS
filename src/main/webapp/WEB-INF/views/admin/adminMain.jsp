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
<link href="/css/adminmenu.css" media="all" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(document).ready(function () {
	  var trigger = $('.hamburger'),
	      overlay = $('.overlay'),
	     isClosed = false;

	    trigger.click(function () {
	      hamburger_cross();      
	    });

	    function hamburger_cross() {

	      if (isClosed == true) {          
	        overlay.hide();
	        trigger.removeClass('is-open');
	        trigger.addClass('is-closed');
	        isClosed = false;
	      } else {   
	        overlay.show();
	        trigger.removeClass('is-closed');
	        trigger.addClass('is-open');
	        isClosed = true;
	      }
	  }
	  
	  $('[data-toggle="offcanvas"]').click(function () {
	        $('#wrapper').toggleClass('toggled');
	  });  
	});
	
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
				if(user.userType==1) type="판매자";
				else if(user.userType==2) type="회원";
				else type="관리자";
				date=user.userBirthday.toString();
				tr=$("<tr></tr>");
				td=$("<td><input type='radio' name='user_id' value='"+user.userId+"'/>"
						+user.userId+"</td><td>"
						+user.userName+"</td><td>"
						+user.userEmail+"</td><td>"
						+user.userAddress+"</td><td>"
						+date+"</td><td>"
						+type+"</td>");
				userList.append(tr.append(td));
				td.find("input").data("userName",user.userName);
			});
		}
	});
	
	$("#searchBtn").bind("click",function(){
		if($(":input[name='name']").val()) {
			var name=$(":input[name='name']").val();
			userList.empty();
			$.ajax({
				url:"admin/getUser",
				data:{userName:name},
				success:function(user){
					tr=$("<tr></tr>");
					td=$("<td><input type='radio' name='user_id' value='"+user.userId+"'/>"
							+user.userId+"</td><td>"
							+user.userName+"</td><td>"
							+user.userEmail+"</td><td>"
							+user.userAddress+"</td><td>"
							+user.userBirthday+"</td><td>"
							+user.userType+"</td>");
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
				data:{userId:user.val()},
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
    <div id="wrapper">
        <div class="overlay"></div>
		
		<!-- Sidebar -->
        <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
            <ul class="nav sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#">관리자</a>
                </li>
                <li><a href="#">회원관리</a></li>
                <li><a href="#">로그아웃</a></li>
                <li><a href="#">쇼핑몰</a></li>
            </ul>
        </nav>
        <!-- /#sidebar-wrapper -->
        
        <!-- Page Content -->
        <div id="page-content-wrapper">
            <button type="button" class="hamburger is-closed" data-toggle="offcanvas">
                <span class="hamb-top"></span>
    			<span class="hamb-middle"></span>
				<span class="hamb-bottom"></span>
            </button>
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <div class="jumbotron">
    						<h3>회원관리</h3>   
    					</div>
    		
	<div class="row">
		<form class=form-inline>
			<div class="form-group">
				<input type="text" class="form-control" name="name" placeholder="검색"/>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-default" id="searchBtn">검색</button>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-default" id="delBtn">회원삭제</button>
			</div>
		</form>
		<table class="table table-hover"style="margin-top:100px">
			<thead>
          		<tr>
            		<th>번호</th>
            		<th>이름</th>
            		<th>이메일</th>
            		<th>주소</th>
            		<th>생년월일</th>
            		<th>회원유형</th>
          		</tr>
        	</thead>
			<tbody id="userList">
				
			</tbody>
		</table>
	</div>
	
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
    
   </div>
</div>
</div>
</div>
<!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->

</body>
</html>