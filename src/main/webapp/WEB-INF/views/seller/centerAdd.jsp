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
		if($("#centerName").val()) {
    		$.ajax({
                url: "/hallManage/addCenter",
                data:{
                	centerName:$("#centerName").val(),
                	locationId:$("#locationId").val(),
                	centerPost:$("#postNum").val(),
                	centerAddress:$("#postDetail").val(),
                	centerPhone:$("#phone").val()
                	},  
           	
                success:function(result){
                    if(result) msg.text("추가 성공");
                    else msg.text("추가 실패");
                    $("#getUsers").trigger("click");
                },
                error:function(a, b, errMsg){
                    msg.text("추가 실패: " + errMsg);                
                },
                complete:function(){
                    modal.modal('show');                    
                }
            });   		
    	}else {
            msg.text("회원 이름을 입력하세요.");
            modal.modal('show');
        }
		
	});
}

$(document).ready(	
	function() {
        resistBtn();
    }
);
</script>
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
								<th>주 소</th><td><button type="button" class="btn btn-md btn-default" id="address">검색</button></td>
							</tr>
							<tr>
								<th>우편 번호</th><td><input type="number" id="postNum"></td>
							</tr>
							<tr>
								<th>상세 주소</th><td><input type="text" id="postDetail"></td>
							</tr>
							<tr>
								<th>전화 번호</th><td><input type="number" placeholder="- 제외 번호입력" id="phone"></td>
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