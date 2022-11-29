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
				<h1><a href="/q&a/q&a" style="color:#3534AB">Q&A</a> > <a href="/q&a/q&a_6" style="color:#3534AB">매너/제재</a></h1>
				<div id="qna_title">
					<h3>레드 카드를 받으면 어떻게 되나요?</h3>
				</div>
			<pre>처음 레드 카드를 받으면 14일 동안 이용이 제한됩니다.

이후 레드 카드를 받을 때 마다 이용 정지 일 수가 늘어납니다.

14 -&gt; 30 -&gt; 90 -&gt; 영구정지

</pre>
			</div>
		</div>
	</article>

	<jsp:include page="../../include/footer.jsp" />

</body>
</html>