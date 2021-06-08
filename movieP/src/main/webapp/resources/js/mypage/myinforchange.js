/**
 * 
 */
$(function() {

	$("#inforDelete").click(function() {

		alert("비밀번호 확인이 필요합니다.")

		$("#inforDelete1").modal({
			remote: '/views/user/page/modal/delete.jsp'
		});
	});

	$("#inforDeleteNaver").click(function() {

		if(confirm("탈퇴시 다시 로그인이 불가합니다. 정말로 탈퇴하시겠습니까?")){
			
			var list = {
				userid : document.getElementById('userid').value,
				kind : '네이버'
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
						alert("탈퇴처리되었습니다")
						frm.action = "/logout"
						frm.submit();
					}
		     	}
			});
			
		}
	});

	$('#pumnchangGo').click(function() {

		if ($('#pumnchangGo').val() == '휴대폰번호 변경') {
			
			if (confirm("휴대폰 번호를 변경하시겠습니까?")) {

				$("#changePnum1").modal({
					remote: '/views/user/page/modal/pnumChange.jsp'

				});

			}

		} else {

			$('#pnumouter').text($('#userpnum').val());
			$('#pumnchangGo').val('휴대폰번호 변경')
		}

	});



	$("#changepw").click(function() {

		frm.action = "/member/mypage/mypwchange"
		frm.submit();

	});



	$("#informodifyGo").click(function() {


		var num = $('#pnumouter').text()
		console.log(num)

		var list = {
			useremail: document.getElementById('useremail').value,
			userpnum: num,
			userid: document.getElementById('userid').value
		};

		$.ajax({
			async: false,
			type: 'POST',
			data: JSON.stringify(list),
			url: "/membermodify",
			dataType: "json",
			contentType: "application/json; charset=UTF-8",
			success: function(data) {

				if (data.cnt > 0) {

					alert("회원정보가 수정되었습니다")
					frm.action = "/member/mypage/mypageMain"
					frm.submit();
				}

			}
		});
	});





});  