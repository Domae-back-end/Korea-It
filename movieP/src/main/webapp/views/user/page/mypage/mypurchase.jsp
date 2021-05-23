<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div>
	<h3>예매내역</h3>
	<div class="purchouter">
		<input type="radio" name="moivepur" id ="now" value="now"/>예매내역
		<input type="radio" name="moivepur" id ="past" value="past"/>지난내역
		<select id="moiverecord" name="moiverecord">
			<c:forEach var="i" begin="1966" end="2020" step="1" >
				<option value="${i }">${i }</option>
			</c:forEach>	
		</select>
		<input type="button" class="changeButt" value="조회" />
	</div>

	<div class="cimeminfor">
		
	</div>
	
	<h3>예매 취소내역</h3>
	<div class="cimeminfor">
		
	</div>
	
</div>