<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 </title>
<link rel="stylesheet" type="text/css" href="/resources/css/login.css" />
<script src="/resources/js/jquery.js"></script>
<script type="text/javascript">
function login_check(){
    if($.trim($("#mem_id").val())==""){
       alert("아이디를 입력해주세요!");
       $("#mem_id").val("").focus();
       return false;
    }
    if($.trim($("#mem_pwd").val())==""){
       alert("비밀번호를 입력해주세요!");
       $("#mem_pwd").val("").focus();
       return false;
    }
 }

</script>
</head>
<body>
<jsp:include page="../include/header.jsp" />

<div class="content" style="height:100%;">
  <div class="quoteContainer">
    <div class="quote" style="background-image: url(/resources/images/quote1.png);">
      <div class="quoteMsgWrap">
        <div class="quoteMsg">
          <span>"언제든 풋살하고 싶을 때 즐길 수 있어요"</span>
        </div>
      </div>
    </div>
  </div>
  <div class="innerContainer" style="padding:20px;height:100%;">
    <div class="inner" style="height:75%;">
      <div class="headMessage">
        <h2>풋살이 마려울땐</h2>
        <h2 class="hlt">공차!</h2>
      </div>
      
      <form method="post" action="login_ok">
        <input type="hidden" name="csrfmiddlewaretoken" value="vLeZ3TwxEk2Ltxrvz4ZlsJq9vOm1ztvXecU9dWv5uQhd1HREJW3lmxKzyXfNNn0o">
        <fieldset>
            
            <div class="inputWrap" style="display: initial;">
              <input type="text" name="mem_id" autofocus required id="mem_id" placeholder="아이디 또는 이메일">
            </div>
            
            <div class="inputWrap" style="display: initial;">
              <input type="password" name="mem_pwd" required id="mem_pwd" placeholder="비밀번호">
            </div>
        </fieldset>
<!--         <input type="checkbox" id="saveID" value="" name="#"> <label for="saveID"><span class="checkbox"></span> <span>아이디 저장</span></label> -->
        <div class="btn-wrap"><button style="background-color: #2139B2; color:white; padding:15px;border-radius: 12px;" type="submit" onclick="return login_check();">로그인</button></div>
        <div class="login_text">
          <span style="text-align:right;padding-right:10px;"><a href="find_id">아이디</a> · <a href="find_pwd">비밀번호 찾기</a></span>
          <span style="text-align:left;padding-left:20px;"><a href="join" onclick="openKakaoRegist()">회원가입</a></span>
        </div>
      </form>
    </div>
   
  </div>
</div>


</body>
</html>