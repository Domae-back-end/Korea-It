/**
 * 
 */
 $(function() {
 
	if(document.getElementById("moiverecord") !=null){
		
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
            
            location.reload()
 
        }else{
              $("#moiverecord").attr("disabled",false);          
              $("#moiveButt").attr("disabled",false);  
        }
    });
    
  
    $("#moiveButt").click(function(){
    	
    	var list = {
    		userid : document.getElementById('userid').value,
    		date :  document.getElementById('moiverecord').value,
    		pageKind : 'seemovie'
    	};
    	
    	purchaselistChange(list);
    	
    });
    
    
    
    
    
    
    
    $("#changepw").click(function(){
    	
    	frm.action = "/member/mypage/mypwchange"
		frm.submit();

	});
     
	$("#pwmodifyGo").click(function(){
    	
    	var list = {
    		userid : document.getElementById('userid').value,
    		userpw :  document.getElementById('nowpw').value
    	};
    	
    	$.ajax({
	    	async : false,
	        type : 'POST',
	        data : JSON.stringify(list),
	        url : "/memberCheck",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				
    	
				if(data.dto!=null && $('#newpw').val() == $('#newpwch').val()){
					
					var inlist = {
			    		userid : document.getElementById('userid').value,
			    		userpw :  $('#newpw').val()
	    			};

					$.ajax({
				    	async : false,
				        type : 'POST',
				        data : JSON.stringify(inlist),
				        url : "/membermodify",
				        dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(data) {
							
							if(data.cnt>0){
								alert("비밀번호 변경이 완료되었습니다.")
								frm.action = "/member/mypage/mypageMain"
								frm.submit();
							}
				     	}
					});
	
				}else{
					alert("비밀번호를 다시 확인해주세요.")
				}
					
	     	}
		});
	
	});
     
 	$('#pumnchangGo').click(function(){
 	
 		if($('#pumnchangGo').val() == "휴대폰번호 변경"){
 	
			$('#newpnum').attr("type", "text");
			$('#checknumButt').attr("type", "button");
			$('#pumnameouter').css("height", "95px");
			$('#pumnameouter').css("line-height", "95px");
			$('#pumMidouter').css("height", "95px");
			$('#pumnchangGo').val("변경 취소");
 		
 		}else{
 		
 		  	$('#newpnum').attr("disabled", false);
 			$('#newpnum').attr("type", "hidden");
			$('#checknumButt').attr("type", "hidden");
			$('#pumnameouter').css("height", "50px");
			$('#pumnameouter').css("line-height", "50px");
			$('#pumMidouter').css("height", "50px");
			$('#pumnchangGo').val("휴대폰번호 변경");
			$('#checknum').val("") 
			$('#newpnum').val("") 
	        $('#checknum').attr("type", 'hidden');
	        $('#numfinish').attr("type", 'hidden');
 		
 		}
 	
 	});
 
     
    
    $('#checknumButt').click(function(){
		
			
		var phoneNumber = document.getElementById('newpnum').value;
			
	    alert("인증번호 발송 완료")
	       	
		$('#checknum').attr("type", "text");
		$('#checknumButt').attr("type", "hidden");
		$('#numfinish').attr("type", "button");
			
	    $.ajax({
			type: "POST",
	      	url: "/memberpnumCheckSNS",
	        data: {phoneNumber : phoneNumber},
	       	success: function(res){
	            	
	           $('#numfinish').click(function(){
	                    
	           		if($.trim(res) == $('#checknum').val()){
	                	
	                	alert("휴대폰 인증완료")
	          
	                    $('#newpnum').attr("disabled", true);
	                    $('#checknum').attr("disabled", true);
						$('#numfinish').attr("disabled", true);
							
					}else{
	                    
	                	alert("휴대폰 인증을 다시 해주세요.")
						
						$('#checknum').val("") 
						$('#newpnum').val("") 
	                    $('#checknum').attr("type", 'hidden');
	                    $('#numfinish').attr("type", 'hidden');
	                    $('#checknumButt').attr("type", "button");
	                   	
	                }
				});
	
	    	 }
	    });
   
	});	
    
    
    
        
    $("#inforDelete").click(function(){
    	
    	var list = {
    		userpw : document.getElementById('userpw').value,
    		userid :  document.getElementById('userid').value,
    		kind:'탈퇴'
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
					frm.action = "/user/main"
					frm.submit();
				}
	
	     	}
		});
    });
        
    $("#inforNaverDelete").click(function(){
    	
    	var list = {
    		userid :  document.getElementById('userid').value,
    		kind:'탈퇴'
    	};
    	
    	$.ajax({
	    	async : false,
	        type : 'POST',
	        data : JSON.stringify(list),
	        url : "/memberdelete",
	        dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
			
				if(data.dcnt >0){
							
					alert("탈퇴처리되었습니다")
					frm.action = "/user/main"
					frm.submit();
				}
	
	     	}
		});
    });
    
    
    
        
    $("#informodifyGo").click(function(){
    
   	 	$('#newpnum').attr("disabled", false);
    	
    	if( document.getElementById('newpnum').value == null){
    		var num = document.getElementById('userpnum').value
    	
    	}else{
    		var num = document.getElementById('newpnum').value
    	}
    	
    	var list = {
    		useremail : document.getElementById('useremail').value,
    		userpnum :  num,
    		userid :  document.getElementById('userid').value
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
							
					alert("회원정보가 수정되었습니다")
					frm.action = "/member/mypage/mypageMain"
					frm.submit();
				}
	
	     	}
		});
    });
    
    
 
 
 
	$("#serviceGo").click(function(){
    	frm.action = "/user/serviceC/servicePersonal"
		frm.submit();
	});
 
 	$("#qnafind").click(function(){
    	
    	var list = {
	    	userid : document.getElementById('userid').value,
	    	qnastate :  document.getElementById('qnastate').value,
	    	qnacontent :  $('#qnacontent').val()
    	};
    	qnalistChange(list);
    	
	});
	
	
	
	
});



