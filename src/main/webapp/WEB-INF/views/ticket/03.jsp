<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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

        th {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        function ImgError(source) {
            source.src = "/img/noImg.png";
            source.onerror = "";
            return true;
        }
        var ticketCnt = sessionStorage.getItem('ticketCnt');

        var initTicketNum = function () {
            $('select').each(function () {
                for (var i = 0; i <= ticketCnt; i++) {
                    $(this).append('<option>' + i + '</option>');
                }
            });
        }

        var initSelectEvent = function () {
            $('select.tickets').change(function () {
                var totalNumber = 0;
                var totalPrice = 0;
                $('select.tickets').each(function () {
                    totalNumber += parseInt($(this).find('option:selected').text());
                    if (totalNumber > ticketCnt) {
                        $(this).find('option:selected').prop('selected', false);
                        alert("예매 인원수를 초과하였습니다.");
                        return false;
                    }
                    var number = parseInt($(this).find('option:selected').text());
                    var price = parseInt($(this).attr('value'));
                    var actualPrice = number * price;
                    totalPrice += actualPrice;
                });
                sessionStorage.setItem('totalPrice', totalPrice);
            });
        }

        var initBtn = function () {
            $('.btn-before').click(function () {
                forwardForm(2);
                return true;
            });
            $('.btn-next').click(function () {
                var totalNumber = 0;
                $('select.tickets').each(function () {
                    totalNumber += parseInt($(this).find('option:selected').text());
                });
                if (totalNumber == ticketCnt) {
                    forwardForm(4);
                    return true;
                } else {
                    alert('선택 좌석 갯수만큼 선택해주세요.');
                    return false;
                }
            });
        }

        // 도큐먼트 레디
        $(document).ready(function () {
            initTicketNum();
            initSelectEvent();
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
                    <h4>가격</h4>
                    <table class="table table-bordered">
                        <thead>
                            <h4></h4>
                        </thead>
                        <tbody>
                            <tr>
                                <th>기본가</th>
                                <td colspan="2">20000원</td>
                                <td>
                                    <select class="form-control tickets" value="20000">
                            </select>
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="4">조건 할인</th>
                                <td>학생할인(중, 고, 대학생 10%)</td>
                                <td>18000원</td>
                                <td>
                                    <select class="form-control tickets" value="18000">
                            </select>
                                </td>
                            </tr>
                            <tr>
                                <td>유공자 할인(15%)</td>
                                <td>15000원</td>
                                <td>
                                    <select class="form-control tickets" value="15000">
                            </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12" style="background-color:#e6e6e6">
                    <h5>유의 사항</h5>
                    <p>가격을 확인해주세요</p>
                    <p>관람일 전일까지만 취소 가능합니다. 또한, 당일 예매 하시는 경우 취소가 불가능 합니다.</p>
                    <p>동일 상품 좌석 이동을 원하시는 경우에는 기존의 예매 건을 취소하시고 재예매해야합니다</p>
                    <p>이 경우 취소 시점에 따라 추가 취소 수수료가 부과 될 수있으니 이점 유의하시기 바랍니다.</p>
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