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
				<h1><a href="/q&a/q&a" style="color:#3534AB">Q&A</a> > 매치 신청</h1>
				<a href="/q&a/q&a_3_1" class="notice_name"><h4>마감된 경기에 대기 신청이 가능한가요?</h4></a>
				<a href="/q&a/q&a_3_2" class="notice_name"><h4>나이 제한이 있나요?</h4></a>
				<a href="/q&a/q&a_3_3" class="notice_name"><h4>남성 매치에 여성이 참가할 수 있나요?</h4></a>
				<a href="/q&a/q&a_3_4" class="notice_name"><h4>남녀 모두 매치는 무엇인가요?</h4></a>
				<a href="/q&a/q&a_3_5" class="notice_name"><h4>고정 골키퍼가 가능한가요?</h4></a>
			</div>
		</div>
	</article>

	<jsp:include page="../../include/footer.jsp" />

</body>
</html>