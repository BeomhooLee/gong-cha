<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/resources/css/cash.css" />

<script type="text/javascript">
	$(function(){	
		$("input:radio[name=options-outlined]").click(function(){
			if($("input:radio[name=options-outlined]:checked").attr("id")=='direct_attack'){
				$('#amount_form').attr("disabled",false);
			}else{
				$('#amount_form').attr("disabled",true);
				$('#amount_form').val('');
			}
		});
	});
</script>

<script type="text/javascript">
	function select_now(){
	    $('button').prop('disabled', true);
	    
	    if($("input:radio[name=options-outlined]:checked").val()=='direct_attack'){
	    	if ($('#amount_form').val() != '' && $('#deposit_name').val() != '' && $('#deposit_method').is(":checked") && $('#deposit_check').is(":checked")) {
	            $('button').prop('disabled', false);
	            $('button').removeClass('btn__disabled');
	        }
	        else {
	            $('button').prop('disabled', true);
	            $('button').addClass('btn__disabled');
	        }
	    }else{
	        if ($('#deposit_name').val() != '' && $('#deposit_method').is(":checked") && $('#deposit_check').is(":checked")) {
	            $('button').prop('disabled', false);
	            $('button').removeClass('btn__disabled');
	        }
	        else {
	            $('button').prop('disabled', true);
	            $('button').addClass('btn__disabled');
	        }
	    }
	    
	}
	
	
</script>

<script type="text/javascript">
 $(document).ready(function(){
 
   $("#amount_form").on("keyup", function() {
	   var num = /^[0-9]+$/;
	   
	   if(!num.test($('#amount_form').val())){
		   $('#amount_form').val('');
		   alert('숫자만 입력하세요');
	   }
   });
   
   $("#deposit_name").on("keyup", function() {
	   var eng = /^[a-zA-Z]*$/;
	   var kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	   
	   if(!((eng.test($('#deposit_name').val())) || (kor.test($('#deposit_name').val())))){
		   $('#deposit_name').val('');
		   alert('한글 6글자, 영어 18글자 이내로 입력해주세요');
	   }else{
		   
		  if((eng.test($('#deposit_name').val()))){
			  if($("#deposit_name").val().length > 18){
			  	alert('글자수가 너무 많습니다.');
			  	$("#deposit_name").val($(this).val().substring(0, 18))
			  }
		  }else{
			  if($("#deposit_name").val().length > 6){
				  	alert('글자수가 너무 많습니다.');
				  	$("#deposit_name").val($(this).val().substring(0, 6))
		  	  }
	      }
		
	   }
   });
 });
 </script>
	<form action="/charge" method="post">
		<div class="select_amount" style="margin: 20px 200px;">
			<p>충전할 금액
			<div class="select_amount_box">
			
				<div class="amount_btn">
					<input type="radio" class="btn-check" name="options-outlined" id="1000원" value="1000" onclick="select_now();"checked >
					<label class="btn btn-outline-success" for="1000원">1000원</label>
				</div>
				
				<div class="amount_btn">
					<input type="radio" class="btn-check" name="options-outlined" id="5000원" value="5000" onclick="select_now();">
					<label class="btn btn-outline-success" for="5000원">5000원</label>
				</div>
				
				<div class="amount_btn">
					<input type="radio" class="btn-check" name="options-outlined" id="10000원" value="10000" onclick="select_now();">
					<label class="btn btn-outline-success" for="10000원">10000원</label>
				</div>
				
				<div class="amount_btn">
					<input type="radio" class="btn-check" name="options-outlined" id="20000원" value="20000" onclick="select_now();">
					<label class="btn btn-outline-success" for="20000원">20000원</label>
				</div>
				
				<div class="amount_btn">
					<input type="radio" class="btn-check" name="options-outlined" id="30000원" value="30000" onclick="select_now();">
					<label class="btn btn-outline-success" for="30000원">30000원</label>
				</div>
				
				<div class="amount_btn">
					<input type="radio" class="btn-check" name="options-outlined" id="50000원" value="50000" onclick="select_now();">
					<label class="btn btn-outline-success" for="50000원">50000원</label>
				</div>
				
				<div class="amount_btn">
					<input type="radio" class="btn-check" name="options-outlined" id="direct_attack" value="direct_attack" onclick="select_now();">
					<label class="btn btn-outline-success" for="direct_attack">직접 입력</label>
				</div>
				
				<div class="amount_input">
					<input id=amount_form name="amount_form" class="form-control" type="text" disabled numberOnly onchange="select_now();">
				</div>
				
			</div>
		</div>
		
		<div class="select_amount" style="margin: 20px 200px;">
			<p>입금자명
			<div class="amount_deposit">
				<input id="deposit_name" name="deposit_name" class="form-control form-control-lg" type="text" placeholder="한글 6글자, 영어 18글자 이내로 입력해주세요" aria-label=".form-control-lg example" 
				onchange="select_now();">
			</div>
		</div>
		
		<div class="select_amount" style="margin: 20px 200px;">
			<p>결제 수단
			<div class="amount_deposit">
				<input type="radio" id="deposit_method" name="deposit_method" onclick="select_now();" checked>&nbsp;&nbsp;
				<label for="deposit_method">무통장 입금</label>
			</div>
		</div>
		
		<div class="select_amount" style="margin: 20px 200px;">
			<p>결제 동의
			<div class="amount_deposit">
				<input type="checkbox" id="deposit_check" name="deposit_check" onclick="select_now();">&nbsp;&nbsp;
				<label for="deposit_check">입금자명과 입금 금액을 확인하였습니다.</label>
			</div>
		</div>
		
		<div class="select_amount" style="margin: 20px 200px;">
			<button class="btn__disabled">충전 신청</button>
		</div>
		<%
			String social_no = request.getParameter("social_no");
			String stadium_no = request.getParameter("stadium_no");
		%>
		<input type="hidden" name="stadium_no" value="<%=stadium_no%>"/>
		<input type="hidden" name="social_no" value="<%=social_no%>"/>
	</form>
		
<jsp:include page="../include/footer.jsp"></jsp:include>