<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>마이페이지</title>
<jsp:include page="/WEB-INF/views/frames/header.jsp" flush="false"/>
<link href="/css/menu.css" media="all" rel="stylesheet" type="text/css" />
<link href="/css/mypage.css" media="all" rel="stylesheet" type="text/css" />
<style>
#middle-menu {
	display: none;
}
</style>
<script type="text/javascript">
$(function(){
	$("#udpUser").bind("click",function(){
		var pw = $("#pw").val();
		var name = $("#name").val();
		var birthDay = $("#birthYear").val()+"-"+$("#birthMon").val()+"-"+$("#birthDate").val();
		var postCode = $("[name='postCode']").val();
		var address =  $("[name='address']").val();+" "+("#datailPost").val();
		var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
		
		$.ajax({
			url: "/mypage1/udpUser",
			data:{
				userPw : pw,
				userName : name,
				userBirthday : birthDay,
				userPost : postCode,
				userAddress : address,
				userPhone : phone,
			},
			success:function(result){
				if(result) msg.text("수정 완료");
				else msg.text("수정 실패");
			},
			error:function(a,b,errMsg){
				msg.text("수정 실패"+errMsg);
			},
			complete:function(){
				alert("수정이 완료되었습니다.");
			}
		});
	});
});
</script>

<!-- jQuery와 Postcodify를 로딩한다 -->
<script src="http://d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<!-- "우편번호찾기" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/frames/menu.jsp" flush="false"/>
	<div class="container" style="padding:2rem 0;">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="btn-group btn-group-justified">
			  		<a href="/mypage/mypage1" class="btn btn-primary mypageBtn"><span class="glyphicon glyphicon-user"></span><br>개인정보수정</a>
			  		<a href="/mypage" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-check"></span><br>예매확인/취소</a>
			  		<a href="/mypage/mypage3" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-erase"></span><br>관람내역</a>
			  		<a href="/mypage/mypage4" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-remove-sign"></span><br>회원탈퇴</a>
				</div>
				
				<div class="page-header">
			  		<h1>개인 정보 수정</h1>
				</div>
			
				<form class="form-inline">
					<table class="table table-striped">
					    <tbody>
					      <tr>
					        <th><label>아이디</label></th>
					        <td><p>soldesk</p></td>
					      </tr>
					      <tr>
					        <th><label for="pw">비밀번호</label></th>
					        <td><input type="password" id="pw" name="#" class="form-control" required/>
					        <button type="submit" class="btn btn-default">비밀번호 변경</button>
					        </td>
					      </tr>
					      <tr>
					        <th><label for="name">이름</label></th>
					        <td><input type="text" id="name" name="#" class="form-control" required/></td>
					      </tr>
					      <tr>
					        <th><label for="birth">생년월일</label></th>
					        <td><input type="number" min="1900" id="birthYear" name="#" class="form-control" required/>년
					        <input type="number" min="1" max="12" id="birthMon"name="#" class="form-control" required/>월
					        <input type="number" min="1" max="31" id="birthDate"name="#" class="form-control" required/>일</td>
					      </tr>
					      <tr>
					        <th>주소</th>
					        <td><input type="text" name="postCode" class="postcodify_postcode5 form-control" value="" placeholder="우편번호 버튼을 누르세요." readonly/>
							<input type="text" name="address1" class="postcodify_address form-control" value="" required readonly/>
							<button type="button" id="postcodify_search_button" class="btn btn-default">우편번호찾기</button></td>
							
					      </tr>
					      <tr>
					      	<th><label for="detailPost">상세주소</label></th>
							<td>
								<input type="text" id="detailPost" name="#" class="postcodify_details form-control" value="" placeholder="상세주소를 입력하세요." style="width:80%;"required />
							</td>
					      </tr>
					      <tr>
					        <th><label for="phone">휴대폰 번호</label></th>
					        <td><input type="number" id="phone1" name="#" class="form-control" required/>-
					        <input type="number" name="#" id="phone2" class="form-control" required/>-
					        <input type="number" name="#" id="phone3" class="form-control" required/></td>
					      </tr>
					  </tbody>
				  </table>
				  <div class="clearfix"></div>
				  <div class="row">
					  <div class="col-sm-3 col-sm-offset-3 text-center">
						  <a class="btn btn-danger btn-block btn-lg" id="cancel" role="submit"> 취 소 </a>
					  </div>
					  <div class="col-sm-3 text-center">
						  <a class="btn btn-primary btn-block btn-lg" id="updUser" role="submit"> 수 정 </a>
					  </div>
				  </div>
			  </form>
		  </div>
	  </div>
	</div>	
	<jsp:include page="/WEB-INF/views/frames/footer.jsp" flush="false"/>
</body>
</html>