<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공차 공지사항</title>
<link rel="stylesheet" type="text/css" href="/First_Project/css/notice_cs.css" />
<script type="text/javascript" src="/First_Project/js/jquery.js"></script>
</head>
<body>

	<jsp:include page="../include/header.jsp" />

	<article>
		<div id="notice_container">
			<div id="notice_t">
				<h1 id="notice_title">공지사항</h1>
			</div>

			<div id="notice_list">
				<a href="#" id="notice_name"><h4>날씨에 따른 Gong차(공Cha) 경기 운영</h4></a>
				<a href="#" id="notice_name"><h4>새로운 매니저 지원 방식</h4></a> 
				<a href="#" id="notice_name"><h4>Gong차(공Cha)와 제휴를 맺고 싶다면?</h4></a>
				<a href="#" id="notice_name"><h4>CS관련 공지사항</h4></a>
				<a href="#" id="notice_name"><h4>사이트 개편</h4></a>
			</div>
		</div>
	</article>

	<jsp:include page="../include/footer.jsp" />

</body>
</html>