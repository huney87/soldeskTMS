<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/frames/header.jsp" flush="false"/>

<title>마이페이지</title>

<link href="/css/menu.css" media="all" rel="stylesheet" type="text/css" />
<link href="/css/mypage.css" media="all" rel="stylesheet" type="text/css" />
<style>
#middle-menu {
	display: none;
}
table th,table td{
	text-align:center;
}
</style>

<script type="text/javascript">
$(function(){
	var email=$("#email").val();
	var reserveList=$("#reserveList");
	reserveList.empty();
	
	$.ajax({
		url:"/mypage/reservelist",
		data:{userEmail:email},
		success:function(reserves){
			if(reserves==null||reserves.length==0){
				tr=$("<tr></tr>");
				td=$("<td colspan='5'><h3>예매 내역이 없습니다</h3></td>");
				reserveList.append(tr.append(td));
			}else{
			$(reserves).each(function(idx, reserve){
					tr=$("<tr></tr>");
					td=$("<td>"+reserve.reservationId+"</td><td><a href='/detail?perfId="+reserve.perfId+"'>"
							+reserve.perfTitle+"</a></td><td>"
							+reserve.hallName+"</td><td>"
							+reserve.reserveDate+"</td><td>"
							+"<button type='button' class='btn btn-danger' value='"+reserve.reservationId+"' onClick='delReserve(this)'>취소</button>");
					reserveList.append(tr.append(td));
					td.find("button").data("reservationId", reserve.reservationId);
				});
			}
		},error:function(a,b,errMsg){
			swal(errMsg);
		}
	});
});

var delReserve = function(reserve){
   	var reservationId=$(reserve).data("reservationId");
   	var reserve=$(reserve);
		swal({
			  title: "예매를 취소 하시겠습니까?",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "네, 취소합니다",
			  cancelButtonText: "취소",
			  closeOnConfirm: false
			},
			function(){
				$.ajax({
					url:"/mypage/reserveDelete",
					data:{reserveId:reservationId},
					success:function(result){
						if(result) return true;
						else swal("예매취소 실패: "+errMsg);
					},
					error:function(a,b,errMsg){
						swal("예매취소 실패: "+errMsg);
					},
					complete:function(){
						swal({
							title: "예매 취소",
							text: "예매를 취소하였습니다",
							type: "success"
						},
						function(){
							window.location.reload();
						});
					}
				});
			});
}
</script>

<jsp:include page="/WEB-INF/views/frames/menu.jsp" flush="false"/>

<input type="hidden" id="email" value="${email}" />
	<div class="container" style="padding:2rem 0;">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="btn-group btn-group-justified">
			  		<a href="/mypage/mypage1" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-user"></span><br>개인정보수정</a>
			  		<a href="/mypage" class="btn btn-primary mypageBtn"><span class="glyphicon glyphicon-check"></span><br>예매확인/취소</a>
			  		<a href="/mypage/mypage4" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-remove-sign"></span><br>회원탈퇴</a>
				</div>
				<div class="page-header">
			  		<h1>예매확인/취소</h1>
				</div>
				<form>
					<table class="table table-hover">
						<thead>
					      <tr>
					        <th>예매번호</th>
					        <th>공연명</th>
					        <th>장소</th>
					        <th>날짜</th>
					        <th>예매취소</th>
					      </tr>
					    </thead>
					    <tbody id="reserveList">

						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>	
	<jsp:include page="/WEB-INF/views/frames/footer.jsp" flush="false"/>