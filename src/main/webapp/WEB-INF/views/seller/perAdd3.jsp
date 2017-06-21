<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>좌석 등급 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
//좌석값 입력후 등록시 오른쪽에 결과창 확인 및 데이터 저장.
var resistBtn = function() {	
    $("#creatGrade").on("click", function(){  	
    	$("#resultPrice").empty();
    	var gradeCnt = $(".gPrice").length/2;
    	
    	for(var i=1;i<=gradeCnt;i++){
    		var div = $('<span id="gradeResult'+i+'" class="box">&nbsp;&nbsp;&nbsp;&nbsp;</span>');
    		var grade = '#'+'grade'+i;
    		var price = '#'+'price'+i;
    		var text = $('<span>&nbsp;&nbsp;'+$(grade).val()+'석&nbsp;&nbsp;'+$(price).val()+'원</span><br>');
    		$("#resultPrice").append(div).append(text);   		
    		
    		var seatInfo = {
        			perId:$("#choice").val(),
        			seatType:i,
        			grade:$(grade).val(),
        			price:$(price).val()
        	}
    		
    		$.ajax({
                url: "/seller/updateSeatsInfo",
                data: seatInfo,
                success:function(result){
                	roundAdd();// 회차정보 입력창 불러오기
                },
                error:function(a, b, errMsg){
                	$("#msg").text("추가 실패: " + errMsg);
                	$("#resultModal").modal('show');
                }
            });			
    	}   	
    	
    	$("#msg").text("좌석 등급정보 등록완료!");
    	$("#resultModal").modal('show');
    });
}

//회차정보 입력창.
var roundAdd = function() {
	$("#step3").empty();
	$("#step3").css({
						"background-color": "#1a1a1a",
						"color":"white",
						"height":"55rem",
						"border":"0.1rem solid #4d4dff"
				});
	
	var addDateBtn = $("<button type='button' id='addDate' class='btn btn-sm btn-default'>공연 날짜 추가</button>");
	var rstDateBtn = $("<button type='button' id='rstDate' class='btn btn-sm btn-default'>날짜 리셋</button>");
	var resistDateBtn = $("<button type='button' id='resistDate' class='btn btn-sm btn-danger'>등록</button>");
	var div = $("<div></div>");
	var roundTitle = $("<h3>회차 정보 입력</h3><p>회차정보는 최대 10회까지 각 회당 2차까지 등록가능합니다.</p>");
	var timeSlot = $("<div id='timeSlots'></div>");
	div.append(addDateBtn).append(rstDateBtn).append(resistDateBtn);
	$("#step3").append(roundTitle).append(div).append(timeSlot);
	
	var cnt = 1;
	//공연날짜추가 선택시 10회차까지 회차 증가.
	$("#addDate").on("click",function(){			
		if(cnt>10){
			cnt = 1;
			alert('최대 10회 까지 등록 가능합니다.');
			$("#timeSlots").empty();
		}else{
			console.log(cnt);
			var dateInput = $("<label>"+cnt+"회<input type='date' class='di'/></label>");
			var timeInput1 = $("<label>1차:<input type='time' class='timeSlot1' id='timeSlot1'"+cnt+"'></label>");
			var timeInput2 = $("<label>2차:<input type='time' class='timeSlot2' id='timeSlot2'"+cnt+"'></label>");
			$("#timeSlots").append(dateInput).append(timeInput1).append(timeInput2);
			cnt=cnt+1;
		}
		
		//회차정보 DB 저장. (등록)
		$("#resistDate").on("click",function(){
			var dates = [];
			var time1 = [];
			var time2 = [];
			var perId = $("#choice").val();

			//회차 정보
			$(".di").each(function(){
				dates.push( $( this ).val());        	     	
	    	}); 
			//회당 1차 시간
			$(".timeSlot1").each(function(){
				time1.push( $( this ).val());        	     	
	    	}); 
			//회당 2차 시간
			$(".timeSlot2").each(function(){
				time2.push( $( this ).val());        	     	
	    	}); 
			
			var roundInfo={"dates":dates, "time1":time1, "time2":time2, "perId":perId};
			
			$.ajax({
                url: "/seller/addRound",
                data:roundInfo,
                success:function(result){
                	 $("#msg").text("회차 정보 저장에 성공했습니다.");
                	 $("#resultModal").modal('show'); 
    	        },
		         error:function(a, b, errMsg){
		        	 $("#msg").text("회차 정보 저장에 실패했습니다.");
		 			 $("#resultModal").modal('show'); 
		         }
    		});
		});
		
		//시간리셋 선택시
		$("#rstDate").on("click", function(){
			$("#timeSlots").empty();
			cnt=1;
		});	
	});	
}

