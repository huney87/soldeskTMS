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
	// 클릭시 반응(리셋)
	$("#reset").click(function(){
		$('.new-seat').remove();
	});

    // 지역 선택시 나타나는 세부 선택창
	$("#locals").on("change", function(){
		$("#localDetail").empty();
		var choice = $("#locals :selected").val();
		var span = $('<span>공연장: </span>');
		var localOption = $('<select id="stage"></select>');
		
		if(choice) {
    		$.ajax({
                url: "/hallManage/getCenter",
                data:{Center_name:searchName},
                success:function(center){
                	$(center).each(function(idx, ctr){        
                        option2 = $("<option value='"+ctr.centerId+"'>"+ctr.centerName+"</option>");
                        $("#choice").append(option2);
                    });                  
    	        }
    		});
    	}
		
		
		
		
		switch(choice){
		case "1": $("#localDetail").append(span.append(localOption.append(southSeoul))); break;
		case "2": $("#localDetail").append(span.append(localOption.append(northSeoul))); break;
		case "3": $("#localDetail").append(span.append(localOption.append(southArea)));  break;
		case "4": $("#localDetail").append(span.append(localOption.append(northArea)));  break;
		}
		//공연장 선택완료시 시간관련 네비바가 나타남
		$("#stage").on("change", function(){
			$("#nav2").empty();
			var timeMain = '날짜 선택 : <input type="date" id="date-input">'
								+'<button type="button" id="addTime" class="btn btn-default btn-sm" style="background-color:black; color:white;">시간추가</button>'
								+'<button type="button" id="rstTime" class="btn btn-danger btn-sm" style="background-color:#4d4dff; color:white;">시간리셋</button>'
								+'<span id="timesNav">&nbsp;&nbsp;&nbsp;</span>';
			$("#nav2").css({
				"background-color":"#1a1a1a",
				"height":"5rem",
				"padding":"1rem",	
				"margin":"0.5rem",
				"color":"white",
				"border":"0.1rem solid #4d4dff"
			});
			$("#nav2").append(timeMain);
			
			//시간추가 선택시
			var cnt = 1;
			$("#addTime").on("click", function(){				
				if(cnt>5){
					cnt = 1;
					alert('최대 5회차 까지 입니다.')
				}else{
					var times = $('<label>'+cnt+'차:<input type="time" name="'+$("#title").val()+'" id="timeSlot'+cnt+'">&nbsp;&nbsp;</label>');
					$("#timesNav").append(times);
					cnt=cnt+1;
				}
			});
			
			//시간리셋 선택시
			$("#rstTime").on("click", function(){
				$("#timesNav").empty();
				cnt=1;
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
					
					seat = '<div class="new-seat" id="'+seatNum+'">'+seatNum+ '<input type="hidden" class="seat-value seats" name="'+ seatNum +'" value="'+seatNum+"1"+'"></div>';
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
				console.log(value);
				$(this).find(".seat-value").val(value);
				$( this ).css({
						"background-color": "blue",
						"color":"white"
				});
			//파란 좌석 선택시 빨간색으로 변경	
			}else if(compare==2 ){
				value = value.slice(0,-1) + (compare*1+1);
				console.log(value);
				$(this).find(".seat-value").val(value);
				$( this ).css({
						"background-color":"red",
						"color":"white",
				});
			//빨간 좌석 선택시 초록색으로 변경		
			}else if(compare==3 ){
				value = value.slice(0,-1) + (compare*1+1);
				console.log(value);
				$(this).find(".seat-value").val(value);
				$( this ).css({
						"background-color":"#BDFF12",
						"color":"black",
				});
			//초록 좌석 선택시 없는좌석으로 변경		
			}else if(compare==4 ){
				value = value.slice(0,-1)+"0";
				console.log(value);
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
	
	// 좌석 셋팅값 DB 저장 ///////////////ajax///////ajax////////ajax//////////
    $("#addSeats").on("click", function(){
    	var seatValue = [];
    	
    	$(".seats").each(function(){
    		seatValue.push( $( this ).attr('value') );        	     	
    	});
    	
    	var seats={"seats":seatValue}
    	
    	
 		console.log(seatValue);
    	if($("#row").val()) {
    		$.ajax({
                url: "/seller/addSeats",
                data: seats,
                success:function(result){
                    if(result) $("#msg").text("추가 성공");
                    else $("#msg").text("추가 실패");
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
	
	

	});/*메뉴 버튼: 공연등록 종료*/
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
#sel{
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
select, input{
	color:black;
    margin-right:2rem;
}
button{
    margin-right:1rem;
}
#row, #col{
    width:7rem;
}
</style>
</head>
<body>
<div class="container-fluid">
    <div class="row content">
        <!--사이드 네비바-->
        <div class="col-sm-2 sidenav">
            <jsp:include page="sellerNav.jsp"/>
        </div>
        <div class="col-sm-10">
			<div class="row">
                <div class="col-lg-12" id="nav1">
                    <div>
                        <span>
                            <select id="locals" style="margin-right:3rem;">
                                <option>지역선택</option><option value="1">서울남부</option>
                                <option value="2">서울북부</option>
                                <option value="3">경기남부</option>
                                <option value="4">경기북부</option>
                            </select>
                            <span id="localDetail"></span>   
                        </span>
                    </div>
                </div>
                <div class="col-lg-12" id="nav2"></div>
                <div class="col-lg-12" id="nav3">
                    <span>
			                    제목:<input type="text" id="title" name="title" placeholder="제목" required>
			                    가로:<input type="number" name="row" id="row" placeholder="max18" min="1" max="18" required>
			                    세로:<input type="number" name="col" id="col" placeholder="max18" min="1" max="18" required>
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
              <h4 class="modal-title" id="msg"></h4>
            </div>            
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
</body>
</html>