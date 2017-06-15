<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>마이페이지</title>
<meta charset="utf-8">
<jsp:include page="/WEB-INF/views/frames/mypageHeader.jsp" flush="false"/>
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
		  		<a href="/mypage/mypage1" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-user"></span><br>개인정보수정</a>
		  		<a href="/mypage" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-check"></span><br>예매확인/취소</a>
		  		<a href="/mypage/mypage3" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-erase"></span><br>관람내역</a>
		  		<a href="/mypage/mypage4" class="btn btn-primary mypageBtn"><span class="glyphicon glyphicon-remove-sign"></span><br>회원탈퇴</a>
			</div>
	
	<div class="page-header">
  		<h1>회원탈퇴</h1>
	</div>

	<form action="#">
	<div class="list-group">
  		<li class="list-group-item active">개선사항</li>
  		<li class="list-group-item">
  			<div class="radio">
  				<label><input type="radio" name="#">서비스 장애가 잦아서</label>
			</div>
			<div class="radio">
  				<label><input type="radio" name="#">이벤트 및 무료서비스 혜택이 적어서</label>
			</div>
			<div class="radio">
  				<label><input type="radio" name="#">불만 및 불편 사항에 대해 고객 응대가 나빠서</label>
			</div>
			<div class="radio">
  				<label><input type="radio" name="#">탈퇴 후 재가입을 위해</label>
			</div>
			<div class="radio">
  				<label><input type="radio" name="#">기타</label>
			</div>
  		</li>
  		<li class="list-group-item active">비밀번호 확인</li>
  		<li class="list-group-item">
  			<input type="password" name="#" class="form-control" placeholder="비밀번호를 입력해주세요." required/>
  		</li>
	</div>
	<div class="clearfix"></div>
	<div class="col-sm-4 col-sm-offset-4 text-center">
		<a href="#" class="btn btn-danger btn-block btn-lg" role="submit">탈 퇴</a>
	</div>
	</form>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/frames/footer.jsp" flush="false"/>
</body>
</html>