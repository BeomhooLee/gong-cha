<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>공차 소셜매치</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="/resources/images/favicon.ico" />

<!-- 부트스트랩 (순서도 바뀌면 안됨) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<!-- jquery랑 main.css -->
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css" />

<!-- 가로 달력 넘기는 버튼 라이브러리 -->
<script src="https://kit.fontawesome.com/19265c8d35.js"
	crossorigin="anonymous"></script>

<!-- 가로달력 라이브러리 -->
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.nav2').slick({
				slide : 'button', //슬라이드 되어야 할 태그 ex) div, li 
				infinite : false, //무한 반복 옵션	 
				slidesToShow : 7, // 한 화면에 보여질 컨텐츠 개수
				slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
				speed : 500, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
				arrows : true, // 옆으로 이동하는 화살표 표시 여부
				dots : false, // 스크롤바 아래 점으로 페이지네이션 여부
				autoplay : false, // 자동 스크롤 사용 여부
				vertical : false, // 세로 방향 슬라이드 옵션
				prevArrow : "<i class='fa-regular fa-circle-left' id='next'></i>", // 이전 화살표 모양 설정
				nextArrow : "<i class='fa-regular fa-circle-right' id='before'></i>",
				draggable : false
			});
	});
</script>
<script type="text/javascript">

	var last_date_var = '${last_date}'

	$(document).on("click",'i',function() {
		var sendData = {"last_date" : last_date_var,"dayofweek" : ""}

		$.ajax({
			url : "slick",
			method : 'POST',
			data : JSON.stringify(sendData),
			contentType : 'application/json; charset=UTF-8',
			dataTye : "json",
			success : function(resp) {

				last_date_var = resp.plused_date

				var div = "<button type='button' class='b_cal'><p>"
						+ resp.last_date + "일</p><span>"
						+ resp.dayofweek + "</span></button>"
				$('.nav2').slick('slickAdd', div);
			}
		});
	});

</script>

<script type="text/javascript">
	$(function() {
		$('.rowWrap').children('button').click(function() {
			$(this).attr('class', 'blue');
			$(this).siblings('button').attr('class', 'normal');
		});
	});
</script>
<script type="text/javascript">
	$(document).on("click", 'button[type="button"]',function() {
				var selectedBtns = document.querySelectorAll('button[class="blue"]');
				var selectedDate = document.querySelector('button[class="b_cal"]')
				$('input[type="hidden"][id="date"]').attr("value",$(this).children('p').data('caldate'));
				//  구장 상세 설정 필터링
				selectedBtns.forEach(function(v) {
					if (v.dataset.type != 'all') {
						if (v.dataset.value == 1 || v.dataset.value == 2 || v.dataset.value == 3) {
							var level = v.innerText;
							$('input[type="hidden"][id="skill"]').attr("value", level);
						} else if (v.dataset.value == 4 || v.dataset.value == 5) {
							var type = v.innerText;
							$('input[type="hidden"][id="type"]').attr("value", type);
						} else if (v.dataset.value == 6 || v.dataset.value == 7) {
							var vs = v.innerText;
							$('input[type="hidden"][id="vs"]').attr("value", vs);
						} else {
							var city = v.innerText;
							$('input[type="hidden"][id="region"]').attr("value", city);
						}
					}else{
						if (v.dataset.value == 11) {
							var level = v.innerText;
							$('input[type="hidden"][id="skill"]').attr("value", level);
						} else if (v.dataset.value == 12) {
							var type = v.innerText;
							$('input[type="hidden"][id="type"]').attr("value", type);
						} else if (v.dataset.value == 13) {
							var vs = v.innerText;
							$('input[type="hidden"][id="vs"]').attr("value", vs);
						} else {
							var city = v.innerText;
							$('input[type="hidden"][id="region"]').attr("value", city);
						}
					}
				});
				filter();
			});
