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
				<h1><a href="/q&a/q&a" style="color:#3534AB">Q&A</a> > <a href="/q&a/q&a_4" style="color:#3534AB">구장 예약</a></h1>
				<div id="qna_title">
					<h3>구장 예약 환불 규정이 궁금해요</h3>
				</div>
				<pre>구장 예약은 취소 시 아래 기준에 따라 환불됩니다. 

[일반]
-결제 후 30분 이내 취소 시 100% 환불 (하루 1회)
-7일 전 취소 시 100% 환불
-5일 전 취소 시 80% 환불
-3일 전 취소 시 50% 환불
-2일 전 ~ 대관 당일 환불 불가
(캐시는 규정에 따라 자동 환급되고, 계좌 환불은 충전 내역에서 잔액 환불 버튼을 눌러주세요.)

[특수]
천재지변
-당일 천재지변으로 인해 구장 이용이 불가한 경우 100% 환불
(적용기준: 호우경보,대설경보,태풍주의보,태풍경보)

우천
-시간 당 5mm 이상 시 날짜 변경 가능
(기준: 당일 이용 2시간 전 기상청 날씨누리 해당 주소지 기준)
단순 변심에 의한 날짜 변경은 불가</pre>
			</div>
		</div>
	</article>

	<jsp:include page="../../include/footer.jsp" />

</body>
</html>