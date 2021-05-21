<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<style>
	.inputbox{
		width: 1000px;
		height: 100%;
		margin: 0 auto;
		background: olive;
	}
	.both{
		clear: both;
	}
	.choice{
		width: 100px;
		height: 100px;
		float: left;
	}
	.choice > img{
		width: 100px;
		height: 100px;
	}
	.checktime{
		border: 1px solid #000;
		color: black;
		font-size: 18px;
		background:white;
	}
	#msgto{
		width:200px;
		float: right;
	}
	.btntimeinsert{
		float: right;
	}
</style>
<script>

$(function() {
	
	$(".checktime").click(function() {
		var time = $('#starttime1').val();
		var movie = $('#movietitle').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/admin/movietime/check?time='+time+'&movietitle='+movie,
			type : 'get',
			success : function(data) {
				if(data == 1){
					$("#msgto").text("사용가능한 시간대 입니다.");
					$("#starttime1").attr("disabled",true);
				}else{
					$("#msgto").text("사용중인 시간대 입니다.");
					$("#starttime1").attr("disabled",false);
				}
			}, error : function() {
				console.log("실패");
			}
		});
	});
	
});
</script>
<form action="/admin/movietime/insertReg">
	<input type="hidden" value="<%=request.getParameter("dal")%>" name="dal">
	<input type="hidden" value="<%=request.getParameter("el")%>" name="el">
	<div class="inputbox">
		<select name="sectorno">
			<option value="작은관">작은관</option>
			<option value="기존관">기존관</option>
			<option value="3D관">3D관</option>
		</select>
		시작 시간 :
			<input type="time" name="starttime1" id="starttime1" /> 
			<input type="button" value="중복체크" class="checktime"/>
			<div id="msgto"></div>
		<div class="both"></div>
		<input type="submit" value="시간표 추가" class="btntimeinsert">
		<div class="both"></div>
		<hr>
		<div class="choice">선택</div>
		<div class="choice">이미지</div>
		<div class="choice">영화 제목</div>
		<div class="choice">감독</div>
		<div class="choice">개봉일</div>
		<div class="choice">상영 시간</div>
		<div class="choice">평점</div>
		<div class="both"></div>
			<c:forEach var="a" items="${data }">
				<div class="choice"><input type="radio" id="movietitle" name="movietitle" value="${a.movietitle }"></div>
				<div class="choice"><img src="/img/${a.movieimg }" alt="이미지 파일 없음."></div>
				<div class="choice">${a.movietitle }</div>
				<div class="choice">${a.mdir }</div>
				<div class="choice">	
			<fmt:formatDate value="${a.mdate }" type="both"
							pattern="yyyy-MM-dd" />
				</div>	
				<div class="choice">${a.mplaytime } 분</div>
				<div class="choice">${a.star }</div>
				<div class="both"></div>
			</c:forEach>
		
		<div class="both"></div>
		<hr>
	</div>
	
</form>