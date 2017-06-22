<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="/js/ticket/ticket.js"></script>
    <title>공연 예매</title>
    <style>
        html,
        body {
            overflow: hidden;
        }

        .container {
            width: 1000px;
            height: 600px;
            border: 0px dotted black;
        }

        .info-wrapper {
            height: 10%;
        }

        .info-panel {
            height: 100%;
            width: 100%;
            border: 0px dotted black;
            text-align: center;
        }

        .booking-wrapper {
            height: 90%;
            border: 0px dotted black;
           /*  padding: 2rem; */
        }

        .select-body {
            height: 100%;
            border: 0px dotted black;
            padding: 0px;
        }

        .control-body {
            height: 100%;
            border: 0px dotted black;
        }

        .control-panel {
            height: 85%;
            border: 0px dotted black;
        }

        .btn-panel {
            height: 15%;
            border: 0px dotted black;
            text-align: center;
        }

        iframe {
            background: white;
            border: none;
            /* Reset default border */
            height: 100%;
            /* Viewport-relative units */
            width: 100%;
            overflow: hidden;
        }

        .img-step {
            display: inline-block;
            /*Vertical Center Start*/
            position: relative;
            top: 50%;
            transform: translateY(-50%);
            /*Vertical Center End*/
            float: left;
            width: 20%;
            margin:0;
            padding:0;
        }
        
        .fir {
        	position: absolute;
        	z-index: 3;
        	left: 597px;
        }

        .customerInfo {
            padding-left: 2rem;
        }
    </style> 
    <script type="text/javascript">

    $(document).ready(function () {
		var email=$("#reserverEmail").val();
		
		$.ajax({
			url:"/mypage/getUser",
			data: {userEmail: email},
			success:function(user){
				userInfo(user);
			}
		});
	
		var userInfo=function(user){
			//이름
			var userName=user.userName;
			
			//생일
			var userBirthday=user.userBirthday;			
			
			//전화번호
			var phone=user.userPhone.toString();
			var phone1="0"+phone.substr(0,2);
			var phone2=phone.substr(2,4);
			var phone3=phone.substr(6,8);
			var phoneNumber = phone1+"-"+phone2+"-"+phone3;		
						
			$("#reserverName").val(userName);
			$("#reserverBirth").val(userBirthday);
			$("#reserverPhone").val(phoneNumber);
		};	
		
		$("#nextBtn").on("click", function(){
			forwardForm(5);
			return true;
		});	
		
	});

</script>
    
</head>

<body>
    <div class="container">
        <div class="row info-wrapper">
            <div class="col-sm-12" style="height:100%;">
                <div class="info-panel">
                    <img class="img-step fir" src="img/ticket/step_04_on.gif">
                    <img class="img-step" src="img/ticket/step_01_off.gif">
                    <img class="img-step" src="img/ticket/step_02_off.gif">
                    <img class="img-step" src="img/ticket/step_03_off.gif">
                    <img class="img-step" src="img/ticket/step_04_off.gif">
                    <img class="img-step" src="img/ticket/step_05_off.gif">
                </div>
            </div>
        </div>
        <div class="row booking-wrapper">
            <div class="col-sm-9 select-body">
                <div class="customerInfo">
                    <div class="seat-layout-wrapper">
                    
                    	<table class="table table-bordered">
                    		<thead>
                                <h4>예매자 확인</h4>                                
                            </thead>
                            <tbody>
                            	<tr>
                            		<th>이름</th>
                            			<td>
                            				<input type="text" class="form-control" id="reserverName" readonly="readonly"></input>
                            			</td>                            		
                            	</tr>     
                            	<tr>
                            		<th>이메일</th>
                            			<td>
                            				<input type="text" class="form-control" id="reserverEmail" value="${email }" readonly="readonly"/>
                            			</td>
                            	</tr>
                            	<tr>
                            		<th>생년월일</th>
                            			<td>
                            				<input type="text" class="form-control" id="reserverBirth" readonly="readonly"></input>
                            			</td>
                            	</tr>   
                            	<tr>
                            		<th>연락처</th>
                            			<td>
                            				<input type="text" class="form-control" id="reserverPhone" readonly="readonly"></input>
                            			</td>
                            	</tr>                     	
                            </tbody>                    	
                    	</table>
                        <p>SMS 문자와 이메일로 예매정보를 보내드립니다.</p>
                    </div>
                    <div class="col-sm-12" style="background-color:#e6e6e6">
                        <h5>유의 사항</h5>
                        <p>관람일 전일까지만 취소 가능합니다. 또한, 당일 예매 하시는 경우 취소가 불가능 합니다.</p>
                        <p>동일 상품 좌석 이동을 원하시는 경우에는 기존의 예매 건을 취소하시고 재예매해야합니다</p>
                        <p>이 경우 취소 시점에 따라 추가 취소 수수료가 부과 될 수있으니 이점 유의하시기 바랍니다.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-3 control-body">
                <div class="control-panel">
                    <iframe src="/ticket/panel" scrolling="no"></iframe>
                </div>
                <div class="btn-panel" style="margin-top:30px">
                    <div class="btn-group btn-group-justified">                    	
                    	<a class="btn btn-danger btn-before" id="beforeBtn"><i class="glyphicon glyphicon-chevron-left"></i>이전으로</a>
                        <a class="btn btn-info btn-next" id="nextBtn">다음으로<i class="glyphicon glyphicon-chevron-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>