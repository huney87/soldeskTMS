<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 페이지-장르관리</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/views/frames/adminHeader.jsp" flush="false"/>
<style>
body {
    border-radius: 0px;
    margin-bottom: 5rem;
}
h3 {
    margin-top : 0.5rem;
}
h4 {
    margin:5px 7px;
}
h4 span{    
    font-size:1.7rem;
    padding:0.5rem 2rem;
}
h4 .cate1{
    font-size:1.3rem;
    margin-left:1.5rem;
}

th {
    height:3.5rem;
}
td, th {
    text-align:center;
    font-size:1.4rem;
}
</style>
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
		url:"/admin/listPerform",
		success:function(performs){
			$(performs).each(function(idx, perform){
				if(perform.perfDisplay==1) value="중지";
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
			sweetAlert("검색 실패", "검색할 공연을 입력해 주세요!", "error");
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
	if(swap==1) swap=0;
	else swap=1;
	 $.ajax({
         url:"/admin/changeDisplay",            
         data:{perfId:perform.value, perfDisplay:swap},
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
    						<h3>장르관리</h3>   
    					</div>
    
					    <div class="well well-sm">    
					      <h4><span class="label label-primary cate1">전체분류</span>
					          <span class="badge">개</span> 
					          <span class="label label-info cate1">분류1</span>
					          <span class="badge">개 </span>
					          <span class="label label-info cate1">분류2</span>
					          <span class="badge">개</span></h4>
					    </div>    
					    <div class="row">
					        <div class="col-sm-12">
					            <div class="pull-right">
					              <input name="addBanner" type="button" class="btn btn-primary" value="분류추가" data-toggle="tooltip" title="분류1을 추가합니다.">
					              <input name="addBanner2" type="button" class="btn btn-primary" value="하위분류추가" data-toggle="tooltip" title="분류2을 추가합니다.">
					              <!-- <input type="submit" class="btn btn-primary" value="일괄적용" data-toggle="tooltip" title="분류 수정내용을 전체저장"> -->
					            </div>
					        </div>
					    </div>
					    <div class="table-responsive">      
					      <form action="/admin/design/categoryadd.jsp" method="post">
					      <table class="table table-striped table-hover" id="categoryAddBanner" style="display:none">
					        <thead>
					          <tr class="warning">
					            <th colspan="7" class="text-center" id="categoryAddInfo" style="display:none">            	
					            	<a class="close" id="addInfoClose">&times;</a>
					                <p>분류코드는 직접 입력한 값을 사용하고 하위분류코드의 분류코드1은 셀렉트 박스를 선택합니다.</p>                
					                <h5>분류코드는 0~9까지 입력이 가능하며 2자리씩 4자리를 사용하여 2단계를 표현합니다.</h5> 
					                <span style="color:red;font-size:1.5rem">분류코드는 나중에 수정/삭제이 되지 않으므로 신중하게 결정하여 사용하십시오.</span>
					            </th>
					          </tr>
					          <tr class="info" name="trBanner">
					            <th style="width:10%">ID</th>
					            <th colspan="2" style="width:20%">분류코드</th>
					            <th style="width:25%">분류명</th>
					            <th style="width:30%">분류설명</th>
					            <th style="width:5%">사용</th>
					            <th style="width:10%">분류관리</th>
					          </tr>
					      </thead>
					      </table>
					      </form>
					      
					      <table class="table table-striped table-hover">
					        <thead>
					          <tr class="info">
					            <th style="width:10%">ID</th>
					            <th colspan="2" style="width:20%">분류코드</th>
					            <th style="width:25%">분류명</th>
					            <th style="width:30%">분류설명</th>
					            <th style="width:5%">사용</th>
					            <th style="width:10%">분류관리</th>
					          </tr>
					        </thead>        
					        <tbody>          
							  <form action="/admin/design/categorymod.jsp" method="get">	  
					          <tr>
					            
					            <td><input name="categoryID" type="hidden" value=""></td>
					            <td colspan="2">
					                <input name="code1" type="hidden" value="">
					                <input name="code2" type="hidden" value="">
					                <input class="form-control input-sm text-center" id="inputsm" type="text" value="" readonly="readonly">
					            </td>
					            <td>
					                <input name="categoryName" class="form-control input-sm" id="inputsm" type="text" value="">
					                <div class="input-group">
					                    <span class="input-group-addon"><i class="fa fa-plus" style="font-size:15px"></i></span>
					                    <input name="categoryName" class="form-control input-sm" id="inputsm" type="text" value="">
					                </div>            
					            </td>
					            <td><input name="categorySubject" class="form-control input-sm" id="inputsm" type="text" value=""></td>
					            <td><label><input name="categoryUse" type="checkbox" value="1" checked>사용</label></td>
					            <td>
					               <input type="submit" class="btn btn-info btn-sm" value="적용">          
					            </td>            
					          </tr>
					          </form>        
					        </tbody>        
					      </table>      
					    </div>
					    
					    <div class="row">
					        <div class="col-sm-12">
					            <div class="pull-right">
					              <input name="addBanner" type="button" class="btn btn-primary" value="분류추가" data-toggle="tooltip" title="분류1을 추가합니다.">
					              <input name="addBanner2" type="button" class="btn btn-primary" value="하위분류추가" data-toggle="tooltip" title="분류2을 추가합니다.">
					              <!-- <input type="submit" class="btn btn-primary" value="일괄적용" data-toggle="tooltip" title="분류 수정내용을 전체저장"> -->
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
 <!-- main container -->

<script>
   //추가 버튼
    $(document).on("click","input[name=addBanner]",function(){
    	
    	$("#categoryAddBanner").show();
        
    	var addBannerText =  '<tr name="trBanner2">'+
            '   <td colspan="3"><input name="code1" class="form-control input-sm text-center" id="inputsm" type="text" value="" placeholder="두자리 숫자입력" required></td>'+
            '   <td><input name="categoryName" class="form-control input-sm" id="inputsm" type="text" value="" placeholder="분류1 이름입력" required></td>'+
            '   <td><input name="categorySubject" class="form-control input-sm" id="inputsm" type="text" value="" placeholder="분류1 설명입력" required></td>'+
            '   <td><label><input name="categoryUse" type="checkbox" value="1" checked>사용</label></td>'+
            '   <td>'+
            '       <button name="delBanner" class="btn btn-info btn-sm">삭제</button>'+
            '       <input type="submit" class="btn btn-info btn-sm" value="적용">'+
            '   </td>'+
            '</tr>';
             
        var trHtml = $( "tr[name=trBanner]:last" ); //last를 사용하여 trSchool라는 명을 가진 마지막 태그 호출         
        trHtml.after(addBannerText); //마지막 trSchool명 뒤에 붙인다.
        $("#categoryAddInfo").show(); //베너추가 주의사항
    });
     
    //삭제 버튼
    $(document).on("click","button[name=delBanner]",function(){    	
        var trHtml = $(this).parent().parent();        
        trHtml.remove(); //tr 테그 삭제
        if($("tr[name=trBanner2]").length == 0) $("#categoryAddBanner").hide();        
    });

    //하위추가 버튼
    $(document).on("click","input[name=addBanner2]",function(){
    	
    	$("#categoryAddBanner").show();
        
    	var addBannerText2 =  '<tr name="trBanner2">'+            
            '   <td colspan="2">'+
	        '      <select class="form-control input-sm" name="code1">'+
		    '         <option value="default" required>-1차분류-</option>'+
		    '         <c:forEach var="category" items="${categoriescode1}">'+
		    '         <option value="${category.code1}">${category.categoryName}</option>'+
		    '         </c:forEach>'+
	        '      </select>'+
            '   </td>'+
            '   <td><input name="code2" class="form-control input-sm text-center" id="inputsm" type="text" value="" placeholder="2자리숫자입력" required></td>'+
            '   <td>'+
            '   <div class="input-group">'+
            '       <span class="input-group-addon"><i class="fa fa-plus" style="font-size:15px"></i></span>'+
            '       <input name="categoryName" class="form-control input-sm" id="inputsm" type="text" value="" placeholder="분류2 이름입력" required>'+
            '   </div>'+
            '   </td>'+
            '   <td><input name="categorySubject" class="form-control input-sm" id="inputsm" type="text" value="" placeholder="분류2 설명입력" required></td>'+
            '   <td><label><input name="categoryUse" type="checkbox" value="1" checked>사용</label></td>'+
            '   <td>'+
            '      <button name="delBanner2" class="btn btn-info btn-sm">삭제</button>'+
            '      <input type="submit" class="btn btn-info btn-sm" value="적용">'+
            '   </td>'+
            '</tr>';
             
        var trHtml = $( "tr[name=trBanner]:last" ); //last를 사용하여 trSkill라는 명을 가진 마지막 태그 호출         
        trHtml.after(addBannerText2); //마지막 trSkill명 뒤에 붙인다.  
        $("#categoryAddInfo").show(); //베너추가 주의사항
    });
     
    //하위삭제 버튼
    $(document).on("click","button[name=delBanner2]",function(){         
        var trHtml = $(this).parent().parent();         
        var trBanner = $("tr[name=trBanner]");
        trHtml.remove(); //tr 테그 삭제
        if($("tr[name=trBanner2]").length == 0) $("#categoryAddBanner").hide();
    });    
</script>
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 

	$("#addInfoClose").click(function(){
		$("#categoryAddInfo").hide();
	});	
});
</script>

</body>
</html>