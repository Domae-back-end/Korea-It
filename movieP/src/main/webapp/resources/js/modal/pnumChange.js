/**
 * 
 */
$(function() {
	
	$('#checknumButt').click(function(){
		
			
		var phoneNumber = document.getElementById('newpnum').value;
			
	    alert("인증번호 발송 완료")
	       	
		$('#checknum').attr("type", "text");
		$('#checknumButt').attr("type", "hidden");
		$('#numfinish').attr("type", "button");
			
	    $.ajax({
			type: "POST",
	      	url: "/memberpnumCheckSNS",
	        data: {phoneNumber : phoneNumber},
	       	success: function(res){
	            	
	           $('#numfinish').click(function(){
	                    
	           		if($.trim(res) == $('#checknum').val()){
	                	
	                	alert("휴대폰 인증완료")
	          
	                    $('#newpnum').attr("disabled", true);
	                    $('#checknum').attr("disabled", true);
						$('#numfinish').attr("disabled", true);
							
					}else{
	                    
	                	alert("휴대폰 인증을 다시 해주세요.")
						
						$('#checknum').val("") 
						$('#newpnum').val("") 
	                    $('#checknum').attr("type", 'hidden');
	                    $('#numfinish').attr("type", 'hidden');
	                    $('#checknumButt').attr("type", "button");
	                   	
	                }
				});
	
	    	 }
	    });
   
	});	
	
	
});