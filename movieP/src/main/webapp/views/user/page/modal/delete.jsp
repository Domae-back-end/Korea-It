<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$("#checkBtn").click(function(){
	
	if(confirm("정말 탈퇴 하시겠습니까?")) {
		
		var list = {
			userpw : document.getElementById('chkPw').value,
			userid :  document.getElementById('userid').value,
			kind:'탈퇴'
		};
		
		$.ajax({
	    	async : false,
	        type : 'POST',
	        data : JSON.stringify(list),
	        url : "/membermodify",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				if(data.cnt >0){
					alert("탈퇴처리되었습니다")
					frm.action = "/logout"
					frm.submit();
				}
	     	}
		});
	}
});
</script>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	<h2>회원 탈퇴</h2>
</div>

<div class="modal-body">
	<input type="password" placeholder="비밀번호를 입력해주세요." maxlength="16" id="chkPw">
	<button type="button" id="checkBtn" class="btn btn-secondary">확인</button>
	<div>
	<button class="close" id="close" data-dismiss="modal">닫기</button>
	</div>
</div>

