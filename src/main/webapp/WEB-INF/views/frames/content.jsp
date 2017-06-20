<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
	<!-- 공연들 -->
	<div class="container-fluid" id="categoryContent">
		<div class="container" id="container">
			<%-- <c:forEach var="i" begin="1" end="20" step="5"> --%>
			<div class="row">
				<div class="col-md-12 frameDiv">
				<c:forEach var="j" begin="1" end="5" step="1">
					<div class="frame">
						<div class="frame1">
							<div class="card">
								<img src="/img/noImg.png" onerror="ImgError(this)" />
							</div>
							<div class="card back">
								<img class="backPost" src="/img/noImg.png" onerror="ImgError(this)" />
								<article id="movieInfo">
									<div class="moveInfoBtn">
										<div class="moveInfoBtn1">
											<a href="/detail"><span class="glyphicon glyphicon-ok"></span><br>상세정보</a>
										</div>
										<div class="moveInfoBtn2">
											<a name="booking_popup" data-perf_id="${j}"><span class="glyphicon glyphicon-heart"></span><br>예매하기</a>
											<input type="hidden" id="perf_id${j}" value="2">
										</div>
									</div>
								</article>
							</div>
						</div>
						<div class="movieInfo3">
							<p>
								<span class="age">12</span> 공연 ${j}
							</p>
							<div class="movieInfo3Txt">공연장</div>
						</div>
					</div>
				</c:forEach>					
				</div>
			</div>
			<%-- </c:forEach> --%>
		</div>
	</div>