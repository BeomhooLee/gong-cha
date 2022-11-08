<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공차고 싶을 땐 공차!</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/resources/images/favicon.ico" />

<!-- 부트스트랩 (순서도 바뀌면 안됨) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<!-- jquery랑 main.css -->
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css" />

<!-- 가로 달력 넘기는 버튼 라이브러리 -->
<script src="https://kit.fontawesome.com/19265c8d35.js" crossorigin="anonymous"></script>


<!-- 가로달력 라이브러리 -->
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>	
	
<script type="text/javascript">
	$('.up').on('click',function(){
		$('html').scrollTop(0);
	});
</script>
</head>
<body>
	<div id="container">
		<header>
		<div id="top">
			<div id="h_logo">
				<a href="/"><img src="/resources/images/Logo.png" width="100"
					height="70" alt="bbalcha" /></a>
			</div>

			<div id="mainTap">
				<img id="search_img" src="/resources/images/search.svg" width="24"
					height="24" />
				<div id="search_bar">
					<img src="/resources/images/search.svg" width="24" height="24" />
					<input id="searchTxt" type="search" placeholder="지역, 구장 이름으로 찾기"
						maxlength="100" autocomplete="off" size="33" />
				</div>

				<div id="join">
				  <c:if test="${empty id}">
					<a href="/member/login"><img src="/resources/images/my.svg"></a>
				  </c:if>
				  <c:if test="${!empty id}">
					<a href="/mypage"><img src="/resources/images/my.svg"></a>
				  </c:if>
				</div>

				<div id="menu">
					<img id="three-dots" src="/resources/images/three-dots.svg"
						data-bs-toggle="offcanvas" data-bs-target="#side_menu"
						aria-controls="side_menu">

					<div class="offcanvas offcanvas-end" tabindex="-1" id="side_menu"
						aria-labelledby="company_introduction">
						<div class="offcanvas-header">
							<h3 id="company_introduction">
								<a href="/side_menu/company_introduction">회사 소개</a>
							</h3>
							<button type="button" class="btn-close text-reset"
								data-bs-dismiss="offcanvas" aria-label="Close"></button>
						</div>
						<div class="offcanvas-body">
							<div id="side_b">
								<a href="/side_menu/notice">공지사항</a>
							</div>

							<div id="side_a">
								<a href="/side_menu/q&a">Q&A</a>
							</div>

							<div id="side_a">
								<a href="#">블랙리스트 신고</a>
							</div>

							<div id="side_b">
								<a href="https://www.instagram.com/">instagram</a>
							</div>

							<div id="side_a">
								<a href="https://www.youtube.com/">youtube</a>
							</div>

							<div style="display: flex; justify-content: flex-end;">
								<img src="/resources/images/Logo.png" alt="bbalcha"
									style="width: 100px; height: 70px; margin-top: 310px;" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>