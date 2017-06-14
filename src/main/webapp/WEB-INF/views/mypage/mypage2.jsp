<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="/css/mypage.css" media="all" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function ImgError(source){
    source.src = "../img/noImg.png";
    source.onerror = "";
    return true;
}
$(function() { 
	var reserveList=$("#reserveList");
	
	reserveList.empty();
	
	$.ajax({
		url:"/mypage/reservelist",
		success:function(reserves){
			$(reserves).each(function(idx, reserve){
				tr=$("<tr></tr>");
				td=$("<td><input type='radio' name='reservationId' value='"+reserve.reservationId+"'/>"
						+reserve.reservationId+"</td><td><a href='/detail'>"
						+reserve.perfTitle+"</a></td><td>"
						+reserve.hallName+"</td><td>"
						+reserve.reserveDate+"</td><td>"
						+"<button type='button' class='btn btn-danger' value='"+reserve.reservationId+"' onClick='deleteReserve(this)'>취소</button>");
				reserveList.append(tr.append(td));
			});
		}
	});
});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/frames/mypageMenu.jsp" flush="false"/>
	<div class="container" style="padding:2rem 0;">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="btn-group btn-group-justified">
			  		<a href="/mypage/mypage1" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-user"></span><br>개인정보수정</a>
			  		<a href="/mypage" class="btn btn-primary mypageBtn"><span class="glyphicon glyphicon-check"></span><br>예매확인/취소</a>
			  		<a href="/mypage/mypage3" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-erase"></span><br>관람내역</a>
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
					      <tr>
					        <td><p>A00001</p></td>
					        <td><a href="../detail/01.html">뮤지컬 <지킬 앤 하이드></a></td>
					        <td><p>블루스퀘어 삼성전자 홀</p></td>
					        <td><p>17.05.31</p></td>
					        <td>
					        	<a href="#" class="btn btn-danger" role="submit">취소</a>
					        </td>
					      </tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>	
	<jsp:include page="/WEB-INF/views/frames/footer.jsp" flush="false"/>
</body>
</html>