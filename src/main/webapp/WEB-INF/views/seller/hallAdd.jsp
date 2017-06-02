<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
#resistForm{
	border: 0.1rem solid #4d4dff;
	margin: 1rem;
	padding: 1rem;
	text-align: center;
}
#resistForm th{
	color:white;
	padding: 1.5rem;
	border: 0.1rem solid #4d4dff;
}
#resistForm td{
	color:black;
	padding: 1.5rem;
	border: 0.1rem solid #4d4dff;
}
#resistArea{
	background-color: #1a1a1a;
	width: 40rem;
	height: auto;
	margin: 5rem;
	padding: 2rem;
}
</style>
</head>
<body>
<div class="container-fluid">
    <div class="row content">
        <!--사이드 네비바-->
        <div class="col-sm-2 sidenav">
            <jsp:include page="sellerNav.jsp"/>
        </div>
        <div class="col-sm-10">
        	<jsp:include page="hallNav.jsp"/>
        	<div class="col-sm-12" align="center">
				<div class="container" id="resistArea" align="center">
					<h4>신규 공연장 등록</h4>
					<table id="resistForm">
							<tr>
								<th>공연장 이름</th><td><input type="text" id="hallName"></td>
							</tr>
							<tr>
								<th>회관 선택</th><td>
													<span>
														<input type="text" id="centerName">
														<a href="" class="btn btn-sm btn-default" id="getCenter">검색</a>
														<input type="text" id="result" placeholder="검색결과" readonly>
													</span>
												</td>
							</tr>
							<tr>
								<th>가로열 크기</th><td><input type="number" id="hallRow" placeholder="max 18"></td>
							</tr>
							<tr>
								<th>세로열 크기</th><td><input type="number" id="hallCol" placeholder="max 18"></td>
							</tr>																								
					</table>
					<button type="button" class="btn btn-md btn-default">등록</button>
				</div>
			</div>
        </div>
	</div>
</div>
<!-- 결과값 모달 -->
<div class="modal fade" id="resultModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="msg"></h4>
      </div>            
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>