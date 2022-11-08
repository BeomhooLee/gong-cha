<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" type="text/css" href="/resources/css/join.css" />
<script type="text/javascript" src="/resources/js/jquery.js"></script>

<script>
function check() {
	$id = $.trim($("#mem_id").val());
	$new = $.trim($("#mem_pwd").val());
	$new2 = $.trim($("#new_pwd").val());
	if ($id == "") {
		alert("아이디를 입력해주세요!");
		$("#mem_id").val("").focus();
		return false;
	}
	if ($new == "") {
		alert("새 비밀번호 입력하세요!");
		$("#mem_pwd").val("").focus();
		return false;
	}

	//비번 영문 숫자 조합
	$("#pwdcheck").hide();
	//1.입력글자 길이 체크
	if ($new.length < 8) {
		$newtext = '<font color="red" size="2">비밀번호는 8자 이상이어야 합니다.</font>';
		$("#pwdcheck").text('');
		//idcheck 아이디 영역 문자열을 초기화
		$("#pwdcheck").show();
		//idcheck 아이디 영역을 보이게 함.
		$("#pwdcheck").append($newtext);
		//idcheck영역에 문자열을 추가
		$("#mem_pwd").val('').focus();
		return false;
	}
	;
	if ($new.length > 12) {
		$newtext = '<font color="red" size="2">비밀번호는12자 이하이어야 합니다.</font>';
		$("#pwdcheck").text('');
		//idcheck 아이디 영역 문자열을 초기화
		$("#pwdcheck").show();
		//idcheck 아이디 영역을 보이게 함.
		$("#pwdcheck").append($newtext);
		//idcheck영역에 문자열을 추가
		$("#mem_pwd").val('').focus();
		return false;
	}
	;
	//2.입력글자 확인
	let check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	if (!(check.test($new))) {
		$newtext = '<font color="red" size="2">비밀번호는 영문소문자,숫자,@#$%^&*조합만 가능합니다.</font>';
		$("#pwdcheck").text('');
		$("#pwdcheck").show();
		$("#pwdcheck").append($newtext);
		$("#mem_pwd").val('').focus();
		return false;
	}

	if ($new2 == "") {
		alert("비밀번호 확인을 입력하세요!");
		$("#new_pwd").val("").focus();
		return false;
	}
		if ($new != $new2) {
			alert("비밀번호가 다릅니다!");
			$("#mem_pwd").val("");//비번 입력박스를 초기화
			$("#new_pwd").val("");
			$("#mem_pwd").focus();
			return false;
		}
}
</script>

<div class="content_wrap">
  <div class="inner">
    <div class="headMessage">
      <h2>${m.mem_id}</h2>
    </div>
    <form action="/mypage/pwd_change_ok" method="post" onsubmit="return check();">
      <div class="inner_wrap">
        <p>
          <label for="mem_id">아이디</label>
          <input type="text" name="mem_id" id="mem_id" style="width: 100%;"/>
        </p>
        <p>
          <label for="mem_pwd">새 비밀번호:</label>
          <input type="password" name="mem_pwd" id="mem_pwd" style="width: 100%;" /><br>
          <span id="pwdcheck"></span>
        </p>
        <ul>        
          <li>비밀번호는 최소 8자 이상이어야 합니다.</li>      
          <li>비밀번호는 영문, 숫자, 특수기호를 섞어서 사용해야 합니다.</li>
        </ul>
        <p>
          <label for="new_pwd">새 비밀번호 (확인)</label>
          <input type="password" name="new_pwd" id="new_pwd" style="width: 100%;" />
        </p>
      </div>
      <div class="btn_wrap">
        <button type="submit" class="btn submit" style="width: 100%; margin-left: 0px;">저장하기</button>
      </div>
    </form>
  </div>
  
</div>




</div>
<div class="clear"></div>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>