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
</style>

<div class="row">
	<div class="col-sm-12 hallNav">
		<div class="col-sm-2" style="color:white;">
		  <h3>공연 관리</h3>
		</div>
		<div class="col-sm-5">		
			<a href="/seller/perAdd1" class="btn btn-sm btn-default mainBtn" id="search">1.공연 신규 등록</a>
			<a href="/seller/perAdd2" class="btn btn-sm btn-default mainBtn" id="search">2.좌석 정보 등록</a>
			<a href="/seller/perAdd3" class="btn btn-sm btn-default mainBtn" id="resistHall">3.좌석 가격 등록</a>
		</div>
		<div class="col-sm-5">			
			<input type="text" id="searchHall" placeholder="공연 이름">
			<button type="button" class="btn btn-md btn-default mainBtn" id="search">공연 검색</button>
		</div>			
	</div>
</div>

