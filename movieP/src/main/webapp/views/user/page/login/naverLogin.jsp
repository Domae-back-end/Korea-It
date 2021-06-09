<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script>
	if("${url}" == "/member/login/loginForm")
		alert("탈퇴한 네이버아이디로는 로그인 불가.")
		
	location.href = "${url}"
</script>