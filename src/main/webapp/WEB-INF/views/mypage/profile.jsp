<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공차고 싶을 땐 공차(GongCha) | 회원정보변경</title>
<link rel="stylesheet" type="text/css" href="/resources/css/profile.css" />
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function post_check() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("roadAddress").value = roadAddr;
						document.getElementById("jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("detailAddress").value = extraRoadAddr;
						} else {
							document.getElementById("detailAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>
<script>
function edit_check(){
	
	if ($.trim($("#email_id").val()) == "") {
		alert("이메일을 입력해주세요!");
		$("#mail_id").val("").focus();
		return false;
	}
	
	$email=$.trim($("#email_id").val());
	$("#email_check").hide();
	let email_check = /[a-z0-9]{5,15}$/;
	if (!(email_check.test($email))) {
			$emailchecktext = '<font color="red" size="2">이메일은 5~15자 까지 영문 소문자와 숫자만 가능합니다.</font>';
			$("#email_check").text('');
			$("#email_check").show();
			$("#email_check").append($emailchecktext);
			$("#email_id").val('').focus();
			return false;
	}
	
	if($.trim($("#email_domain").val())=="none" && $("#email_domain_text").val()==""){
		alert("이메일 주소를 선택해 주세요!");
		$("#email_domain").focus();
		return false;
	}
	
	$domain = $.trim($("#email_domain_text").val());
	$("#domain_check").hide();
	let domain_check = /^(?:\w+\.)+\w+$/g;
	if (!(domain_check.test($domain))) {
			$emailchecktext = '<font color="red" size="2">도메인을 다시 확인해 주세요.</font>';
			$("#domain_check").text('');
			$("#domain_check").show();
			$("#domain_check").append($emailchecktext);
			$("#email_domain_text").val('').focus();
			return false;
	}
	
	$birth = $.trim($("#mem_birth").val())

	if ($birth == "") {
		alert("생년월일을 입력해주세요!");
		$("#mem_birth").val("").focus();
		return false;
	}

	//입력글자 길이 체크
	$("#birth_check").hide();

	if ($birth.length < 8) {
		$birthtext = '<font color="red" size="2">생년월일는 8자 이어야 합니다. ex) 19980312</font>';
		$("#birth_check").text('');
		$("#birth_check").show();
		$("#birth_check").append($birthtext);
		$("#mem_birth").val('').focus();
		return false;
	}
	
	if ($birth.length > 8) {
		$birthtext = '<font color="red" size="2">생년월일는 8자 이어야 합니다. ex) 19980312</font>';
		$("#birth_check").text('');
		$("#birth_check").show();
		$("#birth_check").append($birthtext);
		$("#mem_birth").val('').focus();
		return false;
	}
	
	if($.trim($("#phone02").val())==""){
		alert("휴대폰 번호를 입력해주세요!!");
		$("#phone02").val("").focus();
		return false;
	}
	$phone= $.trim($("#phone02").val());
	$("#phonecheck").hide();
	
	if ($phone.length < 8) {
		$phonetext = '<font color="red" size="2">휴대폰 번호 8자리 입력해주세요!</font>';
		$("#phonecheck").text('');
		$("#phonecheck").show();
		$("#phonecheck").append($phonetext);
		$("#phone02").val('').focus();
		return false;
	}
	
	if ($phone.length > 8) {
		$phonetext = '<font color="red" size="2">휴대폰 번호 8자리 입력해주세요!</font>';
		$("#phonecheck").text('');
		$("#phonecheck").show();
		$("#phonecheck").append($phonetext);
		$("#phone02").val('').focus();
		return false;
	}
	
	if($.trim($("#postcode").val())==""){
		alert("우편번호를 입력해주세요!");		
		return false;
	}
	
	if($.trim($("#extraAddress").val())==""){
		alert("상세 주소를 입력해주세요!!");		
		return false;
	}
	
	if($.trim($("#email_domain").val())=="none" && !($("#email_domain_text").val()=="")){
		$("#email_domain").remove();
		return $("#email_domain_text").val();
	}
	
	if(!($.trim($("#email_domain").val())=="none") && !($("#email_domain_text").val()=="")){
		$("#email_domain_text").remove();
		return $("#email_domain").val();
	}
	
	$owner = $.trim($("#bank_owner").val());
	$("#owner_check").hide();
	let owner_check = /^[가-힣]{2,10}$/;
	if(!($owner.val() == "")){
	if (!(owner_check.test($owner))) {
			$ownwechecktext = '<font color="red" size="2">이름은 2~10자 까지 한글로 입력 가능합니다.</font>';
			$("#owner_check").text('');
			$("#owner_check").show();
			$("#owner_check").append($ownwechecktext);
			$("#bank_owner").val('').focus();
			return false;
	}
	}
	
}

$(function(){	

	$(document).ready(function(){
		if($("#email_domain").val()=="none"){
		$("#email_domain_text").attr("readonly", false);
		}else{
			$("#email_domain_text").attr("readonly", true);
		}
		$('select[name=email_domain]').change(function() {

			if($(this).val()=="none"){

				$('#email_domain_text').val("");
				$("#email_domain_text").attr("readonly", false);

			} else {

				$('#email_domain_text').val($(this).val());

				$("#email_domain_text").attr("readonly", true);

			}

		});

	});

});
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />

	<article>
		<div class="myProfile">
			<div class="inner">
				<div class="headMessage">
					<h3>${id}</h3>
				</div>
			</div>

			<form action="/mypage/edit_ok" method="post" onsubmit="return edit_check();">
				<fieldset>
					<div class="inputWrapA">
						<div class="inputWrapB">
							<label>이름</label> <input name="mem_name" id="name"
								value="${m.mem_name}" placeholder="이름" class="inputFull"
								readonly>
						</div>
					</div>
					<div class="inputWrapA">
						<label>이메일</label>
						<div style="display: flex; width: 100%; align-items:center;" >
							<input name="email_id" id="email_id" value="${m.email_id}">
							&nbsp;@&nbsp;
							<div>
								<input id="email_domain_text" name="email_domain" value="${m.email_domain}"/>
								<select id="email_domain" name="email_domain" style="width: 199px;">
									<option value="none">직접입력</option>
									<option value="naver.com" <c:if test="${m.email_domain == 'naver.com'}">selected</c:if>>naver.com</option>
									<option value="gmail.com" <c:if test="${m.email_domain == 'gmail.com'}">selected</c:if>>gmail.com</option>
									<option value="daum.net" <c:if test="${m.email_domain == 'daum.net'}">selected</c:if>>daum.net</option>
								</select>
							</div>
						</div>
						<span id="email_check"></span> <br>
						<span id="domain_check"></span>
						<label>생년월일</label> <input type="number" name="mem_birth"
							id="mem_birth" value="${m.mem_birth}" style="width: 49%;"
							placeholder="ex)19900101"  maxlength="8">
							<span id="birth_check"></span>
					</div>
					
					<div class="inputWrapB">
						<label>성별</label> <select id="mem_gender" name="mem_gender"
							class="inputFull"
							onFocus="this.initialSelect = this.selectedIndex;"
							onChange="this.selectedIndex = this.initialSelect;">
							<option value="${m.mem_gender}" selected>
								<c:if test="${m.mem_gender == 1}">남성</c:if>
								<c:if test="${m.mem_gender == 2}">여성</c:if>
							
						</select>
					</div>


					<div class="inputWrap"
						style="flex-direction: column; align-items: flex-start;">
						<label>휴대폰 번호</label>
						<div class="phone">
							<select name="phone01" id="phone01">
								<option selected>010</option>
<!-- 								<option>011</option> -->
							</select> <input type="number" name="phone02" value="${m.phone02}"
								placeholder="휴대폰 번호" id="phone02" style="margin-left: 10px;">
						</div>
					</div>
					<span id="phonecheck"></span>
					<div class="inputWrap"
						style="flex-direction: column; align-items: flex-start;">
						<div class="address">
							<label>우편번호</label>
							<div style="display: flex; width: 100%;">
								<input name="postcode" id="postcode" size="3" class="input_box"
									value="${m.postcode}" readonly>
								<button type="button" onclick="post_check();">우편번호 검색</button>
							</div>
							<div style="display: flex;">
								<div
									style="flex-direction: column; align-items: flex-start; margin-right: 10px; width: 49%;">
									<label>도로명 주소</label> <input name="roadAddress"
										id="roadAddress" placeholder="도로명주소" value="${m.roadAddress}"
										readonly>
								</div>
								<div
									style="flex-direction: column; align-items: flex-start; width: 49%;">
									<label>지번 주소</label> <input name="jibunAddress"
										id="jibunAddress" placeholder="지번 주소"
										value="${m.jibunAddress}" readonly> <span id="guide"
										style="color: #999; height: 25px; display: none;"></span>
								</div>
							</div>
							<div style="display: flex;">
								<div
									style="flex-direction: column; align-items: flex-start; width: 49%; margin-right: 10px;">
									<label>상세 주소</label> <input name="extraAddress"
										id="extraAddress" placeholder="상세 주소"
										value="${m.extraAddress}">
								</div>
								<div
									style="flex-direction: column; align-items: flex-start; width: 49%;">
									<label>참고</label> <input type="detailAddress"
										id="detailAddress" placeholder="참고항목" readonly>
								</div>
							</div>
						</div>
					</div>

					<div class="inputWrap"
						style="flex-direction: column; align-items: flex-start;">
						<label>환불 계좌 은행</label> <select name="bank_code" id="bank_code">
						  <c:if test="${!m.bank_code == null}">
							<option value="${m.bank_code}">
								<c:if test="${m.bank_code == 004}">국민</c:if>
								<c:if test="${m.bank_code == 003}">기업</c:if>
								<c:if test="${m.bank_code == 011}">농협</c:if>
								<c:if test="${m.bank_code == 088}">신한</c:if>
								<c:if test="${m.bank_code == 020}">우리</c:if>
								<c:if test="${m.bank_code == 071}">우체국</c:if>
								<c:if test="${m.bank_code == 023}">SC(스탠다드차트)</c:if>
								<c:if test="${m.bank_code == 081}">KEB하나</c:if>
								<c:if test="${m.bank_code == 027}">한국시티</c:if>
								<c:if test="${m.bank_code == 007}">수협</c:if>
								<c:if test="${m.bank_code == 045}">새마을금고</c:if>
								<c:if test="${m.bank_code == 090}">카카오뱅크</c:if>
								<c:if test="${m.bank_code == 092}">토스뱅크</c:if>
							</option>
					    </c:if>
					    
						<c:if test="${m.bank_code == null}">
							<option value="none">-----------</option>
						</c:if>
							<option value="004">국민</option>
							<option value="003">기업</option>
							<option value="011">농협</option>
							<option value="088">신한</option>
							<option value="020">우리</option>
							<option value="071">우체국</option>
							<option value="023">SC(스탠다드차트)</option>
							<option value="081">KEB하나</option>
							<option value="027">한국시티</option>
							<option value="007">수협</option>
							<option value="045">새마을금고</option>
							<option value="090">카카오뱅크</option>
							<option value="092">토스뱅크</option>
						</select>
					</div>

					<div class="inputWrap"
						style="flex-direction: column; align-items: flex-start;">
						<label>환불 계좌 번호</label> <input type="number" name="bank_num"
							placeholder="환불 계좌 번호" id="bank_num" value="${m.bank_num}">
					</div>

					<div class="inputWrap"
						style="flex-direction: column; align-items: flex-start;">
						<label>환불 예금주</label> <input name="bank_owner" placeholder="예금주명"
							id="bank_owner" value="${m.bank_owner }">
					</div>
					<span id="owner_check"></span>
					<div class="confirm">
						<label style="margin: 20px 0px 10px 5px;">알림설정</label> <input
							type="checkbox" name="subscribe" class="checkbox" id="confirm_id">
						<label for="confirm_id" class="checkLabel"> <span
							style="vertical-align: bottom;">이벤트 알림 받기</span>
						</label>
						<p style="color: #999; margin-top: 10px;">공차(GongCha)가 새로운 기능,
							이벤트 소식을 알려드립니다.</p>
					</div>
				</fieldset>

				<div style="display: flex; justify-content: flex-end;">
					<button type="submit" class="btn submit">저장하기</button>
					<button type="button" class="btn del"
						onclick="location='/member/member_del';">회원탈퇴</button>
				</div>
			</form>
		</div>
	</article>

	<jsp:include page="../include/footer.jsp" />
</body>
</html>