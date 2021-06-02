/**
 * 
 */
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
 
function pageChange(i){
	
	var list = {
		userid : document.getElementById('userid').value,
		pageKind : document.getElementById('pagekind').value,
    	page : i
    };
   
	$.ajax({
	   	async : false,
	    type : 'POST',
	    data : JSON.stringify(list),
	    url : "/memberRecord",
	    dataType : "json",
		contentType : "application/json; charset=UTF-8",
		success : function(data) {
			
			$(".fff").remove()
				
			if(data.pdto.page > 0){
				
				if(document.getElementById('pagekind').value == "likemovie"){
					
					for(j in data.like){
						
							var tt ="<div class='fff'><div class = 'likeouter'>"
						
							tt+= "<a href='/user/movie/moviedetail?sub=info&ind="+data.like[j].m_index+"'>"
							tt+="<div class='likeimg'>"
							
							if(data.like[j].imgname!=null){
								tt+= "<img src='/moviedata/"+data.like[j].imgname + "' alt='" +data.like[j].movietitle+ "이미지' />"
							
							}else{
								tt+='이미지없음'
							}
								
							tt+="</div></a>"
							tt+="<a href='/user/movie/moviedetail?sub=info&ind="+data.like[j].m_index+"'>"
							tt+="<div class='liketitle'>"+data.like[j].movietitle+"</div></a>"
							tt+="<div><button class='likeButt' onclick='likeButt("+data.like[j].m_index+")' >"
							tt+=data.like[j].mlike+"</button></div>"
							tt+="<a href='/user/movietime/list?movietitle="+data.like[j].movietitle +"'>"
							tt+="<input type='button' class='changeButt' value='예매하기' />"
							tt+="</a></div>"
							
							$("#add").append(tt)
							
						}
					}
			
				if(document.getElementById('pagekind').value == "writemovie"){
					
					var no = 0;
					
					for(j in data.comment){
					
					
						var tt ="<div class='fff'><div class = 'writeouter'>"
					
						tt+= "<a href='/user/movie/moviedetail?sub=review&ind="+data.comment[j].cate+"'>"
						tt+="<div class='writeimg'>"
						
						if(data.comment[j].imgname!=null){
							tt+= "<img src='/moviedata/"+data.comment[j].imgname + "' alt='" +data.comment[j].movietitle+ "이미지' />"
						
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
						tt+="<span class= 'writeButtouter'>"
						tt+="<button class='changeButt' onclick='writemodifyGo("+data.comment[j].cate +','+ no +")'>"
						tt+='수정'+"</button>"
						tt+="<button class='changeButt' onclick='writedelteGo("+data.comment[j].cate +','+no+")'>"
						tt+='삭제'+"</button></span></div></div>"
						
						no++
						
						$("#add").append(tt)	
						
					}
					
				}
				
				if(document.getElementById('pagekind').value == "seemovie"){
				
					
					for(j in data.purchase){
					
						if(data.like[j].checktime < data.dto.nowDate){
						
							var tt ="<div class='fff'><div class = 'seeouter'>"
						
							tt+= "<a href='/user/movie/moviedetail?sub=info&ind="+data.purchase[j].m_index+"'>"
							tt+="<div class='writeimg'>"
							
							if(data.purchase[j].imgname!=null){
								tt+= "<img src='/moviedata/"+data.purchase[j].imgname + "' alt='" +data.purchase[j].movietitle+ "이미지' />"
							
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
			
			
	     	
	     
	     }
	});
}
