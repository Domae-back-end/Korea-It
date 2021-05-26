/**
 * 
 */
 $(function() {
	
	$('#check').click(function(){
		
		$('#userpnum').attr("disabled", false);
		
		$.ajax({
	    	async : true,
	        type : 'POST',
	        data : JSON.stringify({userid : $('#userid').val(), username : $('#username').val(), userpnum : $('#userpnum').val()}),
	        url : "/memberCheck",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				
				if(data.dto!=null){
					
					alert(data.dto.userpw)
					frm.action = "/user/main"
					frm.submit();
			
				}else{ 
					alert("해당 정보의 아이디가 존재하지않습니다.")
	     		}
	     	}
		});
	});
	
	
	$('#pnumcheck').click(function(){
		
		var phoneNumber = document.getElementById('userpnum').value;
		
        alert("인증번호 발송 완료")
       	
		$('#userpnum').attr("disabled", true);
		$('#pnumcheck').attr("disabled", true);
		$('#userpnumchk').attr("disabled", false);
		$('#checkBtn').attr("disabled", false);
		
        $.ajax({
            type: "POST",
            url: "/memberpnumCheckSNS",
            data: phoneNumber,
            success: function(res){
            	
                $('#checkBtn').click(function(){
                    if($.trim(res) == $('#userpnumchk').val()){
                        alert("휴대폰 인증완료")
                        $('#pnum_check').text('휴대폰 인증완료'); 
                      	$('#userpnumchk').attr("disabled", true);
                      	$('#pnumcheck').attr("disabled", true);
						$('#checkBtn').attr("disabled", true);
						$('#check').attr("disabled", false);
						
                    }else{
                          alert("휴대폰 인증을 다시 해주세요.")
						  $('#userpnumchk').val("") 
						  $('#userpnum').val("") 
                          $('#userpnumchk').attr("disabled", true);
                    	  $('#checkBtn').attr("disabled", true);
                    	  $('#userpnum').attr("disabled", false);
                    	  $('#pnumcheck').attr("disabled", false);
                    }
                })


            }
        })
    });
});	