function likeButt(data){
		
	var list = {
    	userid : document.getElementById('userid').value,
    	like : document.getElementById('like').value,
    	index : data
    };
   
	$(this).click(function(){
		
		$.ajax({
		    async : false,
		    type : 'POST',
		  	data : JSON.stringify(list),
			url : "/membermodify",
		    dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
					
				if(data.cnt >0){
				    	
					$.ajax({
						async : false,
					    type : 'POST',
					    data : JSON.stringify(list),
					    url : "/memberdelete",
					    dataType : "json",
						contentType : "application/json; charset=UTF-8",
						success : function(data) {
								
							if(data.dcnt >0){
								
								alert("좋아요가 취소되었습니다.")
								location.reload();
								
							}
					     }
					});
				}
		     }
		});
		
	})
}

function writemodifyGo(data,no){
    	
	$(".writetnow").eq(no).css('display','none')
	$(".writeArea").eq(no).css('display','block')
		
	$(".writeButtouter").eq(no).remove()
		
	var tt ="<span class='writeButtouter'>"
	tt+="<button class='changeButt' onclick='writemodifyfinish(" + data + ',' + no + ")'>" +"완료"
	tt+="</button>"
	tt+="<button class='changeButt' onclick='writemodifyNo(" + data + ',' + no + ")'>" +'취소'
	tt+="</button>"
	tt+="</span>"
		
	$(".writetitleouter").eq(no).append(tt)	
		
}

function writedelteGo(data,no){
	
	var list = {
		userid : document.getElementById('userid').value,
		content : $('.writeArea').eq(no).val(),
		index : data
    };
    
    if(confirm("작성하신 관람평을 삭제하시겠습니까?")){
        	
		$.ajax({
			
			async : false,
			type : 'POST',
			data : JSON.stringify(list),
		    url : "/memberdelete",
		    dataType : "json",
			contentType : "application/json; charset=UTF-8",
			success : function(res) {
				
				if(res.dcnt >0){
								
					alert("관람평이 삭제되었습니다.")
					location.reload();
				}
		     }
		});
	}	
}


function writemodifyNo(data,no){
    	
	$(".writetnow").eq(no).css('display','block')
	$(".writeArea").eq(no).css('display','none')
		
	$(".writeButtouter").eq(no).remove()
		
	var tt ="<span class='writeButtouter'>"
	tt+="<button class='changeButt' onclick='writemodifyGo(" + data + ',' + no + ")'>" +"수정"
	tt+="</button>"
	tt+="<button class='changeButt' onclick='writedelteGo(" + data + ',' + no + ")'>" +'삭제'
	tt+="</button>"
	tt+="</span>"
		
	$(".writetitleouter").eq(no).append(tt)	
		
}

