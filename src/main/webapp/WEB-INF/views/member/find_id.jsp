<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="/resources/css/profile.css" />
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script>
function check() {
	$name = $.trim($("#mem_name").val());
	$phone = $.trim($("#phone02").val());

	if ($name == "") {
		alert("이름을 입력해주세요!");
		$("#mem_name").val("").focus();
		return false;
	}
	if ($phone == "") {
		alert("휴대폰 번호를 입력해주세요!");
		$("#phone02").val("").focus();
		return false;
	}
	
	$("#phonecheck").hide();
	
	if ($phone.length < 8) {
		$phonetext = '<font color="red" size="2">휴대폰 번호 8자리 입력해주세요!</font>';
		$("#phonecheck").text('');
		$("#phonecheck").show();
		$("#phonecheck").append($phonetext);
		$("#phone02").val('').focus();
		return false;
	}
}
</script>
<style>
.inner{
	display: flex;
    justify-content: center;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />

	<div id="nav">
		<span id="selected"> <a href="/member/find_id" style="font-size: 18px;">아이디
				찾기&nbsp;&nbsp;</a>
		</span> <span id="nav_b"> <a href="/member/find_pwd" style="font-size: 18px;">비밀번호
				찾기&nbsp;&nbsp;</a>
		</span>
	</div>

	<form action="/member/find_id_ok" method="post" onsubmit="return check();">
	  <div class="inner">
		<div class="inner_wrap" style="width:400px;">
			<p>
				<label for="mem_name">회원 이름</label> <input type="text" name="mem_name"
					id="mem_name" placeholder="이름" style="width: 100%;"/>
			</p>
			<p>
				<label>휴대폰 번호</label> <select name="phone01" id="phone01">
					<option selected>010</option>
				</select> <input type="number" name="phone02" placeholder="휴대폰 번호"
					id="phone02" style="margin-left: 10px; width: 85.7%;"><br>
				<span id="phonecheck"></span>
			</p>


		</div>
	</div>
		<div style="display: flex; justify-content: center;">
			<button type="submit" class="btn submit" style="width: 26%;">아이디 찾기</button>
		</div>

	</form>


	</div>
	<div class="clear"></div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>