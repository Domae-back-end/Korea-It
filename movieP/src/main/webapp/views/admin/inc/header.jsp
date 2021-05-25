

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<script type="text/javascript">
	$(document).ready(function() {

		$(".btn1").click(function() {
			const togo = $(this).val()
			alert("/admin/" + togo + "/main기능 메인으로 이동.")
			location.replace("/admin/" + togo + "/list");

		})
		$(".menugobtn").click(function() {
			const togo = $(this).val()
			alert("/admin/" + togo + "기능으로 이동.")
			location.replace("/admin/" + togo );

		})

	})
</script>




</head>
<body>


	<button  id="pageedit" value="pageedit/banner" type="button"
		class="btn btn-success menugobtn">홈페이지설정</button>


	<button  id="movietime" value="movietime/list" type="button"
		class="btn btn-success menugobtn">상영시간표관리</button>

	<button  id="qna" value="qna" type="button"
		class="btn btn-success menugobtn">고객문의처리</button>


	<button  id="sales" value="sales/main" type="button"
		class="btn btn-success menugobtn">매출/정산</button>

	<button  id="userinfo" value="userinfo" type="button"
		class="btn btn-success menugobtn">회원정보관리</button>


	<button  id="ticketcontrol" value="ticketcontrol"
		type="button" class="btn btn-success menugobtn">예매정보관리</button>

</body>
</html>