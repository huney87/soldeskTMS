<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/frames/header.jsp" flush="false"/>

<title>티켓박스-회원가입</title>
<!-- 날짜 입력 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" /> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>

<link href="/css/menu.css" media="all" rel="stylesheet" type="text/css" />

<style>
#middle-menu {
	display: none;
}
</style>

<script>
$(document).ready(function() {	
        	
    //아이디 중복 확인
    $("#idOverLap").on("click", function(){
    	var userEmail = $("#str_email01").val() + "@" + $("#str_email02").val();
    	
    	console.log(userEmail);    	

    	$.ajax({
    	    url: "/user/checkUserEmail",
    	    data: {userEmail : userEmail},
    	    success : function(email) {
    	    	console.log(email.userEmail);  
    	    	if(email.userEmail) {
    	    		alert("중복 되어 있습니다.");
    	    		$("#str_email01").val("");
    	    		$("#str_email02").val("");
    	    	}
    	    	else alert("사용가능합니다.");    	     	    	       		    	       		
    	    },
    	    error: function(){
    	    	alert("확인해보세요.");
	        }
		});    	
    	
    });   

    var modal = $("#resultModal");  // 추가, 수정, 삭제 결과 창
    var msg = $("#msg");            // 결과 메세지
    // 회원가입 버튼 클릭
	$("#userAdd").on("click", function(){
		var userType = $(':radio[name="userTypeRadio"]:checked').val();	// 회원 가입 타입(판매자 - 1 , 사용자 - 2)
		var userEmail01 = $("#str_email01").val();	// 이메일 아이디
		var userEmail02 = $("#str_email02").val();	// 이메일 사이트
		var userEmail = userEmail01 + "@" + userEmail02;
		var userPw = $("#user_psw1").val();
		var userPwCheck = $("#user_psw2").val();
		var userName = $("#name").val();
		var userBirthday = $("#user_birthday").val();
		var userPost = $("#postNumber").val();
		var userAddressDt = $("#address2").val();	//회원 상세주소만
		var userAddress = $("#address1").val() + $("#address2").val();	// 회원 주소 + 상세주소 더한것
		var userPhone = $("#phone01").val() + $("#phone02").val() + $("#phone03").val();
				
		if(!userType){	//회원 가입 타입 미선택시 경고 창
			swal({
				  title: "회원유형을 선택하세요.",
				  type: "warning",
				  showCancelButton: false,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "확인",				  
			});			
			return false;
		}
		
		if(!userEmail01){	//이메일 아이디 미 입력시 경고창
			swal({
				  title: "이메일 아이디를 입력하세요.",
				  type: "warning",
				  showCancelButton: false,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "확인",				  
			});			
			return false;
		}
		
		if(!userEmail02){	//이메일 싸이트 미입력시 경고창
			swal({
				  title: "이메일 홈페이지를 입력하세요.",
				  type: "warning",
				  showCancelButton: false,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "확인",				  
			});			
			return false;
		}
		
		if(!userPw){	//비밀번호 미입력시 경고창
			swal({
				  title: "비밀번호를 입력하세요.",
				  type: "warning",
				  showCancelButton: false,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "확인",				  
			});			
			return false;
		}	
		
		if(!userPwCheck){	//비밀번호 확인 미입력시 경고창
			swal({
				  title: "비밀번호를 확인 하세요.",
				  type: "warning",
				  showCancelButton: false,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "확인",				  
			});			
			return false;
		}	
		
		if(!userName){	//회원 이름 미입력시 경고창
			swal({
				  title: "이름을 입력하세요.",
				  type: "warning",
				  showCancelButton: false,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "확인",				  
			});			
			return false;
		}
		
		if(!userBirthday){	//회원 생일 미입력시 경고창
			swal({
				  title: "생일을 입력하세요.",
				  type: "warning",
				  showCancelButton: false,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "확인",				  
			});			
			return false;
		}
		
		if(!userPost){	//회원 우편번호 미 입력시 경고창
			swal({
				  title: "우편번호를 입력하세요.",
				  type: "warning",
				  showCancelButton: false,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "확인",				  
			});			
			return false;
		}
		
		if(!userAddress2){	//회원 상세주소 미입력시 경고창
			swal({
				  title: "상세주소를 입력하세요.",
				  type: "warning",
				  showCancelButton: false,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "확인",				  
			});			
			return false;
		}
		
		if(!userPhone){	//	회원 휴대폰 번호 미입력시 경고창
			swal({
				  title: "휴대폰 번호를 입력하세요.",
				  type: "warning",
				  showCancelButton: false,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "확인",				  
			});			
			return false;
		}
		
		
		//회원가입 처리
		$.ajax({
            url: "/user/addUser",
            type:"post",
            data:{	// 메소드가 실행한 데이터를 넘겨준다!
            	// 도메인 컬럼 : 명시된 변수명
            	userType : userType,
            	userEmail : userEmail,
            	userPw : userPw,
            	userName : userName,
            	userBirthday : userBirthday,
            	userPost : userPost,
            	userAddress : userAddress,
            	userPhone : userPhone,            	
            	},  
            	success:function(result){
                    if(result) msg.text("추가 성공");
                    else msg.text("추가 실패");
                },
                error:function(a, b, errMsg){
                    msg.text("추가 실패: " + errMsg);                
                },
                complete:function(){
                	//$("#resultModal").modal('show');
                	alert("회원가입완료.");
                	window.location.assign("/");
                    //modal.modal('show');                	
                }        
        });		
	});	
});
</script>

