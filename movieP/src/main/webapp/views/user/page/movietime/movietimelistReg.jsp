<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.t1_lay1{
		width: 100%;
		height: 100px;
		border: 1px solid #000;
	}
	.t1_lay1_1{
		width: 100px;
		float: left;
	}
	.t1_lay1_2{
		width: 50px;
		float: left;
	}
	.t1_lay2{
		width: 100%;
		height: 450px;
		border: 1px solid #000;
	}
	.t1_lay3{
		width: 100%;
		height: 170px;
		border: 1px solid #000;
	}
	.both{
		clear: both;
	}
	.t2_lay1{
		width: 100px;
		float: right;
		font-weight: bold;
	}
	.screen{
		margin: 0 auto;
		width: 200px;
		height: 50px;
		border: 1px solid #000;
		margin-bottom: 30px;
	}
	.sittinglay{
		width:700px;
		height: 500px;
		margin: 0 auto;
	}
	.sitting{
		width: 30px;
		height: 30px;
		float:left;
		border: 1px solid #000;
	}
	.gill{
		width: 100px;
		height: 30px;
		border: 1px solid red;
		float: left;
	}
	.clickontike > input{
		width: 200px;
		height: 170px;
		float: right;
		background: black;
		color: white;
	}
</style>
<%
int cnt1 = 0;
if(request.getParameter("cnt1") != null){
	 cnt1 = Integer.parseInt(request.getParameter("cnt1"));
	if(cnt1 < 0){
		cnt1 = 0;	
	}
}
int cnt2 = 0;
if(request.getParameter("cnt2") != null){
	 cnt2 = Integer.parseInt(request.getParameter("cnt2"));
	if(cnt2 < 0){
		cnt2 = 0;	
	}
}
int cnt3 = 0;
if(request.getParameter("cnt3") != null){
	 cnt3 = Integer.parseInt(request.getParameter("cnt3"));
	if(cnt3 < 0){
		cnt3 = 0;	
	}
}

String sit = "A B C D E F G H I J";
%>
<script>

$(function() {
	
	$("#testbutton").click(function() {
	}
}
</script>
<div class="t1_lay1">
	<div class="t1_lay1_1">어린이</div>
	<div class="t1_lay1_2"><a href="/user/movietime/listReg?m_index=<%=request.getParameter("m_index") %>&cnt1=<%=cnt1-1 %>&cnt2=<%=cnt2%>&cnt3=<%=cnt3%>">-</a></div>
	<div class="t1_lay1_2"><%=cnt1 %></div>
	<div class="t1_lay1_2"><a href="/user/movietime/listReg?m_index=<%=request.getParameter("m_index") %>&cnt1=<%=cnt1+1 %>&cnt2=<%=cnt2%>&cnt3=<%=cnt3%>">+</a></div>
	<div class="both"></div>
	<div class="t1_lay1_1">청소년</div>
	<div class="t1_lay1_2"><a href="/user/movietime/listReg?m_index=<%=request.getParameter("m_index") %>&cnt2=<%=cnt2-1 %>&cnt1=<%=cnt1%>&cnt3=<%=cnt3%>">-</a></div>
	<div class="t1_lay1_2"><%=cnt2 %></div>
	<div class="t1_lay1_2"><a href="/user/movietime/listReg?m_index=<%=request.getParameter("m_index") %>&cnt2=<%=cnt2+1 %>&cnt1=<%=cnt1%>&cnt3=<%=cnt3%>">+</a></div>
	<div class="both"></div>
	<div class="t1_lay1_1">어른</div>
	<div class="t1_lay1_2"><a href="/user/movietime/listReg?m_index=<%=request.getParameter("m_index") %>&cnt3=<%=cnt3-1 %>&cnt2=<%=cnt2%>&cnt1=<%=cnt1%>">-</a></div>
	<div class="t1_lay1_2"><%=cnt3 %></div>
	<div class="t1_lay1_2"><a href="/user/movietime/listReg?m_index=<%=request.getParameter("m_index") %>&cnt3=<%=cnt3+1 %>&cnt2=<%=cnt2%>&cnt1=<%=cnt1%>">+</a></div>
	<div class="both"></div>
	<div class="t2_lay1">어린이 : <%=cnt1 %></div>
	<div class="t2_lay1">청소년 : <%=cnt2 %></div>
	<div class="t2_lay1">어른 : <%=cnt3 %></div>
</div>
<div class="t1_lay2">
<form action="">
		<c:choose>
			<c:when test="<%= cnt1 > 0 || cnt2 > 0 || cnt3 > 0 %>">
				<div class="screen">스크린</div>
				<div class="sittinglay">
				<c:choose>
					<c:when test="${param.sectorno eq '작은관' }">
						<!-- 작은관 할것. -->
					</c:when>
					<c:otherwise>
						<% for(int i = 0; i< 10; i++){ %>
							<c:forEach begin="1" var="a" end="10">
								<div class="sitting"><input id="testbutton" type="button" value="<%=sit.split(" ")[i] %>${a }" /></div>
							</c:forEach>
							<div class="gill">통로</div>
							<c:forEach begin="11" var="a" end="20">
								<div class="sitting"><input id="testbutton" type="button" value="<%=sit.split(" ")[i] %>${a }" /></div>
							</c:forEach>
						<%} %>
					</c:otherwise>
				</c:choose>
				</div>
			</c:when>
			<c:otherwise>
				
			</c:otherwise>
		</c:choose>
	</div>
	<div class="t1_lay3">
		<div class="clickontike"><input type="submit" value="예약하기"></div>
	</div>
</form>