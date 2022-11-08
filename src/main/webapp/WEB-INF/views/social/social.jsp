<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<jsp:include page="../include/header.jsp" />
	<link rel="stylesheet" type="text/css" href="/resources/css/social.css" />
	
	<script type="text/javascript">
		$(function(){
			$('.accor_title').children('button').on('click',function(){
				if($(this).children('i').attr('class') == 'fa-solid fa-chevron-right'){
					$(this).children('i').attr('class','fa-solid fa-chevron-down');
				}else{
					$(this).children('i').attr('class','fa-solid fa-chevron-right');
				}
			});
		});
	</script>
	
	<script type="text/javascript">
	
	$(function(){
		if('${stadium.shower}' == 0){
			$('#shower_img').attr('class', 'icon_no')
			$('#shower_text').attr('class', 'disable')
		}
		if('${stadium.shoes_rental}' == 0){
			$('#shoes_img').attr('class', 'icon_no')
			$('#shoes_text').attr('class', 'disable')
		}
		if('${stadium.vest_rental}' == 0){
			$('#vest_text').attr('class', 'disable')
		}
		
	});
	
	</script>

	<div id="carousel_container">
		<div id="myCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
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
					<img src="/resources/images/social/ground_1.jpeg" alt="..."  width=1024
						height="488">
				</div>

				<div class="carousel-item">
					<img src="/resources/images/social/ground_2.jpeg" alt="..." width=1024
						height="488">
				</div>

				<div class="carousel-item">
					<img src="/resources/images/social/ground_3.jpeg" alt="..." width=1024
						height="488">
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
	
	<div id="social_container">
		<div id="social_container_left">
			<div id="summary" class="social_cont">	
				<div id="summary_top">
					<div class="title">매치 포인트</div>
					<div id="summary_info">
						<div class="summary_info_cont">
							<ion-icon class="icon" name="football-outline"></ion-icon>
							<p>${sm_dto.match_level}</p>
						</div>
						<div class="summary_info_cont">
							<span class="icon"><i class="fa-solid fa-venus-mars"></i></span>
							<c:choose>
								<c:when test="${sm_dto.gender == 1 }">
									<p>남성 경기</p>
								</c:when>
								<c:when test="${sm_dto.gender == 2 }">
									<p>여성 경기</p>
								</c:when>
								<c:otherwise>
									<p>남녀 모두</p>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="summary_info_cont">
							<span class="icon"><i class="fa-solid fa-person fa-2x"></i></span>
							<p>${sm_dto.versus_num}&nbsp;${sm_dto.match_type}</p>
						</div>
						<div class="summary_info_cont">
							<ion-icon class="icon" name="person-add-outline"></ion-icon>
							<p>10명 ~ ${sm_dto.player_num}명</p>
						</div>
						<div class="summary_info_cont">
							<span class="icon"><img
								src="https://plab-football.s3.amazonaws.com/static/img/ic_info_shoes.svg"
								class="icon"></span>
							<p>${sm_dto.shoes}</p>
						</div>
						<div class="summary_info_cont">
							<ion-icon class="icon" name="timer-outline"></ion-icon>
							<p>${sm_dto.match_time}</p>
						</div>
					</div>
				</div>
				<div id="summary_bottom">
					<div id="profile">
						<img alt="프로필" src="/resources/images/social/default_profile.png">
					</div>
					<div id="manager_desc">
						<p>${sm_dto.manager} 매니저가 진행해요<p>
					</div>
				</div>
			</div>
			
			<div id="info" class="social_cont">
				<div id="info_top">
					<div class="title">구장 정보</div>
					<div id="info_info">
						<div class="info_info_cont">
							<img src="https://plab-football.s3.amazonaws.com/static/img/ic_info_stadium.svg" class="icon">
							<p>${stadium.stadium_size}</p>
						</div>
						<div class="info_info_cont">
							<img id="shower_img" src="https://plab-football.s3.amazonaws.com/static/img/ic_info_shower.svg" class="icon">
							<p id="shower_text">샤워실</p>
						</div>
						<div class="info_info_cont">
							<img id="parking_img" src="https://plab-football.s3.amazonaws.com/static/img/ic_info_park.svg" alt="유료주차" class="icon">
							<p id="parking_text">
								<c:choose>
									<c:when test="${stadium.parking_lot == 1}">
										무료주차
									</c:when>
									<c:otherwise>
										유료주차
									</c:otherwise>
								</c:choose>
							</p>
						</div>
						<div class="info_info_cont">
							<img id="shoes_img" src="https://plab-football.s3.amazonaws.com/static/img/ic_info_shoes.svg" class="icon">
							<p id="shoes_text">풋살화 대여</p>
						</div>
						<div class="info_info_cont">
							<img id="vest_img" src="https://plab-football.s3.amazonaws.com/static/img/ic_info_wear.svg" class="icon">
							<p id="vest_text">운동복 대여</p>
							
						</div>
					</div>
				</div>
				<div class="stadInner">
					<div class="matchRule">
						<h4>구장 특이사항</h4>
						<pre>
							<c:forEach var="item" items="${etcs}">
								■${item}
							</c:forEach>
						</pre>
					</div>
				</div>
			</div>
			
			<div id="rule" class="social_cont">
				<div class="accor_title" id="accor_arrow">
					<p>매치 진행 및 취소 규정</p>
					<button data-bs-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample" style="border: none;">
						<i class="fa-solid fa-chevron-right"></i>
					</button> 
				</div>
				<div class="collapse" id="collapseExample">
					<div class="stadInner" style="border: none;">
						<ul class="matchRule">
							<h4>매치 규칙</h4>
							<li>모든 파울은 사이드라인에서 킥인</li>
							<li>골키퍼에게 백패스 가능. 손으로는 잡으면 안돼요</li>
							<li>사람을 향한 태클 금지</li>
						</ul>
						<ul class="matchRule">
							<h4>진행 방식</h4>
							<li>풋살화와 개인 음료만 준비하세요</li>
							<li>매니저가 경기 진행을 도와드려요</li>
							<li>골키퍼와 휴식을 공평하게 돌아가면서 해요</li>
							<li>레벨 데이터를 기준으로 팀을 나눠요</li>
							<li>친구끼리 와도 팀 실력이 맞지 않으면 다른 팀이 될 수 있어요</li>
						</ul>
						<ul class="matchRule">
							<h4>일반 취소 규정</h4>
							<li>매치 시작 1시간 30분 전까지 최소 인원(10명) 미달 시 매치가 취소 됩니다. 취소 시 카카오톡을
								통해 안내드리며 캐시는 전액 환급됩니다.</li>
						</ul>
						<ul class="matchRule">
							<h4>특수 취소 규정(우천)</h4>
							<li>당일 예보 변동이 심해, 실시간으로 예보를 확인하고 매치 시작 4시간 전까지 강수 안내 알림톡을
								발송합니다.</li>
							<li>강수 안내 알림톡을 받고, 매치 시작 1시간 30분 전까지 취소하면 전액 환불합니다.</li>
							<li>매치 시작 1시간 30분 내에 취소하거나 무단 불참하면 이용이 제한될 수 있습니다.</li>
							<li>취소자가 다수 발생하거나, 구장 상태 악화로 진행이 어렵다면 매치 시작 1시간 30분 이내라도 즉시
								취소 안내를 드립니다.</li>
							<li>강한 비(눈)로 매치를 취소 또는 중단할 경우, 남은 시간 만큼 캐시로 환산해 돌려 드립니다.</li>
						</ul>
						<div></div>
					</div>
				</div>
			</div>
			
			<div id="refund" class="social_cont">
				<div class="accor_title" id="accor_arrow_1">
					<p>환불 정책</p>
					<button data-bs-toggle="collapse" href="#collapseExample_1"
						aria-expanded="false" aria-controls="collapseExample_1"
						style="border: none;">
						<i class="fa-solid fa-chevron-right"></i>
					</button>
				</div>
				<div class="collapse" id="collapseExample_1">
					<div class="stadInner section__body" style="border: none;">
						<ul class="matchRule">
							<h4>신청 취소 시 환불 기준</h4>
							<table class="table">
							  <tbody style="font-size: 14px; margin-top: 10px;">
							    <tr>
							      <td scope="row">매치 2일 전</td>
							      <td>무료 취소</td>
							    </tr>
							    <tr>
							      <td scope="row">매치 1일 전</td>
							      <td>80% 환급</td>
							    </tr>
							    <tr>
							      <td scope="row">매치 시작 90분 전까지</td>
							      <td>20% 환급</td>
							    </tr>
							    <tr>
							      <td scope="row">매치 시작 90분 이내</td>
							      <td>0% (환급 불가)</td>
							    </tr>
							  </tbody>
							</table>
