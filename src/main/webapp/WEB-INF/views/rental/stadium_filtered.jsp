<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
													<c:forEach items="${stm_list}" var="st">
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
																	<a href="/rental/order?no=${st.stadium_match_no}">
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