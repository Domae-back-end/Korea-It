/**
 * 
 */
 $(function() {
	
	$("#username").on("propertychange change keyup paste input", function(){
		
		var regexp = /[^a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]/gi
		$(this).val($(this).val().replace(regexp,''));
		
		if($('#username').val()!='' && $('#userbirth').val()!='' && $('#userpnum').val()!='' )
				$('#check').attr('disabled',false)
		else
			$('#check').attr('disabled',true)
	});
	
	$("#userbirth").on("propertychange change keyup paste input", function(){
		
		var regexp = /[^0-9]/gi
		$(this).val($(this).val().replace(regexp,''));
		
		if($('#username').val()!='' && $('#userpnum').val()!='' && $('#userbirth').val()!='' )
				$('#check').attr('disabled',false)
		else
			$('#check').attr('disabled',true)

	});
	
	$("#userpnum").on("propertychange change keyup paste input", function(){
		
		var regexp = /[^0-9]/gi
		$(this).val($(this).val().replace(regexp,''));
		
		if($('#userbirth').val()!='' && $('#username').val()!='' && $('#userpnum').val()!='')
				$('#check').attr('disabled',false)
		else
			$('#check').attr('disabled',true)		
	
	});
	
	
	$('#check').click(function(){
		console.log($('#userbirth').val())
		$.ajax({
	    	async : true,
	        type : 'POST',
	        data : JSON.stringify({username : $('#username').val(), userbirthM : $('#userbirth').val(), userpnum : $('#userpnum').val()}),
	        url : "/memberCheck",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				
				if(data.dto!=null){
					
					alert(data.dto.userid)
					frm.action = "/member/login/loginForm"
					frm.submit();
			
				}else{ 
					alert("해당 정보의 아이디가 존재하지않습니다.")
	     		}
	     	}
		});
	});
});
	