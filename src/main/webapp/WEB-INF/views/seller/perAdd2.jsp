<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공연 좌석설정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
#perName{
	color:black;
}
#nav1, #nav2{
	background-color:#1a1a1a;
	height:5rem; 
	padding:1rem;
	margin:0.5rem;
	color:white;
	border: 0.1rem solid #4d4dff;
}
select, input, option{
	color:black;
    margin-right:2rem;
}
button, select{
    margin-right:1rem;
}
/*  좌석관련 속성 */
#shell {
	background-color:gray;
	display: inline-block;
}
.row-seat{
	margin : 0.5rem;
}
.new-seat {
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
.new-seat:hover{
	border:0.1rem solid red;
	cursor: pointer; /* 커서를 댈경우 손모양으로 바뀜 */
}

.write{
	width:6rem;
	color:#1a1a1a;
}
.box{
	width:5rem;
	height:5rem;
	margin:1px;
	padding:1px;
}
#row, #col{
	width:10rem;
	color:black;
}
</style>
<script>
$(document).ready(function(){
	var modal = $("#resultModal");  // 추가, 수정, 삭제 결과 창
    var msg = $("#msg");            // 결과 메세지

	$("#searchPer").on("click", function(){
		$("#perOption").empty();
		
		var perName = $("#perName").val();
		var select = $("<select id='perf' style='color:black;'></select>");
		var optionBase = $("<option>공연 선택</option>");
		select.append(optionBase);
		
		if(perName) {	
			$.ajax({
	            url: "/seller/getPer",
	            data:{per_name:perName},
	            success:function(performances){
	            	$(performances).each(function(idx, per){        
	                    option = $("<option value='"+per.per_id+"'>"+per.per_title+"</option>");
	                    select.append(option);
	                });
	            	$("#perOption").append(select);
	            	
	            	
	            	$("#msg").text("공연 검색완료!");
	    			$("#resultModal").modal('show');	
		        }
			});
			
			$("#test").on("click", function(){
				var perId = $("#perf").val();
				
				if(perId) {	
					$.ajax({
			            url: "/seller/getLayout",
			            data:{per_id:perId},
			            success:function(hall){
			            	$("#row").val(hall.hallRow);	
			            	$("#col").val(hall.hallCol);	
				        }
					});
				}else{
					$("#msg").text("오류!");
					$("#resultModal").modal('show');
				}
			});
			
		}else{
			$("#msg").text("오류! 공연 제목을 작성해주십시오.");
			$("#resultModal").modal('show');
		}
		
		
		
		
	});	
    
   //////////좌석 생성 파트////////
	var row;
	var col;
	var seatRow='<div class="row-seat"></div>';
	// 클릭시 반응(좌석생성)
	$("#check").click(function(){
		$(".layout").empty();
		
		row = $("#row").val();
		col = $("#col").val();
		var cnt = 0;
		
		for(i=1;i<=row;i++){
			$(".layout").append( seatRow );
			
			for(j=1;j<=col;j++){
					cnt++;
					var seatNum;
					if(i<10 && j<10){
						seatNum = "0"+i+"0"+j;
					}else if(i<10 && j>9){
						seatNum = "0"+i+j;
					}else if(i>9 && j<10){
						seatNum = i+"0"+j;
					}else{
						seatNum = i+""+j;
					}
					
					seat = '<div class="new-seat" id="'+seatNum+'">'+cnt+ '<input type="hidden" class="seat-value seats" name="'+ seatNum +'" value="'+seatNum+"1"+'"></div>';
					$(".row-seat:last").append( seat );																		
			}
		}
		
		// 좌석선택시 값 변경
		$(".new-seat").on("click", function(){
			var value = $(this).find(".seat-value").val();
			var compare = value%10;
			
			 //없는 좌석 선택시 normal 상태로 변경
			if( compare==0 ){
				value = value.slice(0,-1) + (compare*1+1);
				$(this).find(".seat-value").val(value);
				$( this ).css({
						"background-color": "black",
						"color":"white"
				});
			//검정 좌석 선택시 파란색으로 변경	
			}else if(compare==1 ){
				value = value.slice(0,-1) + (compare*1+1);
				$(this).find(".seat-value").val(value);
				$( this ).css({
						"background-color": "blue",
						"color":"white"
				});
			//파란 좌석 선택시 빨간색으로 변경	
			}else if(compare==2 ){
				value = value.slice(0,-1) + (compare*1+1);
				$(this).find(".seat-value").val(value);
				$( this ).css({
						"background-color":"red",
						"color":"white",
				});
			//빨간 좌석 선택시 초록색으로 변경		
			}else if(compare==3 ){
				value = value.slice(0,-1) + (compare*1+1);
				$(this).find(".seat-value").val(value);
				$( this ).css({
						"background-color":"#BDFF12",
						"color":"black",
				});
			//초록 좌석 선택시 없는좌석으로 변경		
			}else if(compare==4 ){
				value = value.slice(0,-1)+"0";
				$(this).find(".seat-value").val(value);
				$( this ).css({
						"background-color":"gray",
						"color":"rgba(0,0,0,0.0)",
				});
			} 		
		});	
	});
	
	// 좌석 셋팅값 DB 저장
    $("#resist").on("click", function(){
    	var seatValue = [];
    	
    	$(".seats").each(function(){
    		seatValue.push( $( this ).attr('value') );        	     	
    	});
    	
    	var seats={"seats":seatValue};
    	var title=$("#title").val();
    	var seatInfo={ "seat":seatValue, "per_title":title}
		
    	// 현재 seat를 단순하게 db에 저장하기 때문에 배열로 넘겨줘야함. (차후 수정)
    	if($("#row").val()) {
    		$.ajax({
                url: "/seller/addSeats",
                data: seatInfo,
                success:function(result){
                    if(result) $("#msg").text("좌석 추가 성공");
                    else $("#msg").text("좌석 추가 실패");
                },
                error:function(a, b, errMsg){
                	$("#msg").text("추가 실패: " + errMsg);                
                },
                complete:function(){
                	alert("좌석 등록완료! 마지막단계로 이동합니다.");
                	window.location.assign("/seller/perAdd3");                    
                }
            });		
    	}else {
            $("#msg").text("오류");
            $("#resultModal").modal('show');
        }
    	
   });

});
</script>
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
                    <span>
                    	공연 찾기:
                    	<input type="text" id="perName">
                    	<button type="button" id="searchPer" class="btn btn-sm btn-default">검색</button>
                    </span>
                    <span id="perOption"></span>
                </div>
                <div class="col-lg-12" id="nav2">
                	<button type="button" id="test" class="btn btn-sm btn-default">레이아웃생성</button>
                	<span>    
			                 가로:<input type="number" id="row" placeholder="row" readonly>
			                 세로:<input type="number" id="col" placeholder="col" readonly>
                    </span>
                    <button type="button" id="check" class="btn btn-default btn-sm">입력</button>
                    <button type="button" id="resist" class="btn btn-danger btn-sm">좌석 등록</button>
                </div>
                <div class="col-sm-12">
                    <div class="layout" id="shell"></div>
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
</html>