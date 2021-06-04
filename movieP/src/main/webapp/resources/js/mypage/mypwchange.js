/**
 * 
 */
 var pwCh = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
 
 $(function() {
	
	var pwnum = 0;
	
	$("#newpw").on("propertychange change keyup paste input", function(){
		
		if (pwCh.test($('#newpw').val())) {
			$('#pw_check').text('사용가능한 비밀번호입니다.'); 
			$('#pw_check').css('color', 'blue');
			$('#newpwch').prop("readonly",false);
			
		}else{
			$('#pw_check').text('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하십시오.'); 
			$('#pw_check').css('color', 'red');
			$('#newpwch').prop("readonly",true);
		}
		if ($('#newpw').val() != $('#newpwch').val() &&  pwnum == 1) {
			$('#newpwch').val('')
			$('#pw_check2').text('비밀번호가 일치하지 않습니다.다시 입력해주세요'); 
			$('#pw_check2').css('color', 'red');	
			 pwnum = 0;		
		}
	});

	$("#newpwch").on("propertychange change keyup paste input", function(){
		
		if ($('#newpw').val() != $(this).val()) {
			$('#pw_check2').text('비밀번호가 일치하지 않습니다.'); 
			$('#pw_check2').css('color', 'red');	
			 pwnum = 0;	
				
		}else{
			$('#pw_check2').text('비밀번호 일치.'); 
			$('#pw_check2').css('color', 'blue');
			
			 pwnum = 1;		
		}
	});
	
	$("#pwmodifyGo").click(function(){
    	
    	if($('#nowpw').val() == ''){
    	
    		alert("현재 비밀번호를 입력해주세요.")
    		return false;
    	}
    	
    	if(pwnum == 0){
    		
    		alert("새로운 비밀번호를 재확인해주세요")
    		return false;
    	}
    	
    	var list = {
    		userid : document.getElementById('userid').value,
    		userpw :  document.getElementById('nowpw').value
    	};
    	
    	$.ajax({
	    	async : false,
	        type : 'POST',
	        data : JSON.stringify(list),
	        url : "/memberCheck",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				
    	
				if(data.dto!=null && $('#newpw').val() == $('#newpwch').val()){
					
					var inlist = {
			    		userid : document.getElementById('userid').value,
			    		userpw :  $('#newpw').val()
	    			};

					$.ajax({
				    	async : false,
				        type : 'POST',
				        data : JSON.stringify(inlist),
				        url : "/membermodify",
				        dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(data) {
							
							if(data.cnt>0){
								alert("비밀번호 변경이 완료되었습니다.")
								frm.action = "/member/mypage/mypageMain"
								frm.submit();
							}
				     	}
					});
	
				}else{
					alert("현재 비밀번호를 다시 확인해주세요.")
				}
					
	     	}
		});
	
	});
     	
});