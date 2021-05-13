<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<title>관리자 메인 화면</title>
<style>
	*{
		padding: 0;
		margin: 0;
	}
	.main{
		text-align: center;
		width: 1400px;
		height: 100%;
		margin: 0 auto;
	}
	.header{
		width: 1400px;
		height: 100px;
	}
	.body{
		width: 1400px;
		height: 100%;
	}
	.footer{
		text-align: center;
		width: 1400px;
		height: 100px;
		background: red;
	}
</style>
</head>
<body>
<div class="main">
	<div class="header"><jsp:include page="inc/header.jsp" /> </div>
	
	<div class="body"><jsp:include page="page/${bodyurl }.jsp" /> </div>
	
	<div class="footer"><jsp:include page="inc/footer.jsp" /> </div>
</div>
</body>
</html>