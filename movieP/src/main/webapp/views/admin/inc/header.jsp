

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
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
	

	
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".btn").click(function() {
			const togo = $(this).val()
			alert("/admin/" + togo + "/main기능 메인으로 이동.")
			location.replace("/admin/" + togo + "/main");

		})

	})
</script>




</head>
<body>


	<button  id="pagecontrol" value="pagecontrol" type="button"
		class="btn btn-success">홈페이지설정</button>


	<button  id="movietime" value="movietime" type="button"
		class="btn btn-success">상영시간표관리</button>


	<button  id="qna" value="qna" type="button"
		class="btn btn-success">고객문의처리</button>


	<button  id="sales" value="sales" type="button"
		class="btn btn-success">매출/정산</button>

	<button  id="userinfo" value="userinfo" type="button"
		class="btn btn-success">회원정보관리</button>


	<button  id="ticketcontrol" value="ticketcontrol"
		type="button" class="btn btn-success">예매정보관리</button>

</body>
</html>