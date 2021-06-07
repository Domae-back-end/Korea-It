$(function() {
	
	var phoneNumber = document.getElementById('userpnum').value;	
	var reschk = '';

	$.ajax({
		type: "GET",
		url: "/memberpnumCheckSNS",
		data: { phoneNumber: phoneNumber },
		success: function(res) {

			reschk = res;

		}
	});

	$('#joinPnum').on("propertychange change keyup paste input", function(){
	
		var regexp = /[^0-9]/gi
		$(this).val($(this).val().replace(regexp,''));
	});


	$('#joinPnumChk').click(function(){ 
		
		if($.trim(reschk) == $('#joinPnum').val()){
	    	
	    	alert('문자인증을 완료했습니다')
	        
	        $('#joinPnum').val("")                
			$('#pnum_check').text('휴대폰 인증완료');
			$('#pnumcheck').val('다시 입력') 
			$("#close").trigger("click");
	       
	        pnumchCnt = 1;
	                
		}else{
			
			alert("인증 번호가 일치하지않습니다.")
			
			$('#pnum_check').text(''); 
			$('#joinPnum').val("") 
			$('#pnumcheck').attr("disabled", true);
			$('#pnumM').attr("disabled", false);
			$('#pnumL').attr("disabled", false);
			$('#pnumF').attr("disabled", false);
			$('#pnumM').val("");
			$('#pnumL').val("");
			$('#pnumF').find('option:first').attr('selected', 'selected');
	        $('#pnumcheck').val('인증번호 전송')
	        document.getElementById('userpnum').value = ""
	        $("#close").trigger("click");
		}
	});
	
	
	$('.close').click(function() {
		$('#pnumcheck').val('다시 입력')
		$("#joinPnum").val('')
	});	
	

});