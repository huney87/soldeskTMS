<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/frames/header.jsp" flush="false"/>

<title>마이페이지</title>
<link href="/css/menu.css" media="all" rel="stylesheet" type="text/css" />
<link href="/css/mypage.css" media="all" rel="stylesheet" type="text/css" />
<!-- jQuery와 Postcodify를 로딩한다 -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<style>
#middle-menu {
	display: none;
}
</style>
<!-- "우편번호찾기" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
<script type="text/javascript">

$(function(){
	var userlist=$("#userlist");
	userlist.empty();
	
	var email=$("#email").val();
	
	$.ajax({
		url:"/mypage/getUser",
		data: {userEmail: email},
		success:function(user){
			userInfo(user);
			$("#postcodify_search_button").postcodifyPopUp(); 
		}
	});

	var userInfo=function(user){
		//생일
		var strArray=user.userBirthday.split('-');
		var year=strArray[0];
		var month=strArray[1];
		var day=strArray[2];
		//주소
		var address =  user.userAddress.split("/");
		var address1 = address[0];
		var address2 = address[1];
		
		//전화번호
		var phone=user.userPhone.toString();
		var phone1="0"+phone.substr(0,2);
		var phone2=phone.substr(2,4);
		var phone3=phone.substr(6,8);
		
		var list = '<tr><input type="hidden" id="id" name="#" class="form-control" value="'+user.userId+'" required/>'
				+'<th><label>아이디</label></th>'
        		+'<td><p>'+user.userEmail+'</p></td>'
      			+'</tr>'
      			+'<tr>'
        		+'<th><label for="pw">비밀번호</label></th>'
        		+'<td><input type="password" id="pw" name="#" class="form-control" value="'+user.userPw+'" required/>'
        		+'</td>'
      			+'</tr>'
      			+'<tr>'
        		+'<th><label for="name">이름</label></th>'
        		+'<td><input type="text" id="name" name="#" class="form-control" value="'+user.userName+'" required/></td>'
      			+'</tr>'
      			+'<tr>'
        		+'<th><label for="birth">생년월일</label></th>'
        		+'<td><input type="number" min="1900" id="birthYear" name="#" class="form-control" value="'+year+'" required/>년'
        		+'<input type="number" min="1" max="12" id="birthMon" name="#" class="form-control" value="'+month+'" required/>월'
        		+'<input type="number" min="1" max="31" id="birthDate" name="#" class="form-control" value="'+day+'" required/>일</td>'
      			+'</tr>'
      			+'<tr>'
        		+'<th>우편번호</th>'
        		+'<td><input type="text" name="postCode" class="postcodify_postcode5 form-control" value="'+user.userPost+'" placeholder="우편번호 버튼을 누르세요." readonly/>'
				+'<button type="button" id="postcodify_search_button" class="btn btn-default">우편번호찾기</button></td>'
		     	+'</tr>'
      			+'<tr>'
      			+'<th><label for="detailPost">상세주소</label></th>'
				+'<td>'
				+'<input type="text" name="address1" class="postcodify_address form-control" value="'+address1+'" style="width:80%;"required readonly/>'
				+'<input type="text" name="address2" class="postcodify_detail form-control" placeholder="상세주소를 입력하세요." value="'+address2+'" style="width:80%;"required/>'
				+'</td>'
      			+'</tr>'
      			+'<tr>'
        		+'<th><label for="phone">휴대폰 번호</label></th>'
        		+'<td><input type="number" id="phone1" name="#" class="form-control" value="'+phone1+'" required/>-'
        		+'<input type="number" name="#" id="phone2" class="form-control" value="'+phone2+'" required/>-'
        		+'<input type="number" name="#" id="phone3" class="form-control" value="'+phone3+'" required/></td>'
      			+'</tr>';
      			
      		$("#userlist").append(list);
	};
	
	$("#updUser").bind("click",function(){
		var pw = $("#pw").val();
		var name = $("#name").val();
		var birthDay = $("#birthYear").val()+"-"+$("#birthMon").val()+"-"+$("#birthDate").val();
		var postCode = $("[name='postCode']").val();
		var address =  $("[name='address1']").val()+"/"+$("[name='address2']").val();
		var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
		var id=$("#id").val();
		
		$.ajax({
			url: "/mypage/updUser",
			data:{
				userId : id,
				userPw : pw,
				userName : name,
				userBirthday : birthDay,
				userPost : postCode,
				userAddress : address,
				userPhone : phone,
			},
			success:function(result){
				if(result) return true;
				else swal("수정에 실패하였습니다");
			},
			error:function(a,b,errMsg){
				swal("수정 실패: ",errMsg);
			},
			complete:function(){
				swal({
					title: "수정 성공",
					text: "회원 정보를 수정했습니다",
					type: "success"
				},
				function(){
					window.location.reload();
				});
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
			  		<a href="/mypage/mypage1" class="btn btn-primary mypageBtn" id="getUser"><span class="glyphicon glyphicon-user"></span><br>개인정보수정</a>
			  		<a href="/mypage" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-check"></span><br>예매확인/취소</a>
			  		<a href="/mypage/mypage4" class="btn btn-default mypageBtn"><span class="glyphicon glyphicon-remove-sign"></span><br>회원탈퇴</a>
				</div>
				
				<div class="page-header">
			  		<h1>개인 정보 수정</h1>
				</div>
			
				<form class="form-inline" action="#">
				<input type="hidden" id="email" value="${email }" />
					<table class="table table-striped">
					    <tbody id="userlist">
					      
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