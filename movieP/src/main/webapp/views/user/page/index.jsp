<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<c:url value="/resources/my_js/jquery-3.6.0.js"/>"></script>
<script src="<c:url value="/resources/my_js/jquery-ui.min.js"/>"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" href='<c:url value="/resources/css/index.css" />'>
<link rel="stylesheet" href='<c:url value="/resources/css/${PPPData.cate}/${PPPData.service}.css" />'>
<script src="<c:url value="/resources/js/${PPPData.cate}/${PPPData.service}.js" />" ></script>

<title>유저 메인 화면</title>
</head>
<body>

<div class="index_mainheader">
	<jsp:include page="inc/header.jsp" />
</div>

<div class="index_maincont">
	<jsp:include page="${PPPData.cate}/${PPPData.service}.jsp" />
</div>

<div class="index_mainfooter">
	<jsp:include page="inc/footer.jsp" />
</div>

</body>
</html>