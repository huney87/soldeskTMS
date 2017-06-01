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
            padding: 2rem;
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
        }

        .customerInfo {
            padding-left: 2rem;
        }
    </style>
    <script type="text/javascript">
        function ImgError(source) {
            source.src = "/img/noImg.png";
            source.onerror = "";
            return true;
        }

        var initBtn = function () {
            $('.btn-before').click(function () {
                forwardForm(3);
                return true;
            });
            $('.btn-next').click(function () {
                /*if (!sessionStorage.getItem('ticketCnt')) {
                    alert("좌석을 선택해주세요.");
                    return false;
                } else {
                    forwardForm(3);
                    return true;
                }*/
            });
        }

        $(document).ready(function () {
            initBtn();
            //이메일 입력방식 선택
            $('#selectEmail').change(function () {
                $("#selectEmail option:selected").each(function () {
                    if ($(this).val() == '1') { //직접입력일 경우
                        $("#str_email02").val(''); //값 초기화
                        $("#str_email02").attr("readonly", false); //활성화
                    } else { //직접입력이 아닐경우
                        $("#str_email02").val($(this).text()); //선택값 입력
                        $("#str_email02").attr("readonly", true); //비활성화
                    }
                });
            });
        })
    </script>
</head>

<body>
    <div class="container">
        <div class="row info-wrapper">
            <div class="col-sm-12" style="height:100%;">
                <div class="info-panel">
                    <img class="img-step" src="img/ticket/step_01.gif">
                    <img class="img-step" src="img/ticket/step_02.gif">
                    <img class="img-step" src="img/ticket/step_03.gif">
                    <img class="img-step" src="img/ticket/step_04.gif">
                    <img class="img-step" src="img/ticket/step_05.gif">
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
                                    <td><input type="text" class="form-control" /></td>
                                </tr>
                                <tr>
                                    <th>생년월일</th>
                                    <td>
                                        <div class="form-group">
                                            <div class="col-sm-2">
                                                <input type="number" class="form-control" id="" placeholder="년">
                                            </div>
                                            <div class="col-sm-2">
                                                <input type="number" class="form-control" id="" placeholder="월">
                                            </div>
                                            <div class="col-sm-2">
                                                <input type="number" class="form-control" id="" placeholder="일">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <p style="color:red">생년월일을 정확히 입력해주세요. <br> 가입 시 입력하신 정보와 다를 경우, <br> 본인 확인이 되지 않아 예매가 불가합니다.
                        </p>
                        <table class="table table-bordered">
                            <tbody>
                                <tr>
                                    <th>연락처</th>
                                    <td>
                                        <div class="form-inline">
                                            <input type="number" class="form-control" style="width:10%" />&nbsp;-
                                            <input type="number" class="form-control" style="width:15%" />&nbsp;-
                                            <input type="number" class="form-control" style="width:15%" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>
                                        <div class="form-inline" id="inline">
                                            <input type="text" id="str_email01" name="str_email01" class="form-control" style="width:23%" required/>
                                            <label style="margin-left:15px">@</label>
                                            <input type="text" id="str_email02" name="str_email02" class="form-control" value="" style="margin-left:20px; width:23%"
                                                required/>
                                            <select id="selectEmail" class="form-control">
	  								<option value="1" selected>직접입력</option>
	    							<option value="naver.com">naver.com</option>
	    							<option value="hanmail.net">hanmail.net</option>
	    							<option value="nate.com">nate.com</option>
	    							<option value="gmail.com">gmail.com</option>
	 							</select>
                                        </div>
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
                <div class="btn-panel" style="margin-top:40px">
                    <div class="btn-group btn-group-justified">
                        <a class="btn btn-danger btn-before">< 이전으로</a>
                        <a class="btn btn-info btn-next">다음 으로 ></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>