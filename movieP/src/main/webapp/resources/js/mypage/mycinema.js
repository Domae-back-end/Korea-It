/**
 * 
 */
$(function() { 
	 
	 $(document).on("click", ".qnaDetailGo", function(){
		
			$('#detail').val($(this).attr("dd"));
			qq.action="/member/mypage/myqna"
			qq.submit();	
	});

});