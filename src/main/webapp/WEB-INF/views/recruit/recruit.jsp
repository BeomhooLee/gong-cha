<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>용병모집</title>
<link rel="stylesheet" type="text/css" href="/resources/css/recruit.css" />
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#location').children('button').click(function(){
			$(this).attr('class', 'blue');
			$(this).siblings('button').attr('class', 'normal');
		});
	});
	
	$(function() {
		$('#left').children('div').click(function(){
			$(this).toggleClass("on");
		});
	});
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	
<div class="clear"></div>
	<div id="nav">
		<span id="nav_a"> <a href="/">소셜매치&nbsp;&nbsp;<img
				src="/resources/images/social.svg"></a>
		</span> <span id="nav_b"> <a href="rental">구장예약&nbsp;&nbsp;<img
				src="/resources/images/reservation.svg"></a>
		</span> <span id="selected"> <a href="recruit">용병모집&nbsp;&nbsp;<img
				src="/resources/images/personplus.svg"></a>
		</span>
	</div>
<div class="clear"></div>

	<article>
		<div id="recruitFilter">
			<div id="filterBox">
				<div id="left">
					<div class="locationBtn" id="locationBtn" role="button" data-bs-toggle="collapse"
						data-bs-target="#location" aria-expanded="false"
						aria-controls="location">지역선택</div>

					<div class="calendarBtn" id="calendarBtn" data-bs-toggle="collapse"
						data-bs-target="#cal" role="button" aria-expanded="false"
						aria-controls="cal">날짜선택</div>
				</div>
				<div id="right">
					<div id="sortBox">
						<div id="sortBox_1">날짜순</div>
						<div id="sortBox_2">등록순</div>
					</div>
				</div>
			</div>
		</div>
		<div id="collapse_wrap">
			<div class="collapse" id="location">
				<button name="local" value="all" class="blue">전체</button>
				<button name="local" value="seoul" class="normal">서울</button>
				<button name="local" value="gyeonggi" class="normal">경기</button>
				<button name="local" value="busan" class="normal">부산</button>
				<button name="local" value="daegu" class="normal">대구</button>
			</div>
			<div class="collapse" id="cal">
				<div class="calendar-container">
					<h2 class="month-year">9월 2022</h2>

					<table class="calendar">
						<thead>
							<tr>
								<th class="day-title" scope="col"><span class="day-number">일</span></th>
								<th class="day-title" scope="col"><span class="day-number">월</span></th>
								<th class="day-title" scope="col"><span class="day-number">화</span></th>
								<th class="day-title" scope="col"><span class="day-number">수</span></th>
								<th class="day-title" scope="col"><span class="day-number">목</span></th>
								<th class="day-title" scope="col"><span class="day-number">금</span></th>
								<th class="day-title" scope="col"><span class="day-number">토</span></th>
							</tr>
						</thead>
						<tbody>
							<tr class="week">
								<td class="day prev-mon" tabindex="0"><span
									class="day-number">29</span></td>
								<td class="day prev-mon" tabindex="0"><span
									class="day-number">30</span></td>
								<td class="day prev-mon" tabindex="0"><span
									class="day-number">31</span></td>
								<td class="day" tabindex="0"><span class="day-number">1</span></td>
								<td class="day today" tabindex="0"><span class="day-number">2</span></td>
								<td class="day" tabindex="0"><span class="day-number">3</span></td>
								<td class="day" tabindex="0"><span class="day-number">4</span></td>
							</tr>
							<tr class="week">
								<td class="day" tabindex="0"><span class="day-number">5</span></td>
								<td class="day" tabindex="0"><span class="day-number">6</span></td>
								<td class="day" tabindex="0"><span class="day-number">7</span></td>
								<td class="day" tabindex="0"><span class="day-number">8</span></td>
								<td class="day" tabindex="0"><span class="day-number">9</span></td>
								<td class="day" tabindex="0"><span class="day-number">10</span></td>
								<td class="day" tabindex="0"><span class="day-number">11</span></td>
							</tr>
							<tr class="week">
								<td class="day" tabindex="0"><span class="day-number">12</span></td>
								<td class="day" tabindex="0"><span class="day-number">13</span></td>
								<td class="day" tabindex="0"><span class="day-number">14</span></td>
								<td class="day" tabindex="0"><span class="day-number">15</span></td>
								<td class="day" tabindex="0"><span class="day-number">16</span></td>
								<td class="day" tabindex="0"><span class="day-number">17</span></td>
								<td class="day" tabindex="0"><span class="day-number">18</span></td>
							</tr>
							<tr class="week">
								<td class="day" tabindex="0"><span class="day-number">19</span></td>
								<td class="day" tabindex="0"><span class="day-number">20</span></td>
								<td class="day" tabindex="0"><span class="day-number">21</span></td>
								<td class="day" tabindex="0"><span class="day-number">22</span></td>
								<td class="day" tabindex="0"><span class="day-number">23</span></td>
								<td class="day" tabindex="0"><span class="day-number">24</span></td>
								<td class="day" tabindex="0"><span class="day-number">25</span></td>
							</tr>
							<tr class="week">
								<td class="day" tabindex="0"><span class="day-number">26</span></td>
								<td class="day" tabindex="0"><span class="day-number">27</span></td>
								<td class="day" tabindex="0"><span class="day-number">28</span></td>
								<td class="day" tabindex="0"><span class="day-number">29</span></td>
								<td class="day" tabindex="0"><span class="day-number">30</span></td>
								<td class="day" tabindex="0"><span class="day-number">31</span></td>
								<td class="day next-mon" tabindex="0"><span
									class="day-number">1</span></td>
							</tr>
						</tbody>
					</table>
					
					<div class="calBtn">
					<a class="button reset">Clear</a>
					<a class="button">OK</a>
					</div>
				</div>
			</div>
		</div>
		<form action="recruit_detail" method="get">
		<div id="recruitList">
		  <div class="inf">
			<div style="width:15%;">경기 날짜</div><div style="width:62%;">제목</div><div>글쓴이</div><div>작성일</div>	
		  </div>
			<ul>
			  <c:if test="${!empty list}">
		<c:forEach var="t" items="${list}">			
				<%--<li class="item"><a
					style="outline: none; color: #222836; text-decoration: none; cursor: pointer;">
						<div class="time">
							<p>10/8(토) 18:00</p>
						</div>
						<div class="info">
							<div class="title">
								<h3>서울 영등포 더에프 필드 K구장</h3>
								<span class="new">12</span>
							</div>
							<div class="option">
								<span class="isMix">남녀모두</span><span>6vs6</span><span>3파전</span><span>모든레벨</span>
							</div>
						</div>

						<div class="schedule">
							<div class="Hurry">
								<p style="margin: 0px;">급구!</p>
							</div>
						</div>
				</a></li> --%>

				<li class="item"><a
					style="outline: none; color: #222836; text-decoration: none; cursor: pointer;" role="button" href="recruit_detail?recruit_no=${t.recruit_no }">
						<div class="time">
							<p>${fn:substring(t.match_date,0,10)}</p>
						</div>
						<div class="info">
							<div class="title" id="title">
								<h3>${t.title}</h3>
							</div>
							<div class="option">
								<span class="isMix" id="stadium_name">${t.stadium_name}</span><span>${t.start_time} ~ ${t.end_time }</span>
								<span>
								<c:if test="${t.match_level == 1}">실력 하</c:if>
								<c:if test="${t.match_level == 2}">실력 중</c:if>
								<c:if test="${t.match_level == 3}">실력 상</c:if>
								</span>
								<span>${t.price}원</span>
							</div>
						</div>

						<div class="mem">
						  <h3>${t.mem_id}</h3>
						</div>
						
						<div class="mem">
						  <h3>${fn:substring(t.regdate,11,16) }</h3>
						</div>
				</a></li>
			  </c:forEach>
		</c:if>
			</ul>
			<div id="board_insert" class="board_insert"
				onclick="location='recruit_regi'">글등록</div>
		</div>
		</form>
		<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

	</article>

	<jsp:include page="../include/footer.jsp" />
	<script type="text/javascript" src="/resources/js/cal.js"></script>
</body>
</html>