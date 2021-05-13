<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<script>
	   $(document).ready(function () {
		   //   로그아웃 
		        
		        
		        $("#admin").click(function() {
		       	 
		       	 alert("관리자페이지 ㄱㄱ")
		       	location.replace("/admin");
		       })
		           
		        $("#movie").click(function() {
		       	 
		       	 alert("영화관메인페이지 ㄱㄱ.")
		       	location.replace("/movie");
		       })
	   })	</script>
<title>관리메인홈</title>
</head>
<body>
난바닥<br>
<button type="button" id="admin">어드민 페이지로</button><br>
<button type="button" id="movie">영화메인 페이지로</button>
</body>
</html>