function writemodifyfinish(data,no){
	
	var list = {
		userid : document.getElementById('userid').value,
		content : $('.writeArea').eq(no).val(),
		index : data
    };
    
    
	$.ajax({
		
		async : false,
		type : 'POST',
		data : JSON.stringify(list),
	    url : "/membermodify",
	    dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(res) {
			
			if(res.cnt >0){
							
				alert("관람평이 수정되었습니다.")
				
				$(".writetnow").eq(no).text($('.writeArea').eq(no).val())
				
				$(".writetnow").eq(no).css('display','block')
				$(".writeArea").eq(no).css('display','none')
				
				$(".writeButtouter").eq(no).remove()
		
				var tt ="<span class='writeButtouter'>"
				tt+="<button class='changeButt' onclick='writemodifyGo(" + data + ',' + no + ")'>" +"수정"
				tt+="</button>"
				tt+="<button class='changeButt' onclick='writedelteGo(" + data + ',' + no + ")'>" +'삭제'
				tt+="</button>"
				tt+="</span>"
					
				$(".writetitleouter").eq(no).append(tt)	
				
			}
	
	     }
	});
		
}

function qnalistChange(list){
    	
    $.ajax({
	    async : false,
	    type : 'POST',
		data : JSON.stringify(list),
	    url : "/memberRecord",
	    dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			
			$(".fff").remove()
				
			if(data.qna!=null){
										
				for(i in data.qna ){
					
					if(data.qna[i].persatime==null)
						data.qna[i].persatime =""
						
					var tt ="<div class='fff'>"
					tt+="<div class='puchaseinner'>"+ data.qna[i].persid + "</div>"
					tt+="<div class='puchaseinner'>" +data.qna[i].perstitle+ "</div>"
					tt+="<div class='puchaseinner'>" +data.qna[i].persqtime+ "</div>"
					tt+="<div class='puchaseinner'>" +data.qna[i].persatime+'('+data.qna[i].persstate+')'
					tt+="</div>"+"</div>"

					$("#qnaRecord").append(tt)	
					
				}
					
			var pp = "<div class='fff'>"
				
			if(data.pdto.startPage > 1)
				pp += "<input type='button' class='btnnn pagebtn pagebtn_lr' onclick='qnapageChange("+data.pdto.startPage-1+ ")' value='&lt' />"
							
			for( var i = data.pdto.startPage ; i <= data.pdto.endPage ; i++){
								
				if(i == data.pdto.page){
					pp += "<input type='button' class='pagebtn_sel' readonly value="+i+ ">"
				}else{
					pp += "<input type='button' class='btnnn pagebtn' onclick='qnapageChange("+i+ ")' value="+i+ ">"
				}
			}			
	     	
	     	if(data.pdto.endPage < data.pdto.total)
				pp += "<input type='button' class='btnnn pagebtn pagebtn_lr' onclick='qnapageChange("+data.pdto.endPage+1+ ")' value='&gt' />"
	     		
	     		pp+="</div>"
	     		
	     		$("#pageRecord").append(pp)
				
			}
	     }
	});
}

function qnapageChange(i){
	
	var list = {
    	userid : document.getElementById('userid').value,
    	qnastate :  document.getElementById('qnastate').value,
    	qnacontent :  $('#qnacontent').val(),
    	page : i
    };
	
	qnalistChange(list);
}

