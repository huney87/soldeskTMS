<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
body{
    background:gray;
} 
h4{
	color:white;
}
.mainBtn{
	margin-left: 1rem;
	margin-right: 1rem;
	margin-bottom: 1.5rem;
	margin-top: 1.5rem;
}
.hallNav{
	background-color: #1a1a1a;
	border: 0.1rem solid #4d4dff;
	text-align: center;
}

#mainContent{
	width: 60rem;
	height: auto;
	margin: 1rem;
	padding: 1rem;
	background-color: #1a1a1a;
	border: 0.1rem solid #4d4dff;
	text-align: center;
	align:center;
}
#hallTable{
	margin: 1rem;
	padding: 1rem;
	width: 50rem;
	color: white;
	border: 0.1rem solid #4d4dff;
}
#hallTable th, #hallTable td{
	width: 15rem;
	text-align: center;
}
</style>

<script>
var hallList = function() {
	var divMain = $("<div class='col-sm-12' id='mainContent'>"
					+"<table id='hallTable' class='table'>"
					+"<thead id='tHead'>"
					+"<tr><th>공연장명</th><th>가로좌석</th><th>세로좌석</th><th>소속 회관</th></tr>"
					+"</thead>"
					+"<tbody id='hallList'></tbody>"
					+"</table>"
					+"</div>");
	
	$("#search").on("click", function(){
		$("#contents").empty();
		$("#contents").append(divMain);
		$("#resistArea").hide();
		$("#hallList").empty();
		
		var searchName = $("#searchHall").val();
		
		$.ajax({
            url: "/hallManage/searchHalls",
            data:{hall_name:searchName},
            success:function(halls){
            	console.log(halls);
            	$(halls).each(function(idx, hall){
                    tr = $("<tr><td><input type='hidden' id="+hall.hallID+"' value='"+hall.hallID+"'>"+hall.hallName+"</td><td>"+hall.hallCol+"</td><td>"+hall.hallRow+"</td><td>"+hall.centerId+"</td></tr>");
                    $("#hallList").append(tr);
                });	
	        }
		});	
	});
	
	$("#searchAll").on("click", function(){
		$("#contents").empty();
		$("#contents").append(divMain);
		$("#resistArea").hide();
		$("#hallList").empty();
		
		$.ajax({
            url: "/hallManage/getHalls",
            success:function(halls){
            	$(halls).each(function(idx, hall){
                    tr = $("<tr><td><input type='hidden' id="+hall.hallID+"' value='"+hall.hallID+"'>"+hall.hallName+"</td><td>"+hall.hallCol+"</td><td>"+hall.hallRow+"</td><td>"+hall.centerId+"</td></tr>");
                    $("#hallList").append(tr);
                });	
	        }
		});	
	});
	
}

$(document).ready(function() {
	hallList();
});


</script>

<div class="row">
	<div class="col-sm-12 hallNav">
		<div class="col-sm-2" style="color:white;">
		  <h3>공연장 관리</h3>
		</div>
		<div class="col-sm-3">		
			<a href="/hallManage/cenAdd" class="btn btn-md btn-default mainBtn">회관 등록</a>
			<a href="/hallManage/hallAdd" class="btn btn-md btn-default mainBtn">공연장 등록</a>
		</div>
		<div class="col-sm-7">			
			<input type="text" id="searchHall" placeholder="공연장 이름 작성">
			<button type="button" class="btn btn-md btn-default mainBtn" id="search">공연장 검색</button>	
			<button type="button" class="btn btn-md btn-default mainBtn" id="searchAll">전체검색</button>	
		</div>			
	</div>
</div>
<div class="row" id="contents" align="center"></div>
