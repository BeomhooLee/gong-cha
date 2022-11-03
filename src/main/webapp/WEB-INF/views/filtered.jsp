<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<c:forEach items="${sm_list}" var="sm" varStatus="status">
						<li class="item""><a href="/social?match_no=${sm.match_no}"
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
									<c:if
										test="${((sm.player_num-sm.current_count) <= 3) && ((sm.player_num-sm.current_count)>0)}">
										<div class="Hurry">
											<p style="margin: 0px;">마감임박!</p>
										</div>
									</c:if>

									<c:if test="${(sm.player_num - sm.current_count) == 0}">
										<div class="isFull">
											<p style="margin: 0px;">마감</p>
										</div>
									</c:if>

									<c:if test="${(sm.player_num-sm.current_count) >= 3}">
										<div class="isOpen">
											<p style="margin: 0px;">신청가능</p>
										</div>
									</c:if>
								</div>

						</a></li>
					</c:forEach>