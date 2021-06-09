$(function() {

	var pnumCh = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/; 
	
	$("#newpnum").on("propertychange change keyup paste input", function() {
		   
			var regexp = /[^0-9-]/gi
		   	$(this).val($(this).val().replace(regexp,''));
		   
		   
		   	if (pnumCh.test($(this).val()) || $(this).val()=='') {
				
				$('#pnum_check').text(''); 
				$('#checknumButt').attr("disabled", false);
			
			}else{
				
				$('#pnum_check').text('-를 포함해서 숫자만 입력해주세요'); 
				$('#pnum_check').css('color', 'red');
			}
	
	})
	
	var resch = ''
	
	$('#checknumButt').click(function() {
		var phoneNumber = document.getElementById('newpnum').value;
	
		alert("인증번호 발송 완료")
	
		$('#userpnumchk').attr("disabled", false);
		$('#checknewnum').attr("disabled", false);
		
		$.ajax({
			type: "GET",
			url: "/memberpnumCheckSNS",
			data: { phoneNumber: phoneNumber },
			success: function(res) {
				
				resch = res
	
			}
		});
	
	});
	
	$('#checknewnum').click(function() {
				
		if($.trim(resch) == $('#userpnumchk').val()) {
	
			alert("휴대폰 인증완료");
	
			$('#userpnumchk').val('');
			$('#checknum').attr("disabled", true);
			$('#userpnumchk').attr("disabled", true);
			$('#pnumouter').text($('#newpnum').val());
			$('#pumnchangGo').val("변경 취소");
			$('#newpnum').val('');
			$('.spanMM').text('등록버튼을 눌러야 변경 완료됩니다.')
			$("#close").trigger("click");
	
			} else {
						
				$('#newpnum').val("")
				$('#userpnumchk').val("")
				$('#userpnumchk').attr("disabled", true);
				$('#checknewnum').attr("disabled", true);
				$('#checknumButt').attr("disabled", true);
	
			}
		});
		
		
	$('.close').click(function() {
	
		$('#newpnum').val("")
		$('#userpnumchk').val("")
		$('#userpnumchk').attr("disabled", true);
		$('#checknewnum').attr("disabled", true);
		$('#checknumButt').attr("disabled", true);
		$('#pnum_check').text(''); 
	});	
	
})