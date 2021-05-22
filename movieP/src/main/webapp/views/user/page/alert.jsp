<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경고창</title>
</head>
<body>

<script>

	alert("${data.msg}") 
	location.href = "${data.url}"
</script>
</body>
</html>