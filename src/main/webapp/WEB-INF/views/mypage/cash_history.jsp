<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	int[] cashlist = { 10000, 20000, 30000, 40000, 20000, 20000, 10000 };
int cash = 10000;
Date date = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd E");
request.setAttribute("cashlist", cashlist);
request.setAttribute("cash", cash);
request.setAttribute("id", "userid");
request.setAttribute("date", date);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공차고 싶을 땐 공차(GongCha) | 마이페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/cash_history.css" />
<script type="text/javascript" src="/resources/js/jquery.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />

	<article>
		<div class="content">
			<h3>충전 내역</h3>
			<div class="innerBox">
				<div class="cashcontainer">
					<div class="cashBox">
						<div class="right">
							<p style="font-size: 12px;">캐시</p>
							<p style="font-size: 20px; font-weight: 700;">${cash}원</p>
						</div>

						<a href="cash">
							<div class="cashCharge">
								<span>캐시 충전</span>
							</div>
						</a>
					</div>
				</div>

				<div class="chargelsit" style="padding-top: 30px;">
					<c:if test="${cash == 0}">
						<ul>
							<li style="list-style: none;">
								<p>아직 충전 내역이 없습니다.</p>
							</li>
						</ul>
					</c:if>
					<c:if test="${cash != 0}">
						<p><span style="color: #25316D;">${id}</span>님의충전내역</p>
						<c:forEach var="ca" items="${cashlist}">
							<ul>
								<li>
									<div class="cashHistory">
										<div class="date">
											<span><%=sf.format(date)%></span>
										</div>
										<div class="cash">
											<span>${ca}</span>원
											<c:set var="total" value="${total +ca}" />
										</div>
									</div>
								</li>
							</ul>
						</c:forEach>
						<div class="totalCash">
							총 금액 :
							<c:out value="${total}" />
							원
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</article>

	<jsp:include page="../include/footer.jsp" />
</body>
</html>