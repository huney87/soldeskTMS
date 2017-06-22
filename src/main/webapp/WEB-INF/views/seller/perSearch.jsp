<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공연 검색결과</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
var resultTable = function() {	
		var perName = $("#perName").val();	
		var locName = '지역이름';
		var catName = '장르이름';
		$("#tbody").empty();
		$.ajax({
	        url: "/seller/getPer",
	        data:{per_name:perName},
	        success:function(perfSearch){
	        	$(perfSearch).each(function(idx, per){       		
	        		switch(per.loc){
	        		case 1: locName = '서울남부'; break;
	        		case 2: locName = '서울북부'; break;
	        		case 3: locName = '경기남부'; break;
	        		case 4: locName = '경기북부'; 
	        		}
	        		
	        		switch(per.ct_id){
	        		case 1: catName = '뮤지컬'; break;
	        		case 2: catName = '콘서트'; break;
	        		case 3: catName = '연극'; 
	        		}

	        		var tr2 = $("<tr></tr>");	        		
	                td1 = $("<td><input type='radio' value='"+per.per_id+"' class='perId' name='radios'>"+per.per_title+"</td>");
	                td2 = $("<td>"+catName+"</td>");
	                td3 = $("<td>"+locName+"</td>");
	                td4 = $("<td>"+per.cName+"</td>");
	                td5 = $("<td>"+per.hName+"</td>");
	                td6 = $("<td>"+per.per_startDate+"</td>");
	                td7 = $("<td>"+per.per_endDate+"</td>");
	                td8 = $("<td>"+per.per_image+"</td>");
	                $("#tbody").append(tr2.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6).append(td7).append(td8));   
	        	});
	        	resultLayout();
	        }
		});
}

// 공연정보에 따른 좌석 정보를 가져오기. (좌석 레이아웃 생성용)
var resultLayout = function() {
	// 공연 :라디오 박스 클릭시.
	$("input:radio[name=radios]").on("click",function(){
		$(".layout").empty();	
		var perId = $("input:radio[name=radios]:checked").val();
		var seatRow='<div class="row-seat"></div>';
		var row=0;
		var col=0;
		var cnt=1;
		var tmp=1;
		
		// 전체 레이아웃 크기 불러오기
		$.ajax({
            url: "/seller/getLayout",
            data:{per_id:perId},
            success:function(hall){
            	row=hall.hallRow;	
            	col=hall.hallCol;	
	        }
		});			
		
		//공연 레이아웃 가져오기
		$.ajax({
	        url: "/seller/getPerLayout",
	        data:{perId:perId},
	        success:function(seats){
	        	$(".layout").append( seatRow );
	        	$(seats).each(function(idx, seat){	        		
	        		// 순차적으로 불러온 좌석값을 하나씩 출력
	        		if(tmp<=col){
	        			seat = '<div class="seats" id="type'+seat.seatType+'">'+cnt+'</div>';
    					$(".row-seat:last").append( seat );	   					
	        			tmp++; cnt++;
	        		}else{
	        			tmp=2;
	        			$(".layout").append( seatRow );
	        			seat = '<div class="seats" id="type'+seat.seatType+'">'+cnt+'</div>';
    					$(".row-seat:last").append( seat );	
	        			cnt++;
	        		}        		
		
	        	});  	
	        },
            error:function(a, b, errMsg){
            	$("#msg").text("등록된 좌석값이 없습니다.");
            	$("#resultModal").modal('show');
            }
		});
		
	});
}


$(document).ready(function(){
	$("#perSearch").on("click",function(){
		resultTable();
		$(".layout").empty();
	});
});

</script>
<style>
#infoTable{
	background-color: white;
	margin:0.5rem;
}
#searchMenu{
	margin:0.5rem;
}
#type1{ background-color:black; 
}
#type2{ background-color:blue;
}
#type3{ background-color:red;
}
#type4{ background-color:#BDFF12; color:black;
}
#type0{ background-color:gray;
}
.row-seat{
	margin : 0.5rem;
}
.seats {
	width : 3rem;
	height : 3rem;
	margin : 1px;
	padding : 1px;	
	font-size : 0.7rem;
	text-align: center;
	color: white;
	background-color:black;
	display : inline-block;
	-ms-user-select: none; 
    -moz-user-select: -moz-none;
    -khtml-user-select: none;
    -webkit-user-select: none;
    user-select: none;
}
#shell {
	background-color:gray;
	display: inline-block;
}
#nav2{
	
	height:auto;
	width:auto; 
	color:white;
	padding: 0.5rem;
	text-align:center;
}
#layoutNav{
	background-color:#1a1a1a;
	border: 0.1rem solid #4d4dff;
	height:auto;
	text-align:center;
	align:center
}
</style>
</head>
<body>
<div class="container-fluid">
    <div class="row content">
        <!--사이드 네비바-->
        <div class="col-sm-2 sidenav">
            <jsp:include page="mainNav.jsp"/>
        </div>
        <!-- 메인출력화면 -->
        <div class="col-sm-10">
        	<jsp:include page="perNav.jsp"/>
			<div class="row">
                <div class="col-lg-12" id="nav1">
	                <div id="searchMenu">
	               		<input type="text" id="perName" placeholder="공연 이름">
	               		<button type="button" class="btn btn-sm btn-default" id="perSearch">검색</button>
	                </div>
                    <table class="table table-condensed table-striped" id="infoTable">
                    	<thead>
                    		<tr><th>공연명</th><th>장르</th><th>지역</th><th>회관</th><th>공연장</th><th>시작날짜</th><th>종료날짜</th><th>그림파일</th></tr>
                    	</thead>
                    	<tbody id="tbody"></tbody><!-- 검색한 공연정보를 넣을 공간 -->
                    </table>
                </div>
                <div class="col-sm-12" id="layoutNav">
                	<h4>좌석 배치도</h4>
                	<hr style="border:solid 0.1rem #4d4dff;"></hr>
	                <div id="nav2"> <!-- 공연 선택시 좌석셋팅값 가져오기 -->
	                	<div id="title"></div>
	                	<div class="layout" id="shell"></div>
	                </div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 결과 확인을 위한 모달 -->
<div class="modal fade" id="resultModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="msg" style="color:black;"></h4>
      </div>            
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>                
</body>
</body>
</html>