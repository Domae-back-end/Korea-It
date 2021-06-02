<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.salesbutton{
		width: 100px;
		height: 100px;
		float: left;
	}
</style>
<div class="salesbutton">
<a href="/user/movietime/finish?time_index=<%=request.getParameter("time_index") %>&seatNo=<%=request.getParameter("seatNo") %>&cnt3=<%=request.getParameter("cnt3")%>&cnt2=<%=request.getParameter("cnt2")%>&cnt1=<%=request.getParameter("cnt1")%>&choice=1&userid=<%=session.getAttribute("sessionId")%>">카드 결제</a>
</div>
<div class="salesbutton">
<a href="/user/movietime/finish?time_index=<%=request.getParameter("time_index") %>&seatNo=<%=request.getParameter("seatNo") %>&cnt3=<%=request.getParameter("cnt3")%>&cnt2=<%=request.getParameter("cnt2")%>&cnt1=<%=request.getParameter("cnt1")%>&choice=2&userid=<%=session.getAttribute("sessionId")%>">현금 결제</a>
</div>
