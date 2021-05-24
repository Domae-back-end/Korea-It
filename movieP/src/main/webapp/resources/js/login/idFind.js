/**
 * 
 */
 $(function() {
	
	$('#check').click(function(){
		
		$.ajax({
	    	async : true,
	        type : 'POST',
	        data : JSON.stringify({username : $('#username').val(), userbirth : $('#userbirth').val(), userpnum : $('#userpnum').val()}),
	        url : "/memberCheck",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				
				if(data.dto!=null){
					
					/* frm.action = "/user/main"
					frm.submit(); */
			
				}else{ 
					alert("해당 정보의 아이디가 존재하지않습니다.")
	     		}
	     	}
		});
	});
});
	