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
				<h1><a href="/q&a/q&a" style="color:#3534AB">Q&A</a> > <a href="/q&a/q&a_3" style="color:#3534AB">매치 신청</a></h1>
				<div id="qna_title">
					<h3>남녀 모두 매치는 무엇인가요?</h3>
				</div>
				<pre>남녀 모두 누구나 자유롭게 참여할 수 있는 매치입니다.

남성 매치가 체력적으로 버거운 남성 참가자, 더 빠른 템포의 경기를 뛰고 싶은 여성 참가자에게 추천해요. 

보통 남성 비율이 높고 비정기적으로 진행하고 있습니다. 

남녀 비율은 따로 맞추지 않고, 남녀 누구나 자유롭게 신청 가능해요. 

과한 몸싸움이나 강한 슈팅은 보다는 서로 배려하며 재미있게 찰 수 있는 매너 플레이를 하면 좋아요.</pre>
			</div>
		</div>
	</article>

	<jsp:include page="../../include/footer.jsp" />

</body>
</html>