</script>
<script type="text/javascript">
	function filter() {
		
		var level = $('input[type="hidden"][id="skill"]').attr("value");
		var type = $('input[type="hidden"][id="type"]').attr("value");
		var vs = $('input[type="hidden"][id="vs"]').attr("value");
		var city = $('input[type="hidden"][id="region"]').attr("value");
		var selectedDate = $('input[type="hidden"][id="date"]').attr("value");
		var sendData = {"level" : level,"type" : type,"vs" : vs,"city" : city,"selectedDate" : selectedDate}
		
		$.ajax({
			url : "social_filter",
			method : 'POST',
			data : JSON.stringify(sendData),
			contentType : 'application/json; charset=UTF-8',
			dataTye : "html",
			success : function(data) {
				$('#ajax_result').html(data);
			}
		});

	};
</script>
<script type="text/javascript">
	$(function(){
		$('#detail').click(function(){
			if($(this).attr("aria-expanded")){
				$(this).toggleClass("on");
			}
		});
	});
</script>
<script type="text/javascript">
	var selected_date = $(this).children('p').text().replace('일', '')
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
						<a href="login"><img src="/resources/images/my.svg"></a>
					</c:if>
					<c:if test="${!empty id}">
						<a href="mypage"><img src="/resources/images/my.svg"></a>
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
								<a href="#">instagram</a>
							</div>

							<div id="side_a">
								<a href="#">youtube</a>
							</div>

							<div style="display: flex; justify-content: flex-end;">
								<img src="/resources/images/Logo.png" alt="bbalcha"
									style="width: 100px; height: 70px; margin-top: 310px;"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="clear"></div>
		<div id="nav">
			<span id="selected"> <a href="/">소셜매치&nbsp;&nbsp;<img
					src="/resources/images/social.svg"></a>
			</span> <span id="nav_b"> <a href="rental">구장예약&nbsp;&nbsp;<img
					src="/resources/images/reservation.svg"></a>
			</span> <span id="nav_c"> <a href="recruit">용병모집&nbsp;&nbsp;<img
					src="/resources/images/personplus.svg"></a>
			</span>
		</div>

		</header>
		<div class="clear"></div>

		<form method="get" action="/">
			<article>
			<div id="carousel_container">
				<div id="myCarousel" class="carousel slide carousel-fade"
					data-bs-pause="hover">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#myCarousel"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#myCarousel"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#myCarousel"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">

						<div class="carousel-item active">
							<img src="/resources/images/social/ground_1.jpeg" alt="..."
								width=1020 height="488">
						</div>

						<div class="carousel-item">
							<img src="/resources/images/social/ground_2.jpeg" alt="..."
								width=1020 height="488">
						</div>

						<div class="carousel-item">
							<img src="/resources/images/social/ground_3.jpeg" alt="..."
								width=1020 height="488">
						</div>
					</div>

					<button class="carousel-control-prev" type="button"
						data-bs-target="#myCarousel" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#myCarousel" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div>

				<div id="filter_wrap">
					<div id="calendar_wrap">
						<div class="nav2" style="display: flex;">
							<c:forEach var="item" items="${dates}" varStatus="status">
								<button type="button" class="b_cal">
									<p data-caldate="${item}">${fn:substring(item,8,10)}일</p>
									<span>${dayofweek_list[status.index]}</span>
								</button>
							</c:forEach>

						</div>
					</div>
				</div>

			</div>

			<div class="clear"></div>

			<div class="header_wrap">
				<div role="button" id="detail" data-bs-toggle="collapse" data-bs-target="#collapseExample"
					aria-expanded="false" aria-controls="collapseExample">
					<span>매치 상세설정</span>
				</div>
			</div>
			<div class="collapse" id="collapseExample">
				<div id="match_filter">
					<div id="m_t">

						<div id="row1">
							<div id="row1_1">
								<b style="cursor:default">레벨</b><br>
								<div class="rowWrap">
									<button type="button" class="blue" data-value="11" data-type="all" >전체</button>
									<button type="button" class="normal" data-value="1" >초보</button>
									<button type="button" class="normal" data-value="2" >중급</button>
									<button type="button" class="normal" data-value="3" >고급</button>
								</div>

							</div>
							<div id="row1_2">
								<b style="cursor:default">매치 형태</b><br>
								<div class="rowWrap">
									<button type="button" class="blue" data-value="12" data-type="all" >전체</button>
									<button type="button" class="normal" data-value="4" >2파전</button>
									<button type="button" class="normal" data-value="5" >3파전</button>
								</div>
							</div>
						</div>


						<div id="row2">
							<div id="row2_1">
								<b style="cursor:default">매치 인원</b><br>
								<div class="rowWrap">
									<button type="button" class="blue" data-value="13" data-type="all" >전체</button>
									<button type="button" class="normal" data-value="6" >6vs6</button>
									<button type="button" class="normal" data-value="7" >7vs7</button>
								</div>
							</div>
							<div id="row2_2">
								<b style="cursor:default">지역</b><br>
								<div class="rowWrap">
									<button type="button" class="blue" data-value="14" data-type="all" >전체</button>
									<button type="button" class="normal" data-value="8" >서울</button>
									<button type="button" class="normal" data-value="9" >경기</button>
									<button type="button" class="normal" data-value="10" >부산</button>
								</div>
							</div>
							<input type="hidden" id="date" name="date" value="${today}">
							<input type="hidden" id="region" name="region" value="전체">
							<input type="hidden" id="skill" name="skill" value="전체">
							<input type="hidden" id="type" name="type" value="전체"> 
							<input type="hidden" id="vs" name="vs" value="전체"> 
						</div>
					</div>
				</div>
			</div>

			<div id="list">
				<ul id="ajax_result">
					<c:forEach items="${social_match}" var="sm" varStatus="status">
						<li class="item"><a href="/social?match_no=${sm.match_no}"
							style="outline: none; color: #222836; text-decoration: none; cursor: pointer;">
								<div class="time">
									<p>${fn:substring(sm.match_date,11,16)}</p>
								</div>
								<div class="info">
									<div class="title">
										<h3>${sm.stadium_name}</h3>
									</div>
									<div class="option">
										<c:if test="${sm.gender == 1}">
											<span class="isMix">남자</span>
										</c:if>
										<c:if test="${sm.gender == 2}">
											<span class="isMix">여자</span>
										</c:if>
										<span>${sm.versus_num}</span> 
										<span>${sm.match_type}</span> 
										<span>${sm.match_level}</span>
									</div>
								</div>

								<div class="schedule">
									<c:choose>
										<c:when
											test="${((sm.player_num-sm.current_count) <= 3) && ((sm.player_num-sm.current_count)>0)}">
											<div class="Hurry">
												<p style="margin: 0px;">마감임박!</p>
											</div>
										</c:when>
	
										<c:when test="${(sm.player_num - sm.current_count) == 0}">
											<div class="isFull">
												<p style="margin: 0px;">마감</p>
											</div>
										</c:when>
	
										<c:when test="${(sm.player_num-sm.current_count) > 3}">
											<div class="isOpen">
												<p style="margin: 0px;">신청가능</p>
											</div>
										</c:when>
									</c:choose>
								</div>

						</a></li>
					</c:forEach>	
				</ul>
			</div>
			</article>
		</form>

		<footer>
		<div id="up" class="up" onclick="window.scrollTo(0,0);">
			<img src="/resources/images/arrow-up-circle.svg" width="40"
				height="40">
		</div>
		<div id="f_logo">
			<a href="/"><img src="/resources/images/Logo.png" width="80"
				height="50" alt="bbalcha" /></a><br> 풋살이 마려울땐 뽈차!<br> <br>
		</div>
		<div id="copy">
			| 서울특별시 강남구 강남대로84길 16 11, 12층 <br> | 사업자번호 123-45-47890 | 통신판매업
			ITbank-1103호<br> | 대표전화 070-2808-6087 | 대표메일 bbalcha@gmail.com<br>
			<br> COPYRIGHT ⓒBC C&C ALL RIGHTS RESERVED<br> <br>
		</div>

		<div id="social">
			<a href="https://www.kakaocorp.com/page/service/service/KakaoTalk" />
			<img src="/resources/images/kakaotalk.png" width="33" height="33"
				alt="kakaotalk" /></a> <a href="https://www.instagram.com/" /><img
				src="/resources/images/instargram.png" width="33" height="34"
				alt="instargram" /> </a> <a href="https://www.youtube.com/"><img
				src="/resources/images/youtube.png" width="33" height="33"
				alt="youtube" /> </a> <a href="https://www.facebook.com/" /><img
				src="/resources/images/facebook.png" width="33" height="33"
				alt="facebook" /> </a>
		</div>
		</footer>
	</div>
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>
