<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" type="text/css" href="/resources/css/rental.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/detail.css" />
<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- Clipboard API -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="/resources/js/jquery.js"></script>
<!-- 가로달력 라이브러리 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script>
$(function() {
	$('.nav2').slick(
		{
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
			draggable : false,
		});
});

var last_date_var = '${last_date}'

$(document).on("click",'i',function() {
			var sendData = {"last_date" : last_date_var,"dayofweek" : ""}

			$.ajax({
				url : "/slick",
				method : 'POST',
				data : JSON.stringify(sendData),
				contentType : 'application/json; charset=UTF-8',
				dataTye : "json",
				success : function(resp) {

					last_date_var = resp.plused_date

					var div = "<button type='button' class='b_cal' onclick='filter()'><p>"
							+ resp.last_date + "일</p><span>"
							+ resp.dayofweek + "</span></button>"
					$('.nav2').slick('slickAdd', div);
				}
			});
		});

function showmap() {
	  var togglemap = document.getElementById("toggleMap");
	  var stadMap = document.getElementById("stadMap");
	  if (stadMap.style.zIndex=== "0") {
		  stadMap.style.zIndex = "1";
		togglemap.innerHTML = "지도 닫기";
	  } else {
		  stadMap.style.zIndex = "0";
		togglemap.innerHTML = "지도 보기";
	  }
	}

$(document).ready(function(){
	togglemap = $('#toggleMap'); //버튼 아이디 변수 선언
	map = $('#map'); //레이어 아이디 변수 선언
	btn.click(function(){
       map.toggle(
         function(){map.addClass('show')}, //클릭하면 show클래스 적용되서 보이기
         function(){map.addClass('hide')} //한 번 더 클릭하면 hide클래스가 숨기기
       );
     });
   });

function clipBoard(){
var content = document.getElementById('txt1').innerHTML;

navigator.clipboard.writeText(content).then(() => {
    alert('주소가 클립보드에 복사되었습니다.')
}).catch(err => {
    console.log('Something went wrong', err);
})
}

$(function() {
	$('#location').children('button').click(function(){
		$(this).attr('class', 'blue');
		$(this).siblings('button').attr('class', 'normal');
	});
});

$(function() {
	$('#filter_wrapper').children('div').click(function(){
		$(this).toggleClass("on");
	});
});

$(function(){
	$('#reserv').click(function(){
		if($('.soldout').css('display') != "none"){
			$('.soldout').hide();
		}else{
			$('.soldout').show();
		}
	});
});
$(document).on("click", 'button[type="button"][id="cal"]',function() {
	var selectedDate = document.querySelector('button[class="b_cal"]');
	$('input[type="hidden"][id="date"]').attr("value",$(this).children('p').data('caldate'));
	
	check();
});

function check(){
	$('input[type="hidden"][id="date"]').attr("value",$(this).children('p').data('caldate'));
	var selectedDate = $('input[type="hidden"][id="date"]').attr("value");
	var stadium = $('p[id="name"]').text();
	var sendData = {"stadium" : stadium,"selectedDate" : selectedDate}
	
	$.ajax({
		url : "/detailDate",
		method : 'POST',
		data : JSON.stringify(sendData),
		contentType : 'application/json; charset=UTF-8',
		dataTye : "html",
		success : function(data) {
			$('#timelist').html(data);
		}
	});
}

