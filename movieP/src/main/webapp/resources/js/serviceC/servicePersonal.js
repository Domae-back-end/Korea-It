$(document).ready(function() {
	
	var fileTarget = $('.upload_box .upload_hidden');

	fileTarget.on('change', function() {
		if (window.FileReader) {
			var filename = $(this)[0].files[0].name;
			
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}

		$(this).siblings('.upload_name').val(filename);
	});
});


function emptychk() {
	if (document.getElementById("titleG").value == "") {
		alert("제목을 입력해주세요");
		return false;
	}else if(document.getElementById("contG").value == "") {
		alert("내용을 입력해주세요");
		return false;
	}else {
		document.fff.submit();
	}
}

function checkfile(input, inputV) {
	var fileLen = inputV.length; 
	var fileLas = inputV.lastIndexOf(".");
	var fileExt = inputV.substring(fileLas+1, fileLen).toLowerCase();
	
	if (fileExt != "jpg" && fileExt != "png" && fileExt != "jpeg") {
		alert("확장자를 확인하세요!");
		
		$('.upload_name').val('파일선택')
        input.value = null;
	}
	
	if (input.files && input.files[0].size > (1 * 1024 * 1024)) {
        alert("파일 사이즈가 1mb 를 넘습니다.");
        
        $('.upload_name').val('파일선택')
        input.value = null;
    }
	
}