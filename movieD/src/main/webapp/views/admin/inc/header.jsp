

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".btn").click(function() {
			const togo = $(this).val()
			alert("/admin/" + togo + "/main기능 메인으로 이동.")
			location.replace("/admin/" + togo + "/main");

		})
		$(".btn1").click(function() {
			const togo = $(this).val()
			alert("/admin/" + togo + "/main기능 메인으로 이동.")
			location.replace("/admin/" + togo + "/list");
		})
	})
</script>




</head>
<body>


	<button  id="pagecontrol" value="pagecontrol" type="button"
		class="btn btn-success">홈페이지설정</button>


	<button  id="movietime" value="movietime" type="button"
		class="btn1 btn-success">상영시간표관리</button>


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