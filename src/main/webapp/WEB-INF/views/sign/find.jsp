<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/views/frames/header.jsp" flush="false"/>

<title>아이디/비밀번호 찾기</title>
<link href="/css/menu.css" media="all" rel="stylesheet" type="text/css" />
<link href="/css/mypage.css" media="all" rel="stylesheet" type="text/css" />
<style>
#middle-menu {
	display: none;
}
</style>
<script type="text/javascript">
$(function(){
	$("#findId").hide();
	$("#findPw").hide();
	$("#lostId").show();
	$("#lostPw").show();
	
	$("#searchId").bind("click",function(){
		var name=$("#name").val();
		var phone=$("#phone1").val()+$("#phone2").val()+$("#phone3").val();
		
		if(name==null||name.length==0){
			swal("실패","이름을 입력해 주세요", "error");
		}else if(phone==null||phone.length==0){
			swal("실패","휴대폰 번호를 입력해 주세요", "error");
		}else{
			phone = phone.replace(phone.substring(0,1),'');
			phone=Number(phone);
			$.ajax({
				url:"/user/findId",
				data:{userName:name, userPhone:phone},
				success:function(email){
					if(email==null||email.length==0){
						swal({
							title: "실패",
							text: "해당 회원은 존재하지 않습니다",
							type: "error"
						},
						function(){
							window.location.reload();
						});
					}else{
						$("#uid").text(name+" 회원님의 아이디는 "+email+" 입니다.");
						$("#findId").toggle();
						$("#lostId").toggle();
						$("#lostPw").toggle();
					}
				}
			});
		}
	});
	
	$("#searchPw").bind("click",function(){
		var id=$("#id").val();
		var name=$("#name2").val();
		var phone=$("#phone4").val()+$("#phone5").val()+$("#phone6").val();
		
		if(id==null||id.length==0){
			swal("실패","아이디를 입력해 주세요", "error");
		}else if(name==null||name.length==0){
			swal("실패","이름을 입력해 주세요", "error");
		}else if(phone==null||phone.length==0){
			swal("실패","휴대폰 번호를 입력해 주세요", "error");
		}else{
			phone = phone.replace(phone.substring(0,1),'');
			phone=Number(phone);
			$.ajax({
				url:"/user/findPw",
				data:{userEmail:id, userName:name, userPhone:phone},
				success:function(pw){
					if(pw==null||pw.length==0){
						swal({
							title: "실패",
							text: "해당 회원은 존재하지 않습니다",
							type: "error"
						},
						function(){
							window.location.reload();
						});
					}else{
						$("#upw").text(name+" 회원님의 비밀번호는 "+pw+" 입니다.");
						$("#findPw").toggle();
						$("#lostId").toggle();
						$("#lostPw").toggle();
					}
				}
			});
		}
	});
	
	$("#back").bind("click",function(){
		location.replace("/user/find");
	});
	
	$(".login").bind("click",function(){
		location.replace("/");
	});
});
</script>
<jsp:include page="/WEB-INF/views/frames/menu.jsp" flush="false"/>

<div class="container" style="margin-top:50px">
	<div class="row">
		<div class="col-sm-6 text-center" id="lostId">
		<h2 class="text-left">아이디 찾기</h2>
			<form class="form-horizontal">
  				<div class="form-group">
    			<label class="control-label col-sm-3" for="name">이름:</label>
    				<div class="col-sm-9">
      					<input type="text" class="form-control" id="name" placeholder="이름">
   					 </div>
  				</div>
  				<div class="form-inline">
  					<label class="control-label col-sm-3" for="phone1">휴대폰:</label>
  					<input type="text" class="form-control" id="phone1" style="width:23%"/>&nbsp;-
  					<input type="text" class="form-control" id="phone2" style="width:23%"/>&nbsp;-
  					<input type="text" class="form-control" id="phone3" style="width:23%"/>
  				</div>
  				<button type="button" class="btn btn-default" id="searchId" style="margin-top:50px">아이디 찾기</button>
  			</form>
 			</div>
 			
 			<div id="findId">
				<div class="panel panel-success">
      			<div class="panel-heading"><h3>아이디</h3></div>
      			<div class="panel-body"><p id="uid"></p></div>
      			<div class="col-sm-4 col-sm-offset-4 text-center">
      				<button class="btn btn-primary btn-lg login" style="margin: 1rem">로그인</button>
      				<button class="btn btn-default btn-lg" id="back" style="margin: 1rem">비밀번호 찾기</button>
      			</div>
    			</div>
			</div>
	
 			<div class="col-sm-6 text-center" id="lostPw">
 			<h2 class="text-left">비밀번호 찾기</h2>
  			<form class="form-horizontal">
  			<div class="form-group">
    			<label class="control-label col-sm-2">아이디:</label>
    				<div class="col-sm-10">
      					<input type="text" class="form-control" id="id" placeholder="아이디">
   					 </div>
  				</div>
  				<div class="form-group">
    				<label class="control-label col-sm-2">이름:</label>
    				<div class="col-sm-10"> 
     					<input type="text" class="form-control" id="name2" placeholder="이름">
   					</div>
  				</div>
  				<div class="form-inline">
  					<label class="control-label col-sm-2" style="width:18%">휴대폰:</label>
  					<input type="text" class="form-control" id="phone4" style="width:25%"/>&nbsp;-
  					<input type="text" class="form-control" id="phone5" style="width:25%"/>&nbsp;-
  					<input type="text" class="form-control" id="phone6" style="width:25%"/>
  				</div>
  				<button type="button" class="btn btn-default" id="searchPw" style="margin-top:50px">비밀번호 찾기</button>
  			</form>
		</div>
		
		<div id="findPw">
			<div class="panel panel-success">
      			<div class="panel-heading"><h3>비밀번호</h3></div>
      			<div class="panel-body"><p id="upw"></p></div>
      			<div class="col-sm-4 col-sm-offset-4 text-center">
      				<button class="btn btn-primary btn-lg login" style="margin: 1rem">로그인</button>
      			</div>
    		</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/frames/footer.jsp" flush="false"/>