<jsp:include page="/WEB-INF/views/frames/menu.jsp" flush="false"/>	

	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="page-header">
		    		<h1><span class="glyphicon glyphicon-user"></span> 회원가입</h1>      
		  		</div>
				<form class="form-horizontal" id="frmUserAdd">
					<div class="form-group">
						<div class="col-sm-offset-4">
							<div class="col-sm-4">
								<label class="radio-inline"><input type="radio" name="userTypeRadio" class="userType" value="2">일반 사용자</label>
							</div>
							<div class="col-sm-6">
								<label class="radio-inline"><input type="radio" name="userTypeRadio" class="userType" value="1">판매자</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="form-inline">
			  				<label class="control-label col-sm-2">이메일:</label>
			  				<input type="text" id="str_email01" name="str_email01" class="form-control" style="width:20%; margin-left:15px" required/>
							<label>@</label>	 
							<input type="text" id="str_email02" name="str_email02" class="form-control" value="" style="width:20%" required/>
							<select id="selectEmail" class="form-control">
				  				<option value="1" selected>직접입력</option>
				    			<option value="naver.com">naver.com</option>
				    			<option value="hanmail.net">hanmail.net</option>
				    			<option value="nate.com">nate.com</option>
				    			<option value="gmail.com">gmail.com</option>
				 			</select>
				 			<button type="button" id="idOverLap" class="btn btn-info">중복확인</button>
				 		</div>
			 		</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="psw">비밀번호:</label>
		 				<div class="col-sm-8"> 
							<input type="password" class="form-control" id="user_psw1" name="psw" placeholder="비밀번호" required>							
						</div>
					</div>
					<div class="form-group" id="check" style="display:none;">
						<div class="col-sm-12 text-center">
							<font name="check" color="red"></font>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="psw">비밀번호 확인:</label>
						<div class="col-sm-8"> 
							<input type="password" class="form-control" id="user_psw2" name="psw2" placeholder="비밀번호 확인" required>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="name">성명:</label>
						<div class="col-sm-8"> 
							<input type="text" class="form-control" id="name" name="name" placeholder="성명" required>
						</div>
					</div>
					<div class="form-group">
                        <label class="control-label col-sm-2">생일:</label>
                        <div class="col-sm-8"> 
                             <input type="date" class="form-control" id="user_birthday" required>
                        </div>					 					
		  			</div>
		  			
		  			<div class="form-inline" style="margin-bottom:1rem;">
                        <label class="control-label col-sm-2" for="postCode">우편번호:</label>					
						<input type="text" name="postCode" class="postcodify_postcode5 form-control" id="postNumber" value="" placeholder="우편번호 버튼을 누르세요." style="margin-left:7px" readonly/>
						<button type="button" id="postcodify_search_button" class="btn btn-info">우편번호찾기</button>
						<input type="text" id="address1" class="postcodify_address form-control" value="" style="margin-left:20px; width:32%" required readonly/>
					</div>
					<div class="form-group" id="inline">
						<label class="control-label col-sm-2">상세주소:</label>
						<div class="col-sm-8">
							<input type="text" id="address2" class="postcodify_details form-control" value="" placeholder="상세주소를 입력하세요." required/>
						</div>
						<!-- jQuery와 Postcodify를 로딩한다 -->
						<script src="http://d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				
						<!-- "우편번호찾기" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
						<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
					</div>
					<div class="form-inline">
		  				<label class="control-label col-sm-2">휴대폰:</label>
		  				<input type="number" id="phone01" class="form-control" min="0"	max="999" 	style="width:10%;margin-left:5px"/>&nbsp;-
		  				<input type="number" id="phone02" class="form-control" min="0"	max="999" 	style="width:15%"/>&nbsp;-
		  				<input type="number" id="phone03" class="form-control" min="0"	max="9999"	style="width:15%"/>
		  			</div>
	  			
			 		<div class="form-group" style="margin-top:50px"> 
						<div class="col-sm-offset-2 col-sm-8 text-right">
							<button type="button" class="btn btn-primary btn-lg" id="userAdd">회원가입</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		//이메일 입력방식 선택
		$('#selectEmail').change(function(){
			$("#selectEmail option:selected").each(function () {
     
 				if($(this).val()== '1'){ //직접입력일 경우
      				$("#str_email02").val('');                //값 초기화
      				$("#str_email02").attr("readonly",false); //활성화
 				}else{ //직접입력이 아닐경우
      				$("#str_email02").val($(this).text());    //선택값 입력
      				$("#str_email02").attr("readonly",true);  //비활성화
 				}
			});	
		});	
		
		//비밀번호 확인 - 보안코딩 기법 적용
		$(function(){			
			//비밀번호 조건 - 영어 대소문자 숫자 함께 사용, 6~14자리 까지
			var isValidPw = function(pw){
				var pattern = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,14}$/;
			    return pattern.test(pw);
			};
			
			// 비밀번호 조건확인 화면 출력
			$('#user_psw1').keyup(function(){
				$('#check').hide();
				$('font[name=check]').text('');
				var pw = $("input[name=psw]").val();
		        
			    if(isValidPw(pw)){
			    	$.ajax({
			        	method: "post",
			            data: {"pw":pw},
			            success: function(){
			            	$('#check').show();
							$('font[name=check]').html("사용 가능합니다.");
			            },
			            error: function(){
			            	$('#check').show();
							$('font[name=check]').html("Password가 잘못되었습니다. 영문, 숫자 혼용 6~14자만 입력하세요.");
			            }
			        });
			    }else{
			    	$('#check').show();
					$('font[name=check]').html("Password가 잘못되었습니다. 영문, 숫자 혼용  6~14자만 입력하세요.");
			    }
			});		
		
			/* 
			//$(function(){
			// 비밀번호 6~14 자리수 인지 화면 표시
				$('#user_psw1').keyup(function(){
					$('#check').hide();
					$('font[name=check]').text('');
					if(($('#user_psw1').val().length < 6 || $('#user_psw1').val().length > 14) && $('#user_psw1').val().length != 0) {
						$('#check').show();
						$('font[name=check]').html("Password가 잘못되었습니다.6~14자만 입력하세요.");			  
				}
			});				
			 */
			
			// 비밀번호 와 비밀번호 확인이 같은지 확인
			$('#user_psw2').keyup(function(){
				if($('#user_psw1').val().length != 0 || $('#user_psw2').val().length != 0){
					$('#check').show();
		 	  		if($('#user_psw1').val()!=$('#user_psw2').val()){
		 	  			
		 	   			$('font[name=check]').text('');
		 	   			$('font[name=check]').html("두 글자가 다릅니다.");
		 	  		}else{
		 	   			$('font[name=check]').text('');
		 	   			$('font[name=check]').html("암호 확인 되었습니다.");
		 	  		}
				}
	 	 	});
			 
			// 선언한 TextBox에 DateTimePicker 위젯을 적용한다. 
			$('#user_birthday').datetimepicker({
				language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다. 
				pickTime : false, // 사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션을 생략한다. 
				defalutDate : new Date() // 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다. 
			});
		});
	</script>
	
	<!-- 결과값 모달 -->
	<div class="modal fade" id="resultModal">
	     <div class="modal-dialog">
	       <div class="modal-content">
	         <div class="modal-header">
	           <button type="button" class="close" data-dismiss="modal">&times;</button>
	           <h4 class="modal-title" id="msg" style="color:black;"></h4>
	         </div>            
	         <div class="modal-footer">
	           <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	         </div>
	       </div>
	     </div>
	</div>
	
<jsp:include page="/WEB-INF/views/frames/footer.jsp" flush="false"/>


