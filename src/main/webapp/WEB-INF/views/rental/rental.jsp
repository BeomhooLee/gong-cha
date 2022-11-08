<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
	<jsp:include page="../include/header.jsp" />
	<link rel="stylesheet" type="text/css" href="/resources/css/rental.css" />
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
	$(document).on("click", 'button[type="button"]',function() {
				var selectedBtns = document.querySelectorAll('button[class="blue"]');
				var selectedDate = document.querySelector('button[class="b_cal"]')
				$('input[type="hidden"][id="date"]').attr("value",$(this).children('p').data('caldate'));
				//  구장 상세 설정 필터링
				selectedBtns.forEach(function(v) {
					$('input[type="hidden"][id="region"]').attr("value", v.innerText);
				});
				
				
				filter();
			});
	</script>
	<script type="text/javascript">
		$(function(){
			$('#reserve').click(function(){
				$(this).toggleClass("on");
				if($(this).attr("class") == 'filterBtn on'){
					$(".soldout").hide()
				}else{
					$(".soldout").show()
				}
			});
		});
	</script>
	<script type="text/javascript">
	function filter() {
		
		var region = $('input[type="hidden"][id="region"]').attr("value");
		var selectedDate = $('input[type="hidden"][id="date"]').attr("value");
		var sendData = {"region" : region,"selectedDate" : selectedDate}
		
		$.ajax({
			url : "/stadium_filter",
			method : 'POST',
			data : JSON.stringify(sendData),
			contentType : 'application/json; charset=UTF-8',
			dataTye : "html",
			success : function(data) {
				$('.ajax_result').html(data);
			}
		});

	};
</script>
	<script type="text/javascript">
		$(function() {
			$('#location').children('button').click(function() {
				$(this).attr('class', 'blue');
				$(this).siblings('button').attr('class', 'normal');
			});
		});
	
		function checked(){
			alert('이미 예약된 구장입니다.');
		}
 	</script>
 	
 	
	
	<script>
		/* 지역 선택 버튼, 다른곳 클릭시 collapse */
		$('html').click(function(e){
			var button = $('#location').children('button')
			var button_bool = $(e.target).is(button)
			var location = $(e.target).is('#location')
	    	if(!(button_bool || location)){
	        	$('#location').attr("class", "collapse")
	        }
	    });
	</script>

	<div class="clear"></div>
	<div id="nav">
		<span id="nav_a"> <a href="/">소셜매치&nbsp;&nbsp;<img
				src="/resources/images/social.svg"></a>
		</span> <span id="selected"> <a href="rental">구장예약&nbsp;&nbsp;<img
				src="/resources/images/reservation.svg"></a>
		</span> <span id="nav_c"> <a href="recruit">용병모집&nbsp;&nbsp;<img
				src="/resources/images/personplus.svg"></a>
		</span>
	</div>
	<div class="clear"></div>

	<article>
		<div id="rental_container">
			<div id="rental_wrap">

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

				<div class="clear"></div>

				<div id="rental_filter">
					<div id="rFilter">
						<div id="filter_wrapper">
							<div class="filterBtn" role="button" data-bs-toggle="collapse"
								data-bs-target="#location" aria-expanded="false"
								aria-controls="location">
								<span>지역선택</span>
							</div>
							<button data-class="avail" class="filterBtn" id="reserve">
								<span>예약가능</span>
							</button>
						</div>
					</div>
				</div>
				<div class="collapse" id="location">
					<button type="button" data-class="region" name="local" value="전체" class="blue">전체</button>
					<button type="button" data-class="region" name="local" value="서울특별시" class="normal">서울</button>
					<button type="button" data-class="region" name="local" value="경기도" class="normal">경기</button>
					<button type="button" data-class="region" name="local" value="부산광역시" class="normal">부산</button>
					<input type="hidden" id="date" name="date" value="${today}">
					<input type="hidden" id="region" name="region" value="전체">
				</div>
				
				
				
				
				
				
				<div id="rental_match_container" class="ajax_result">
					<c:forEach items="${stadium}" var="s">
						<ul>
							<li id="rental_list" data-city="stadium_city">
								<div id="rental_title">
									<div style="display: flex;">
										<h4 style="display: flex; align-item: flex-start;">
											<a style="align-self: center;"><c:out
													value="${s.stadium_name}" /></a>
										</h4>
									</div>
									<a href="/rental/detail?stadium=${s.stadium_name}" id="rental_info"
										style="min-width: 58px;">구장정보</a>
								</div>

								<ul>
									<li>
										<div>
											<div id="rentalChoice">
												<ul>
													<c:set var="stadium_name" value="${s.stadium_name}" />
													<c:forEach items="${stadium_match}" var="st">
														<c:set var="stadium_match_name" value="${st.stadium_name}" />
														<c:if test="${stadium_name eq stadium_match_name}" var="b">
															<c:choose>
																<c:when test="${st.available eq 1}">
																	<a href="/rental/order?no=${st.stadium_match_no}">
																		<li class="rental" data-date="${fn:substring(st.match_date,8,10)}">
																			<p class="rTime">
																				<c:out value="${st.start_time}" />
																				~<br>
																				<c:out value="${st.end_time}" />
																			</p>
																		</li>
																	</a>
																</c:when>
																<c:otherwise>
																	<a onclick="checked();">
																		<li class="rental soldout" data-date="${fn:substring(st.match_date,8,10)}">
																			<p class="rTime">
																				<c:out value="${st.start_time}" />
																				~<br>
																				<c:out value="${st.end_time}" />
																			</p>
																		</li>
																	</a>
																</c:otherwise>
															</c:choose>
														</c:if>
													</c:forEach>
												</ul>
											</div>
										</div>
									</li>
								</ul>
							</li>
						</ul>
					</c:forEach>
				</div>
				
				
				
				
				
				
				
				
				
				
			</div>
		</div>
	</article>

	<jsp:include page="../include/footer.jsp" />
</body>
</html>