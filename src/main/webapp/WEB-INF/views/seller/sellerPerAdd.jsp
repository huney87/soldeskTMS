<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공연등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	var modal = $("#resultModal");  // 추가, 수정, 삭제 결과 창
    var msg = $("#msg");            // 결과 메세지
	
	// 클릭시 반응(리셋)
	$("#reset").click(function(){
		$('.new-seat').remove();
	});
	
	//지역 선택시 나타나는 세부 선택창
	$("#locals").on("change", function(){
		$("#localDetail").empty();
		var choice = $("#locals :selected").val();
		var span1 = $("<span style='color:white;'>회관: </span>");
		var localOption = $("<select id='center' style='color:black;'></select>");
		var optionBase = $("<option>회관선택</option>");
		localOption.append(optionBase);
		
		if(choice) {	
			$.ajax({
	            url: "/hallManage/centerOfArea",
	            data:{locId:choice},
	            success:function(center){
	            	$(center).each(function(idx, ctr){        
	                    option = $("<option value='"+ctr.centerId+"'>"+ctr.centerName+"</option>");
	                    localOption.append(option);
	                });                  
		        }
			});
			$("#localDetail").append(span1.append(localOption));
		}
		// 회관 선택시 공연장 목록 나타내기
		$("#center").on("change", function(){
			$("#hallSelect").empty();
			var choice2 = $("#center").val();
			var span2 = $("<span style='color:white;'>공연장: </span>");
			var stageOption = $("<select id='stage' style='color:black;'></select>");
			var optionBase2 = $("<option>공연장 선택</option>");
			stageOption.append(optionBase2);
		
			if(choice2) {	
				$.ajax({
		            url: "/seller/getHalls",
		            data:{centerId:choice2},
		            success:function(halls){
		            	$(halls).each(function(idx, hall){
		                    option = $("<option value='"+hall.hallId+"'>"+hall.hallName+"</option>");
		                    stageOption.append(option);
		                });	
			        }
				});
				$("#hallSelect").append(span2.append(stageOption));
			}
			//공연장 선택시 좌석 레이아웃 가져오기
			$("#stage").on("change", function(){
				var choice3 = $("#stage").val();
				console.log(choice3);
				if(choice3) {	
					$.ajax({
			            url: "/seller/getLayout",
			            data:{hallId:choice3},
			            success:function(hall){
			            	console.log(hall);
			            	$("#row").val(hall.hallRow);	
			            	$("#col").val(hall.hallCol);	
				        }
					});
				}
			
			});
		});
		
	});
    //좌석 생성파트///////////////////////////////////////////////////////
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
	
	//좌석 등급 생성
	$("#sel").on("change", function(){
		$("#grades").empty();
		
		var choice = $("#sel :selected").val();    
	    var result = $('<button type="button" id="creatGrade" class="btn btn-danger btn-sm ">등록</button>'); 
	    
	     for(var i=0;i<choice;i++){
	    	var sheetDiv = $('<div></div>');
	 	    var gradeName = $('<label>등급 이름: <input type="text" class="write" id="grade'+i+'"></label>');
	 	    var gradePrice = $('<label>가격: <input type="number" min="0" class="write" id="price'+i+'">원</label>'); 
	    	$("#grades").append(sheetDiv.append(gradeName).append(gradePrice));
	    }
	    $("#grades").append(result);
	    
	    
	    $("#creatGrade").on("click", function(){
	    	$("#resultPrice").empty();
	    	
	    	for(var i=0;i<choice;i++){
	    		var div = $('<span id="gradeResult'+(i+1)+'" class="box">&nbsp;&nbsp;&nbsp;&nbsp;</span>');
	    		var grade = '#'+'grade'+i;
	    		var price = '#'+'price'+i;
	    		var text = $('<span>&nbsp;&nbsp;'+$(grade).val()+'석&nbsp;&nbsp;'+$(price).val()+'원</span><br>')
	    		$("#resultPrice").append(div).append(text);
	    	}
	    });	    	    	
	});
	
	// 좌석 셋팅값 DB 저장 ///공연정보 같이 저장됨///////ajax///////ajax////////ajax//////////
    $("#addSeats").on("click", function(){
    	var seatValue = [];
    	
    	$(".seats").each(function(){
    		seatValue.push( $( this ).attr('value') );        	     	
    	});
    	
    	var seats={"seats":seatValue};
    	var title=$("#title").val();
    	var stage=$("#stage").val();
    	var category=$("#genre").val();
    	var seatInfo={ "seat":seatValue, "per_title":title, }
		
    	// 현재 seat를 단순하게 db에 저장하기 때문에 배열로 넘겨줘야함. (차후 수정)
    	if($("#row").val()) {
    		$.ajax({
                url: "/seller/addSeats",
                data: seats,
                success:function(result){
                    if(result) $("#msg").text("좌석 추가 성공");
                    else $("#msg").text("좌석 추가 실패");
                },
                error:function(a, b, errMsg){
                	$("#msg").text("추가 실패: " + errMsg);                
                },
                complete:function(){
                	$("#resultModal").modal('show');                    
                }
            });		
    	}else {
            $("#msg").text("오류");
            $("#resultModal").modal('show');
        }
    	// 공연정보 넘겨주는부분
    	if(stage){
    		$.ajax({
                url: "/seller/addPerInfo",
                data: {
                	per_title:title,
                	hall_id:stage,
                	ct_id:category
                },
                success:function(result){
                    if(result) $("#msg").text("공연 추가 성공");
                    else $("#msg").text("공연 추가 실패");
                },
                error:function(a, b, errMsg){
                	$("#msg").text("추가 실패: " + errMsg);                
                },
                complete:function(){
                	$("#resultModal").modal('show');                    
                }
            });
    	}else {
            $("#msg").text("오류");
            $("#resultModal").modal('show');
        }
   }); 

});/*document 종료*/
</script>
<style>
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
#gradeResult1{ background-color:black;
}
#gradeResult2{ background-color:blue;
}
#gradeResult3{ background-color:red;
}
#gradeResult4{ background-color:#BDFF12;
}
#timeSlot{
	width:12rem;
}
button{
	background-color:black;
}
#sel,#title{
	color:black;
}
#searchTable{
	border: 0.1rem solid #4d4dff;
	background-color:#1a1a1a;
	color:white;
	text-align:center;
}
#searchTable th{
	text-align: center;
}
#nav1, #nav3{
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
button{
    margin-right:1rem;
}
#row, #col{
    width:7rem;
    color:black;
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
                    <div>
                        <span>
                            <select id="locals" style="margin-right:3rem; color:black;">
                                <option>지역선택</option><option value="1">서울남부</option>
                                <option value="2">서울북부</option>
                                <option value="3">경기남부</option>
                                <option value="4">경기북부</option>
                            </select>
                            <span id="localDetail"></span>   
                            <span id="hallSelect"></span>   
                        </span>
                    </div>
                </div>
                <div class="col-lg-12" id="nav2"></div>
                <div class="col-lg-12" id="nav3">
                    <span>
			                 제목:<input type="text" id="title" placeholder="제목" required>
					 장르 :<select id="genre" style="color:black;">
							<option>장르 선택</option>
							<option value="1">뮤지컬</option>
							<option value="2">콘서트</option>
							<option value="3">연극</option>
						</select>      
			                 가로:<input type="number" id="row" placeholder="row" readonly>
			                 세로:<input type="number" id="col" placeholder="col" readonly>
                    </span>
                    <button type="button" id="check" class="btn btn-default btn-sm" style="background-color:white; color:black;">입력</button>
                    <button type="reset" id="reset" class="btn btn-danger btn-sm" style="background-color:#4d4dff; color:white;">리셋</button>
                    <button type="button" id="addSeats" class="btn btn-danger btn-sm" style="background-color:#4d4dff; color:white;">좌석 완료(테스트용)</button>
                    <!-- <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal" id ="button1" >좌석 선택완료</button> -->
                </div> 
                <div class="col-sm-8">
                    <div class="layout" id="shell"></div>
                </div>
                <div class="col-sm-4" style="background-color:#1a1a1a; height:60rem; border:0.1rem solid #4d4dff; color:white">
                    <h5>좌석 등급은 최대 4개까지 선택 가능합니다.</h5>
                    <div>
                        <span>좌석 등급 갯수:</span>
                        <select id="sel">
                            <option value="1">좌석등급 1개</option>
                            <option value="2">좌석등급 2개</option>
                            <option value="3">좌석등급 3개</option>
                            <option value="4">좌석등급 4개</option>
                        </select>
                    </div>
                    <hr style="border:0.1rem solid #4d4dff;">
                    <div>
                        <h3>공연 좌석 등록</h3>
                        <p>좌석 등급 이름은 대소문자를 구분하지 않습니다.</p>
                        <div id="grades"></div>
                    </div>
                    <hr style="border:0.1rem solid #4d4dff;">
                    <div>
                        <h3>공연 좌석 등급별 가격</h3>
                        <div id="resultPrice"></div>
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
</html>