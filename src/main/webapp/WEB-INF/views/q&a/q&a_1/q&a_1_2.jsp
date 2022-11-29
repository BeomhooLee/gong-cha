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
				<h1><a href="/q&a/q&a" style="color:#3534AB">Q&A</a> > <a href="/q&a/q&a_1" style="color:#3534AB">매치 취소</a></h1>
				<div id="qna_title">
					<h3>비(눈)이 와서 취소하고 싶어요</h3>
				</div>
				<pre>1mm 이상의 강수 예보가 있다면 [강수 안내] 알림톡(카카오톡 혹은 문자)을 발송합니다.

알림톡을 받으신 경우, 매치 시작 1시간 30분 전까지 취소하면 전액 환불합니다.

당일 예보 변동이 심한 점을 고려해 실시간으로 예보를 확인하고 매치 시작  4시간 전까지는 알림톡을 발송해드립니다. 

*매치 시작 1시간 30분 내에 취소하거나 무단 불참하면 이용이 제한될 수 있습니다.

▶취소 방법: 마이 페이지 &gt; '신청 내역'에서 직접 취소
▶환불 규정: 매치 시작 1시간 30분 전까지 취소했을 경우
▶기준 강수: 기상청 날씨 누리 기준 해당 지역 1mm 이상 예보가 있는 경우</pre>
			</div>
		</div>
	</article>

	<jsp:include page="../../include/footer.jsp" />

</body>
</html>