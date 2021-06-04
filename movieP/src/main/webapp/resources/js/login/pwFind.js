/**
 * 
 */
 var pnumCh = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/; 

$(function() {
	
	var messch = 0;
	
	$("#username").on("propertychange change keyup paste input", function(){
	
		if($('#username').val()!='' && $('#userid').val()!='' && $('#userpnum').val()!='' && messch == 1)
				$('#check').attr('disabled',false)
		else
			$('#check').attr('disabled',true)
	});
	
	$("#userid").on("propertychange change keyup paste input", function(){
	
		if($('#username').val()!='' && $('#userpnum').val()!='' && $('#userid').val()!='' && messch == 1 )
				$('#check').attr('disabled',false)
		else
			$('#check').attr('disabled',true)

	});
	
	$("#userpnum").on("propertychange change keyup paste input", function(){
	
		if($('#userid').val()!='' && $('#username').val()!='' && $('#userpnum').val()!='' && messch == 1 )
				$('#check').attr('disabled',false)
		else
			$('#check').attr('disabled',true)		
	
	});
	
	$('#check').click(function(){
	
		if(messch == 0){
		
			alert("휴대폰 인증을 완료해주세요.")
			return false;
		}
		
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
	
	
	$("#userpnum").on("propertychange change keyup paste input", function(){
		
		if (pnumCh.test($('#userpnum').val())) {
			
			$('#pnumcheck').attr("disabled", false);

		}else{
			
			$('#pnumcheck').attr("disabled", true);
		}
	});
	
	$('#pnumcheck').click(function(){
		
		if($('#pnumcheck').val() == '인증번호 발송'){
			
			var phoneNumber = document.getElementById('userpnum').value;
			
	        alert("인증번호 발송 완료")
	       	
			$('#userpnum').attr("disabled", true);
			$('#pnumcheck').val("다시입력");
			$('#userpnumchk').attr("disabled", false);
			$('#checkBtn').attr("disabled", false);
			
	        $.ajax({
	            type: "POST",
	            url: "/memberpnumCheckSNS",
	            data: {phoneNumber : phoneNumber},
	            success: function(res){
	            	
	                $('#checkBtn').click(function(){
	                   
	                    if($.trim(res) == $('#userpnumchk').val()){
	                        
	                        alert("휴대폰 인증완료")
	                        $('#pnum_check').text('휴대폰 인증완료'); 
	                      	$('#userpnumchk').attr("disabled", true);
							$('#checkBtn').attr("disabled", true);
							 messch = 1;
							
							if($('#username').val()!='' && $('#userpnum').val()!='' && $('#userid').val()!='' && messch == 1 )
								$('#check').attr('disabled',false)
							
	                    }
	                    
	                    if($.trim(res) != $('#userpnumchk').val()){
	                         
	                          alert("휴대폰 인증을 다시 해주세요.")
							 
							  $('#userpnumchk').val("") 
							  $('#userpnum').val("") 
	                          $('#userpnumchk').attr("disabled", true);
	                    	  $('#checkBtn').attr("disabled", true);
	                    	  $('#userpnum').attr("disabled", false);
	                    	  $('#pnumcheck').val("인증번호 발송");
	                    	   messch = 0;
	                    }
	                });
	
	
	            }
	        });
        }
        else{
			
			$('#userpnumchk').val("") 
			$('#userpnum').val("") 
	        $('#userpnumchk').attr("disabled", true);
	        $('#checkBtn').attr("disabled", true);
	        $('#userpnum').attr("disabled", false);
	        $('#pnumcheck').val("인증번호 발송");
	        $('#check').attr("disabled", true);
	         $('#pnumcheck').attr("disabled", true);
	        messch = 0;
        }

    });
    
    
});	