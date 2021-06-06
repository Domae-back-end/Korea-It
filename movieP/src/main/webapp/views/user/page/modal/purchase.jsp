<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" id="time" value="${param.time}" />    
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	<h2>결제 정보</h2>
</div>

<div class="modal-body">
	<h4>결제상세정보</h4>
	<div class="modalouter">
		<div class="modalmiddle">
			<div class="modalname">결제금액</div>
			<div class="modaldata">${param.price}</div>
		</div>
		<div class="modalmiddle">
			<div class="modalname">결제일시</div>
			<div class="modaldata" id="modaldata">${param.time.replace(","," ")}</div>
		</div>
		<div class="modalmiddle">
			<div class="modalname">결제수단</div>
			<div class="modaldata">${param.type}</div>
		</div>
	</div>
	<div>
	<button class="close" id="close" data-dismiss="modal">닫기</button>
	</div>
</div>
    