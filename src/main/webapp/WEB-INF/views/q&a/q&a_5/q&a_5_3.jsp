<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공차 Q&A</title>
<link rel="stylesheet" type="text/css" href="/resources/css/q&a_1.css" />
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script>
	$('#helpSearch').keypress(function(e){
		if(e.which == 13){
			var keyword = $(this).val();
			
			var url="/q&a/search/keyword/";
			url=url.replace('keyword',keyword);
			location.href = url;
		}
	});
</script>
</head>
<body>

	<jsp:include page="../../include/header.jsp" />

	<article>
		<div id="notice_container">
			<div id="qAnda_t">
				<div id="qAnda_title">Q&A</div>
				<div class="helpSearch">
					<input type="text" name="helpSearch" id="helpSearch" placeholder="키워드검색으로 궁금증을 빠르게 해결해보세요 (환불,인원변경 등)">
				</div>
			</div>

			<div id="notice_list">
				<h1><a href="/q&a/q&a" style="color:#3534AB">Q&A</a> > <a href="/q&a/q&a_5" style="color:#3534AB">캐시</a></h1>
				<div id="qna_title">
					<h3>캐시를 계좌로 환불 받고 싶어요.</h3>
				</div>
			<pre>남아 있는 캐시를 계좌로 환불하고 싶으시다면 마이페이지-충전내역에서 잔액 환불 버튼을 눌러주세요.  

환불 업무는 매주 월 , 금 오후 5시~6시에 진행하고 있습니다. 

환불 신청 중에는 매치 신청이 어려우니 참고 부탁드려요.</pre>
			</div>
		</div>
	</article>

	<jsp:include page="../../include/footer.jsp" />

</body>
</html>