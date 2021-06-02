<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.ticketinglay1{
		width: 1000px;
		height: 100%;
		margin: 0 auto;
		background-color: #F5F5DC;
	}
	.both{
		clear: both;
	}
	.lay1_1{
		overflow:auto;
		width: 250px;
		height: 500px;
		margin: 5px;
		border: 1px solid #000;
		float: left;
	}
	.lay1_2{
		overflow:scroll;
		width: 150px;
		height: 500px;
		margin: 5px;
		border: 1px solid #000;
		float: left;
	}
	.movietitle{
		width: 248px;
		height: 50px;
		color: white;
		border: 1px solid #000;
		text-align: center;
		line-height: 50px;
		background: black;
	}
	.movietitle2{
		width: 130px;
		height: 50px;
		color: white;
		border: 1px solid #000;
		text-align: center;
		line-height: 50px;
		background: black;
	}
	.movietitlelay{
		width: 248px;
		height: 50px;
		text-align: center;
		font-weight: bold;
	}
	.totaltiketing{
		width: 100%;
		height: 100px;
		background: gray;
		color: black;
		text-align: center;
		font-weight: bold;
		font-size: 20px;
	}
	.buttonticket{
		width: 100px;
		height: 50px;
		float: right;
	}
	.timelist{
		margin-bottom: 10px;
		width: 100%;
		height: 70px;
		background: gray;
	}
	.timelist1{
		width: 100%;
		height: 30px;
		font-size: 20px;
		font-weight: bold;
		text-align: center;
	}
	.timelist1 > a{
		color: black;
	}
	.timelist2{
		width: 120px;
		float:left;
		height: 50px;
		text-align: center;
	}
</style>
<%
Calendar dal1 = Calendar.getInstance();
Calendar dal2 = Calendar.getInstance();
dal2.set(Calendar.MONTH, dal1.get(Calendar.MONTH)+1);

if(session.getAttribute("sessionId") == null || session.getAttribute("sessionId").equals("")){
%>
<script>
	alert("로그인이 필요합니다.")
	location.href = "/member/login/loginForm"
</script>
<%
}
%>
<form action="">
	<div class="ticketinglay1">
		<div class="lay1_1">
		<div class="movietitle">영화</div>
			<c:forEach var="a" items="${data.movielist}">
				<div class="movietitlelay"><a href="?movietitle=${a.movietitle }">${a.movietitle }</a></div>
			</c:forEach>
		</div>
		<div class="lay1_2">
			<div class="movietitle2">날짜</div>
			<div><%=dal1.get(Calendar.MONTH)+1 %>월</div>
			<c:forEach var="a" begin="<%=dal1.get(Calendar.DATE) %>" end="<%=dal1.getActualMaximum(Calendar.DATE) %>">
				<div><a href="?movietitle=<%=request.getParameter("movietitle") %>&dal=<%=dal1.get(Calendar.MONTH)+1%>&el=${a}">${a }</a></div>
			</c:forEach>
			<div><%=dal2.get(Calendar.MONTH)+1 %>월</div>
			<c:forEach var="a" begin="1" end="<%=dal2.getActualMaximum(Calendar.DATE) %>">
				<div><a href="?movietitle=<%=request.getParameter("movietitle") %>&dal=<%=dal2.get(Calendar.MONTH)+1%>&el=${a}">${a }</a></div>
			</c:forEach>
		</div>
		<div class="lay1_1">
			<div class="movietitle">선택</div>
			<c:forEach var="a" items="${data.movietimelist}">
			<div class="timelist">
				<div class="timelist1"><a href="?movietitle=<%=request.getParameter("movietitle") %>&dal=<%=request.getParameter("dal") %>&el=<%=request.getParameter("el") %>&time_index=${a.time_index}&sectorno=${a.sectorno}">${a.sectorno }</a></div>
				<div class="timelist2">
					시작 : <fmt:formatDate value="${a.starttime }" type="both"
						pattern="HH:mm:ss" /></div>
				<div class="timelist2">
					종료 : <fmt:formatDate value="${a.endtime }" type="both"
						pattern="HH:mm:ss" /></div>
				</div>
			</c:forEach>
		</div>
		<div class="timelist1">
			<a href="/user/movietime/listReg?time_index=<%=request.getParameter("time_index") %>&sectorno=<%=request.getParameter("sectorno")%>">
				예매하기
			</a>
		</div>
		<div class="both"></div>
		<div class="totaltiketing">
			영화 : <%=request.getParameter("movietitle") %>   /
			시간 : <%=request.getParameter("dal") %>월 <%=request.getParameter("el") %>일   /
			선택 : <%=request.getParameter("sectorno") %><br>
		</div>
	</div> 
</form>
