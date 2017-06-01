<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/zabuto_calendar.min.css">
    <script src="/js/zabuto_calendar.min.js"></script>
  
    <title>공연 예매</title>
    <style>
        html,
        body {
            overflow: hidden;
            background: #f1eeec;
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
        
        .text-center {
            text-align: center;
        }
        
        .selectDate {
            font-size: 1.5rem;
            height: 1.5rem;
            line-height: 1rem;
        }
    </style>
  
    <script type="application/javascript">
        var eventData = [{
            "date": "2017-05-17",
            "badge": false
        }, {
            "date": "2017-05-18",
            "badge": false
        }, {
            "date": "2017-05-19",
            "badge": false
        }, {
            "date": "2017-05-20",
            "badge": false
        }];

        var initCalender = function() {
            $('#show-calender').zabuto_calendar({
                language: "kr",
                data: eventData,
                action: function() {
                    clickCalender(this.id);
                },
            });
        }

        var clickCalender = function(id) {
            var date = $("#" + id).data("date");
            var hasEvent = $("#" + id).data("hasEvent");
            if (hasEvent) {
                $(".selectDate").text(date);
                sessionStorage.setItem('ticketDate', date);
            }
        }

        var initBtn = function() {
            $('.btn-next').click(function() {
                if (!sessionStorage.getItem('ticketDate')) {
                    alert("날짜를 선택해주세요.");
                    return false;
                } else {
                    return true;
                }
                
            });
        }
        /* 가상 폼 제작 참고용 소스
        $('#btn_add').click( function() { //추가

            var name = $.trim($("#usr").val());
            if(name){
                swal({
                    title: "회원 정보 추가",
                    text: name+"를 추가합니다.",
                    type: "info",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    showLoaderOnConfirm: true,
                },
                function(){
                    var $form = $('<form></form>');
                    $form.attr('action', 'useradd');
                    $form.attr('method', 'post');
                    $form.appendTo('body');

                    var usrname = $('<input type="hidden" value="'+ name +'" name="userName">');
                    var mode = $('<input type="hidden" value="add" name="mode">');

                    $form.append(usrname).append(mode);
                    $form.submit();
                });
            }else{
                sweetAlert("추가할 사용자 이름이 없습니다!","사용자를 이름을 입력하세요.","warning");
                $('#usr').focus();
                return false;
            }
        });*/

        $(document).ready(function() {
            initCalender();
            initBtn();
        });
       
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
                <div class="seat-layout-wrapper">
                    <div class="row">
                        <div class="col-sm-6">
                            <div id="show-calender"></div>
                        </div>
                        <div class="col-sm-2 text-center">
                            <h4>선택한 날짜</h4>
                            <div class='selectDate'><span>&nbsp; &nbsp;  -&nbsp; &nbsp; - &nbsp; &nbsp; </span></div>

                            <h4>시간 선택</h4>
                            <button type="button" class="btn btn-default btn-sm">15시 00분</button>
                            <button type="button" class="btn btn-default btn-sm">17시 00분</button>
                        </div>
                        <div class="col-sm-4">
                            <h5>좌석등급/ 잔여석</h5>
                            <ul>
                                <li> VIP 잔여좌석 30석</li>
                                <li> R 잔여좌석 50석</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-12" style="background-color:#e6e6e6">
                        <h5>유의 사항</h5>
                        <p>해당되는 날짜에만 선택하세요</p>
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
                    <button class="btn btn-info btn-block btn-next">다음으로 ></button>
                </div>
            </div>
        </div>

    </div>

</body>

</html>