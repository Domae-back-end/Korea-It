/**
 * 
 */
 $(function() {

	var date = new Date();
	var changeChars; 
	var currMonth = date.getMonth()+1;
	var currYear = date.getFullYear();
	var option;
	 
	for(var i = 0;i <=6 ;i++){
		
		var changeMonth = currMonth--;
		var changeYear = currYear;
		
		if(changeMonth <= 1){
			currMonth = 12;
			currYear--;
		}
		
		if(changeMonth < 10)
			changeChars = "0"+changeMonth;
		else
			changeChars = changeMonth;
		 
		option = new Option();
		option.value = changeYear + "-" + changeChars;
		option.text = changeYear + "년" + changeChars+ "월" ;
		document.getElementById("moiverecord").options.add(option);
	}
		
	
	$('#check').click(function(){
		
		$.ajax({
	    	async : true,
	        type : 'POST',
	        data : JSON.stringify({userid : $('#userid').val(), userpw : $('#userpwchk').val()}),
	        url : "/memberCheck",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				
				if(data.dto!=null){
				
					alert("비밀번호가 일치합니다.")		
					frm.action = "/member/mypage/myinforchange"
					frm.submit();
			
				}else{ 
					alert("비밀번호가 일치하지않습니다.")
	     		}
	     	}
		});
	});
	
	$('#mainGo').click(function(){
		frm.action = "/member/mypage/mypageMain"
		frm.submit();
	});
	
	$("input:radio[name=moivepur]").click(function(){
 
        if($("input[name=moivepur]:checked").val() == "now"){
            $("#moiverecord").attr("disabled",true);
            $("#moiveButt").attr("disabled",true);
 
        }else{
              $("#moiverecord").attr("disabled",false);          
              $("#moiveButt").attr("disabled",false);  
        }
    });
    
  
    $("#moiveButt").click(function(){
    	console.log($('#userid').val())
 		
		
    });
    
 
});
