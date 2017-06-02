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
					<h4>신규 회관 등록</h4>
					<table id="resistForm">
							<tr>
								<th>회관 이름</th><td><input type="text" id="centerName"></td>
							</tr>
							<tr>
								<th>지역 선택</th><td>
													<select id="locals" style="margin-right:3rem;">
                               						 	<option>선택</option>
														<option value="1">서울남부</option>
                                						<option value="2">서울북부</option>
														<option value="3">경기남부</option>
														<option value="4">경기북부</option>
                           							 </select>
												  </td>
							</tr>
							<tr>
								<th>주 소</th><td><button type="button" class="btn btn-md btn-default">검색</button></td>
							</tr>
							<tr>
								<th>우편 번호</th><td><input type="number" id="hallName"></td>
							</tr>
							<tr>
								<th>상세 주소</th><td><input type="text" id="hallName"></td>
							</tr>
							<tr>
								<th>전화 번호</th><td><input type="number" id="- 제외 번호입력"></td>
							</tr>																									
					</table>
					<button type="button" class="btn btn-md btn-default">등록</button>
				</div>
			</div>
        </div>
	</div>
</div>
</body>
</html>