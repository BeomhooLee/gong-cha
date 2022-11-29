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
					<h3>소셜 매치의 진행 방식이 궁금해요.</h3>
				</div>
				<pre>소셜 매치의 진행 방식은 아래와 같아요. 

• 6vs6 3파전: 18명이 모여 6명씩 한 팀, 총 3팀
• 5vs5 3파전: 15명이 모여 5명씩 한 팀, 총 3팀
• 한 쿼터는 13분, 총 9쿼터


각 매치마다 저희 공차에서 해당 매치를 진행하는데 도움을 주실 매니저분들을 파견하게 되며
구장에 도착하시면 매니저에게 이름을 말하여 도착했음을 알려주세요! 이후에는 매니저의 진행에 따라
경기 즐겨주세요!!</pre>	
			</div>
		</div>
	</article>

	<jsp:include page="../../include/footer.jsp" />

</body>
</html>