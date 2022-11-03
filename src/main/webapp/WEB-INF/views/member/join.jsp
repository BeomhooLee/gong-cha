<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공차고 싶을 땐 공차(GongCha) | 회원가입</title>
<link rel="stylesheet" type="text/css" href="/resources/css/join.css" />
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/member.js"></script>
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
</head>
<body>
	<jsp:include page="../include/header.jsp" />

	<article>
		<div class="myProfile">
			<div class="inner">
				<div class="headMessage">
					<h3>회원가입</h3>
				</div>
			</div>

			<form action="join_ok" method="post" onsubmit="return join_check();">
				<fieldset>
					<div class="inputWrap"
						style="flex-direction: column; align-items: flex-start;">
						<div>
						<label for="id">아이디</label>

						<input type="text" name="mem_id" id="mem_id">						
						<input type="button" name="btn_id_check" onclick="id_check();" value="아이디 중복체크">
						<br>
						<span id="idcheck"></span>
						</div>
						
						
						
						
						<div class="newWrap">
							<div class="new1">
								<label for="Password">비밀번호</label> <input type="password"
									name="mem_pwd" id="mem_pwd"> <span
									id="pwdcheck"></span>
							</div>

							<div class="new2">
								<label for="Password2">비밀번호(확인)</label> <input
									type="password" name="mem_pwd2" id="mem_pwd2">
							</div>
							
						</div>
						<p style="font-size: 14px; color: red;">* 다른 개인자정보와 비슷한 비밀번호는
							사용할 수 없습니다. 비밀번호는 8자 이상 12자 이하 이여야 합니다. 비밀번호는 영문/숫자/특수문자를 섞어서
							사용해야합니다.</p>
					</div>
							

					<div class="inputWrapA">
						<div class="inputWrapB">
							<label>이름</label> <input name="mem_name" id="mem_name"
								type="text" value="${mem_name}" placeholder="이름" class="inputFull">
						</div>
					</div>
					<div class="inputWrapA">
						<label>이메일</label>
						<div style="display: flex; width: 100%">
							<input name="email_id" id="email_id" value="${email}">
							&nbsp;@&nbsp;
							<div>
								<select id="email_domain" name="email_domain" style="width: 280px;">
									<option value="none">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
								</select>
							</div>
						</div>
						<label>생년월일</label> <input type="number" name="mem_birth" id="mem_birth"
							value="${mem_birth}" style="width: 49%;"
							placeholder="ex)19900101"><br>
							<span id="birthcheck"></span>
					</div>
					<div class="inputWrapB">
						<label>성별</label>
						<select id="mem_gender" name="mem_gender" class="inputFull">
									<option value="none">성별 선택</option>
									<option value="1">남성</option>
									<option value="2">여성</option>
									
								</select>
					


					<div class="inputWrap"
						style="flex-direction: column; align-items: flex-start;">
						<label>휴대폰 번호</label>
						<div class="phone">
							<select name="phone01" id="phone01">
								<option selected>010</option>
								<option>011</option>
							</select> <input type="number" name="phone02" value="${phone02}" placeholder="휴대폰 번호"
								id="phone02" style="margin-left: 10px;"><br>
								<span id="phonecheck"></span>
						</div>
					</div>

					<div class="inputWrap"
						style="flex-direction: column; align-items: flex-start;">
						<div class="address">
							<label>우편번호</label>
							<div style="display: flex; width: 100%;">
								<input name="postcode" id="postcode" size="3" class="input_box" readonly>
								<button type="button" onclick="post_check();">우편번호 검색</button>
							</div>
							<div style="display: flex;">
								<div
									style="flex-direction: column; align-items: flex-start; margin-right: 10px; width: 49%;">
									<label>도로명 주소</label> <input name="roadAddress"
										id="roadAddress" placeholder="도로명주소" readonly>
								</div>
								<div
									style="flex-direction: column; align-items: flex-start; width: 49%;">
									<label>지번 주소</label> <input name="jibunAddress"
										id="jibunAddress" placeholder="지번 주소" readonly> <span
										id="guide" style="color: #999; height: 25px; display: none;"></span>
								</div>
							</div>
							<div style="display: flex;">
								<div
									style="flex-direction: column; align-items: flex-start; width: 49%; margin-right: 10px;">
									<label>상세 주소</label> <input name="extraAddress"
										id="extraAddress" placeholder="상세 주소">
								</div>
								<div
									style="flex-direction: column; align-items: flex-start; width: 49%;">
									<label>참고</label> <input type="detailAddress"
										id="detailAddress" placeholder="참고항목" readonly>
								</div>
							</div>
						</div>
					</div>

					<div class="confirm">
						<label style="margin: 20px 0px 10px 5px;">알림설정</label> <input
							type="checkbox" name="subscribe" class="checkbox" id="confirm_id">
						<label for="confirm_id" class="checkLabel"> <span
								style="vertical-align:bottom;">이벤트 알림 받기</span>
						</label>
						<p style="color: #999; margin-top: 10px;">공차(GongCha)가 새로운 기능,
							이벤트 소식을 알려드립니다.</p>
					</div>
				</fieldset>

				<div style="display: flex; justify-content: flex-end;;">
					<button type="submit" class="btn submit">가입하기</button>
					<button type="button" class="btn del">취소하기</button>
				</div>
			</form>
		</div>
	</article>

	<jsp:include page="../include/footer.jsp" />
</body>
</html>