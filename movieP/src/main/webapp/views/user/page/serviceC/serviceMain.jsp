<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 메인</title>
<style>
	*{
		padding: 0;
		margin: 0;
	}
	.main{
		text-align: center;
		width: 1000px;
		height: 100%;
		margin: 0 auto;
	}
	.header{
		width: 1000px;
		height: 100px;
	}
	.body{
		width: 1000px;
		height: 100%;
	}
	.footer{
		text-align: center;
		width: 1000px;
		height: 100px;
		background: red;
	}
</style>
</head>


<!-- 템플릿. jsp > 이안에서 include   -->
<body>
<div class="main">
	<div class="header"><jsp:include page="../../inc/header.jsp" /> </div>
	<div class="body"><jsp:include page="${bodyurl }.jsp" /> </div>
	<div class="footer"><jsp:include page="../../inc/footer.jsp" /> </div>
</div>
</body>
</html>