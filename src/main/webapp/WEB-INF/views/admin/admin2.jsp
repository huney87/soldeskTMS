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
	var img;
	var per;
	
	performanceList.empty();
	
	$.ajax({
		url:"/admin/listPerform",
		success:function(performs){
			$(performs).each(function(idx, perform){
				if(perform.perfDisplay===1) value="중지";
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
				url:"/admin/searchPerform",
				data:{perfTitle:name},
				success:function(performs){
					$(performs).each(function(idx, perform){
						if(perform.perfDisplay==1) value="중지";
						else value="게시";
						printPerform(perform,value);
					});
				},
				error:function(a,b,errMsg){
					sweetAlert("검색 실패: "+errMsg);
				}
			});
		}else {
			sweetAlert("검색 실패", "검색할 공연을 입력해 주세요!", "error");
        }
	});
    
	$("#allBtn").bind("click",function(){
		window.location.reload();
	});
	
	var printPerform=function(perform,value){
		list=$("<div class='col-sm-3'><img src='./"+perform.perfImage+"' onerror='ImgError(this)'/></div>"
				+"<div class='col-sm-7'><div class='col-sm-10'>"
				+"<h2>"+perform.perfTitle+"</h2>"
				+"<p>시작일:"+perform.perfStartDate+"		종료일:"+perform.perfEndDate+"</p>"
				+"<p>총 티켓 판매 수: "+perform.perfCntTicket+"</p>"
				+"<div class='col-sm-2'>"
				+"<button type='button' class='btn btn-danger' value='"+perform.perfId+"' onClick='changeDisplay(value)'>"+value+"</button>"
				+"</div></div></div>"
				+"<input type='hidden' id='hidden"+perform.perfId+"' name='hidden' value='"+perform.perfDisplay+"'/>");
		performanceList.append(list);
	}
}

var changeDisplay=function(id){
	var swap=$('#hidden'+id).val();
	if(swap==1) swap=0;
	else swap=1;
	
	 $.ajax({
         url:"/admin/changeDisplay",            
         data:{perfId:id, perfDisplay:swap},
         success:function(result){
             if(result) swal("공연 게시 성공");
             else swal("공연 게시 실패");
         },
         error:function(a, b, errMsg){                
        	 swal("공연 게시 실패: " + errMsg);                
         },
         complete:function(){
        	 if(swap==1){
        	 	swal({
					title: "공연 게시",
					text: "공연을 게시하였습니다",
					type: "success"
			 	},
			 	function(){
					window.location.reload();
			 	});
        	 }else{
        		 swal({
 					title: "공연 중지",
 					text: "공연 게시를 중단 하였습니다",
 					type: "success"
 			 	},
 			 	function(){
 					window.location.reload();
 			 	});
        	 }
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
                <li><a href="/admin/admin1">회원관리</a></li>
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
				
				<div class="list-group">
				<div class="row col-sm-12" style="margin-top:10px" id="performanceList">

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
</div>
</body>
</html>