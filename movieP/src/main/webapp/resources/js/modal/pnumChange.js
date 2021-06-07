/**
 * 
 */
var pnumCh = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/; 

$("#newpnum").on("propertychange change keyup paste input", function() {
	   
		var regexp = /[^0-9-]/gi
	   $(this).val($(this).val().replace(regexp,''));
	
	 
})

$('#checknumButt').click(function() {


	var phoneNumber = document.getElementById('newpnum').value;

	alert("인증번호 발송 완료")

	$('#userpnumchk').attr("disabled", false);
	$('#checknewnum').attr("disabled", false);
   
	
	$.ajax({
		type: "POST",
		url: "/memberpnumCheckSNS",
		data: { phoneNumber: phoneNumber },
		success: function(res) {

			$('#checknewnum').click(function() {

				if ($.trim(res) == $('#userpnumchk').val()) {

					alert("휴대폰 인증완료")

					$('#userpnumchk').val("")
					$('#checknum').attr("disabled", true);
					$('#userpnumchk').attr("disabled", true);
					$('#pnumouter').text($('#newpnum').val());
					$('#pumnchangGo').val("변경 취소");
					$('#newpnum').val("");
					$("#close").trigger("click");
					

				} else {

					alert("휴대폰 인증을 다시 해주세요.")

					$('#newpnum').val("")
					$('#userpnumchk').val("")
					$('#userpnumchk').attr("disabled", true);
					$('#checknewnum').attr("disabled", true);
					

				}
			});

		}
	});

});
