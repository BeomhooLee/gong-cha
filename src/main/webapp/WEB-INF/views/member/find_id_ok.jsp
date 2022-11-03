<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="/resources/css/profile.css" />
</head>
<body>
	<jsp:include page="../include/header.jsp" />

	<div id="nav">
		<span id="selected"> <a href="find_id" style="font-size: 18px;">아이디
				찾기&nbsp;&nbsp;</a>
		</span> <span id="nav_b"> <a href="find_pwd" style="font-size: 18px;">비밀번호
				찾기&nbsp;&nbsp;</a>
		</span>
	</div>

	  <div class="inner" style="text-align:center;">
		<div class="headMessage">
					<h3>아이디 찾기 결과</h3>
					<span>${id.mem_name}님의 아이디는<span style="font-size:27px; font-weight:600;"> '${id.mem_id}'</span> 입니다.</span>	
				</div>
		</div>

		<div style="display: flex; justify-content: center;">
			<button class="btn submit" style="width: 26%;" onclick="location='login'">로그인 하기</button>
		</div>



	</div>
	<div class="clear"></div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>