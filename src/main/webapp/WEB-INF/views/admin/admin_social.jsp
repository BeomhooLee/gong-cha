<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소셜 매치 관리</title>
</head>
<body>
<h2>소셜 매치 관리</h2>
	<table border="1">
		<tr>
			<th>번호</th><th>구장이름</th><th>경기일</th><th>가격</th><th>VS</th><th>매치타입</th><th>성별</th><th>신발</th><th>인원</th><th>수준</th><th>경기시간</th><th>참여인원수</th><th>매니저</th><th>시작시간</th><th>종료시간</th>
		</tr>
			<c:forEach var="m" items="${s}">
			<tr>
			<td>${m.match_no}</td><td>${m.stadium_name}</td><td>${m.match_date}</td>
			<td>${m.price}</td><td>${m.versus_num}</td><td>${m.match_type}</td>
			<td>${m.gender}</td><td>${m.shoes}</td><td>${m.player_num}</td>
			<td>${m.match_level}</td><td>${m.match_time}</td><td>${m.current_count}</td>
			<td>${m.manager}</td><td>${m.start_time}</td><td>${m.end_time}</td>
			</tr>
			</c:forEach>			
	</table>
</body>
</html>