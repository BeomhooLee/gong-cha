<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/pwd_change.css" />
<script type="text/javascript" src="/resources/js/jquery.js"></script>

<script>
function check() {
	$id = $.trim($("#mem_id").val());
	$pwd = $.trim($("#mem_pwd").val());

	if ($id == "") {
		alert("아이디를 입력해주세요!");
		$("#mem_id").val("").focus();
		return false;
	}
	if ($pwd == "") {
		alert("비밀번호 입력하세요!");
		$("#mem_pwd").val("").focus();
		return false;
	}
	
	var del_text = confirm('정말로 탈퇴 하시겠습니까?');
	
	if(del_text == true){
		location = 'del_ok';
	}
}

</script>
</head>
<body>
    <div class="content_wrap">
  <div class="inner">
    <div class="headMessage">
      <h2>회원 탈퇴</h2>
    </div>
    <form action="/mypage/del_ok" method="post" onsubmit="return check();">
      <div class="inner_wrap">
        
          <label for="mem_id">아이디</label>
          <input type="text" name="mem_id" id="mem_id" />
        
          <label for="mem_pwd">비밀번호:</label>
          <input type="password" name="mem_pwd" id="mem_pwd" /><br>
          <span id="pwdcheck"></span>
       
 
      </div>
      <div class="btn_wrap">
        <button type="submit" class="edit">탈퇴하기</button>
      </div>
    </form>
  </div>
  
</div>
</body>
</html>