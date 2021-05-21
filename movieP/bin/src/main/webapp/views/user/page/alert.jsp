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
	alert("${data.msg}") // 블라블라!등록성공!
	location.href = "${data.url}"
</script>
</body>
</html>