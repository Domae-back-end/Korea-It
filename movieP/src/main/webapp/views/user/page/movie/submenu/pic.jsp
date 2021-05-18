<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#still{
		display: inline-block;
	}
	#still>img{
		width: 400px;
		height:600px;
		overflow:hidden;
	}
</style>
<script>

</script>
<input type="button" value="<"/>
	<c:forEach items="${movieimage }" var="i" varStatus="no">
		<div id= "still">
			<img src="/moviedata/${moviedetail.movietitle }/${i.imgname}">
		</div>
	</c:forEach>
<input type="button" value=">"/>