<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공연 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<script>
$(document).ready(function(){
	var modal = $("#resultModal");  // 추가, 수정, 삭제 결과 창
    var msg = $("#msg");            // 결과 메세지

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
			
			//공연장 선택시 기간선택화면 출력
			$("#stage").on("change", function(){
				$("#term").empty();
				$("#imageUrl").empty();
				var term = $("<span>공연기간 : <input type='date' id='sDate'> ~ <input type='date' id='eDate'></span>");
				var imageUrl = $("<input type='text' id='poster' placeholder='공연 포스터 주소(/주소.jpg)'/>");
				
				$("#term").append(term);
				$("#imageUrl").append(imageUrl);
		        	
			});
		});
		
	});	
	
////// 공연정보 DB 저장 ////////
    $("#resist").on("click", function(){ 	
    	var title=$("#title").val();	// 제목
    	var stage=$("#stage").val();	// 공연장
    	var category=$("#genre").val();	// 장르
    	var sDate=$("#sDate").val(); 	//공연 시작날짜
    	var eDate=$("#eDate").val();	//공연 종료날짜
    	var image=$("#poster").val();	//공연 포스터 주소
    	
    	// 공연정보 넘겨주는부분
    	if(image){
    		$.ajax({
                url: "/seller/addPerInfo",
                data: {
                	per_title:title,
                	hall_id:stage,
                	ct_id:category,
                	per_startDate:sDate,
                	per_endDate:eDate,
                	per_image:image
                		
                },
                success:function(result){
                    if(result) $("#msg").text("공연 등록 성공");
                    else $("#msg").text("공연 등록 실패");
                },
                error:function(a, b, errMsg){
                	$("#msg").text("등록 실패: " + errMsg);                
                },
                complete:function(){          	
                	alert("등록완료! 다음단계로 이동합니다.");
                	window.location.assign("/seller/perAdd2");
                }
            });
    	}else {
            $("#msg").text("오류");
            $("#resultModal").modal('show');
        }
   }); 

  //이미지 업로드 버튼
    var regButtons = function() {    
        $(":button#send").bind("click", function() {        
            var formData = new FormData($("form")[0]);        
            $.ajax({
                method: "post",            
                data: formData,
                processData: false, //no serialize
                contentType: false, // multipart/formdata
                success: function(result){
                    if(result)$("#msgModal #msg").text("업로드 성공");                
                },
                error: function(a, b, errMsg){
                    $("#msgModal #msg").text("업로드 실패: " + errMsg);
                },
                complete:function(){
                    $("#msgModal").modal("show");
                }
            });        
        });
    };
});/*document 종료*/

var imgView = function(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();        
        reader.addEventListener("load", function(){
            $('.previewImg').attr('src', reader.result);
          }, false);
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<style>
#title,#eDate,#sDate,#imageUrl{
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
</style>
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
                            	지역: 
                            	<select id="locals" style="margin-right:3rem; color:black;">
                                <option>지역선택</option><option value="1">서울남부</option>
                                <option value="2">서울북부</option>
                                <option value="3">경기남부</option>
                                <option value="4">경기북부</option>
                            </select>
                            <span id="localDetail"></span>   
                            <span id="hallSelect"></span>   
                            <span id="term"></span>   
                        </span>
                    </div>
                </div>
                <div class="col-lg-12" id="nav2">
                    <span>
			                 제목:<input type="text" id="title" placeholder="제목" required>
					 장르 :<select id="genre" style="color:black;">
							<option>장르 선택</option>
							<option value="1">뮤지컬</option>
							<option value="2">콘서트</option>
							<option value="3">연극</option>
						</select>   
                    </span>
                    <span id="imageUrl"></span>
    					<img class="previewImg" align="left" hspace="72"  width="200" height="250" > 
					<form>    
    					<input type="file" id="uploadFile" name="uploadFile" onChange="imgView(this)">        
					</form>
					<button type="button" id="send" class="button btn-default">업로드</button>
                    <button type="button" id="resist" class="btn btn-danger btn-sm">공연 등록</button>
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

<!-- 이미지 업로드 확인을 위한 모달창 -->
<div id="msgModal" class="modal fade">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <p id="msg">수정 성공</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="close" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>              
</body>
</html>