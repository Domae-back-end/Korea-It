<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="com.model.MemberDTO" scope="request" />
<form action="" method="post" enctype="multipart/form-data" name="frm" >
<h2>개인정보 수정</h2>
	<div class = "idouter">
		<div class = "nameouter">아이디</div>
		<div>
			<div class = "dataouter">${sessionId }</div>
			<input type="button" class="changeButt" value="회원탈퇴"/>
		</div>
	</div>
	
	<h3>기본정보</h3>
	<div class = "changeouter">
		<div>
			<div class = "nameouter">이름</div>
			<div>
				<div class = "dataouter"><%=dto.getUsername() %></div>
				<input type="button" class="changeButt" value="이름변경"/>
			</div>
		</div>
		
		<div>
			<div class = "nameouter">생년월일</div>
			<div>
				<div class = "dataouter"><%=dto.getUserbirth() %></div>
			</div>
		</div>
		
		
		<div>
			<div class = "nameouter">휴대폰</div>
			<div>
				<div class = "dataouter" id="pnumouter"><%=dto.getUserpnum() %></div>
				<input type="button" class="changeButt" value="휴대폰번호 변경"/>
			</div>
		</div>
		
		
		<div>
			<div class = "nameouter">이메일</div>
			<div>
				<input type="text" value="<%=dto.getUseremail() %>" />
			</div>
		</div>
			
		<div>
			<div class = "nameouter">비밀번호</div>	
			<div>
				<input type="button" class="changeButt" value="비밀번호 변경" />
			</div>
		</div>
	</div>
	
	<div>
		<input type="button" id="mainGo" value="취소"/>
		<input type="button" id="check" value="등록"/>
	</div>
</form>