<!-- 							<img src="/resources/images/table.PNG" width="550" height="120">
 -->						</ul>
						<ul class="matchRule">
							<h4>그 외 취소 기준</h4>
							<li>기상악화 매치매치 시작 90분 전까지 무료취소 가능 (기상악화로 설정되어 메시지가 발송된 매치만
								해당합니다)</li>
							<li>쿠폰으로 신청한 경우매치 시작 90분 전까지 취소 시 반환 가능</li>
						</ul>
						<div></div>
					</div>
				</div>
			</div>
		</div>
		<div id="social_container_right">
			<div id="social_right_top">
				<div class="title">${fn:substring(sm_dto.match_date,5,7)}월 ${fn:substring(sm_dto.match_date,8,10)}일 ${dayofweek}요일 ${fn:substring(sm_dto.match_date,10,16)}</div>
				<div id="per_ground">
					<a href="#">${sm_dto.stadium_name}</a> 
				</div>
				<div id="address">
					<a href="#">${stadium.address}</a>
				</div>
				<div id="map">
					<a href="#">지도보기</a>
				</div>
				<div id="cost">
					<span><fmt:formatNumber value="${sm_dto.price}" pattern="#,###"/>원</span>
					<p>&nbsp;/&nbsp;${sm_dto.match_time}</p>
				</div>
			</div>
			<div id="social_right_bottom">
				<c:choose>
					<c:when test="${(sm_dto.player_num - sm_dto.current_count) <= 0}">
						<button id="pay_btn_disabled" disabled>
							<span>지난매치입니다</span>
						</button>
					</c:when>
					<c:when test="${(sm_dto.player_num - sm_dto.current_count) > 3}">
						<a href="social/social_order?no=${sm_dto.match_no}"><button id="pay_btn_available">
							<span>신청가능</span>
						</button></a>
					</c:when>
					<c:when test="${((sm_dto.player_num-sm_dto.current_count) <= 3) && ((sm_dto.player_num-sm_dto.current_count) > 0)}">
						<a href="social/social_order?no=${sm_dto.match_no}"><button id="pay_btn_almost">
							<span>마감임박!!</span>
						</button></a>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>