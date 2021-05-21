<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

li{
	list-style: none;
	height: 100px;
}
ul{
	width: 300px;
	height: 500px;
}

</style>
<nav>
	<ul>
		<li><a href="mycinema">나의 영화관</a></li>
		<li><a href="mypurchase">예매내역</a></li>
		<li><a href="myfna">문의내역</a></li>
		<li><a href="myinfor">내 정보수정</a></li>
	</ul>
</nav>

<jsp:include page="${PPPData.cate}/${PPPData.service}.jsp" /> 
	
