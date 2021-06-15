<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<c:url value="/resources/my_js/jquery-3.6.0.js"/>"></script>
<jsp:useBean id="currTime" class="java.util.Date" />

<title><fmt:formatDate value="${currTime}" pattern="" />관리자 메인 화면</title>

<style>
	* {
		padding: 0;
		margin: 0;
	}
	
	.adminheader {
		width: 1000px;
		height: 37px;
		border-left: 1px solid  #aaa;
		border-right: 1px solid  #aaa;
		/* box-shadow: 1px 0 0 0 #aaa inset;  */
		border: 1px solid black; box-sizing: border-box;
	}
	.main {
		text-align: center;	width: 1000px;	/* height: 100%; */	margin: 0 auto;	/* height: 900px; */
		/* box-shadow: 1px 0 0 0 #aaa inset;  */
		border: 1px solid black; box-sizing: border-box;
	}
	
	.containerr {
		width: 1000px;
		/* height: 90%; */
		margin: 0px;
		padding: 0px;
		display: flex;
		/* border: 2px dashed #ddd; */
	}
	
	.aside {
		background:#eee;
		display: inline-block;
		width: 150px;
		/* height: 100%; */
		/* border: 5px solid blue; */
		/* box-shadow: 1px 0 0 0 #aaa inset;  */
		border: 1px solid black; box-sizing: border-box;
	}
	
	.body {
		width: 1030px;		/* height: 100%; */		display: inline-block; /* 		border: 1px solid red; */
		/* box-shadow: 1px 0 1px 1px #aaa inset;  */	
		border: 1px solid black; box-sizing: border-box;	
	}
	
	/*adminheader> div>  nav 속 button들있고, 또는 a 태그가 있음.  */
	.adminheader div nav{
		width:906px;display:flex;justify-content:space-between;
	}
	.adminheader div nav button{
		width:170px;
	}
	
	
</style>
</head>



<body>
	<div class="main">
		<div class="adminheader">
			<jsp:include page="inc/header.jsp" />
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
			">
				<jsp:include page="page/${bodyurl }.jsp" />
			</div>
		</div>
	</div>
</body>
</html>