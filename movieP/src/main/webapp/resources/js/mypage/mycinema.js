/**
 * 
 */
$(function() { 
	 
	 $(document).on("click", ".qnaDetailGo", function(){
		
			$('#detail').val($(this).attr("dd"));
			qq.action="/member/mypage/myqna"
			qq.submit();	
	});
	
	 $(".qwer").click(function(){
	 	var ddd= $(this).attr("dd");
	 	var ccc= $(this).attr("cc").replace(/ /g,"");
	 	var ttt= $(this).attr("tt");
	 	
	 	  $("#inforpurchase2").modal({
		      	remote: '/views/user/page/modal/purchase.jsp?price='+ddd +'&time='+ccc+'&type='+ttt
		   	});
	 });

});