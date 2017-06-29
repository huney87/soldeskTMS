<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    var initCalender = function( data ) {
        var eventData = [];
        for( i = 0 ; i < data.length ;){   
        	var skddate = {
        			"date": data[i].roundDate,
        			"time1": data[i].roundTime,
        			"time2": data[i+1].roundTime,
        			"roundId1": data[i].roundId,
        			"roundId2": data[i+1].roundId
        			};            	
            eventData.push(skddate);   
            i = i+2;
        }            
    	
        $('#show-calender').zabuto_calendar({
            language: "kr",
            data: eventData,
            action: function() {
            	clickCalender(this.id, eventData);
            },
        });
    }

    var clickCalender = function(id, eventData) {
        var date = $("#" + id).data("date");
        var time2 = eventData;
        var hasEvent = $("#" + id).data("hasEvent");
        if (hasEvent) {
            sessionStorage.setItem('ticketDate', date);
        }
        
        for(var i=0 ; i<time2.length ; i++){
        	if(time2[i].date == date){
       			$("#roundTime1").val(time2[i].time1);
       			$("#roundTime1").data("roundId",time2[i].roundId1);
           		$("#roundTime11").text(time2[i].time1);
           		
           		$("#roundTime2").val(time2[i].time2);
           		$("#roundTime2").data("roundId",time2[i].roundId2);
           		$("#roundTime22").text(time2[i].time2);
           		
           		sessionStorage.setItem('ticketTime1', time2[i].time1);
           		sessionStorage.setItem('ticketTime2', time2[i].time2);
           		sessionStorage.setItem('roundId1', time2[i].roundId1);
           		sessionStorage.setItem('roundId2', time2[i].roundId2);
           		
        	}
        }
        $('.btn1').show();
        $('.btn2').hide();
    }

    var initBtn = function() {
		$('[name="roundTimeBtn"]').on('click',function(){
			var time = $(this).val();
			var roundId = $(this).data('roundId');
			sessionStorage.setItem('ticketTime', time);
			sessionStorage.setItem('roundId', roundId);
		});
    }
    
	//	티켓 등급 및 가격
    var ticketGrade = function(){
    	var perId = ${perfInfo.per_id};
       	$.ajax({
            url: "/ticket/getPerSeatInfo",
            data:{
            	performanceID : perId
            },
            dataType: 'json',
            success:function(pif){
            	var pifSeatList = pif.seatList;
            	$.each(pifSeatList,function(){
                    var divHtml = '<p>'+this['grade']+'석&nbsp;:&nbsp;&nbsp;'+this['price'].toLocaleString()+'원</p>';
                    $('#ticketGrade').append(divHtml);
                });
       		}
       	});
    }

    $(document).ready(function() {
    	
    	//회차 선택 버튼 초기화 (날짜를 선택하세요.)
    	$('.btn1').hide();
    	
    	//공연 아이디
    	var perId = ${perfInfo.per_id};
    	
		//달력그리기
    	$.ajax({
            url: '/ticket/getskd',
            data : {
            	"performance_id" : perId
            },
            dataType: 'json',
            success : function(data) {
                initCalender(data);
            }
	    });           
        
        initBtn(); //회차 버튼
        ticketGrade();	//	티켓 등급 가격
    });
