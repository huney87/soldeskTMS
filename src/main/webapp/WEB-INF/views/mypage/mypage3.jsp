<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
<meta charset="utf-8">
<jsp:include page="/WEB-INF/views/frames/header.jsp" flush="false"/>
<link href="/css/menu.css" media="all" rel="stylesheet" type="text/css" />
<link href="/css/mypage.css" media="all" rel="stylesheet" type="text/css" />

<style>
#middle-menu {
	display: none;
}
</style>
<script type="text/javascript">
$(function() { 
	var reserveList=$("#reserveList");
	reserveList.empty();
	var test = '17/01/01';
	//예매일 나누기
	var reserves = reserve.reserveDate.split("/");
	var d = new Date();
	
	var reserveDate = d.setFullYear(2000+test[0], test[1], test[2]);
	var year = d.getFullYear();
	var month = d.getMonth()+1;
	var date = d.getDate()-1;
	
	if(reserveYear<=year || reserveMonth<=month || reserveDay<=date){
		var reservation = reserve.reserveDate;
		console.log("허걱");
	}else{
		false;
	}
	
	$.ajax({
		url:"/mypage/reservelist",
		success:function(reserves){
			$(reserves).each(function(idx, reserve){
				tr=$("<tr></tr>");
				td=$("<td>"+reserve.reservationId+"</td><td><a href='/detail'>"
						+reserve.perfTitle+"</a></td><td>"
						+reserve.hallName+"</td><td>"
						+reservation+"</td><td>"
						+"<button type='button' class='btn btn-primary' value='"+reserve.reservationId+"' data-toggle='modal' data-target='#myModal' onClick='deleteReserve(this)'>후기 작성</button>");
				reserveList.append(tr.append(td));
				td.find("button").data("reservationId", reserve.reservationId);
			});
		}
	});
});

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/frames/menu.jsp" flush="false"/>
<div class="container" style="padding:2rem 0;"> <!-- 시작 -->
	<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
			<div class="btn-group btn-group-justified">
		  		<a href="/mypage/mypage1" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-user"></span><br>개인정보수정</a>
		  		<a href="/mypage" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-check"></span><br>예매확인/취소</a>
		  		<a href="/mypage/mypage3" class="btn btn-primary mypageBtn"><span class="glyphicon glyphicon-erase"></span><br>관람내역</a>
		  		<a href="/mypage/mypage4" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-remove-sign"></span><br>회원탈퇴</a>
			</div>
	
	<div class="page-header">
  		<h1>관람내역</h1>
	</div>
	
	<form action="#">
	<table class="table table-hover">
    <thead>
      <tr>
        <th>예매번호</th>
        <th>공연명</th>
        <th>장소</th>
        <th>예매일시</th>
        <th>후기작성</th>
      </tr>
    </thead>
    <tbody id="reserveList">

	</tbody>
  </table>
  </form>
	</div> <!-- row 끝 -->
	</div>
	
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">후기 작성</h3>
        </div>
        <div class="modal-body">
          <p><img src="../img/musical/chicago.gif" id="poster-img"/></p>
          <h3><뮤지컬> 시카고</h3>
          <div>
          <p style="font-size:1.5rem;">삼성전자 블루스퀘어 홀</p>
          <p style="font-size:1.5rem;">17.05.31</p>
          </div>
          <form action="#" class="clear">
          <div class="form-group">
          	<label for="message-text" class="form-control-label">평점:</label>
          	<input id="input-id" type="text" class="rating" data-size="xs" >
            <textarea class="form-control" rows="5" id="message-text"></textarea>
          </div>
        </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">등록</button>
        </div>
      </div>
    </div>
  </div>
</div> <!-- 끝 -->
 
<jsp:include page="/WEB-INF/views/frames/footer.jsp" flush="false"/>
</body>
</html>