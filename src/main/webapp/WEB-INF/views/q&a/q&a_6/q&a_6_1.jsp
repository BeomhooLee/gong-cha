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
					<h3>카드를 받았는데 납득하기 어려워요</h3>
				</div>
			<pre>최근 10경기 동안 여러 경기에서 여러 명의 비매너 신고가 누적되면 옐로 카드가 주어집니다.

비매너 신고는 주관적일 수 있기 때문에 지속적으로 불특정 다수에게 신고가 누적되는 경우에 옐로 카드와 레드 카드가 주어집니다.

옐로 카드를 받았더라도 5경기 동안 신고를 받지 않으면 옐로 카드는 사라집니다. 서로를 존중하고 격려하며 함께 즐기는 공차 문화를 함께 만들어주세요.</pre>
			</div>
		</div>
	</article>

	<jsp:include page="../../include/footer.jsp" />

</body>
</html>