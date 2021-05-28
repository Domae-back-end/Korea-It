/**
 * 
 */
 $(function() {
	
	$('#check').click(function(){
		
		$.ajax({
	    	async : true,
	        type : 'POST',
	        data : JSON.stringify({userid : $('#userid').val(), userpw : $('#userpw').val()}),
	        url : "/memberCheck",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				console.log(data.dto)
				if(data.dto!=null){
					
					frm.action = "/user/main"
					frm.submit();
			
				}else{ 
					
					alert("아이디와 비밀번호를 다시 확인해주세요.")
	     		}
	     	}
		});
	});
	
});
