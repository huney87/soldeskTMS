<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<script type="text/javascript">
	$(document).ready(function(){
		sessionStorage.setItem('perId','');
		sessionStorage.setItem('title','');
		sessionStorage.setItem('place','');
		sessionStorage.setItem('ticketDate','');
	    sessionStorage.setItem('ticketTime','');
	    sessionStorage.setItem('ticketCnt','');
	    sessionStorage.setItem('bank','');
	    sessionStorage.setItem('totalPrice','');
		
		$(function() {
			$('#mainGenBtn1').trigger('click', {genid:1}, mainButtonClicked);
		});
		
		$('#mainGenBtn1').on('click', {genid:1}, mainButtonClicked);
	    $('#mainGenBtn2').on('click', {genid:2}, mainButtonClicked);
	    $('#mainGenBtn3').on('click', {genid:3}, mainButtonClicked);
	});
		
	function mainButtonClicked(e) {
		 
		var genList=$("#genList");
    	var genid = e.data.genid;
    	//location.href='/category?genid='+v;
    	 
       	$(".mainGenBtn button").removeClass("active");
       	$(this).addClass("active");
   	 
		$.post({
           	url:"/category/mainGenre",
           	method:"get",
           	dataType:'json',
           	data:{
           		gen_id:genid, 
           	},
			success:function(response){
           	 	genList.empty();
           		var genre = response.genreList;
 				$.each(genre,function(){
               		//printGener(genreList);
               		var title = this['per_title'];
               		title = title.substr(0,10);
               		var genDiv = '<div class="frame">'
				    genDiv += '<div class="frame1">';
				    genDiv += '<div class="card">';
				    //genDiv += '<img src="/img/noImg.png" onerror="ImgError(this)" />';
				    genDiv += '<img src="/img/perf/'+this['per_image']+'" onerror="ImgError(this)" />';
				    genDiv += '</div>';
			    	genDiv += '<div class="card back">';
			    	genDiv += '<img class="backPost" src="/img/perf/'+this['per_image']+'" onerror="ImgError(this)" />';
			    	genDiv += '<article id="movieInfo">';
			    	genDiv += '<div class="moveInfoBtn">';
			    	genDiv += '<div class="moveInfoBtn1">';
			    	genDiv += '<a href="/detail?perfId='+this['per_id']+'"><span class="glyphicon glyphicon-ok"></span><br>상세정보</a>';
			    	genDiv += '</div>';
			    	genDiv += '<div class="moveInfoBtn2">';
			    	genDiv += '<a name="booking_popup" data-perf_id="'+this['per_id']+'"><span class="glyphicon glyphicon-heart"></span><br>예매하기</a>';
			    	genDiv += '<input type="hidden" id="perf_id'+this['per_id']+'" value="'+this['per_id']+'">';
			    	genDiv += '</div>';
			    	genDiv += '</div>';
			    	genDiv += '</article>';
			    	genDiv += '</div>';
			    	genDiv += '</div>';
			    	genDiv += '<div class="movieInfo3">';
			    	genDiv += '<p><span class="age">12</span>'+title+'</p>';
			    	genDiv += '<div class="movieInfo3Txt">'+this['per_startDate']+'~'+this['per_endDate']+'</div>';
			    	genDiv += '<div class="movieInfo3Txt">'+this['hallName']+'</div>';
			    	genDiv += '</div>';
			    	genDiv += '</div>';
               		genList.append(genDiv);
 				});
 				
 				$("[name='booking_popup']").click(function(){                
 					var perf_id = $("#perf_id"+$(this).attr('data-perf_id')).val();
 					booking_popup(perf_id);
 				});
			},
			error:function(response){
				console.log(response);
			}
		});
    }
	</script>
	
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">

			<div class="item active">
				<img src="/img/main/carouselImg01.png" alt="image01" style="width: 100%;">
			</div>

			<div class="item">
				<img src="/img/main/carouselImg02.png" alt="image02" style="width: 100%;">
			</div>

			<div class="item">
				<img src="/img/main/carouselImg03.png" alt="image03" style="width: 100%;">
			</div>

		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	
	<div class="container-fluid" id="mainContent">
		<div class="container" style="padding:2rem 0;">
	        <div class="row">
	            <div class="col-md-8 col-md-offset-2">
		            <div class="btn-group btn-group-justified">
		               	<div class="btn-group mainGenBtn">
							<button type="button" class="btn btn-default btn-lg active" id="mainGenBtn1">뮤지컬</button>
						</div>
						<div class="btn-group mainGenBtn">
							<button type="button" class="btn btn-default btn-lg" id="mainGenBtn2">콘서트</button>
						</div>
						<div class="btn-group mainGenBtn"> 
							<button type="button" class="btn btn-default btn-lg" id="mainGenBtn3">연극</button>
						</div>
		            </div>
	            </div>
	        </div>
	    </div>
		
		<!-- 공연들 -->
		<div class="container" id="container">
			<div class="row">
				<div class="col-md-12 frameDiv" id="genList">
				</div>
			</div>
		</div><!-- //공연들 -->
	</div>