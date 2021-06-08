<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
String seatno = "";
boolean check = true;

int total = cnt1+cnt2+cnt3;
String sitting="선택안함.";
if(request.getParameter("seatNo") != null){
	seatno = request.getParameter("seatNo");
	sitting = seatno;
	if(seatno.split(",").length > total){
		check = false;
	}
}
%>
<div class="t1_lay1">
	<div class="t1_lay1_1">어린이</div>
	<div class="t1_lay1_2"><a href="/user/movietime/listReg?time_index=<%=request.getParameter("time_index") %>&cnt1=<%=cnt1-1 %>&cnt2=<%=cnt2%>&cnt3=<%=cnt3%>&sectorno=<%=request.getParameter("sectorno")%>">-</a></div>
	<div class="t1_lay1_2"><%=cnt1 %></div>
	<div class="t1_lay1_2"><a href="/user/movietime/listReg?time_index=<%=request.getParameter("time_index") %>&cnt1=<%=cnt1+1 %>&cnt2=<%=cnt2%>&cnt3=<%=cnt3%>&sectorno=<%=request.getParameter("sectorno")%>">+</a></div>
	<div class="both"></div>
	<div class="t1_lay1_1">청소년</div>
	<div class="t1_lay1_2"><a href="/user/movietime/listReg?time_index=<%=request.getParameter("time_index") %>&cnt2=<%=cnt2-1 %>&cnt1=<%=cnt1%>&cnt3=<%=cnt3%>&sectorno=<%=request.getParameter("sectorno")%>">-</a></div>
	<div class="t1_lay1_2"><%=cnt2 %></div>
	<div class="t1_lay1_2"><a href="/user/movietime/listReg?time_index=<%=request.getParameter("time_index") %>&cnt2=<%=cnt2+1 %>&cnt1=<%=cnt1%>&cnt3=<%=cnt3%>&sectorno=<%=request.getParameter("sectorno")%>">+</a></div>
	<div class="both"></div>
	<div class="t1_lay1_1">어른</div>
	<div class="t1_lay1_2"><a href="/user/movietime/listReg?time_index=<%=request.getParameter("time_index") %>&cnt3=<%=cnt3-1 %>&cnt2=<%=cnt2%>&cnt1=<%=cnt1%>&sectorno=<%=request.getParameter("sectorno")%>">-</a></div>
	<div class="t1_lay1_2"><%=cnt3 %></div>
	<div class="t1_lay1_2"><a href="/user/movietime/listReg?time_index=<%=request.getParameter("time_index") %>&cnt3=<%=cnt3+1 %>&cnt2=<%=cnt2%>&cnt1=<%=cnt1%>&sectorno=<%=request.getParameter("sectorno")%>">+</a></div>
	<div class="both"></div>
	<div class="t2_lay1">어린이 : <%=cnt1 %></div>
	<div class="t2_lay1">청소년 : <%=cnt2 %></div>
	<div class="t2_lay1">어른 : <%=cnt3 %></div>
</div>
<div class="t1_lay2">
	<c:if test="<%=check %>">
			<c:choose>
				<c:when test="<%= cnt1 > 0 || cnt2 > 0 || cnt3 > 0 %>">
					<div class="screen">스크린</div>
					<div class="sittinglay">
					<c:choose>
						<c:when test="${data.no eq '작은관' }">
							<c:set var="sit" value="A B C D E" />
							<c:forEach var="i" begin="0" end="4">
								<c:set var="buf" value="${fn:split(sit,' ')[i] }" />
									<c:forEach begin="1" var="a" end="10">
										
											<div class="sitting"><a href="/user/movietime/listReg?time_index=<%=request.getParameter("time_index") %>&cnt3=<%=cnt3 %>&cnt2=<%=cnt2%>&cnt1=<%=cnt1%>&seatNo=<%=seatno %>,${buf }${a }&sectorno=<%=request.getParameter("sectorno")%>">${buf }${a }</a></div>
									</c:forEach>
								<div class="gill">통로</div>
								<c:forEach begin="11" var="a" end="20">
									<div class="sitting"><a href="/user/movietime/listReg?time_index=<%=request.getParameter("time_index") %>&cnt3=<%=cnt3 %>&cnt2=<%=cnt2%>&cnt1=<%=cnt1%>&seatNo=<%=seatno %>,${buf }${a }&sectorno=<%=request.getParameter("sectorno")%>">${buf }${a }</a></div>
								</c:forEach>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:set var="sit" value="A B C D E F G H I J" />
							
							<c:forEach var="i" begin="0" end="9">
									<c:forEach begin="1" var="a" end="10">
										<c:set var="buf" value="${fn:split(sit,' ')[i] }${a }" />
										<c:set var="check" value="true" />
										
										<c:forEach var="ac" items="${data.sitting }">
											<c:if test="${ac.seatNo eq buf }">
												<c:set var="check" value="false" />
											</c:if>
										</c:forEach>
										
											<c:choose>
												<c:when test="${check eq false }">
													<div class="sitting">${buf }</div>
												</c:when>
												<c:otherwise>
													<div class="sitting"><a href="/user/movietime/listReg?time_index=<%=request.getParameter("time_index") %>&cnt3=<%=cnt3 %>&cnt2=<%=cnt2%>&cnt1=<%=cnt1%>&seatNo=<%=seatno %>,${buf }&sectorno=<%=request.getParameter("sectorno")%>">${buf }</a></div>
												</c:otherwise>
											</c:choose>
									</c:forEach>
									
								<div class="gill">통로</div>
								
									<c:forEach begin="11" var="a" end="20">
										<c:set var="buf" value="${fn:split(sit,' ')[i] }${a }" />
										<c:set var="check" value="true" />
										
										<c:forEach var="ac" items="${data.sitting }">
											<c:if test="${ac.seatNo eq buf }">
												<c:set var="check" value="false" />
											</c:if>
										</c:forEach>
									
											<c:choose>
												<c:when test="${check eq false }">
													<div class="sitting">${buf }</div>
												</c:when>
												<c:otherwise>
													<div class="sitting"><a href="/user/movietime/listReg?time_index=<%=request.getParameter("time_index") %>&cnt3=<%=cnt3 %>&cnt2=<%=cnt2%>&cnt1=<%=cnt1%>&seatNo=<%=seatno %>,${buf }&sectorno=<%=request.getParameter("sectorno")%>">${buf }</a></div>
												</c:otherwise>
											</c:choose>
									</c:forEach>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</div>
				</c:when>
			</c:choose>
		</c:if>
	</div>
	<div class="t1_lay3">
		<c:if test="<%=!(check) %>">
			<div class="clickontike"><a href="/user/movietime/listRegReg?time_index=<%=request.getParameter("time_index") %>&seatNo=<%=seatno %>&cnt3=<%=request.getParameter("cnt3")%>&cnt2=<%=request.getParameter("cnt2")%>&cnt1=<%=request.getParameter("cnt1")%>">예약하기</a></div>
		</c:if>
		<div class="clickontike"><a href="/user/movietime/listReg?time_index=<%=request.getParameter("time_index") %>&cnt3=<%=cnt3 %>&cnt2=<%=cnt2%>&cnt1=<%=cnt1%>">다시 좌석 선택하기</a></div>
		<div class="clickontike">좌석 : <%=sitting %></div>
		<div class="clickontike">가격 : ${data.money }</div>
	</div>