<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/frames/adminHeader.jsp" flush="false"/>

<title>관리자 페이지-장르관리</title>

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
	
</script>
<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
					      <h4><span class="label label-primary cate1">전체장르</span>
					          <span class="badge">${genreAllCnt}개</span> 
					          <span class="label label-info cate1">장르1</span>
					          <span class="badge">${genreCode1Cnt}개 </span>
					          <span class="label label-info cate1">장르2</span>
					          <span class="badge">${genreAllCnt-genreCode1Cnt}개</span></h4>
					    </div>    
					    <div class="row">
					        <div class="col-sm-12">
					            <div class="pull-right">
					              <input name="addGenre" type="button" class="btn btn-primary" value="장르추가" data-toggle="tooltip" title="장르1을 추가합니다.">
					              <input name="addGenre2" type="button" class="btn btn-primary" value="하위장르추가" data-toggle="tooltip" title="장르2을 추가합니다.">
					            </div>
					        </div>
					    </div>
					    <div class="table-responsive">      
					      <form id="genreAddBtn">
					      <table class="table table-striped table-hover" id="genreaddGenre" style="display:none">
					        <thead>
					          <tr class="warning">
					            <th colspan="7" class="text-center" id="genreAddInfo" style="display:none">            	
					            	<a class="close" id="addInfoClose">&times;</a>
					                <p>장르코드는 직접 입력한 값을 사용하고 하위장르코드의 장르코드1은 셀렉트 박스를 선택합니다.</p>                
					                <h5>장르코드는 0~9까지 입력이 가능하며 2자리씩 4자리를 사용하여 2단계를 표현합니다.</h5> 
					                <span style="color:red;font-size:1.5rem">장르코드는 나중에 수정/삭제이 되지 않으므로 신중하게 결정하여 사용하십시오.</span>
					            </th>
					          </tr>
					          <tr class="info" name="trGenre">
					            <th colspan="3" style="width:40%">장르코드</th>
					            <th style="width:40%">장르명</th>					            
					            <th style="width:20%">장르관리</th>
					          </tr>
					      	</thead>
					      </table>
					      </form>
					      
					      <form action="/admin/design/genremod.jsp" method="get">
					      <table class="table table-striped table-hover">
					        <thead>
					          <tr class="info">
					            <th style="width:10%">ID</th>
					            <th colspan="2" style="width:30%">장르코드</th>
					            <th style="width:40%">장르명</th>
					            <th style="width:20%">장르관리</th>
					          </tr>
					        </thead>        
					        <tbody>
					        <c:choose>
						       	<c:when test="${empty genreList}"> 
						       	<tr>
						         	<td colspan="5">
						           	장르 정보가 없습니다.               
						         	</td>
						       	</tr>
						       	</c:when>
						       
						       	<c:otherwise>
									<c:forEach var="genre" items="${genreList}">      
					          <tr>
					            <td><input name="genreID" type="hidden" value="${genre.genreID}">${genre.genreID}</td>
					            <td colspan="2">
					                <input name="code1" type="hidden" value="${genre.code1}">
					                <input name="code2" type="hidden" value="${genre.code2}">
					                <input class="form-control input-sm text-center" id="inputsm" type="text" value="${genre.code1*100+genre.code2}" readonly="readonly">
					            </td>
					            <td>
					            <c:choose>
					            	<c:when test="${genre.code2 eq 0}">
					                <input name="genreName" class="form-control input-sm" id="inputsm" type="text" value="${genre.genreName}">
					                </c:when>
					                <c:otherwise>
					                <div class="input-group">
					                    <span class="input-group-addon"><i class="fa fa-plus" style="font-size:15px"></i></span>
					                    <input name="genreName" class="form-control input-sm" id="inputsm" type="text" value="${genre.genreName}">
					                </div>
					                </c:otherwise>
					            </c:choose>              
					            </td>
					            <td>
					               <input type="submit" class="btn btn-info btn-sm" value="적용">          
					            </td>            
					          </tr>
					          		</c:forEach>
	      						</c:otherwise>
							</c:choose>
					        </tbody>        
					      </table>
					      </form> 
					    </div>
					    
					    <div class="row">
					        <div class="col-sm-12">
					            <div class="pull-right">
					              <input name="addGenre" type="button" class="btn btn-primary" value="장르추가" data-toggle="tooltip" title="장르1을 추가합니다.">
					              <input name="addGenre2" type="button" class="btn btn-primary" value="하위장르추가" data-toggle="tooltip" title="장르2을 추가합니다.">
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
   //장르1추가 버튼
    $(document).on("click","input[name=addGenre]",function(){
    	
    	if($("tr[name=trGenre2]").length != 0)
    		return false;
    	$("#genreaddGenre").show();
        
    	var addGenreText =  '<tr name="trGenre2">'+
            '   <td colspan="3"><input name="code1" class="form-control input-sm text-center" id="inputsm" type="text" value="" placeholder="두자리 숫자입력" required></td>'+
            '   <td><input name="genreName" class="form-control input-sm" id="inputsm" type="text" value="" placeholder="장르1 이름입력" required></td>'+
            '   <td>'+
            '       <button type="button" name="delGenre" class="btn btn-info btn-sm">삭제</button>'+
            '       <button type="button" name ="addGenre" class="btn btn-info btn-sm">적용</button>'+
            '   </td>'+
            '</tr>';
             
        var trHtml = $( "tr[name=trGenre]:last" ); //last를 사용하여 trGenre라는 명을 가진 마지막 태그 호출         
        trHtml.after(addGenreText); //마지막 trSchool명 뒤에 붙인다.
        $("#genreAddInfo").show(); //베너추가 주의사항
    });
     
    //삭제 버튼
    $(document).on("click","button[name=delGenre]",function(){    	
        var trHtml = $(this).parent().parent();        
        trHtml.remove(); //tr 테그 삭제
        if($("tr[name=trGenre2]").length == 0) $("#genreaddGenre").hide();        
    });

    //하위추가 버튼
    $(document).on("click","input[name=addGenre2]",function(){
    	
    	if($("tr[name=trGenre2]").length != 0)
    		return false;
    	
    	$("#genreaddGenre").show();
        
    	var addGenreText2 =  '<tr name="trGenre2">'+            
            '   <td colspan="2">'+
	        '      <select class="form-control input-sm" name="selectcode1" id="selectcode1">'+
		    '         <option value="default" required>-1차장르-</option>'+
		    '         <c:forEach var="genre" items="${genreMajorList}">'+
		    '         <option value="${genre.code1}">${genre.genreName}</option>'+
		    '         </c:forEach>'+
	        '      </select>'+
            '   </td>'+
            '   <td><input name="code2" class="form-control input-sm text-center" id="inputsm" type="text" value="" placeholder="2자리숫자입력" required></td>'+
            '   <td>'+
            '   <div class="input-group">'+
            '       <span class="input-group-addon"><i class="fa fa-plus" style="font-size:15px"></i></span>'+
            '       <input name="genreName" class="form-control input-sm" id="inputsm" type="text" value="" placeholder="장르2 이름입력" required>'+
            '   </div>'+
            '   </td>'+
            '   <td>'+
            '      <button type="button" name="delGenre2" class="btn btn-info btn-sm">삭제</button>'+
            '      <button type="button" name ="addGenre" class="btn btn-info btn-sm">적용</button>'+
            '   </td>'+
            '</tr>';
             
        var trHtml = $( "tr[name=trGenre]:last" ); //last를 사용하여 trSkill라는 명을 가진 마지막 태그 호출         
        trHtml.after(addGenreText2); //마지막 trSkill명 뒤에 붙인다.  
        $("#genreAddInfo").show(); //베너추가 주의사항
    });
     
    //하위삭제 버튼
    $(document).on("click","button[name=delGenre2]",function(){         
        var trHtml = $(this).parent().parent();         
        var trGenre = $("tr[name=trGenre]");
        trHtml.remove(); //tr 테그 삭제
        if($("tr[name=trGenre2]").length == 0) $("#genreaddGenre").hide();
    });
    
    $(document).on("click","button[name=addGenre]",function(){
		var code1 = $("#selectcode1").val();
		console.log(code1);
		return false;
	});
</script>
<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 

	$("#addInfoClose").on("click",function(){
		$("#genreAddInfo").hide();
	});
});
</script>

</body>
</html>