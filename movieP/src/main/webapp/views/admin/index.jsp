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
* {
	padding: 0;
	margin: 0;
}

.main {
	text-align: center;
	width: 80%; height : 100%;
	margin: 0 auto;
	height: 100%;
}

.header {
	width: 80%;
	height: 100px;
	border: 1px dashed #ccc;
}

.container {
	width: 150%;
	height: 90%;
	margin: 0px;
	padding: 0px;
	display: flex;
}

.aside {
	display: inline-block;
	width: 150px;
	height: 900px;
	border: 1px solid;
}

.body {
	display: inline-block;
	width: 110%;
	height: 100%;
	border: 1px solid;
}

.footer {
	text-align: center;
	width: 80%;
	height: 100px;
	background: red;
}
</style>
</head>
<body>
	<div class="main">
		<div class="header"><jsp:include page="inc/header.jsp" />
		</div>

		<div class="container">

			<div class="aside"><jsp:include page="inc/submenu.jsp" /></div>

			<div class="body"><jsp:include page="page/${bodyurl }.jsp" /></div>


		</div>
		
		<div class="footer"><jsp:include page="inc/footer.jsp" /></div>


	</div>
</body>
</html>