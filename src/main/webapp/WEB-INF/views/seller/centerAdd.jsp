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
<style>
.hallNav{
	background-color: #1a1a1a;
	border: 0.1rem solid #4d4dff;
	text-align: center;
}
#resistForm{
	border: 0.1rem solid #4d4dff;
	margin: 1rem;
	padding: 1rem;
	text-align: center;
}
#resistForm th{
	color:white;
	width: 18rem;
	padding: 1.5rem;
	border: 0.1rem solid #4d4dff;
	text-align: center;
}
#resistForm td{
	text-align:left;
	color:black;
	width: 40rem;
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
#result{
	color:black;
	margin:1rem;
}
#hallRow, #hallCol{
	width:10rem;
}
</style>
<script>
var resistBtn = function() {
	var modal = $("#resultModal");  // 추가, 수정, 삭제 결과 창
    var msg = $("#msg");            // 결과 메세지
    
    //완료시
	$("#resist").on("click", function() {
		name=$("#centerName").val();
		localID= $("#locationId").val();
		postCode = $("#postNumber").val();
		postAll = $("#address1").val() + $("#address2").val();
		phone = $("#phone").val();
		
		if(name) {
    		$.ajax({
                url: "/hallManage/addCenter",
                data:{
                	centerName:name,
                	locationId:localID,
                	centerPost:postCode,
                	centerAddress:postAll,
                	centerPhone:phone
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
}

$(document).ready(	
	function() {
        resistBtn();
        $("#contents").empty();
    }
);
</script>
</head>
<body>
<div class="container-fluid">
    <div class="row content">
        <!--사이드 네비바-->
        <div class="col-sm-2 sidenav">
            <jsp:include page="mainNav.jsp"/>
        </div>
        <div class="col-sm-10">
        	<jsp:include page="hallNav.jsp"/>
        	<div class="col-sm-12" align="center">
				<div class="container" id="resistArea" align="center">
					<h4>신규 회관 등록</h4>
					<table id="resistForm">
							<tr>
								<th>회관 이름</th><td><input type="text" id="centerName"></td>
							</tr>
							<tr>
								<th>지역 선택</th><td>
													<select id="locationId" style="margin-right:3rem;">
                               						 	<option>선택</option>
														<option value="1">서울남부</option>
                                						<option value="2">서울북부</option>
														<option value="3">경기남부</option>
														<option value="4">경기북부</option>
                           							 </select>
												  </td>
							</tr>
							<tr>
								<th>주 소</th><td><button type="button" class="btn btn-md btn-default" id="postcodify_search_button">주소검색</button></td>
							</tr>
							<tr>
								<th>우편 번호</th><td><input type="text" name="postCode" class="postcodify_postcode5 form-control" id="postNumber" value="" placeholder="주소검색 버튼을 누르세요." style="width:auto;" readonly/></td>
							</tr>
							<tr>
								<th>주소</th><td><input type="text" id="address1" name="address1" class="postcodify_address form-control" value="" required readonly/></td>
							</tr>
							<tr>
								<th>상세 주소</th><td><input type="text" id="address2" name="address2" class="postcodify_details form-control" value="" placeholder="상세주소를 입력하세요." style=""required /></td>
							</tr>
							
							<tr>
								<th>전화 번호</th><td><input type="number" placeholder="- 제외 번호입력" id="phone"></td>
							</tr>																									
					</table>
					<button type="button" class="btn btn-md btn-default" id="resist">등록</button>
					<!-- jQuery와 Postcodify를 로딩한다 -->
					<script src="http://d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
			
					<!-- "우편번호찾기" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
					<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>			
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