//공연찾기 기능
var searchBtn = function() {
	$("#searchPer").on("click", function() {
    	var searchName = $("#perName").val();
    	var option = $("<option>공연 선택</option>");
    	$("#choice").empty();
    	$("#choice").append(option);
    
    	if(searchName) {
    		$.ajax({
                url: "/seller/getPer",
                data:{per_name:searchName},
                success:function(perfomance){
                	$(perfomance).each(function(idx, per){        
                        option2 = $("<option value='"+per.per_id+"'>"+per.per_title+"</option>");
                        $("#choice").append(option2);
                        
                    });                  
    	        }
    		});
    	}else{
    		$("#msg").text("공연 이름을 입력해주십시오!");
			$("#resultModal").modal('show');
    	}	
    });
}

$(document).ready(function(){
	var modal = $("#resultModal");  // 추가, 수정, 삭제 결과 창
    var msg = $("#msg");            // 결과 메세지
	
    searchBtn();
    
   	//좌석 등급 생성(등록된 좌석이 있을경우 등록된 수만큼 칸 생성, 없을경우 선택해서 신규생성)
   	$("#choice").on("change", function(){
   		var gradeCnt=0;
   		$("#grades").empty();  		
   		var perId=$("#choice").val();
   	    var result = $("<button type='button' id='creatGrade' class='btn btn-danger btn-sm'>등록하기</button>");
   	    
	   	 $.ajax({  		
		         url: "/seller/maxGrade",
		         data:{per_id:perId},
		         success:function(grade){
		         	if(grade){gradeCnt=grade;}	
				   	     for(i=1;i<=gradeCnt;i++){
				   	    	var sheetDiv = $("<div></div>");
				   	 	    var gradeName = $("<label>"+i+".등급 이름: <input type='text' class='gPrice' id='grade"+i+"'></label>");
				   	 	    var gradePrice = $("<label> 가격: <input type='number' min='0' class='gPrice' id='price"+i+"'>원</label>"); 
				   	    	$("#grades").append(sheetDiv.append(gradeName).append(gradePrice));
		         		}
			   	     $("#grades").append(result);
			   		 resistBtn();// 완료버튼 활성화 기능.   	  
		         },
		         error:function(a, b, errMsg){
		        	
		         }  	   	    
	  		}); 
   	});		
});
</script>
<style>
#roundNav{
	background-color:#1a1a1a;
	height:5rem;
	padding:1rem;
	margin:0.5rem;
	color:white;
	border:0.1rem solid #4d4dff;
}
#addTime{
background-color:black;
color:white;
}
#rstTime{
background-color:#4d4dff;
color:white;
}
#eDate, #sDate, #perName, #choice{
color:black;
}
input{
color:black;
}
.timeSlot1, .timeSlot2{
	color:black;
}
/* 하단 정보입력창 속성 */
#step1, #step2{
	background-color:#1a1a1a;
	height:55rem;
	border:0.1rem solid #4d4dff;
	color:white;
}
#searchPer,#rstTime{
	margin-right:3rem;
}
#sel,.gPrice{
	color:black;
	text-align:right;
	width:12rem;
}
label{
	margin:1rem;
}
.box{
	width:3rem;
	height:3rem;
	margin:1rem;
	padding:1rem;
	display:inline-block;
}
#gradeResult1{ background-color:black; border:gray solid 0.1rem;
}
#gradeResult2{ background-color:blue;
}
#gradeResult3{ background-color:red;
}
#gradeResult4{ background-color:#BDFF12;
}
.di{
	width:12rem;
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
        <div class="col-sm-10">
        	<jsp:include page="perNav.jsp"/>
        	<div class="row">
        		<div class="col-sm-12" id="roundNav">
        			<span>
        				공연 찾기:<input type="text" id="perName">
        						<button type="button" class="btn btn-sm btn-info" id="searchPer">검색</button>	
        				검색 결과 선택: <select id="choice"></select>
        			</span>
        		</div>
				<div class="col-sm-5" id="step1">
                    <h5>좌석 등급은 공연등록시 저장한 좌석종류를 기준으로 입력 가능합니다.</h5>
                    <div id="gradeMenu"></div>
                    <hr style="border:0.1rem solid #4d4dff;">
                    <div>
                        <h3>공연 좌석 등록</h3>
                        <p>좌석 등급 이름은 대소문자를 구분하지 않습니다.</p>
                        <div id="grades"></div>
                    </div>                                      
                </div>
                <div class="col-sm-2" id="step2">
                	<div>
                        <h3 style="text-align:center;">등록 결과</h3>
                        <div id="resultPrice" style="text-align:left;"></div>
                    </div>
                </div>
                <div class="col-sm-5" id="step3"></div>
        	</div>
        </div>
	</div>
</div>
<!-- 결과값 모달 -->
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