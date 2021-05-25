<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>나의 무비스토리</h2>

<div class ="buttouter">
<a href="?kind=seemovie"><div class ="butt">본 영화</div></a>
<a href="?kind=writemovie"><div class ="butt">관람평</div></a>
<a href="?kind=likemovie"><div class ="butt">좋아요</div></a>
</div>

<div class="buttresult">
	<jsp:include page='<%=request.getParameter("kind")+".jsp" %>' /> 
</div>
	
