/**
 * 
 */
 $(function() {
 
 	$('.sessnull').click(function(){
 		
 		if(document.getElementById('vv').value == ''){
 			alert('로그인 상태가 아니므로 이용이 불가능 합니다.')
 			return false;
 		}	
 	});
 	
	$('#check').click(function(){
		
		$.ajax({
	    	async : true,
	        type : 'POST',
	        data : JSON.stringify({userid : $('#userid').val(), userpw : $('#userpwchk').val()}),
	        url : "/memberCheck",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				
				if(data.dto!=null){
				
					alert("비밀번호가 일치합니다.")		
					frm.action = "/member/mypage/myinforchange"
					frm.submit();
			
				}else{ 
					alert("비밀번호가 일치하지않습니다.")
	     		}
	     	}
		});
	});
	
	$('#mainGo').click(function(){
		
		if(document.getElementById('vv').value == ''){
 			
 			frm.action = "/user/mainpage/main"
 			frm.submit();
 		
 		}else{
 			
 			location.href = "/member/mypage/mypageMain"
 		}

	});
	
});









