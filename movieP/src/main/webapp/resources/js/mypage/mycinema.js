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
	 	var ccc= $(this).attr("cc").replace(/ /g,",");
	 	var ttt= $(this).attr("tt");
	 	
	 	$("#mPrice").html(ddd)
	 	$("#mTime").html(ccc.replace(',',' '))
	 	$("#mType").html(ttt)
	 	
	 	$("#inforpurchase2").modal({
			remote: '/views/user/page/modal/purchase.jsp?price='+ddd +'&time='+ccc+'&type='+ttt
		});
	 
	 });

});

function ticketCancel(i){
	
	var list = {
		userid : document.getElementById('userid').value,
		ticket : i
    };
    
    if(confirm("예매를 취소하시겠습니까?")){
	
		$.ajax({
		    	async : false,
		        type : 'POST',
		        data : JSON.stringify(list),
		        url : "/memberdelete",
		        dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
				
					if(data.dcnt >0 && data.ccnt >0 ){
								
						alert("예매가 취소되었습니다")
						location.reload()
					}
		
		     	}
		});
	}
}