function checked(){
	alert('해당시간은 이미 예약완료 되었습니다. 다른 시간을 골라주세요!');
}
</script>
<article>
	<div id="contentWrap">

		<div id="stadMap" style="z-index: 0;">
			<div id="map"></div>
		</div>
		<div class="clear"></div>
		<div id="carousel_container">
			<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#myCarousel"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#myCarousel"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#myCarousel"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
					<button type="button" data-bs-target="#myCarousel"
						data-bs-slide-to="3" aria-label="Slide 4"></button>
				</div>
				<div class="carousel-inner">

					<div class="carousel-item active">
						<img src="/resources/images/rental/as_hm1.jpg" alt="..."
							width=1024; height="488">
					</div>

					<div class="carousel-item">
						<img src="/resources/images/rental/as_hm2.jpg" alt="..."
							width=1024; height="488">
					</div>

					<div class="carousel-item">
						<img src="/resources/images/rental/as_hm3.jpg" alt="..."
							width=1024; height="488">
					</div>

					<div class="carousel-item">
						<img src="/resources/images/rental/as_hm4.jpg" alt="..."
							width=1024; height="488">
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
		<div class="clear"></div>
	</div>

	<div id="stadium_profile">
		<p id="name">${stadium.stadium_name}</p>
		<div id="wtgTool">
			<span id="txt1">${stadium.address}</span> <span id="copy-url1"
				class="txt2" onclick="clipBoard()">주소 복사</span> <span id="toggleMap"
				class="txt2" onclick="showmap()">지도 보기</span>
		</div>
	</div>

	<div class="clear"></div>

	<div id="rentalInfo">
		<div id="navi_con">
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="pills-home-tab"
						data-bs-toggle="pill" data-bs-target="#pills-home" type="button"
						role="tab" aria-controls="pills-home" aria-selected="true">시설</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="pills-profile-tab"
						data-bs-toggle="pill" data-bs-target="#pills-profile"
						type="button" role="tab" aria-controls="pills-profile"
						aria-selected="false">구장 예약</button>
				</li>
			</ul>
		</div>
		<div class="tab-content" id="pills-tabContent">
			<div class="tab-pane fade show active" id="pills-home"
				role="tabpanel" aria-labelledby="pills-home-tab">
				<div id="stadium_info">
					<span>${stadium.stadium_size}·실외·인조잔디</span>
					<div id="info_list_wrap">
						<ul>
							<li class="info_list"><i class="bi bi-car-front"
								style="font-size: 1.5rem;"></i>
								<div class="li_di">
									<p>
										<c:if test="${stadium.parking_lot == 1 }">
									무료주차
								</c:if>
										<c:if test="${stadium.parking_lot == 0 }">
									유료주차
								</c:if>
									</p>
								</div></li>
							<li class="info_list"><c:if
									test="${stadium.parking_lot == 1 }">
									<img
										src="https://plab-football.s3.amazonaws.com/static/img/ic_info_shower.svg"
										style="font-size: 1.5rem;">
									<div class="li_di">
										<p>샤워실</p>
									</div>
								</c:if> <c:if test="${stadium.parking_lot == 0 }">
									<img class="no_icon"
										src="https://plab-football.s3.amazonaws.com/static/img/ic_info_shower.svg"
										style="font-size: 1.5rem;">
									<div class="li_di">
										<p class="title_line">샤워실</p>
									</div>
								</c:if></li>
							<li class="info_list"><i class="fa-solid fa-restroom"
								style="font-size: 1.2rem;"></i>
								<div class="li_di">
									<p>화장실</p>
								</div></li>
							<li class="info_list"><c:if
									test="${stadium.shoes_rental==1}">
									<img id="shoes_img"
										src="https://plab-football.s3.amazonaws.com/static/img/ic_info_shoes.svg"
										class="icon">
									<div class="li_di">
										<p>풋살화 대여</p>
									</div>
								</c:if> <c:if test="${stadium.shoes_rental==0}">
									<img id="shoes_img" class="no_icon"
										src="https://plab-football.s3.amazonaws.com/static/img/ic_info_shoes.svg"
										class="icon">
									<div class="li_di">
										<p class="title_line">풋살화 대여</p>
									</div>
								</c:if></li>
							<li class="info_list"><c:if test="${stadium.vest_rental==1}">
									<img id="vest_img"
										src="https://plab-football.s3.amazonaws.com/static/img/ic_info_wear.svg"
										class="icon">
									<div class="li_di">
										<p>운동복 대여</p>
									</div>
								</c:if> <c:if test="${stadium.vest_rental==0}">
									<img id="vest_img"
										src="https://plab-football.s3.amazonaws.com/static/img/ic_info_wear.svg"
										class="icon">
									<div class="li_di">
										<p class="title_line">운동복 대여</p>
									</div>
								</c:if></li>
						</ul>
					</div>
				</div>
				<div id="info_container">
					<p class="info_p">구장 특이사항</p>
					<pre class="txt3">
						<c:forEach var="item" items="${etcs}">
							■${item}
						</c:forEach>
				  	</pre>
				</div>
				<div id="order_wrap">
					<div id="lp">
						<div id="lp_btn">
							<a class="btn_order"
								onclick="$('#pills-profile-tab.nav-link').trigger('click');">
								<p id="btn_p">예약하기</p>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>

			<div class="tab-pane fade" id="pills-profile" role="tabpanel"
				aria-labelledby="pills-profile-tab">
				<div id="info_container2">
					<div id="filter_wrap">
						<div id="calendar_wrap">
							<div class="nav2" style="display: flex;">
								<c:forEach var="item" items="${dates}" varStatus="status">
									<button type="button" class="b_cal" id="cal">
										<p data-caldate="${item}">${fn:substring(item,8,10)}일</p>
										<span>${dayofweek_list[status.index]}</span>
									</button>
								</c:forEach>
							</div>
						</div>
					</div>
					<div id="rFilter">
						<div id="filter_wrapper">
							<div class="filterBtn" id="reserv" style="margin-bottom: 15px;">
								<span>예약가능</span>
							</div>
						</div>
					</div>
					<input type="hidden" id="date" name="date" value="${today}">
					<div id="rentalChoice">
						<ul style="padding-left: 0rem;" id="timelist">
							<c:forEach var="s" items="${sm_list }">
								<c:if test="${s.available == 1}">
										<li class="rental">
									<a href="/rental/order?no=${s.stadium_match_no}">
											<p class="rTime">
											${s.start_time }~<br>${s.end_time}
											</p>
									</a>
										</li>
								</c:if>
								<c:if test="${s.available == 0}">
									<li class="rental soldout">
									<a onclick="checked();">
										<p class="rTime">
											${s.start_time }~<br>${s.end_time}
										</p>
									</a>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			

				<div id="st_info">
					<p class="info_p">취소/환급</p>
					<div id="stadInner">
						<ul class="matchRule" style="padding-left: 0rem;">
							<h4>일반</h4>
							<li>7일 전 취소 시 100% 환불</li>
							<li>5일 전 취소 시 80% 환불</li>
							<li>3일 전 취소 시 50% 환불</li>
							<li>2일 전 ~ 예약 당일 환불 불가</li>
							<p>
								<strong>(캐시는 규정에 따라 자동 환급되며 잔액 환불 희망 시 나의 충전 내역에서
									신청바랍니다)</strong>
							</p>
						</ul>
						<ul class="matchRule"
							style="padding-left: 0rem; margin-top: 20px; margin-bottom: 0rem;">
							<h4>천재지변</h4>
							<li>당일 천재지변으로 인해 구장 이용이 불가한 경우 100% 환불</li>
							<li>(적용기준 : 호우경보, 대설경보, 태풍주의보, 태풍경보)</li>
							<h4>우천 시 변경 기준</h4>
							<li>시간 당 5mm 이상 시 날짜 변경 가능</li>
							<li>(기준 : 당일 이용 2시간 전 기상청 날씨누리 해당 주소기 기준)</li>
							<li>단순 변심에 의한 날짜 변경은 불가</li>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>		
		<div class="clear"></div>
</article>

<!-- 카카오맵 api -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1e91324cb846f49c6af089e52a7498a"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

    mapOption = { 
        center: new kakao.maps.LatLng(37.498096349937015, 127.0294336536626), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.498096349937015, 127.0294336536626); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>

</div>
<div class="clear"></div>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>