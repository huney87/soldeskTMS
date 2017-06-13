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
$(function() { $("#postcodify_search_button").postcodifyPopUp(); });
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/frames/mypageMenu.jsp" flush="false"/>
	<div class="container" style="padding:2rem 0;">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="btn-group btn-group-justified">
			  		<a href="../mypage/01.html" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-user"></span><br>개인정보수정</a>
			  		<a href="../mypage/02.html" class="btn btn-primary mypageBtn"><span class="glyphicon glyphicon-check"></span><br>예매확인/취소</a>
			  		<a href="../mypage/03.html" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-erase"></span><br>관람내역</a>
			  		<a href="../mypage/04.html" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-remove-sign"></span><br>회원탈퇴</a>
				</div>
				<div class="page-header">
			  		<h1>예매확인/취소</h1>
				</div>
				<form action="#">
					<table class="table table-hover">
						<thead>
					      <tr>
					        <th>예매번호</th>
					        <th>공연명</th>
					        <th>장소</th>
					        <th>날짜</th>
					        <th>예매일</th>
					        <th>예매취소</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <td><p>A00001</p></td>
					        <td><a href="../detail/01.html">뮤지컬 <지킬 앤 하이드></a></td>
					        <td><p>블루스퀘어 삼성전자 홀</p></td>
					        <td><p>17.05.31</p></td>
					        <td><p>17.05.17</p></td>
					        <td>
					        	<a href="#" class="btn btn-danger" role="submit">취소</a>
					        </td>
					      </tr>
					      <tr>
					        <td><p>A00002</p></td>
					        <td><a href="../detail/01.html">뮤지컬 <캣츠></a></td>
					        <td><p>국립극장 해오름극장</p></td>
					        <td><p>17.05.31</p></td>
					        <td><p>17.05.20</p></td>
					        <td>
					        	<a href="#" class="btn btn-danger" role="submit">취소</a>
					        </td>
					      </tr>
					      <tr>
					        <td><p>A00003</p></td>
					        <td><a href="../detail/01.html">뮤지컬 <매디슨 카운티의 다리></a></td>
					        <td><p>충무아트센터 대극장</p></td>
					        <td><p>17.06.25</p></td>
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