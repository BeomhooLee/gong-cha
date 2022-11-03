<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공차 Q&A</title>
<link rel="stylesheet" type="text/css" href="/First_Project/css/notice_cs.css" />
<script type="text/javascript" src="/First_Project/js/jquery.js"></script>
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

	<jsp:include page="../include/header.jsp" />

	<article>
		<div id="notice_container">
			<div id="qAnda_t">
				<div id="qAnda_title">Q&A</div>
				<div class="helpSearch">
					<input type="text" name="helpSearch" id="helpSearch" placeholder="키워드검색으로 궁금증을 빠르게 해결해보세요 (환불,인원변경 등)">
				</div>
			</div>
			
			<div id="qAnda_menu">
				<h3>카테고리</h3>
				<ul>
					<li><a href="#"><div>매치 취소</div></a></li>
					<li><a href="#"><div>매치 진행</div></a></li>
					<li><a href="#"><div>매치 신청</div></a></li>
					<li><a href="#"><div>서비스</div></a></li>
					<li><a href="#"><div>포인트</div></a></li>
					<li><a href="#"><div>매너/제재</div></a></li>
				</ul>
			</div>

			<div id="notice_list">
				<h3>자주묻는 질문</h3>
				<a href="#" id="notice_name"><h4>포인트를 계좌로 환불 할 수 없을까요?</h4></a>
				<a href="#" id="notice_name"><h4>비회원으로 구장예약을 하고 싶어요.</h4></a>
				<a href="#" id="notice_name"><h4>매니저로 근무하고 싶은데 어떻게 해야하나요?</h4></a>
			</div>
		</div>
	</article>

	<jsp:include page="../include/footer.jsp" />

</body>
</html>