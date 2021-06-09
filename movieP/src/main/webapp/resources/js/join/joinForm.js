var empCh = /\s/g; 
var idCh = /^(?=.*[a-zA-Z])(?=.*[0-9_-]).{5,20}$/;
var pwCh = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
var nameCh = /^[가-힣a-zA-Z]{2,10}$/;
var pnumCh = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; 
var emailCh = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
$(function() {
	
	var chCnt = 0;
	var pwnum = 0;
	var emChk = 0;
	
    $("#userid").on("propertychange change keyup paste input", function(){
		
		chCnt = 0;
		
		var regexp = /[^a-zA-Z0-9_-]/gi
		$(this).val($(this).val().replace(regexp,''));
		
		if($('#userid').val() ==''){ 
			$('#id_check').text('아이디를 입력하세요.'); 
			$('#id_check').css('color', 'red'); 
			$("#usercheck").attr("disabled", true); 
			
		
		}else if(!idCh.test($('#userid').val())){ 
			$('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호_와-만 사용 가능합니다.'); 
			$('#id_check').css('color', 'red'); 
			$("#usercheck").attr("disabled", true); 
			
			
		} else { 
			$('#id_check').text('아이디 중복확인을 해주세요.'); 
			$('#id_check').css('color', 'blue'); 
			$("#usercheck").attr("disabled", false);
			
			$("#usercheck").click(function() {
				
		        $.ajax({
		           async : true,
		           type : 'POST',
		           data : JSON.stringify({userid : $('#userid').val()}),
		           url : "/memberCheck",
		           dataType : "json",
		           contentType : "application/json; charset=UTF-8",
		           success : function(data) {
	
						if(data.dto!=null){
							
							$('#id_check').text('이미 사용중이거나 탈퇴한 아이디입니다.'); 
							$('#id_check').css('color', 'red'); 
							$("#usercheck").attr("disabled", true); 
							$("#userid").val("");
							chCnt = 0;
				
						}else{ 
							$('#id_check').text('사용가능한 아이디 입니다.'); 
							$('#id_check').css('color', 'blue'); 
							chCnt = 1;
		     			}
		           }
				});
			})
		}
	});
	
	$("#username").on("propertychange change keyup paste input", function(){
		
		var regexp = /[^a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]/gi
		$(this).val($(this).val().replace(regexp,''));
		
		if (nameCh.test($('#username').val()) || $('#username').val() == '') {
			$('#name_check').text(''); 
		}else{
			$('#name_check').text('한글,영어 2~10자 이내로 입력하세요. (특수기호, 공백, 숫자 사용 불가)'); 
			$('#name_check').css('color', 'red');
		}
	});


	$("#userpw").click(function(){
		pwnum = 0
		$('#userpwchk').val('')
		$('#pw_check2').text(''); 
			
	});
	
	$("#userpw").on("propertychange change keyup paste input", function(){
		
		var regexp = /[^a-zA-Z0-9!@#$%^*+=-]/gi
		$(this).val($(this).val().replace(regexp,''));
		
		pwnum = 0
		$('#userpwchk').val('')
		$('#pw_check2').text(''); 
		
		if (pwCh.test($('#userpw').val())) {
			$('#pw_check').text('사용가능한 비밀번호입니다.'); 
			$('#pw_check').css('color', 'blue');
			$('#userpwchk').prop("readonly",false);
		}else{
			$('#pw_check').text('8~16자 영문 대 소문자, 숫자, 특수문자(!@#$%^*+=-)를 사용하십시오.'); 
			$('#pw_check').css('color', 'red');
			$('#userpwchk').prop("readonly",true);
		}
		
	});

	$("#userpwchk").on("propertychange change keyup paste input", function(){
				
		var regexp = /[^a-zA-Z0-9!@#$%^*+=-]/gi
		$(this).val($(this).val().replace(regexp,''));
		
		if($(this).val() == ''){
			$('#pw_check2').text('');
			pwnum = 0; 
		
		}else if ($('#userpw').val() != $(this).val()) {
			$('#pw_check2').text('비밀번호가 일치하지 않습니다.'); 
			$('#pw_check2').css('color', 'red');	
			pwnum = 0;			
		
		}else{
			$('#pw_check2').text('비밀번호 일치.'); 
			$('#pw_check2').css('color', 'blue');
			pwnum = 1;
		}
	});
		
	$("select[name=emailSe]").on("click", function(){
	   	
	   	emChk = 0;
	    var em = $(this).closest('#email_Ch').find("input[name=emailAd]");
	   
	    if ($(this).val() == "직접입력") {
	        em.val('');
	        em.prop("readonly",false);
	        
	    } else {
	        em.val($(this).val());
	        em.prop("readonly",true);
	    }
	    
	    if ($('#emailId').val() == '') {
			$('#email_check').text('이메일 아이디를 확인해주세요'); 
			$('#email_check').css('color', 'red');
		}
	});
	
	
	$("#emailAd").on("propertychange change keyup paste input", function(){	
		
		var regexp = /[^a-zA-Z0-9_.-]/gi
		$(this).val($(this).val().replace(regexp,''))
		 
		emChk = 0;
		if (emailCh.test($('#emailId').val()+'@'+$('#emailAd').val())) {
			emChk = 1;
			$('#email_check').text('')
			document.getElementById('useremail').value = $('#emailId').val()+'@'+$('#emailAd').val();	
		
		}else if($("#emailAd").val()==''){
			
			$('#email_check').text('')
		
		}else{
			$('#email_check').text('이메일 양식을 확인해주세요.'); 
			$('#email_check').css('color', 'red');
		}
	});
	
	
	$("#emailId").on("propertychange change keyup paste input", function(){	
		
		var regexp = /[^a-zA-Z0-9_.-]/gi
		$(this).val($(this).val().replace(regexp,''))
		
		emChk = 0; 
		if (emailCh.test($('#emailId').val()+'@'+$('#emailAd').val())) {
			emChk = 1;
			$('#email_check').text('')
			document.getElementById('useremail').value = $('#emailId').val()+'@'+$('#emailAd').val();	
		
		}else if($("#emailId").val() ==''){
			
			$('#email_check').text('')
		
		}else{
			$('#email_check').text('이메일 양식을 확인해주세요.'); 
			$('#email_check').css('color', 'red');
		}
	});
	
	
	$("#pnumL").on("propertychange change keyup paste input", function(){
		
		var regexp = /[^0-9]/gi
		$(this).val($(this).val().replace(regexp,''));
		   	
		if (pnumCh.test($('#pnumF').val()+$('#pnumM').val()+$('#pnumL').val())) {
			
			document.getElementById('userpnum').value = $('#pnumF').val()+'-'+$('#pnumM').val()+'-'+$('#pnumL').val();		
			
			$('#pnum_check').text('문자인증을 해주세요.'); 
			$('#pnum_check').css('color', 'blue');
			$('#pnumcheck').attr("disabled", false);

		}else{
			$('#pnum_check').text('휴대폰번호를 확인해주세요.(2~4자 숫자만 사용가능)'); 
			$('#pnum_check').css('color', 'red');
			$('#pnumcheck').attr("disabled", true);
			document.getElementById('userpnum').value = ''
		}
	});
	
	
	$("#pnumM").on("propertychange change keyup paste input", function(){
		
		var regexp = /[^0-9]/gi
		$(this).val($(this).val().replace(regexp,''));
		
		if (pnumCh.test($('#pnumF').val()+$('#pnumM').val()+$('#pnumL').val())) {
			
			document.getElementById('userpnum').value = $('#pnumF').val()+'-'+$('#pnumM').val()+'-'+$('#pnumL').val();		
			
			$('#pnum_check').text('문자인증을 해주세요.'); 
			$('#pnum_check').css('color', 'blue');
			$('#pnumcheck').attr("disabled", false);

		}else{
			$('#pnum_check').text('휴대폰번호를 확인해주세요.(2~4자 숫자만 사용가능)'); 
			$('#pnum_check').css('color', 'red');
			$('#pnumcheck').attr("disabled", true);
			document.getElementById('userpnum').value = ''
		}
	});
	
	
	$('#pnumcheck').click(function(){
			
		if($('#pnumcheck').val() =='인증번호 전송'){
				
			var phoneNumber = document.getElementById('userpnum').value;	
			
			alert("인증번호 발송 완료")
			
			$.ajax({
				type: "GET",
				url: "/memberpnumCheckSNS",
				data: { phoneNumber: phoneNumber },
				success: function(res) {
		
				document.getElementById('chk').value = res
		
				}
			});
			
	
			$("#joinPhoneCheck1").modal({
				remote: '/views/user/page/modal/join.jsp'
			});
			
		}else{
			
			$('#pnum_check').text(''); 
			$('#pnumcheck').attr("disabled", true);
			$('#pnumM').val("");
			$('#pnumL').val("");
			$('#pnumF option:eq(0)').prop("selected", true);
			$('#pnumM').attr("disabled", false);
			$('#pnumL').attr("disabled", false);
			$('#pnumF').attr("disabled", false);
			$('#pnumcheck').val('인증번호 전송')
			document.getElementById('userpnum').value = ""
			document.getElementById('chk').value = 0
		}
		
    });
	

	document.addEventListener('keydown', function(event) {
		
		if (event.keyCode === 13) {
		    event.preventDefault();
		};
	}, true);
	
	
	$('form').on('submit',function(){

		if (!nameCh.test($('#username').val())) { 
			alert('이름을 확인하세요.'); 
			return false;
		} 
		if (!idCh.test($('#userid').val())) { 
			
			alert('아이디를 확인하세요.'); 
			return false; 
		}
		if(chCnt == 0){
			alert('아이디를 중복확인을 하세요.'); 
			return false; 
		}
		if (!pwCh.test($('#userpw').val()) ||  pwnum == 0){
 			alert('비밀번호를 확인하세요.'); 
			return false;
		} 
		if (!pnumCh.test($('#userpnum').val())) { 
			
			alert('휴대폰번호를 확인하세요.'); 
			return false;  
		} 
		if(document.getElementById('chk').value != 1){
			alert('휴대폰 인증 필요.'); 
			return false;
		}
		if(emChk!= 1){
			alert('이메일을 확인하세요.'); 
			return false;
		}
		
		document.getElementById('useremail').value = $('#emailId').val()+'@'+$(emailAd).val();	
		document.getElementById('birthYear').value = $('#birthY').val();
	    document.getElementById('birthDay').value = $('#birthM').val() + '-' + $('#birthD').val();
		
	    alert("회원가입이 완료되었습니다")	
	    frm.action ='joinReg'
	    frm.submit()
	});
	
	
});

function mainGo() {
	frm.action = "/user/mainpage/main"
	frm.submit()
}