<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/rental.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/detail.css" />
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
	$('.nav2').slick({
		slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
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
		<p id="name">HM풋살파크 안산 고잔점</p>
		<div id="wtgTool">
			<span id="txt1">경기 안산시 단원구 광덕대로 175</span> <span id="copy-url1"
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
				<!-- <li class="nav-item" role="presentation">
					<button class="nav-link" id="pills-contact-tab"
						data-bs-toggle="pill" data-bs-target="#pills-contact"
						type="button" role="tab" aria-controls="pills-contact"
						aria-selected="false">소셜 매치</button>
				</li> -->
			</ul>
		</div>
		<div class="tab-content" id="pills-tabContent">
			<div class="tab-pane fade show active" id="pills-home"
				role="tabpanel" aria-labelledby="pills-home-tab">
				<div id="stadium_info">
					<p id="info_title">1개의 구장</p>
					<div id="stadium_img">
						<ul>
							<li>
								<div id="stm_wrap">
									<div id="stm_img">
										<div id="dots">
											<button type="button" class="btn btn-primary"
												data-bs-toggle="modal" data-bs-target="#exampleModal">
												<span id="plus"></span>
											</button>
										</div>
									</div>
								</div>
								<p>B구장</p> <span>40x20m·실외·인조잔디</span>
							</li>
						</ul>
					</div>
					<div id="info_list_wrap">
						<ul>
							<li class="info_list">
								<i class="bi bi-car-front" style="font-size: 1.5rem;"></i>
								<div class="li_di">
									<p>주차</p>
								</div>
							</li>
							<li class="info_list">
								<img class="no_icon" src="https://plab-football.s3.amazonaws.com/static/img/ic_info_shower.svg" style="font-size: 1.5rem;">
								<div class="li_di">
									<p class="title_line">샤워실
								</div>
							</li>
							<li class="info_list">
								<i class="fa-solid fa-restroom" style="font-size: 1.2rem;"></i>
								<div class="li_di">
									<p>화장실</p>
								</div>
							</li>
							<li class="info_list">
								<img id="shoes_img" src="https://plab-football.s3.amazonaws.com/static/img/ic_info_shoes.svg" class="icon">
								<div class="li_di">
									<p>풋살화 대여</p>
								</div>
							</li>
							<li class="info_list">
								<img id="vest_img" src="https://plab-football.s3.amazonaws.com/static/img/ic_info_wear.svg" class="icon">
								<div class="li_di">
									<p class="title_line">운동복 대여</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div id="info_container">
					<p class="info_p">공지사항</p>
					<pre class="txt3">
 ■ 안내 사항

 - 주차 : 사전 주차 등록 16대 3시간 무료 (예약 시 알림톡 비상 연락처로 주차 번호 전달 필요)

 - 흡연 : 지정된 흡연 구역 외에 금연

 - 물/음료 판매 : o

 - 공/조끼 대여 : o

 - 풋살화 대여 : o (비오는 날 x)
				  </pre>
				</div>
				<div id="order_wrap" >
					<div id="lp">
						<div id="lp_btn">
							<a class="btn_order" onclick="$('#pills-profile-tab.nav-link').trigger('click');">
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
								<div class="b_cal">
									<p>${item}일</p>
									<span>${dayofweek_list[status.index]}</span>
								</div>
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
				
					<div id="rental_boxWrap">
						<div id="rental_box">
							<p class="futsalName">B구장</p>
							<p class="futsalSize">
								40x20m <span class="futsalSize">실외, </span> <span
									class="futsalSize">인조잔디</span>
							</p>
						</div>
					</div>

					<div id="rentalChoice">
						<ul style="padding-left: 0rem;">
							<li class="rental soldout">
								<p class="rTime">
									09:00~<br>10:00
								</p>
							</li>
							<li class="rental soldout">
								<p class="rTime">
									10:00~<br>11:00
								</p>
							</li>
							<li class="rental"><a class="bl"
								href="order"><p class="rTime">
										11:00~<br>12:00
									</p></a></li>
							<li class="rental soldout">
								<p class="rTime">
									12:00~<br>13:00
								</p>
							</li>
							<li class="rental soldout">
								<p class="rTime">
									13:00~<br>14:00
								</p>
							</li>
							<li class="rental soldout">
								<p class="rTime">
									14:00~<br>15:00
								</p>
							</li>
							<li class="rental">
								<p class="rTime">
									15:00~<br>16:00
								</p>
							</li>
							<li class="rental soldout">
								<p class="rTime">
									16:00~<br>17:00
								</p>
							</li>
							<li class="rental soldout">
								<p class="rTime">
									17:00~<br>18:00
								</p>
							</li>
							<li class="rental">
								<p class="rTime">
									18:00~<br>19:00
								</p>
							</li>
							<li class="rental">
								<p class="rTime">
									19:00~<br>20:00
								</p>
							</li>
							<li class="rental soldout">
								<p class="rTime">
									20:00~<br>21:00
								</p>
							</li>
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
				      <p><strong>(캐시는 규정에 따라 자동 환급되며 잔액 환불 희망 시 나의 충전 내역에서 신청바랍니다)</strong></p>
				    </ul>
				    <ul class="matchRule" style="padding-left: 0rem; margin-top:20px; margin-bottom: 0rem;">
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
			
			
<!-- 			<div class="tab-pane fade" id="pills-contact" role="tabpanel"
				aria-labelledby="pills-contact-tab">
			
			<div id="info_container3">
			
				<div id="filter_wrap">
					<div id="calendar_wrap">
						<div class="nav2" style="display:flex;">
							<div class="b_cal">
								<p>1일</p>
								<span>수</span>
							</div>
							<div class="b_cal">
								<p>2일</p>
								<span>수</span>
							</div>
							<div class="b_cal">
								<p>3일</p>
								<span>수</span>
							</div>
							<div class="b_cal">
								<p>4일</p>
								<span>수</span>
							</div>
							<div class="b_cal">
								<p>5일</p>
								<span>수</span>
							</div>
							<div class="b_cal">
								<p>6일</p>
								<span>수</span>
							</div>
							<div class="b_cal">
								<p>7일</p>
								<span>수</span>
							</div>
							<div class="b_cal">
								<p>8일</p>
								<span>목</span>
							</div>
							<div class="b_cal">
								<p>9일</p>
								<span>금</span>
							</div>
							<div class="b_cal">
								<p>10일</p>
								<span>토</span>
							</div>
							<div class="b_cal">
								<p>11일</p>
								<span>일</span>
							</div>
							<div class="b_cal">
								<p>12일</p>
								<span>월</span>
							</div>
							<div class="b_cal">
								<p>13일</p>
								<span>화</span>
							</div>
							<div class="b_cal">
								<p>13일</p>
								<span>화</span>
							</div>
							<div class="b_cal">
								<p>13일</p>
								<span>화</span>
							</div>
							<div class="b_cal">
								<p>13일</p>
								<span>화</span>
							</div>
							<div class="b_cal">
								<p>13일</p>
								<span>화</span>
							</div>
						</div>
					</div>
				</div>
				
				
				<div id="list">
				<ul>
					<li class="item">
						<a href="/social" style="outline: none; color: #222836; text-decoration: none; cursor: pointer;">
							<div class="time">
								<p>10:00</p>
							</div>
							<div class="info">
								<div class="title">
									<h3>HM풋살파크 안산 고잔점 A구장 *주차16자리*</h3>									
								</div>
								<div class="option">
									<span class="isMix">남녀모두</span><span>6vs6</span><span>3파전</span><span>모든레벨</span>
								</div>
							</div>
	
							<div class="schedule">
								<div class="Hurry">
									<p style="margin: 0px;">마감임박!</p>
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div>	
				
			<div id="list">
				<ul>
					<li class="item">
						<a href="/social" style="outline: none; color: #222836; text-decoration: none; cursor: pointer;">
							<div class="time">
								<p>17:00</p>
							</div>
							<div class="info">
								<div class="title">
									<h3>HM풋살파크 안산 고잔점 B구장 *주차16자리*</h3>									
								</div>
								<div class="option">
									<span class="isMan">남녀모두</span><span>6vs6</span><span>3파전</span><span>모든레벨</span>
								</div>
							</div>
	
							<div class="schedule">
								<div class="isOpen">
									<p style="margin: 0px;">신청가능</p>
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div>
			
			<div id="list">
				<ul>
					<li class="item">
						<a href="/social" style="outline: none; color: #222836; text-decoration: none; cursor: pointer;">
							<div class="time">
								<p>19:00</p>
							</div>
							<div class="info">
								<div class="title">
									<h3>HM풋살파크 안산 고잔점 ㅠ구장 *주차16자리*</h3>								
								</div>
								<div class="option">
									<span class="isMix">남녀모두</span><span>6vs6</span><span>3파전</span><span>모든레벨</span>
								</div>
							</div>
	
							<div class="schedule">
								<div class="isFull">
									<p style="margin: 0px;">마감</p>
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div>		
				
				
			</div>
		</div> -->

	</div>
	<div class="clear"></div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<ul>
						<li class="ma"><img class="ma_img"
							src="/resources/images/rental/as_hm1.jpg" alt="..." /></li>
						<li class="ma"><img class="ma_img"
							src="/resources/images/rental/as_hm2.jpg" alt="..." /></li>
						<li class="ma"><img class="ma_img"
							src="/resources/images/rental/as_hm3.jpg" alt="..." /></li>
						<li class="ma"><img class="ma_img"
							src="/resources/images/rental/as_hm4.jpg" alt="..." /></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</article>

<!-- 카카오맵 api -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1e91324cb846f49c6af089e52a7498a"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.31180981633277, 126.8289844683709), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.31180981633277, 126.8289844683709); 

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
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>