

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

	<script>
	   $(document).ready(function () { 
		        $("#admin").click(function() {		       	 
		       	 alert("관리자페이지 ㄱㄱ")
		       	location.replace("/admin");
		       })		           
		        $("#user").click(function() {		       	 
		       	 alert("영화관메인페이지 ㄱㄱ.")
		       	location.replace("/user/main");
		       })
	   })	</script>


</head>
<body>
    <div class="d-flex flex-column flex-md-row align-items-center px-20 px-md-10 mb-6 bg-white border-bottom box-shadow">
     
      <nav class="mx-auto">
	


<button type="button" id="admin" class="btn-dark" style="display:inline;margin-left:30px;">어드민 페이지로</button>
<button type="button" id="user" class="btn-dark" style="display:inline;margin-left:30px;">영화메인 페이지로</button>
	
	<button  id="pageedit" value="pageedit/banner" type="button"
		class="btn btn-success menugobtn">홈페이지설정</button>


	<button  id="movietime" value="movietime/list" type="button"
		class="btn btn-success menugobtn">상영시간표관리</button>

	<button  id="persqna" value="persqna/persqnanew" type="button"
		class="btn btn-success menugobtn">고객문의처리</button>


	<button  id="sales" value="sales/main" type="button"
		class="btn btn-success menugobtn">매출/정산</button>
<!-- 
	<button  id="userinfo" value="userinfo" type="button"
		class="btn btn-success menugobtn">회원정보관리</button>

 -->
	<!-- <button  id="ticketadmin" value="ticketadmin/tclist"
		type="button" class="btn btn-success menugobtn">예매정보관리</button> -->
      
      </nav>
     
      <a class="btn btn-outline-primary" href="/adminlogout">로그아웃</a>
     
     
    </div>


</body>
</html>