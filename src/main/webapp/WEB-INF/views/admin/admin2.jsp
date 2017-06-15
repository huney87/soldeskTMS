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
	var performanceList=$("#performanceList");
	var display;
	var value;
	
	performanceList.empty();
	
	$.ajax({
		url:"admin2/listPerform",
		success:function(performs){
			$(performs).each(function(idx, perform){
				if(perform.perfDisplay==1) value="게시 취소";
				else value="게시";
				printPerform(perform,value);
			});
		}
	});
	
	$("#searchBtn").bind("click",function(){
		if($(":input[name='name']").val()) {
			var name=$(":input[name='name']").val();
			performanceList.empty();
			$.ajax({
				url:"admin2/searchPerform",
				data:{perfTitle:name},
				success:function(performs){
					$(performs).each(function(idx, perform){
						if(perform.perfDisplay==1) value="게시 취소";
						else value="게시";
						printPerform(perform,value);
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
    
	$("#allBtn").bind("click",function(){
		window.location.reload();
	});
	
	var printPerform=function(perform,value){
		tr=$("<tr></tr>");
		td=$("<td>"+perform.perfImage+"</td><td>"
				+perform.perfTitle+"</td><td>"
				+perform.perfStartDate+"</td><td>"
				+perform.perfEndDate+"</td><td>"
				+perform.perfCat+"</td><td>"
				+perform.perfcountTicket+"</td><td>"+
				"<button type='button' class='btn btn-danger' value='"+perform.perfId+"' onClick='changeDisplay(this)'>"+value+"</button>"
				+"<input type='hidden' name='hidden' value='"+perform.perfDisplay+"'/>"
				);
		performanceList.append(tr.append(td));
	}
}

var changeDisplay=function(perform){
	var swap=$(":input[name='hidden']").val();
	 $.ajax({
         url:"admin2/changeDisplay",            
         data:{perfId:perform.value, perfDisplay:Number(!swap)},
         success:function(result){
             if(result) swal("수정 성공");
             else swal("수정 실패");
         },
         error:function(a, b, errMsg){                
        	 swal("수정 실패: " + errMsg);                
         },
         complete:function(){
        	 swal("성공했다!!!!!!!!!!!!!!!!!!!!!!!!");                    
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
    						<h3>공연관리</h3>   
    					</div>
    		
		<div class="row">
				<div class="form-inline">
					<input type="text" class="form-control" name="name" placeholder="검색"/>
					<button type="button" class="btn btn-info" id="searchBtn">검색</button>
					<button type="button" class="btn btn-default" id="allBtn">전체 조회</button>
				</div>
		<table class="table table-hover"style="margin-top:100px">
			<thead>
          		<tr>
          			<th>포스터 이미지</th>
            		<th>공연명</th>
            		<th>시작일</th>
            		<th>마감일</th>
            		<th>분류</th>
            		<th>총 티켓 판매수</th>
            		<th>게시</th>
          		</tr>
        	</thead>
			<tbody id="performanceList">
				
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