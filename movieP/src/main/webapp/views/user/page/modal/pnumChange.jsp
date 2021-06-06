<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

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



</script>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	<h2>핸드폰번호 변경</h2>
</div>

<div class="modal-body bodywidth">
	<h4>핸드폰번호 입력</h4>
	<div class="main">
		<div class="outF">
			<div class="outD" >휴대폰 번호</div>
			<input type="text"  class="outT" id="newpnum" name="newpnum" maxlength="20" placeholder="'-'제외하고 입력" autocomplete="off" />
			<input type="button" class="chButt" id="checknumButt"  value="인증번호 발송"/>
		</div>
		<div class="outF">
			<div class="outD" >인증번호</div>
			<input type="text"  class="outT" id="userpnumchk" name="userpnumchk" disabled="disabled" maxlength="20" autocomplete="off" />
			<input type="button" class="chButt" id="checknewnum" disabled="disabled" value="확인"/>
		</div>
	</div>
	<button class="close" id="close" data-dismiss="modal">닫기</button>
</div>
