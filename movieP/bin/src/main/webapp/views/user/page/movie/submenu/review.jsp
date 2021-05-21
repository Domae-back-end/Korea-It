<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	#reviewwrapper{
		border: 3px solid #000;
		width: 1000px;
		display: inline-block;
	}
	
	#aa{
		border: 1px solid #a0a;
	}
	#userinfo{
		display: inline-block;
		border: 2px solid #ccc;
		text-align: center;
	}
	#content{
		display: inline-block;
	}
	
	
</style>
<div id="reviewwrapper">
<c:forEach items="${moviereview }" var="r" varStatus="no">
<div id = "aa">
	<div id= "userinfo">
		${r.userid }<br>
		${r.posttime_s }
	</div>
	<div id= "content">${r.postcontent }</div>
</div>
</c:forEach>
</div>