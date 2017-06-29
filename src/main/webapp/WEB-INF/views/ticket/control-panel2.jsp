<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <style>
        .control-window{
            width: 210px;
            height: 452px;
            text-align: center;
            padding-left:10px;
            background-color:#fff;
        }
        #sub{
        	font-size: 0.7rem;
        }
        .img-wrapper{
            border: 1px solid black;
            margin-right: 2px;
        }
        #conTb {
        	margin-top: 3rem;
        }
        #conTb th {
            text-align: center;
            color:#fff;
			background-color:#337ab7;
			font-size: 1.4rem;
        }
        #conTb td {
            text-align: center;
			font-size: 1.4rem;
        }
    </style>

    <script>
        $(document).ready(function(){
            var ticketDate = sessionStorage.getItem('ticketDate');
            var ticketTime = sessionStorage.getItem('ticketTime');
            var ticketCnt = sessionStorage.getItem('ticketCnt');        
            var ticketPrice = sessionStorage.getItem('totalPrice');
            $("#ticketCnt").text(ticketCnt);
            $("#ticketDate").text(ticketDate);
            $("#ticketTime").text(ticketTime);
            if(ticketPrice) $("#ctotalPrice").text(ticketPrice+"원");
            
            if (sessionStorage.getItem('perId')) ;
        	else sessionStorage.setItem('perId',$('#a').val()); //세션에 공연 아이디 저장.
        	
        	var perId = $('#a').val();
            console.log(perId)
            $.ajax({
            	url:'/ticket/getPerformanceInfo',
            	type:'get',
            	data:{'perf_Id' : perId},
            	success:function(response){
            		var perInfo ='<tr>'
            		perInfo += '<td rowspan="4">';
            		perInfo += '<div class="img-wrapper">';
            		perInfo += '<img src="/img/perf/'+response.per_image+'" style="width:70px; height:100px;" onerror="ImgError(this)">';
            		perInfo += '</div>';
            		perInfo += '</td>';
            		perInfo += '<td id="sub">'+response.per_title+'</td>';
            		perInfo += '</tr>';
            		perInfo += '<tr>'  ;
            		perInfo += '<td id="sub">'+response.per_startDate+"~"+response.per_endDate+'</td>';
            		perInfo += '</tr>';
            		perInfo += '<tr>'; 
            		perInfo += '<td id="sub">'+response.hall_name+'/ 만 13세이상</td>';
            		perInfo += '</tr>';
            		perInfo += '<tr>';
            		perInfo += '<td id="sub">관람시간 110분</td>';
            		perInfo += '</tr>';
       				$("#ticketInfo").append(perInfo);
       				
       				sessionStorage.setItem("title",response.per_title);
       				sessionStorage.setItem("place",response.hall_name);
            	},
            	error:function(a, b, errMsg){
                     alert('공연정보실패' + errMsg);
                }
        	});	
        });

        /* 이미지 없을 경우 */
        function ImgError(source){
            source.src = "/img/noImg.png";
            source.onerror = "";
            return true;
        }
    </script>

    <div class="control-window">
        <input type="hidden" id="perfId" value="${perId }" />
        <table id="ticketInfo">
			<thead>
				<h4>My 예매정보</h4>
			</thead>
        </table>
        <table class="table table-bordered" id="conTb">
            <tbody>
                <tr>
                    <th>선택일</th>
                    <td id="ticketDate"></td>
                </tr>
                <tr>
                	<th>선택시간</th>
                    <td id="ticketTime"></td>
                </tr>
                <tr>
                    <th>선택좌석</th>
                    <td id="ticketCnt"></td>
                </tr>
                <tr>
                    <th>티켓금액</th>
                    <td id="ctotalPrice"></td>
                </tr>
                <tr>
                    <th>취소기한</th>
                    <td>공연 하루 전까지</td>
                </tr>
            </tbody>
        </table>

    </div>
