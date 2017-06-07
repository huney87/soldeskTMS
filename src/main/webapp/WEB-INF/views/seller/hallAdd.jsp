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
var resistBtn = function() {
	var modal = $("#resultModal");  // 추가, 수정, 삭제 결과 창
    var msg = $("#msg");            // 결과 메세지
    
    //회관찾기 버튼
    $("#searchCenter").on("click", function() {
    	var searchName = $("#centerName").val();
    	var option = $("<option>회관 선택</option>");
    	$("#choice").empty();
    	$("#choice").append(option);
    
    	if(searchName) {
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
    });
    
    //공연장 등록 버튼
	$("#resist").on("click", function() {
		name=$("#hallName").val();
		low= $("#hallRow").val();
		col = $("#hallCol").val();
		cId = $("#choice").val();
		
		if(name) {
    		$.ajax({
                url: "/hallManage/addHall",
                data:{
                	hallName:name,
                	hallRow:low,
                	hallCol:col,
                	centerId:cId,
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
    	}else {
            msg.text("빈칸을 전부 작성해 주십시오.");
            modal.modal('show');
        }
	});
    
}// function 종료

$(document).ready(	
	function() {
        resistBtn();
});
</script>
<style>
#resistForm{
	border: 0.1rem solid #4d4dff;
	margin: 1rem;
	padding: 1rem;
	text-align: center;
}
#resistForm th{
	color:white;
	padding: 1.5rem;
	border: 0.1rem solid #4d4dff;
	text-align: center;
}
#resistForm td{
	text-align:left;
	color:black;
	padding: 1.5rem;
	border: 0.1rem solid #4d4dff;
}
#resistArea{
	background-color: #1a1a1a;
	width: 50rem;
	height: auto;
	margin: 5rem;
	padding: 2rem;
}
#resultId{
	color:black;
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
        	<jsp:include page="hallNav.jsp"/>
        	<div class="col-sm-12" align="center">
				<div class="container" id="resistArea" align="center">
					<h4>신규 공연장 등록</h4>
					<table id="resistForm">
							<tr>
								<th>공연장 이름</th><td><input type="text" id="hallName"></td>
							</tr>
							<tr>
								<th>회관 검색</th>
								<td>
									<span>
										<input type="text" id="centerName">
										<button type="button" class="btn btn-sm btn-default" id="searchCenter">검색</button>
									</span>
								</td>
							</tr>
							<tr>
								<th>회관 선택</th>
								<td >
									<select id="choice"></select>
								</td>
							</tr>
							<tr>
								<th>가로열 크기</th><td><input type="number" id="hallRow" placeholder="max 18"></td>
							</tr>
							<tr>
								<th>세로열 크기</th><td><input type="number" id="hallCol" placeholder="max 18"></td>
							</tr>																								
					</table>
					<button type="button" class="btn btn-md btn-default" id="resist">등록</button>
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