<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
	<script>
	   $(document).ready(function () { 
		        $("#admin").click(function() {		       	 
		 
		       	location.replace("/admin");
		       })		           
		        $("#user").click(function() {		       	 
		    
		       	location.replace("/user/main");
		       })
	   })	</script>
난바닥<br>
<button type="button" id="admin" class="btn-dark" style="display:inline;margin-left:30px;">어드민 페이지로</button>
<button type="button" id="user" class="btn-dark" style="display:inline;margin-left:30px;">영화메인 페이지로</button>