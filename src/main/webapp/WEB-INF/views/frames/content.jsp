<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
	<!-- 공연들 -->
	<div class="container-fluid" id="categoryContent">
		<div class="container" id="container">
			<c:forEach var="i" begin="1" end="20" step="5">
			<div class="row">
				<div class="col-md-12 frameDiv">
				<c:forEach var="j" begin="0" end="4" step="1">
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
											<a href="/detail"><span class="glyphicon glyphicon-ok"></span><br>상세정보</a>
										</div>
										<div class="moveInfoBtn2">
											<a name="booking_popup"><span class="glyphicon glyphicon-heart"></span><br>예매하기</a>
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
								<span class="age">12</span> 공연 ${i+j}
							</p>
							<div class="movieInfo3Txt">공연장</div>
						</div>
					</div>
				</c:forEach>					
				</div>
			</div>
			</c:forEach>
		</div>
	</div>