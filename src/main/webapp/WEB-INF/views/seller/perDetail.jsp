<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	var modal = $("#resultModal");  // 추가, 수정, 삭제 결과 창
    var msg = $("#msg");            // 결과 메세지
	
	//공연찾기 버튼
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
    	}
    });

	//시간추가 선택시
	var cnt = 1;
	$("#addTime").on("click", function(){				
		if(cnt>5){
			cnt = 1;
			alert('최대 5회차 까지 입니다.')
		}else{
			var times = $('<label>'+cnt+'차:<input type="time" class="timeSlot" id="timeSlot'+cnt+'">&nbsp;&nbsp;</label>');
			$("#timesNav").append(times);
			cnt=cnt+1;
		}
	});
	
	//시간리셋 선택시
	$("#rstTime").on("click", function(){
		$("#timesNav").empty();
		cnt=1;
	});
	
	//최종완료버튼( DB 등록) 현재 기간만 등록되고, 회차에 대한 정보는 저장되지 않음.
	$("#roundResist").on("click", function(){
		var sDate = $("#sDate").val()+"";
		var eDate = $("#eDate").val()+"";
		var choice = $("#choice").val();
		var timeSlot1 = $("#timeSlot1").val();
		var timeSlot2 = $("#timeSlot1").val();
		var timeSlot3 = $("#timeSlot1").val();
		var timeSlot4 = $("#timeSlot1").val();
		var timeSlot5 = $("#timeSlot1").val();
		
		if(choice){
			$.ajax({
	            url: "/seller/addPerDetail",
	            data:{
	            	per_id:choice,
	            	per_startDate:sDate,
	            	per_endDate:eDate
	            	},
	            success:function(result){
                    if(result) msg.text("추가 성공");
                    else msg.text("추가 실패");
                },
                error:function(a, b, errMsg){
                    msg.text("추가 실패: " + errMsg);                
                },
                complete:function(){
                    modal.modal('show');                    
                }
			});			
		}else{
			alert("입력이 잘못되었습니다.");
		}
		
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
.timeSlot{
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
        <div class="col-sm-10">
        	<jsp:include page="perNav.jsp"/>
        	<div class="row">
        		<div class="col-sm-12" id="roundNav">
        			<span>
        				공연 찾기:<input type="text" id="perName">
        						<button type="button" class="btn btn-sm btn-default" id="searchPer">검색</button>	
        				&nbsp;&nbsp;&nbsp;검색 결과 선택: <select id="choice"></select>
        			</span>
        		</div>
        		<div class="col-sm-12" id="roundNav">
		        	 공연기간 :
		        	<input type="date" id="sDate"> ~ <input type="date" id="eDate">
        			<button type="button" id="addTime" class="btn btn-default btn-sm">시간추가</button>
					<button type="button" id="rstTime" class="btn btn-danger btn-sm">시간리셋</button>
					<span id="timesNav">&nbsp;&nbsp;&nbsp;</span>
				</div>
				<div style="text-align:center;">
					<button type="button" id="roundResist" class="btn btn-md btn-danger">회차 등록</button>
				</div>
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