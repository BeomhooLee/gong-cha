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
					<h3>신청한 경기를 취소하고 싶어요</h3>
				</div>
				<pre>신청한 경기는 마이페이지 - 신청내역을 통해 직접 취소할 수 있습니다. 

[매치 참가 취소 시 환불 기준]

-결제 후 30분 이내 : 무료 취소 (하루 1회 / 매치 시작 90분 전까지)
-매치 2일 전 : 무료 취소
-매치 1일 전 : 80% 환급
-매치 시작 90분 전까지: 20% 환급
-매치 시작 90분 이내 : 0% 환급 (환급 불가)

----------------------------------------------

[그 외 취소 기준]

- 기상 악화 매치
매치 시작 90분 전까지 무료 취소 가능(기상악화로 설정되어 메세지가 발송 된 매치만 해당 합니다)

-쿠폰 참가 매치
매치 시작 90분 전까지 취소 시 반환 가능

*결제 후 30분 이내 취소는 매치 시작 90분 전까지만 가능합니다.

*취소 없이 무단 불참하면 서비스 이용에 제한이 있을 수 있습니다.
				</pre>		
			</div>
		</div>
	</article>

	<jsp:include page="../../include/footer.jsp" />

</body>
</html>