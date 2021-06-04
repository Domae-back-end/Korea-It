<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div id="content">
	
	<c:forEach items="${memdata.qna }" var ="pp">
	<c:if test="${param.detail ==  pp.persindex }">
	<div class="history_detail">
		<div class="hdetail_top">
			<ul>
				<li>[${pp.perscate }] ${pp.perstitle }</li>
				<li><span>등록일</span>"${pp.persqtime }"</li>
				<li><span>답변상태</span> ${pp.persstate }</li>
			</ul>
		</div>
		<div class="hdetail_cont">
			<p class="hdetail_cont_ques">
				${pp.perscontBr }
			</p>
			<p class="hdetail_cont_pic">
				<c:if test="${pp.persimg != null}">
					<img src='<c:url value="../../views/user/img/persupload/${pp.persimg }" />' alt="" />
				</c:if>
			</p>
			<p class="hdetail_cont_status">
				<span> "${pp.persatime }"</span> ${pp.persstate }
			</p>
			<p class="hdetail_cont_ans">
				${pp.persacontBr }
			</p>
		</div>
	</div>	
	</c:if>
	</c:forEach>
		<div class="hdetail_bot">
			<div class="back_list">
				<a href="javascript:history.back();">목록</a>
			</div>
		</div>
</div>