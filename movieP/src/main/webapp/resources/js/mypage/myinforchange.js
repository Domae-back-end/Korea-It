/**
 * 
 */
 $(function() {
 	
 	$("#inforDelete").click(function(){
	   
	   alert("비밀번호 확인이 필요합니다.")
	   
	   $("#inforDelete1").modal({
      		remote: '/views/user/page/modal/delete.jsp'
   		});
	});
	
  $('#pumnchangGo').click(function(){
 	
	  if(confirm("휴대폰 번호를 변경하시겠습니까?")){
	  	
	  	 $("#changePnum1").modal({
      		remote: '/views/user/page/modal/pnumChange.jsp'
		});

	  }
	   
	  
 	
 		/*if($('#pumnchangGo').val() == "휴대폰번호 변경"){
 	
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
 	*/
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