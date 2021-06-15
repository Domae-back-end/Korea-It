$(function() {
	//alert("안녕");
	$(".btnnn").click(function(){
		//alert("눌렀냐?"+$(this).attr("dd"))
		$("#pageIN").val($(this).attr("dd"))
		frm.submit()
	})
	
})

function detailGo(aa) {
	//alert("detailGo 눌렀냐?"+aa)
	frm.action = "serviceHistoryDetail"
	$("#detailId").val(aa)
	//alert(aa+"번으로 이동")
	frm.submit()
}