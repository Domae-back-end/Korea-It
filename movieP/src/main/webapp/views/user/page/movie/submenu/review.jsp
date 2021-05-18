<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	#reviewwrapper{
		border: 3px solid #000;
		width: 1000px;
	}
	
	#aa{
		border: 1px solid #a0a;
	}
	
	
</style>
<div id="reviewwrapper">
<c:forEach items="${moviereview }" var="r" varStatus="no">
<div id = "aa">
	<div id= "userinfo">
		${r.userid }
		${r.posttime_s }
	</div>
	<div id= "content">${r.postcontent }</div>
</div>
</c:forEach>
</div>