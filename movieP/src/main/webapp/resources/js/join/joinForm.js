var empCh = /\s/g; 
var idCh = /^(?=.*[a-zA-Z])(?=.*[0-9_-]).{5,20}$/;
var pwCh = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
var nameCh = /^[가-힣]{2,6}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 
var emailCh = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
var pnumCh = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; 

$(function() {
	
	var chCnt = 0;
	
	 
    $("#userid").on("propertychange change keyup paste input", function(){
		
		if($('#userid').val() ==''){ 
			$('#id_check').text('아이디를 입력하세요.'); 
			$('#id_check').css('color', 'red'); 
			$("#usercheck").attr("disabled", true); 
		
		}else if(idCh.test($('#userid').val())!=true){ 
			$('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호_와-만 사용 가능합니다.'); 
			$('#id_check').css('color', 'red'); 
			$("#usercheck").attr("disabled", true); 
			
		} else { 
			$('#id_check').text('아이디 중복확인을 해주세요.'); 
			$('#id_check').css('color', 'blue'); 
			$("#usercheck").attr("disabled", false); 
			
			var userid=$('#userid').val(); 
			
			$("#usercheck").click(function() {
				
		        $.ajax({
		           async : true,
		           type : 'POST',
		           data : JSON.stringify({userid}),
		           url : "/memberCheck",
		           dataType : "json",
		           contentType : "application/json; charset=UTF-8",
		           success : function(data) {
	
						if(data.dto!=null){
							
							$("#userid").val("");
							$('#id_check').text('중복된 아이디 입니다.'); 
							$('#id_check').css('color', 'red'); 
							$("#usercheck").attr("disabled", true); 
				
						}else{ 
							if(idCh.test(userid)){ 
								$('#id_check').text('사용가능한 아이디 입니다.'); 
								$('#id_check').css('color', 'blue'); 
								$("#usercheck").attr("disabled", true); 
								chCnt = 1;
										
							} else if(userid==''){ 
								$('#id_check').text('아이디를 입력해주세요.'); 
								$('#id_check').css('color', 'red');  
								$("#usercheck").attr("disabled", true); 
										
							} else{ 
								$('#id_check').text("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다."); 
								$('#id_check').css('color', 'red'); 
								$("#usercheck").attr("disabled", true); 			
							} 
		     			}
		           }
			});
		})
	}
});
	
	$("#username").on("propertychange change keyup paste input", function(){
		
		if (nameCh.test($('#username').val())) {
	
		}else{
			$('#name_check').text('한글 2~6자 또는 영어 2~10자 이내로 입력하세요. (특수기호, 공백 사용 불가)'); 
			$('#name_check').css('color', 'red');
		}
	});

	$("#userpw").on("propertychange change keyup paste input", function(){
		
		if (pwCh.test($('#userpw').val())) {
			$('#pw_check').text('사용가능한 비밀번호입니다.'); 
			$('#pw_check').css('color', 'blue');
			$('#userpwchk').prop("readonly",false);
		}else{
			$('#pw_check').text('8~16자 영문 대 소문자, 숫자, 특수문자를 사용하십시오.'); 
			$('#pw_check').css('color', 'red');
			$("#userpw").val("");
			$('#userpwchk').prop("readonly",true);
		}
	});

	$("#userpwchk").on("propertychange change keyup paste input", function(){
		
		if ($('#userpw').val() != $(this).val()) {
			$('#pw_check2').text('비밀번호가 일치하지 않습니다.'); 
			$('#pw_check2').css('color', 'red');			
		}else if($(this).val()==""){
			
		}else{
			$('#pw_check2').text('비밀번호 일치.'); 
			$('#pw_check2').css('color', 'blue');
		}
	});
		
	$("select[name=emailSe]").on("click", function(){
	    var em = $(this).closest('#email_Ch').find("input[name=emailAd]");
	    if ($(this).val() == "직접입력") {
	        em.val('');
	        em.prop("readonly",false);
	        
	    } else {
	        em.val($(this).val());
	        em.prop("readonly",true);

			if (emailCh.test($('#emailId').val()+'@'+$(this).val())) {
				
				document.getElementById('useremail').value = $('#emailId').val()+'@'+$(this).val();	
			}else{
				$('#email_check').text('이메일 아이디를 확인해주세요'); 
				$('#email_check').css('color', 'red');
				$('#emailId').val('');
			}
	    }
	});
	
	$("#emailAd").on("propertychange change keyup paste input", function(){	
		 
		if (emailCh.test($('#emailId').val()+'@'+$('#emailAd').val())) {
			
			document.getElementById('useremail').value = $('#emailId').val()+'@'+$('#emailAd').val();	
		}else{
			$('#email_check').text('이메일 양식을 확인해주세요.'); 
			$('#email_check').css('color', 'red');
			$('#emailId').val('');
			$('#emailAd').val('');
		}
	});
	
	$("#pnumL").on("propertychange change keyup paste input", function(){
		
		if (pnumCh.test($('#pnumF').val()+$('#pnumM').val()+$('#pnumL').val())) {
			
			document.getElementById('userpnum').value = $('#pnumF').val()+'-'+$('#pnumM').val()+'-'+$('#pnumL').val();		
			
			$('#pnum_check').text('문자인증을 해주세요.'); 
			$('#pnum_check').css('color', 'blue');
			$('#pnumcheck').attr("disabled", false);

		}else{
			$('#pnum_check').text('휴대폰번호를 확인해주세요.(2~4자 숫자만 사용가능)'); 
			$('#pnum_check').css('color', 'red');
			$('#pnumM').val('');
			$('#pnumL').val('');
		}
	});
	
	$('#pnumcheck').click(function(){
		
		var phoneNumber = document.getElementById('userpnum').value;

		alert("인증번호 발송 완료")
        
        $('#pchecknum').prop("type", 'text');
		$('#checkBtn').prop("type", 'button');
		$('#pnumcheck').attr("disabled", true);
		$('#pnumM').attr("disabled", true);
        $('#pnumL').attr("disabled", true);
        $('#pnumF').attr("disabled", true);
		
        $.ajax({
            type: "POST",
            url: "/memberpnumCheckSNS",
            data: {phoneNumber : phoneNumber},
            success: function(res){
            	
                $('#checkBtn').click(function(){
                    if($.trim(res) == $('#pchecknum').val()){
                        alert(phoneNumber)
                        $('#pnum_check').text('휴대폰 인증완료'); 
                        $('#pchecknum').prop("type", 'hidden');
                    	$('#checkBtn').prop("type", 'hidden');
                    	$('#pnumcheck').attr("disabled", true);
                 
                    }else{
                          alert("휴대폰 인증을 다시 해주세요.")
						  $('#pchecknum').val("") 
                          $('#pnumcheck').attr("disabled", true);
                          $('#pnumM').attr("disabled", false);
					      $('#pnumL').attr("disabled", false);
					      $('#pnumF').attr("disabled", false);
					      $('#pnumM').val("");
					      $('#pnumL').val("");
					      $('#pnumF').val("");
                    }
                });
            }
        });
    });
	
	document.addEventListener('keydown', function(event) {
		
		if (event.keyCode === 13) {
		    event.preventDefault();
		};
	}, true);
	
	
	$('form').on('submit',function(){
	
	 	$('#pnumM').attr("disabled", false);
		$('#pnumL').attr("disabled", false);
		$('#pnumF').attr("disabled", false);
		
		var inval_Arr = new Array(8).fill(false); 
		
		if (nameCh.test($('#username').val())) { 
			inval_Arr[0] = true; 
		} else { 
			inval_Arr[0] = false; 
			alert('이름을 확인하세요.'); 
			return false; 
		}
		
		if (idCh.test($('#userid').val())) { 
			inval_Arr[1] = true; 
		} else { 
			inval_Arr[1] = false; 
			alert('아이디를 확인하세요.'); 
			return false; 
		}
		
		if ( pwCh.test($('#userpw').val()) && ($('#userpw').val() == $('#userpwchk').val())){
 
			inval_Arr[2] = true; 
		} else { 
			inval_Arr[2] = false; 
			alert('비밀번호를 확인하세요.'); 
			return false; 
		}
		
		if (pnumCh.test($('#userpnum').val())) { 
			inval_Arr[3] = true; 
		} else { 
			inval_Arr[3] = false; 
			alert('휴대폰번호를 확인하세요.'); 
			return false; 
		}
		
		if (emailCh.test($('#useremail').val())) { 
			inval_Arr[4] = true; 
		} else { 
			inval_Arr[4] = false; 
			alert('이메일을 확인하세요.'); 
			return false; 
		}
			
		document.getElementById('birthYear').value = $('#birthY').val();
	    document.getElementById('birthDay').value = $('#birthM').val() + '-' + $('#birthD').val();
		
	    alert("회원가입이 완료되었습니다")	
	});
	
	
});

function mainGo() {
	frm.action = "/user/main"
	frm.submit()
}