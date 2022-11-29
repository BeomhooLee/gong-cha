<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙리스트</title>
<link rel="stylesheet" type="text/css" href="/resources/css/black_list.css" />
<script type="text/javascript" src="/resources/js/jquery.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	
<div class="clear"></div>

	<article>
	
		<div class="blackList">
		<div class="blck_list_t">
			<h5 class="b_title">블랙리스트 신고 </h5>
		</div>
		  <div class="inf">
			<div style="width:62%;">제목</div><div style="margin-right: 5px;">글쓴이</div><div style="margin-right: 20px;">작성일</div>	
		  </div>
			<ul class="black_lsit">
			  <c:if test="${!empty list}">
		<c:forEach var="b" items="${list}">			

				<li class="item"><a
					style="outline: none; color: #222836; text-decoration: none; cursor: pointer;" role="button" href="/side_menu/black_list_content?no=${b.black_list_no }">
						<div class="info">
							<div class="title" id="title" style="justify-content: center;">
								<h3>${b.black_list_title}</h3>
							</div>
						</div>

						<div class="mem">
						  <h3>${b.mem_id}</h3>
						</div>
						
						<div class="mem">
						  <h3>${fn:substring(b.regdate,0,10) }</h3>
						</div>
				</a></li>
			  </c:forEach>
		</c:if>
		
		<c:if test="${empty list}">
			<div class="empty"><h5>현재 블랙리스트 신고 내역이 없습니다.</h5></div>
		</c:if>
			</ul>
			<div class="board_insert" onclick="location='/side_menu/black_list_regi'">글등록</div>
		</div>

	</article>

	<jsp:include page="../include/footer.jsp" />
</body>
</html>