</script>		
	<!-- 공연들 -->
	<div class="container-fluid" id="categoryContent">
		<div class="container" id="container">
			<div class="row">
				<div class="col-xs-8">
					<div class="row">
						<h3>
						<c:choose>
							<c:when test="${perfInfo.ct_id eq 1}">뮤지컬</c:when>
							<c:when test="${perfInfo.ct_id eq 2}">콘서트</c:when>
							<c:when test="${perfInfo.ct_id eq 3}">연극</c:when>
						</c:choose> 
						<${perfInfo.per_title}></h3>
						<h5>
						<c:choose>
							<c:when test="${perfInfo.ct_id eq 1}">뮤지컬</c:when>
							<c:when test="${perfInfo.ct_id eq 2}">콘서트</c:when>
							<c:when test="${perfInfo.ct_id eq 3}">연극</c:when>
						</c:choose> 
						 | 140분 (인터미션 : 20분) | 중학생이상 관람</h5>
					</div>
			
					<div class="row">
						<div class="col-xs-4">
							<img src="/img/perf/${perfInfo.per_image}" onerror="ImgError(this)"/>
						</div>
						<div class="col-xs-8">
							<div class="col-xs-3 title">
								<p>장르</p>
								<p>장소</p>
								<p>기간</p>
								<p>관람등급</p>
								<p>관람시간</p>
								<p>가격정보</p>
							</div>
							<div class="col-xs-9">
								<p>
								<c:choose>
									<c:when test="${perfInfo.ct_id eq 1}">뮤지컬</c:when>
									<c:when test="${perfInfo.ct_id eq 2}">콘서트</c:when>
									<c:when test="${perfInfo.ct_id eq 3}">연극</c:when>
								</c:choose>
								</p>
								<p>${perfInfo.hall_name}</p>
								<p>${perfInfo.per_startDate} ~ ${perfInfo.per_endDate}</p>
								<p>만 13세이상</p>
								<p>140분 (인터미션 : 20분)</p>
								<p><div id="ticketGrade"></div></p>
								
							</div>
						</div>
					</div>
					<div class="row"> <!-- row 시작 -->
					<hr>
					 <!-- nav바 -->
				  		<ul class="nav nav-tabs">
				  			<li class="active"><a data-toggle="tab" href="#menu1">상세정보</a></li>
				    		<!-- <li><a data-toggle="tab" href="#menu2">출연진</a></li> -->
				    		<!-- <li><a data-toggle="tab" href="#menu3">관람후기</a></li> -->
				    		<li><a data-toggle="tab" href="#menu4">Q&A</a></li>
				    		<li><a data-toggle="tab" href="#menu5">예매유의사항</a></li>
				  		</ul>
				 	<!-- nav바 -->
				 	
				 	<div class="tab-content"> <!-- 탭 콘텐트 시작 -->
				 		<div id="menu1" class="tab-pane fade in active"> <!-- 메뉴1 -->
					  		<div class="panel panel-default">
					    		<div class="panel-heading">알립니다</div>
					    		<div class="panel-body">
					    		<p><img src="/img/perf/${perfInfo.per_image}"></p>
					    			<img src="../img/item/17004371/17004371_01.jpg">
					    		</div>
					    		<div class="panel-heading">작품설명</div>
					    		<div class="panel-body">
					    			<img src="../img/item/17004371/17004371-02.jpg">
					    		</div>
							</div>
					  	</div>
					  	<!-- <div id="menu2" class="tab-pane fade"> 메뉴2
					  		<div class = "well well-sm"><h3>출연진</h3>
							  		<p style="margin-top:20px">옥주현, 박은태, 박선우, 이상현, 김민수, 김나윤(김희원), 유리아, 김현진, 송영미.</p>
							</div>
					  	</div> -->
					  	<!-- <div id="menu3" class="tab-pane fade"> 메뉴3
					    	<div class="panel panel-default">
					    		<div class="panel-heading">공연 관람후기</div>
					    		<div class="panel-body">
					    			<p> 티켓 매매 및 양도의 글은 발견 즉시 임의 삭제되며 전화번호, 이메일 등의 개인정보는 악용될 우려가 있으므로 게시를 삼가 주시기 바랍니다.</p>
					    		</div>
					    		
					    		<ul class="list-group">
					  				<li class="list-group-item">
					  					<a href="#" data-toggle="modal" data-target="#myModal"><h3>매디슨 카운티의 다리</h3></a>
					  					<span class="more">
					  					첫 뮤지컬로 너무 좋았습니다.첫 뮤지컬로 너무 좋았습니다.첫 뮤지컬로 너무 좋았습니다.
					  					첫 뮤지컬로 너무 좋았습니다.첫 뮤지컬로 너무 좋았습니다.
					  					첫 뮤지컬로 너무 좋았습니다.첫 뮤지컬로 너무 좋았습니다.첫 뮤지컬로 너무 좋았습니다.
					  					첫 뮤지컬로 너무 좋았습니다.첫 뮤지컬로 너무 좋았습니다.첫 뮤지컬로 너무 좋았습니다.
					  					</span>
					  					<br>
					  					<small>예매자</small> | <small>날짜</small>
					  				</li>
								</ul>
								
								Modal
					  			<div class="modal fade mod-lg" id="myModal" role="dialog">
					    			<div class="modal-dialog">
					    
					      		Modal content
					      		<div class="modal-content">
					        		<div class="modal-header">
					          		<button type="button" class="close" data-dismiss="modal">&times;</button>
					          		<h3 class="modal-title">매디슨 카운티의 다리</h3>
					        	</div>
					        	<div class="modal-body">
					          		<p>첫 뮤지컬로 너무 좋았습니다.첫 뮤지컬로 너무 좋았습니다.첫 뮤지컬로 너무 좋았습니다.
					  					첫 뮤지컬로 너무 좋았습니다.첫 뮤지컬로 너무 좋았습니다.
					  					첫 뮤지컬로 너무 좋았습니다.첫 뮤지컬로 너무 좋았습니다.첫 뮤지컬로 너무 좋았습니다.
					  					첫 뮤지컬로 너무 좋았습니다.첫 뮤지컬로 너무 좋았습니다.첫 뮤지컬로 너무 좋았습니다.
					  				</p>
					        	</div>
					        	<div class="modal-footer">
					          		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					        	</div>
					      		</div> Modal content
					      		
					      			</div> 
					  			</div> Modal
					    	</div>
					  	</div> -->
					  	<div id="menu4" class="tab-pane fade"> <!-- 메뉴4 -->
					    	<table class="table table-hover">
					    		<thead>
					      			<tr>
					        			<th>글번호</th>
					        			<th>날짜</th>
					        			<th>제목</th>
					        			<th>작성자</th>
					        			<th>상태</th>
					      			</tr>
					    		</thead>
					    		<tbody>
					      			<tr class="question" data-prod-answer="1" style="cursor:pointer">
					        			<td>1</td>
					        			<td>2017/05/18</td>
					        			<td>환불 문의입니다</td>
					        			<td>왕예나</td>
					        			<td>답변완료</td>
					      			</tr>
					      			<tr id="answer1" class="answer">
					      				<td colspan="5">
					      				<div>
					      					<p>Q.환불 취소하고 싶은데요</p>
					      					<p>A.안녕하세요 고객님</p>
					      					<p>문의하신 공연 예매취소 되었습니다.</p>
					      					<p>확인 부탁드립니다. 감사합니다.</p>	
					      				</div>
					      				</td>
					      			</tr>
					      			<tr class="question" data-prod-answer="2" style="cursor:pointer">
					        			<td>2</td>
					        			<td>2017/05/25</td>
					        			<td>가정의 달 20% 할인 문의해요~</td>
					        			<td>왕예나</td>
					        			<td>미답변</td>
					      			</tr> 
					      			<tr id="answer2" class="answer">
					      				<td colspan="5">
					      				<div>
					      					<p>Q.가정의 달 20% 할인 문의 합니다.</p>
					      				</div>
					      				</td>
					      			</tr>
					    		</tbody>
					  		</table>
					  		<div class="col-sm-12 text-right">
					  			<button type="button" class="btn btn-success" data-toggle="modal" data-target="#question">질문하기</button>
					  		</div>
					  		<div id="question" class="modal fade" role="dialog">
						 		<div class="modal-dialog modal-lg">
							  		<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">문의 하기</h4>
										</div>
										<div class="modal-body">	
											<form action="#">
												<div class="form-inline"style="margin-bottom:30px">
													<input type="text" class="form-control" placeholder="작성자"/>
													<input type="text" class="form-control" placeholder="제목" style="width:50%"/>
													<input type="password" class="form-control" placeholder="비밀번호"/>
												</div>
												<div class="form-group">
													<label for="comment">답변:</label>
														<textarea class="form-control" rows="20" id="comment"></textarea>
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">등록</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
					  	</div>
					  	<div id="menu5" class="tab-pane fade"> <!-- 메뉴5 -->
					    	<div class = "well well-sm">티켓수령안내</div>
					    	<p><b>예약번호입장</b></p>
							<p>공연 당일 현장 교부처에서 예약번호 및 본인 확인 후 티켓을 수령하실 수 있습니다.</p>
							<p>상단 예매확인/취소 메뉴에서 예매내역을 프린트하여 가시면 편리합니다.</p>
							<p><b>티켓배송</b></p>
							<p>예매완료(결제익일) 기준 4~5일 이내에 배송됩니다. (주말, 공휴일을 제외한 영업일 기준)</p>
							<p>배송 중 전달 불가사항이 발생할 시에는 반송되며, 본인 수령 불가 시 경우에 따라 대리 수령도 가능합니다.</p>
							<p>공연 3일 전까지 티켓을 배송받지 못하신 경우 고객센터(1544-1555)로 연락 주시기 바랍니다.</p>
							<p>반송이 확인되지 않은 티켓은 현장에서도 수령하실 수 없으며, 공연 관람 및 환불이 불가합니다.</p>
					    	<div class = "well well-sm">예매취소 시 유의사항</div>
					    	<p>① 예매 후 7일까지 취소 시에는 취소수수료가 없습니다.</p>
							<p>② 관람일 기준은 아래와 같이 취소수수료가 적용됩니다.</p>
							<p>①번과 ②번 모두 해당되는 경우, ②번 기준이 우선 적용됩니다.</p>
							<p>~관람일 10일전까지 : 뮤지컬/콘서트/클래식 장당 4,000원, 연극/전시 등 장당 2,000원 (단, 최대 티켓금액의 10% 한도)</p>
							<p>관람일 9일전~관람일 7일전까지 : 티켓금액의 10%</p>
							<p>관람일 6일전~관람일 3일전까지 : 티켓금액의 20%</p>
							<p>관람일 2일전~관람일 1일전까지 : 티켓금액의 30%</p>
							<p>위 ② 번의 경우에도 예매 당일 밤 12시 이전 취소 시에는 취소수수료가 없습니다.</p>
							<p>(취소기간 내에 한함)
					    	<div class = "well well-sm">환불안내</div>
					    	<p>예매 취소 시에 환불 계좌번호를 남기고, 그 계좌를 통해 취소수수료를 제외한 금액을 환불 받습니다. 취소 후 고객님의 계좌로 입금까지 대략 5~7일 정도가 소요됩니다. (주말 제외)
							환불은 반드시 예매자 본인 명의의 계좌로만 받으실 수 있습니다.</p>
							<p>단, 예매자 본인 명의의 계좌가 없을 경우에는 직계 가족 명의의 계좌에 한하여 가능하며, 이 경우 관계를 증명할 수 있는 증빙서류를 예매자 본인이 팩스나 우편 등으로 인터파크 티켓 본사로 보내주셔야 합니다.
							(예매자 본인 외 가족이 증빙서류를 보내주셨을 경우, 이로 인해 문제 발생 시 환불 접수한 가족 본인에게 모든 책임이 있습니다.)</p>
					  	</div>
					</div>
				</div> <!-- 탭 콘텐트 끝 -->
			</div>
			<div class="col-xs-4">
				<div class="row">
					<div class="col-xs-12">
						<p><pre>랭킹 : 4위 </pre>
					</div>
				</div>
				<div class="row" id="sideMenu" data-spy="affix" data-offset-top="50">
					<div class="col-xs-12">
						<h4>예매가능 공연날짜</h4>
						<h5>${perfInfo.per_startDate} ~ ${perfInfo.per_endDate}</h5>
						<div id="show-calender"></div> <!-- 캘린더 -->
						<div class="btn-group btn-block"> <!-- 드롭다운 -->
							<button type="button" class="btn btn-default btn-block dropdown-toggle" data-toggle="dropdown">
				      			<span class="col-xs-10">
				      			 회차 선택
				       			</span> 
				       		    <span class="col-xs-2">
				            		<span class="caret"></span>
				        		</span>
				    		</button>
				    		<ul class="dropdown-menu btn-block" role="menu">
				    			<li class="dropdown-header btn1">회차를 선택해 주세요</li>
				    			<li class="dropdown-header btn2">먼저 날짜를 선택하세요</li>
				    			<li><a name="roundTimeBtn" id="roundTime1">&nbsp; &nbsp;<span id="roundTime11"></span></a></li>
				    			<li><a name="roundTimeBtn" id="roundTime2">&nbsp; &nbsp;<span id="roundTime22"></span></a></li>
				    		</ul>
				  		</div> <!-- 드롭다운 -->
				  			
				  		<div class="form-group"> <!-- 셀렉트 박스 -->
				  			<label for="sel">예매가능 좌석</label>
				  			<select multiple class="form-control" id="sel">
				    			<option>VIP석 30석</option>
				    			<option>S석 50석</option>
				    			<option>R석 80석</option>
				    			<option>A석 100석</option>
				  			</select>
						</div> <!-- 셀렉트 박스 -->
							<button class="btn btn-primary btn-block btn-lg" name="booking_popup" data-perf_id="${perfInfo.per_id}">예매하기</button>
							<input type="hidden" id="perf_id${perfInfo.per_id}" value="${perfInfo.per_id}">
						</div>
					</div>
				</div>
			</div> <!-- row 끝 -->
		</div>  <!-- 끝 -->
	</div>
