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

    <style>
        body{
        }
        .control-window{
            width: 215px;
            height: 452px;
        }
        #sub{
        	font-size: 0.7rem;
        }
        .img-wrapper{
            border: 1px solid black;
            margin-right: 2px;
        }
    </style>
</head>

<body>
    <script>
        $(document).ready(function(){
            var ticketDate = sessionStorage.getItem('ticketDate');
            var ticketCnt = sessionStorage.getItem('ticketCnt');        
            var totalPrice = sessionStorage.getItem('totalPrice');    
            $('#ticketCnt').text(ticketCnt);
            $('#ticketDate').text(ticketDate);
            $('#totalPrice').text(totalPrice);
        });

        /* 이미지 없을 경우 */
        function ImgError(source){
            source.src = "/img/noImg.png";
            source.onerror = "";
            return true;
        }
    </script>
    <div class="control-window">
        
        <table id="ticketInfo">
            <tr>
                <td rowspan="4">
                    <div class="img-wrapper">
                    <img src="http://lorempixel.com/g/100/150" style="width:100px; height:150px;" onerror="ImgError(this)">
                    </div>
                </td>
                <td id="sub">20주년 특별공연<br> <라이어 스페셜></td>
            </tr>
            <tr>  
                <td id="sub">2017.05.23~2017.07.30</td> 
            </tr> 
            <tr>  
                <td id="sub">동숭아트센터 동숭홀<br> 만 13세이상</td>
            </tr>
            <tr>
                <td id="sub">관람시간 110분</td>
            </tr>
        </table>
        <table class="table table-bordered">
            <thead>
                <h4>My 예매정보</h4>
            </thead>
            <tbody>
                <tr>
                    <th>일시</th>
                    <td id='ticketDate'></td>
                </tr>
                <tr>
                    <th>선택좌석</th>
                    <td id='ticketCnt'></td>
                </tr>
                <tr>
                    <th>티켓금액</th>
                    <td id='totalPrice'></td>
                </tr>
                <tr>
                    <th>취소기한</th>
                    <td>공연 하루 전까지</td>
                </tr>
            </tbody>
        </table>

    </div>

</body>
</html>