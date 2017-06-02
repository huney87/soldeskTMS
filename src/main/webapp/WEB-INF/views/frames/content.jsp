<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		               <a href="#" class="btn btn-default btn-lg">뮤지컬</a> 
	                   <a href="#" class="btn btn-default btn-lg">콘서트</a> 
	                   <a href="#" class="btn btn-default btn-lg">연극</a>
		            </div>
	            </div>
	        </div>
	    </div>
		
		<!-- 공연들 -->
		<div class="container" id="container">
			<div class="row">
				<div class="col-md-12 frameDiv">
					<div class="frame">
						<div class="frame1">
							<div class="card">
								<img src="./img/에어리언.jpg" onerror="ImgError(this)" />
							</div>
							<div class="card back">
								<img class="backPost" src="../img/에어리언.jpg" onerror="ImgError(this)" />
								<article id="movieInfo">
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<span class="glyphicon glyphicon-ok"></span><br><a href="./detail/01.html">상세정보</a>
										</div>
										<div class="moveInfoBtn2">
											<span class="glyphicon glyphicon-heart"></span><br><a name="booking_popup">예매하기</a>
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo2">
							<div style="float:left;width:35%">평점 4.5</div> 
							<div style="display:inline;width:65%">
								<input id="input-2" name="input-name" type="number" class="rating rating-loading" min=0 max=5 step=0.1 value=4.5 data-size="xs" data-show-clear="false" data-show-caption="false" data-rtl="false" data-readonly="true">
							</div>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 1
							</p>
							<div class="movieInfo3Txt">공연장</div>
						</div>
					</div>
					<div class="frame">
						<div class="frame1">
							<div class="card">
								<img src="./img/titanic.jpg" onerror="ImgError(this)" />
							</div>
							<div class="card back">
								<img class="backPost" src="../img/titanic.jpg" onerror="ImgError(this)">
								<article id="movieInfo">
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<span class="glyphicon glyphicon-ok"></span><br><a href="./detail/01.html">상세정보</a>
										</div>
										<div class="moveInfoBtn2">
											<span class="glyphicon glyphicon-heart"></span><br><a name="booking_popup">예매하기</a>
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo2">
							<div style="float:left;width:35%">평점 3.2</div> 
							<div style="display:inline;width:65%">
								<input id="input-2" name="input-name" type="number" class="rating rating-loading" min=0 max=5 step=0.1 value=3.2 data-size="xs" data-show-clear="false" data-show-caption="false" data-rtl="false" data-readonly="true">
							</div>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 2
							</p>
							<div class="movieInfo3Txt">공연장</div>
						</div>
					</div>
					<div class="frame">
						<div class="frame1">
							<div class="card">
								<img src="./img/titanic.jpg" onerror="ImgError(this)" />
							</div>
							<div class="card back">
								<img class="backPost" src="../img/titanic.jpg" onerror="ImgError(this)">
								<article id="movieInfo">
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<span class="glyphicon glyphicon-ok"></span><br><a href="./detail/01.html">상세정보</a>
										</div>
										<div class="moveInfoBtn2">
											<span class="glyphicon glyphicon-heart"></span><br><a name="booking_popup">예매하기</a>
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo2">
							2017.05.31 <span class="dDay">D-3</span>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 3
							</p>
							<div class="movieInfo3Txt">공연장</div>
						</div>
					</div>
					<div class="frame">
						<div class="frame1">
							<div class="card">
								<img src="./img/titanic.jpg" onerror="ImgError(this)" />
							</div>
							<div class="card back">
								<img class="backPost" src="../img/titanic.jpg" onerror="ImgError(this)">
								<article id="movieInfo">
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<span class="glyphicon glyphicon-ok"></span><br><a href="./detail/01.html">상세정보</a>
										</div>
										<div class="moveInfoBtn2">
											<span class="glyphicon glyphicon-heart"></span><br><a name="booking_popup">예매하기</a>
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo2">
							2017.05.30 <span class="dDay">D-1</span>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 4
							</p>
							<div class="movieInfo3Txt">공연장</div>
						</div>
					</div>
					<div class="frame">
						<div class="frame1">
							<div class="card">
								<img src="./img/titanic.jpg" onerror="ImgError(this)" />
							</div>
							<div class="card back">
								<img class="backPost" src="../img/titanic.jpg" onerror="ImgError(this)">
								<article id="movieInfo">
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<span class="glyphicon glyphicon-ok"></span><br><a href="./detail/01.html">상세정보</a>
										</div>
										<div class="moveInfoBtn2">
											<span class="glyphicon glyphicon-heart"></span><br><a name="booking_popup">예매하기</a>
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo2">
							<div style="float:left;width:35%">평점 4.7</div> 
							<div style="display:inline;width:65%">
								<input id="input-2" name="input-name" type="number" class="rating rating-loading" min=0 max=5 step=0.1 value=4.7 data-size="xs" data-show-clear="false" data-show-caption="false" data-rtl="false" data-readonly="true">
							</div>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 5
							</p>
							<div class="movieInfo3Txt">공연장</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>