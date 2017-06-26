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
	$("#delUser").bind("click",function(){
		var pw=$("#pw").val();
		var email=$("#email").val();
		
		$.ajax({
			url:"/mypage/delUser",
			method:"post",
			data:{userEmail:email,userPw:pw},
			success:function(result){
				if(result==1) {
					swal({
						title: "회원 탈퇴",
						text: "탈퇴하셨습니다.",
						type: "success"
					},
					function(){
						location.replace("/login/logout");
					});
				}
				else swal({
					title: "탈퇴 실패", 
					text: "비밀번호를 정확하게 입력해 주세요",
					type: "error"
					},
					function(){
						location.replace("/login/logout");
					});
			},error:function(a,b,errMsg){
				swal("삭제 실패: "+errMsg);
			}
		});
	});
});
</script>
<jsp:include page="/WEB-INF/views/frames/menu.jsp" flush="false"/>
<div class="container" style="padding:2rem 0;">
	<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
			<div class="btn-group btn-group-justified">
		  		<a href="/mypage/mypage1" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-user"></span><br>개인정보수정</a>
		  		<a href="/mypage" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-check"></span><br>예매확인/취소</a>
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
  		<li class="list-group-item active">비밀번호 확인
  		<li class="list-group-item">
  			<input type="password" id="pw" class="form-control" placeholder="비밀번호를 입력해주세요." required/>
  			<input type="hidden" id="email" value="${email }" />
  		</li>
	</div>
	<div class="clearfix"></div>
	<div class="col-sm-4 col-sm-offset-4 text-center">
		<button class="btn btn-danger btn-block btn-lg" id="delUser">탈 퇴</button>
	</div>
	</form>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/frames/footer.jsp" flush="false"/>