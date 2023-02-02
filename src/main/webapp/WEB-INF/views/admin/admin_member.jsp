<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 관리</title>
</head>
<body>
	<h2>사용자 관리</h2>
	<table border="1">
		<tr>
			<th>아이디</th><th>이름</th><th>비밀번호</th><th>가입일</th><th>예약수량</th><th>게시글수</th>
		</tr>
			<c:forEach var="m" items="${m}">
			<tr>
			<td>${m.mem_id}</td><td>${m.mem_name}</td><td>${m.mem_pwd}</td><td>없음</td><td>없음</td><td>없음</td>
			</tr>
			</c:forEach>			
	</table>
</body>
</html>
