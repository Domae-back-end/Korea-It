function detailGo(aa) {
	//alert("detailGo 눌렀냐?"+aa)
	frm.action = "serviceNoticeDetail"
	$("#detailId").val(aa)
	//alert(aa+"번으로 이동")
	frm.submit()
}