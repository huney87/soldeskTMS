<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/frames/header.jsp" flush="false"/>
	
<title>티켓박스 상세페이지</title>
<link href="/css/menu.css" media="all" rel="stylesheet" type="text/css" />
<link href="/css/detail.css" media="all" rel="stylesheet" type="text/css" />
<script>
$(document).ready(function(){
$("#my-calendar").zabuto_calendar({
     	language: "kr",
	  	data: eventData,
        action: function(){
            return myDateFunction(this.id, false);
       	},
	 });
});
</script>

<jsp:include page="/WEB-INF/views/frames/menu.jsp" flush="false"/>

<jsp:include page="/WEB-INF/views/detail/detailContent.jsp" flush="false"/>

<jsp:include page="/WEB-INF/views/frames/footer.jsp" flush="false"/>
