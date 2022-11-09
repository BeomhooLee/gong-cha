/**
 * member.js
 */
function join_check(){
   if($.trim($("#mem_id").val())==""){
      alert("아이디를 입력해주세요!");
      $("#mem_id").val("").focus();
      return false;
   }
   
   $mem_name=$.trim($("#mem_name").val());
   $email=$.trim($("#email_id").val());
   $mem_pwd=$.trim($("#mem_pwd").val());
   $mem_pwd2=$.trim($("#mem_pwd2").val());

   if($mem_pwd == ""){
      alert("비밀번호를 입력해주세요!");
      $("#mem_pwd").val().focus();
      return false;
   }
   if($mem_pwd2 == ""){
      alert("비밀번호 확인을 입력해주세요!");
      $("#mem_pwd2").val().focus();
      return false;
   }
   if($mem_pwd != $mem_pwd2){
      alert("비밀번호가 다릅니다!");
      $("#mem_pwd").val("");//비번 입력박스를 초기화
      $("#mem_pwd2").val("");
      $("#mem_pwd").focus();
      return false;
   }
   //비번 영문 숫자 조합
      $("#pwdcheck").hide();
      //1.입력글자 길이 체크
      if ($mem_pwd.length < 8) {
         $pwdchecktext = '<font color="red" size="2">비밀번호는 8자 이상이어야 합니다.</font>';
         $("#pwdcheck").text('');
         $("#pwdcheck").show();
         $("#pwdcheck").append($pwdchecktext);
         $("#mem_pwd").val('').focus();
         return false;
      }
      
      if ($mem_pwd.length > 12) {
         $pwdchecktext = '<font color="red" size="2">비밀번호는12자 이하이어야 합니다.</font>';
         $("#pwdcheck").text('');
         $("#pwdcheck").show();
         $("#pwdcheck").append($pwdchecktext);
         $("#mem_pwd").val('').focus();
         return false;
      }
      ;
      //2.입력글자 확인
      let check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
      if (!(check.test($mem_pwd))) {
         $pwdchecktext = '<font color="red" size="2">비밀번호는 영문소문자,숫자,@#$%^&*조합만 가능합니다.</font>';
         $("#pwdcheck").text('');
         $("#pwdcheck").show();
         $("#pwdcheck").append($pwdchecktext);
         $("#mem_pwd").val('').focus();
         return false;
      }
   
   if($.trim($("#mem_name").val())==""){
      alert("이름을 입력해주세요!!");
      $("#mem_name").val("").focus();
      return false;
   }
   
   $("#mem_check").hide();
   let id_check = /^[가-힣]{2,10}$/;
   if (!(id_check.test($mem_name))) {
         $namechecktext = '<font color="red" size="2">이름은 2~10자 까지 한글로 입력 가능합니다.</font>';
         $("#name_check").text('');
         $("#name_check").show();
         $("#name_check").append($namechecktext);
         $("#mem_name").val('').focus();
         return false;
   }
      
   if($.trim($("#email_id").val())==""){
      alert("이메일을 입력해주세요!");
      $("#mail_id").val("").focus();
      return false;
   }
   
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

	if($.trim($("#email_domain").val())=="none" && !($("#email_domain_text").val()=="")){
		$("#email_domain").remove();
		return true;
	}
	
	if(!($.trim($("#email_domain").val())=="none") && !($("#email_domain_text").val()=="")){
		$("#email_domain_text").remove();
		return true;
	}
   
   $domain = $.trim($("#email_domain_text").val());
   $("#domain_check").hide();
   let domain_check = /^(?:\w+\.)+\w+$/g; //도메인 정규식
   if (!(domain_check.test($domain))) {
         $emailchecktext = '<font color="red" size="2">도메인을 다시 확인해주세요.</font>';
         $("#email_check").text('');
         $("#email_check").show();
         $("#email_check").append($emailchecktext);
         $("#email_domain_text").val().focus();
         return false;
   }
   
   $birth = $.trim($("#mem_birth").val());
   
   if($.trim($("#mem_birth").val()) == ""){
      alert("생년월일을 입력해주세요!");
      $("#mem_birth").val('').focus();
      return false;
   }
   
   //입력글자 길이 체크
   $("#birthcheck").hide();
   
   if ($birth.length < 8) {
      $birthtext = '<font color="red" size="2">생년월일는 8자 이어야 합니다. ex) 19980312</font>';
      $("#birthcheck").text('');
      $("#birthcheck").show();
      $("#birthcheck").append($birthtext);
      $("#mem_birth").val('').focus();
      return false;
   }
   
   if ($birth.length > 8) {
      $birthtext = '<font color="red" size="2">생년월일는 8자 이어야 합니다. ex) 19980312</font>';
      $("#birthcheck").text('');
      $("#birthcheck").show();
      $("#birthcheck").append($birthtext);
      $("#mem_birth").val('').focus();
      return false;
   }
   
   if($.trim($("#mem_gender").val())=="none"){
      alert("성별을 선택해주세요!");      
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
   
   if($("input[name='id_checked']").val()==''){
        alert('아이디중복 확인을 해주세요.');
        $("input[name='id_checked']").eq(0).focus();
        return false;
    }
}
//중복아이디 검색
function id_check(){
    $("input[name=id_checked]").val('y');
   $("#idcheck").hide();
   //아이디 영역을 숨김
   $mem_id=$.trim($("#mem_id").val());
   //1.입력글자 길이 체크
   if($mem_id.length < 4){
      $newtext='<font color="red" size="3"><b>아이디는 4자 이상이어야 합니다.</b></font>';
      $("#idcheck").text('');
      //idcheck 아이디 영역 문자열을 초기화
      $("#idcheck").show();
      //idcheck 아이디 영역을 보이게 함.
      $("#idcheck").append($newtext);
      //idcheck영역에 문자열을 추가
      $("#mem_id").val('').focus();
      return false;
   };
   if($mem_id.length > 12){
      $idtext='<font color="red" size="3"><b>아이디는12자 이하이어야 합니다.</b></font>';
      $("#idcheck").text('');
      //idcheck 아이디 영역 문자열을 초기화
      $("#idcheck").show();
      //idcheck 아이디 영역을 보이게 함.
      $("#idcheck").append($idtext);
      //idcheck영역에 문자열을 추가
      $("#mem_id").val('').focus();
      return false;
   };
   //2.입력글자 확인
   if(!(validate_userid($mem_id))){
      $idchecktext='<font color="red" size="3"><b>아이디는 영문소문자,숫자 조합만 가능합니다.</b></font>';
      $("#idcheck").text('');
      $("#idcheck").show();
      $("#idcheck").append($idchecktext);
      $("#mem_id").val('').focus();
      return false;
   };
   
   if(validate_userid2($("#mem_id").val())){
      $idchecktext='<font color="red" size="3"><b>공백을 제거 해주세요.</b></font>';
      $("#idcheck").text('');
      $("#idcheck").show();
      $("#idcheck").append($idchecktext);
      $("#mem_id").val('').focus();
      return false;
   }
   
   //아이디 중복확인
    $.ajax({
        type:"POST",//데이터를 서버로 보내는 방법    
        url:"id_check", //아작스 서버 주소 파일명
        data: {"id":$mem_id},  //좌측 id 피라미터 이름에 우측 $mem_id변수값을 저장
        datatype:"int",//서버의 실행된 결과값을 사용자로 받아오는 방법
        success: function (data) {//success는 아작스로 받아오는것이 성공했을경우
           //서버 데이터를 data변수에 저장
           if(data==1){//중복 아이디가 있다면
            $notext='<font color="red" size="3"><b>중복 아이디입니다.</b></font>';
            $("#idcheck").text('');
           $("#idcheck").show();
           $("#idcheck").append($notext);                
             $("#mem_id").val('').focus();
             return false;
        
           }else{//중복 아이디가 아니면
            $yestext='<font color="blue" size="3"><b>사용가능한 아이디입니다.</b></font>';
            $("#idcheck").text('');
            $("#idcheck").show();
            $("#idcheck").append($yestext);
            $("#mem_pwd").focus();
           }              
        },
         error:function(){//비동기식 아작스로 서버디비 데이터를
            //못가져와서 에러가 발생했을 때 호출되는 함수이다.
            alert("data error");
         }
      });//$.ajax
 /* end */   
}

//정규표현식
function validate_userid($mem_id){
  var pattern= new RegExp(/[a-zA-Z0-9]/g);//아이디를 영문소문
  //자와 숫자 조합으로 처리
  return pattern.test($mem_id);
}

function validate_userid2($mem_id){
  //var pattern2= new RegExp(/\s/g);//공백 확인
  var regExp = /\s/g;
  return regExp.test($mem_id);
}