function purchaselistChange(list){

	$.ajax({
	    async : false,
	    type : 'POST',
		data : JSON.stringify(list),
	    url : "/memberRecord",
	    dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			
			$(".fff").remove()
				
			if(data.purchase!=null){
										
				for(j in data.purchase ){
					
					var tt ="<div class='fff'><div class = 'purchaseMainouter'>"
					
					tt+= "<a href='/user/movie/moviedetail?sub=review&ind="+data.purchase[j].m_index+"'>"
					tt+="<div class='purchaseimg'>"
					
					if(data.purchase[j].imgname!=null){
						tt+= "<img src='/moviedata/"+data.purchase[j].imgname + "' alt=' +data.purchase[j].movietitle+ '이미지' />"
					
					}else{
						tt+='이미지없음'
					}
						
					tt+="</div></a>"
					tt+="<div class='puinfor' id='puinfor'><div>"
					tt+='예매번호 :'+"<span class='saleslink'>"+ data.purchase[j].saleslink + "</span></div>"
					tt+= "<div>" +'영화명 : '+ data.purchase[j].movietitle +"</div>"
					tt+= "<div><div class='purchasespace'>"+'상영관 : '+ data.purchase[j].sectorNo +"</div>"
					tt+="<span>"+'관람인원 :'
					
					if(data.purchase[j].A!=null)
						tt+= '성인'+ data.purchase[j].A +'명'
					if(data.purchase[j].B!=null)
						tt+= '청소년'+ data.purchase[j].B +'명'
					if(data.purchase[j].C!=null)
						tt+= '어린이'+ data.purchase[j].C +'명'
					tt+="</span>"
					tt+="</div>"
					tt+="<div><div class='purchasespace'>"+'관람일시'+ data.purchase[j].starttime+"</div>"
					tt+="<span>"+ '관람좌석 : '+ data.purchase[j].seatNo +"</span></div>"
					tt+="<div class='purchasespace'>"+'결제일시 : '+ data.purchase[j].sales_time +"</div>"
					tt+="<div class='purchasespaceButt'><button class='changeButt'>"+'결제정보'+"</button>"
						if(data.purchase[j].checktime > data.dto.nowDate)
							tt+="<button class='changeButt' onclick='ticketCancel("+data.purchase[j].saleslink +")'>"+'예매취소'+"</button>"		
						
					tt+="</div></div></div>"
					
					$("#recordpurchase").append(tt)	
					
				}
					
			var pp = "<div class='fff'>"
				
			if(data.pdto.startPage > 1)
				pp += "<input type='button' class='btnnn pagebtn pagebtn_lr' onclick='purchasepageChange("+data.pdto.startPage-1+ ")' value='&lt' />"
							
			for( var i = data.pdto.startPage ; i <= data.pdto.endPage ; i++){
								
				if(i == data.pdto.page){
					pp += "<input type='button' class='pagebtn_sel' readonly value="+i+ ">"
				}else{
					pp += "<input type='button' class='btnnn pagebtn' onclick='purchasepageChange("+i+ ")' value="+i+ ">"
				}
			}			
	     	
	     	if(data.pdto.endPage < data.pdto.total)
				pp += "<input type='button' class='btnnn pagebtn pagebtn_lr' onclick='purchasepageChange("+data.pdto.endPage+1+ ")' value='&gt' />"
	     		
	     		pp+="</div>"
	     		
	     		$("#pageRecord").append(pp)
				
			}
	     }
	});
	
    	
}

function purchasepageChange(i){
	
	var list = {
    	userid : document.getElementById('userid').value,
    	date :  document.getElementById('moiverecord').value,
    	pagekind : 'mypurchase',
    	page : i
    };
	
	purchaselistChange(list);
}

