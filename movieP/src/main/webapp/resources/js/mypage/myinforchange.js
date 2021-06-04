/**
 * 
 */
 $(function() {
 	
 	$("#inforDelete").click(function(){
	   $("#inforDelete1").modal({
      	remote: '/views/user/page/modal/delete.jsp'
   	});
});
  $('#pumnchangGo').click(function(){
 	
 		if($('#pumnchangGo').val() == "휴대폰번호 변경"){
 	
			$('#newpnum').attr("type", "text");
			$('#checknumButt').attr("type", "button");
			$('#pumnameouter').css("height", "95px");
			$('#pumnameouter').css("line-height", "95px");
			$('#pumMidouter').css("height", "95px");
			$('#pumnchangGo').val("변경 취소");
 		
 		}else{
 		
 		  	$('#newpnum').attr("disabled", false);
 			$('#newpnum').attr("type", "hidden");
			$('#checknumButt').attr("type", "hidden");
			$('#pumnameouter').css("height", "50px");
			$('#pumnameouter').css("line-height", "50px");
			$('#pumMidouter').css("height", "50px");
			$('#pumnchangGo').val("휴대폰번호 변경");
			$('#checknum').val("") 
			$('#newpnum').val("") 
	        $('#checknum').attr("type", 'hidden');
	        $('#numfinish').attr("type", 'hidden');
 		
 		}
 	
 	});
 
     
    
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
  
  	 $("#changepw").click(function(){
    	
    	frm.action = "/member/mypage/mypwchange"
		frm.submit();

	});
     
    
    
    $("#informodifyGo").click(function(){
    
   	 	$('#newpnum').attr("disabled", false);
    	
    	if( document.getElementById('newpnum').value == ""){
    		var num = document.getElementById('userpnum').value
    	
    	}else{
    		var num = document.getElementById('newpnum').value
    	}
    	
    	var list = {
    		useremail : document.getElementById('useremail').value,
    		userpnum :  num,
    		userid :  document.getElementById('userid').value
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
							
					alert("회원정보가 수정되었습니다")
					frm.action = "/member/mypage/mypageMain"
					frm.submit();
				}
	
	     	}
		});
    });
       
  
  
  
  
  });  