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
				<h1><a href="/q&a/q&a" style="color:#3534AB">Q&A</a> > <a href="/q&a/q&a_2" style="color:#3534AB">매치 진행</a></h1>
				<div id="qna_title">
					<h3>경기 중에 비가 많이 오면 어떻게 되나요??
</h3>
				</div>
				<pre>경기 중에 많은 비가 내리면 참가자분들의 의사에 따라 진행 여부를 결정하고 있어요. 

경기가 중단되면 캐시, 이용권 참가자를 대상으로 진행하지 못한 시간만큼 캐시를 돌려드립니다.</pre>	
			</div>
		</div>
	</article>

	<jsp:include page="../../include/footer.jsp" />

</body>
</html>