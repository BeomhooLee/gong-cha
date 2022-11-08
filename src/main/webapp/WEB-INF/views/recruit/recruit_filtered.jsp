<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${!empty list}">
		<c:forEach var="t" items="${list}">			

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
								<span class="isMix" id="stadium_name">${t.stadium_name}</span><span>${t.address}</span><span>${t.start_time} ~ ${t.end_time }</span>
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
						  <h3>${fn:substring(t.regdate,5,10) }</h3>
						</div>
				</a></li>
			  </c:forEach>
		</c:if>