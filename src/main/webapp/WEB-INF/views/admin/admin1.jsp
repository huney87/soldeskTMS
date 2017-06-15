<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/frames/adminHeader.jsp" flush="false"/>
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
	var userList=$("#userList");
	var type;
	
	userList.empty();
	
	$.ajax({
		url:"/admin/listUsers",
		success:function(users){
			$(users).each(function(idx, user){
				if(user.userType==1) type="판매자";
				else type="회원";
				printUser(user,type);
			});
		}
	});
	
	var printUser=function(user,type){
		var date;
		var type;
		
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
	}
	
	$("#searchBtn").bind("click",function(){
		if($(":input[name='name']").val()) {
			var name=$(":input[name='name']").val();
			userList.empty();
			$.ajax({
				url:"/admin/searchUser",
				data:{userName:name},
				success:function(users){
					$(users).each(function(idx, user){
						if(user.userType==1) type="판매자";
						else if(user.userType==2) type="회원";
						else type="관리자";
						printUser(user,type);
					});
				},
				error:function(a,b,errMsg){
					sweetAlert("검색 실패: "+errMsg);
				}
			});
		}else {
			sweetAlert("검색 실패", "검색할 회원을 입력해 주세요!", "error");
        }
	});
	
	$("#delBtn").bind("click",function(){
		var user=$(":checked");
		if(user.size()){
			swal({
				  title: "정말로 삭제하시겠습니까?",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "삭제",
				  cancelButtonText: "취소",
				  closeOnConfirm: false
				},
				function(){
					$.ajax({
						url:"admin/delete",
						data:{userId:user.val()},
						success:function(result){
							if(result) return true;
							else swal("삭제 실패: "+errMsg);
						},
						error:function(a,b,errMsg){
							swal("삭제 실패: "+errMsg);
						},
						complete:function(){
							swal({
								title: "삭제 성공",
								text: "회원을 삭제했습니다",
								type: "success"
							},
							function(){
								window.location.reload();
							});
						}
					});
				});
		}else{
			sweetAlert("삭제 실패", "삭제할 회원을 선택해 주세요!", "error");
		}
	});
	
	$("#allBtn").bind("click",function(){
		window.location.reload();
	});
	
	$("#sellerBtn").bind("click",function(){
		$(":input[name='name']").val()=="";
		var userList = $("#userList");  // 회원목록
		
        userList.empty();
        
        $.ajax({
            url:"/admin/listUsers",
            success:function(users){
    			$(users).each(function(idx, user){
    				if(user.userType==1) {
    					type="판매자";
    					printUser(user,type);
    				}
    			});
    		}
        });   
	});
	
	$("#userBtn").bind("click",function(){
		$(":input[name='name']").val()=="";
		var userList = $("#userList");  // 회원목록
		
        userList.empty();
        
        $.ajax({
            url:"/admin/listUsers",
            success:function(users){
    			$(users).each(function(idx, user){
    				if(user.userType==2) {
    				type="회원";
    				printUser(user,type);
    				}
    			});
    		}
        });   
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
                    <a href="/admin">관리자</a>
                </li>
                <li><a href="/admin">회원관리</a></li>
                <li><a href="/admin/admin2">공연관리</a></li>
                <li><a href="/login/logout">로그아웃</a></li>
                <li><a href="/">쇼핑몰</a></li>
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
				<div class="form-inline">
					<input type="text" class="form-control" name="name" placeholder="검색"/>
					<button type="button" class="btn btn-info" id="searchBtn">검색</button>
				<div class="btn-group">
					<button type="button" class="btn btn-default" id="allBtn">전체 조회</button>
					<button type="button" class="btn btn-default" id="sellerBtn">판매자 조회</button>
					<button type="button" class="btn btn-default" id="userBtn">회원 조회</button>
				</div>
					<button type="button" class="btn btn-danger" id="delBtn">회원삭제</button>
				</div>
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
   </div>
</div>
</div>
</div>
<!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->
</div>
</body>
</html>