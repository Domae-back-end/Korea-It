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
<script src="<c:url value="/resources/my_js/jquery-3.6.0.js"/>"></script>

<title>관리자 메인 화면</title>
<style>
* {
	padding: 0;
	margin: 0;
}

.main {
	text-align: center;
	width: 60%;
	height: 100%;
	margin: 0 auto;
	height: 100%;
}

.adminheader {
	width: 104.3%;
	height: 100px;

}
/*  */



.containerr{width:80%;margin: 0 auto;border: 1px dashed red;}

.aside {
	display: inline-block;
	width: 150px;
	height: 900px;
	border: 1px solid;
}

.body {
	display: inline-block;
	width: 100%;
	height: 100%;
	border: 1px solid blue;
}

.footer {
	text-align: center;
	width: 80%;

	height: 100px;
	margin: 0 auto;
	background: white;
	border: 1px dashed black;
}
</style>
</head>
<body>
	<div class="main">
		<div class="adminheader"><jsp:include page="inc/header.jsp" />
		</div>

		<div class="containerr">

			<c:choose>
				<c:when test="${not empty submenu}">
					<div class="aside"><jsp:include page="inc/submenu.jsp" /></div>

				</c:when>

			</c:choose>


			<div class="body" style="
			<c:choose>
				<c:when test="${not empty submenu}">
					width:900px;

				</c:when>

			</c:choose>
			
			
			
			
			"><jsp:include page="page/${bodyurl }.jsp" /></div>

			<!--  page/   pageedit/banner .jsp 를 열어줘.  -->


		</div>

		<div class="footer"><jsp:include page="inc/footer.jsp" /></div>


	</div>
</body>
</html>