function pageChange(i){
	
	var list = {
		userid : document.getElementById('userid').value,
		pagekind : $('#pageKind').val(),
    	page : i
    };
    console.log(i)
	$.ajax({
	   	async : false,
	    type : 'POST',
	    data : JSON.stringify(list),
	    url : "/memberRecord",
	    dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			
			$(".fff").remove()
			
			if(data.pdto.page > 1){
				
				if($('#pageKind').val() == 'writemovie' ){
					
					var no = 0;
					
					for(j in data.comment){
					
					
						var tt ="<div class='fff'><div class = 'writeouter'>"
					
						tt+= "<a href='/user/movie/moviedetail?sub=review&ind="+data.comment[j].cate+"'>"
						tt+="<div class='writeimg'>"
						
						if(data.comment[j].imgname!=null){
							tt+= "<img src='/moviedata/"+data.comment[j].imgname + "' alt=' +data.comment[j].movietitle+ '이미지' />"
						
						}else{
							tt+='이미지없음'
						}
							
						tt+="</div></a>"
						tt+= "<a href='/user/movie/moviedetail?sub=review&ind="+data.comment[j].cate+"'>"
						tt+="<div class='writetitle'>"+data.comment[j].movietitle+' | 좋아요: '+ data.comment[j].mlike +"</div></a>"
						tt+="<div class='writetnow'>"+data.comment[j].postcontent+"</div>"
						tt+="<textarea class='writeArea' rows='1' cols='40'>"+data.comment[j].postcontent+"</textarea>"
						tt+="<div class='writetitleouter'>"
						tt+="<div class='writetitle2'>"+ '작성일 : '+ data.comment[j].posttime+"</div>"
						tt+="<span class= 'writeButtouter'><button class='changeButt' onclick='writemodifyGo("+data.comment[j].cate +','+ no +"')>"
						tt+='수정'+"</button><button class='changeButt' onclick='writedelteGo("+data.comment[j].cate }+','+no+"')>"
						tt+='삭제'+"</button></span></div></div>"
						
						no++
						
						$("#add").append(tt)	
						
					}
					
				}else if($('#pageKind').val() == 'likemovie'){
				console.log(data.like)
				
					for(j in data.like){
					
						var tt ="<div class='fff'><div class = 'likeouter'>"
					
						tt+= "<a href='/user/movie/moviedetail?sub=info&ind="+data.like[j].m_index+"'>"
						tt+="<div class='likeimg'>"
						
						if(data.like[j].imgname!=null){
							tt+= "<img src='/moviedata/"+data.like[j].imgname + "' alt=' +data.like[j].movietitle+ '이미지' />"
						
						}else{
							tt+='이미지없음'
						}
							
						tt+="</div></a>"
						tt+="<a href='/user/movie/moviedetail?sub=info&ind="+data.like[j].m_index+"'>"
						tt+="<div class='liketitle'>"+data.like[j].movietitle+"</div></a>"
						tt+="<div><button class='likeButt' onclick='likeButt("+data.like[j].m_index+"') >"
						tt+=data.like[j].mlike+"</button></div>"
						tt+="<a href='/user/movietime/list?movietitle="+data.like[j].movietitle +"'>"
						tt+="<input type='button' class='changeButt' value='예매하기' />"
						tt+="</a></div>"
						
						$("#add").append(tt)
						

					}
				
				}else{
				
					for(j in data.purchase){
					
						if(data.like[j].checktime < data.dto.nowDate){
						
							var tt ="<div class='fff'><div class = 'seeouter'>"
						
							tt+= "<a href='/user/movie/moviedetail?sub=info&ind="+data.purchase[j].m_index+"'>"
							tt+="<div class='writeimg'>"
							
							if(data.purchase[j].imgname!=null){
								tt+= "<img src='/moviedata/"+data.purchase[j].imgname + "' alt=' +data.purchase[j].movietitle+ '이미지' />"
							
							}else{
								tt+='이미지없음'
							}
								
							tt+="</div></a>"
							tt+="<div class='seeContent'>"
							tt+="<a href='/user/movie/moviedetail?sub=info&ind="+data.purchase[j].m_index +"'><div class='seeContentitle'>"
							tt+=data.purchase[j].movietitle + "</div></a>"
							tt+="<div>"+data.purchase[j].starttime +"</div>"
							tt+="<div>"+data.purchase[j].sectorNo +"</div>"
							tt+="<a href='/user/movie/moviedetail?sub=info&ind="+data.purchase[j].m_index +"'>"
							tt+="<button class='changeButt' id='seewriteG'>"+'관람평쓰기'+"</button>"
							tt+="</a></div>	</div>"
							
							$("#add").append(tt)
					
						}
	
					}
				
				}
			
			
			var pp = "<div class='fff'>"
				
			if(data.pdto.startPage > 1)
				pp += "<input type='button' class='btnnn pagebtn pagebtn_lr' onclick='pageChange("+data.pdto.startPage-1+ ")' value='&lt' />"
							
			for( var i = data.pdto.startPage ; i <= data.pdto.endPage ; i++){
								
				if(i == data.pdto.page){
					pp += "<input type='button' class='pagebtn_sel' readonly value="+i+ ">"
				}else{
					pp += "<input type='button' class='btnnn pagebtn' onclick='pageChange("+i+ ")' value="+i+ ">"
				}
			}			
	     	
	     	if(data.pdto.endPage < data.pdto.total)
				pp += "<input type='button' class='btnnn pagebtn pagebtn_lr' onclick='pageChange("+data.pdto.endPage+1+ ")' value='&gt' />"
	     		
	     		pp+="</div>"
	     		
	     		$("#pageRecord").append(pp)
	     	
	     }
	});
}


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
