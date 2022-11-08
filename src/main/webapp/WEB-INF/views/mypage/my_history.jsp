<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="/resources/css/my_history.css" />
<script>
function cancel1(){
	var reset = confirm('정말 취소 하시겠습니까?');
	var smNo = $('p[id="sm"]').data('value');		
	var stNo = 0;
	var price = $('p[id="sm"]').data('price');
	var sendData = {"stadium_match_no" : stNo,"match_no" : smNo , "price" : price}
	
	if(reset == true){
		$.ajax({
			url : "/historyDel",
			method : 'POST',
			data : JSON.stringify(sendData),
			contentType : 'application/json; charset=UTF-8',
			dataTye : "text",
			success : function(data) {
				alert(data);
				window.self.location = "/mypage/my_history";
			}
		});
	}
}

function cancel2(){
	var reset = confirm('정말 취소 하시겠습니까?');
	var smNo = 0;		
	var stNo = $('p[id="st"]').data('value');
	var price = $('p[id="st"]').data('price');
	var sendData = {"stadium_match_no" : stNo, "match_no" : smNo, "price" : price}
	
	if(reset == true){
		$.ajax({
			url : "/historyDel",
			method : 'POST',
			data : JSON.stringify(sendData),
			contentType : 'application/json; charset=UTF-8',
			dataTye : "text",
			success : function(data) {
				alert(data);
				window.self.location = "/mypage/my_history";
			}
		});
	}
}
</script>
</head>
<body>
  <jsp:include page="../include/header.jsp" />
  
   <div class="play_list_container">
     <section class="section">
       <div class="section_header">
         <div class="section_title">
           <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">소셜 매치</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">구장 예약</button>
  </li>
  
</ul>
		 </div>
		 
<div class="tab-content" id="pills-tabContent">
  <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
    <div class="section_body">
      <ul class="play_list">
     
        
        <!-- 소설 매치 신청 없을때 -->
        <c:if test="${sh_size <= 0}">
        <div class="empty_state">
          <p>예약한 소셜매치가 없어요<br>아래에서 더 많은 매치을 알아보세요</p>
          <a href="/" class="empty_btn">예약할 수 있는 소셜매치 보기</a>
        </div>
          </c:if>
          <!-- 소셜매치 있을때  -->
          <c:if test="${sh_size > 0}">
           <div class="match_list">
 
       </div>
          <c:forEach var="sm" items="${social_history}">
          <div id="list">
				<ul>
					<li class="item">
						<a style="outline: none; color: #222836; text-decoration: none; cursor: pointer;">
							<div class="time">
								<p>${fn:substring(sm.match_date,0,10)}</p>
							</div>
							<div class="info" style="width: 45%;">
								<div class="title">
									<h3>${sm.stadium_name}</h3>									
								</div>
								<div class="option">
									<span class="isMix">${sm.gender}</span><span>${sm.versus_num}</span><span>${sm.match_type}</span><span>${match_level}</span>
								</div>
							</div>
	
							<div class="reserv_option">
								<div class="st_info" onclick="lodcation='/social?match_no=${sm.match_no}'">
									<p style="margin: 0px;">구장정보</p>
								</div>
								<div class="cancel">
								   <p id="sm" style="margin:0px;" onclick="cancel1();" data-value="${sm.match_no}" data-price="${sm.price}">신청취소</p>
								   
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div>					
			</c:forEach>
			</c:if>
      </ul>
    </div>
  </div>
  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
    <div class="section_body">
      <ul class="play_list">
      <!-- 구장예약 없을때 -->
      <c:if test="${st_size <= 0}">
          <div class="empty_state">
          <p>예약한 구장이 없어요<br>아래에서 더 많은 구장을 알아보세요</p>
          <a href="/rental" class="empty_btn">예약할 수 있는 구장 보기</a>
        </div>
        </c:if>
      </ul>
    </div>
    <!-- 구장예약 있을때 -->
    	<c:if test="${st_size >= 0}">
      <c:forEach var="st" items="${stadium_matchList}">
    <div id="list">
				<ul>
					<li class="item">
						<a style="outline: none; color: #222836; text-decoration: none; cursor:default;">
							<div class="time">
								<p>${fn:substring(st.match_date,0,10)}</p>
							</div>
							<div class="info" style="width: 45%;">
								<div class="title">
									<h3>${st.stadium_name}</h3>								
								</div>
								<div class="option">
									<span class="isMix">${st.start_time} ~ ${st.end_time}</span>
								</div> 
							</div>
							<div class="reserv_option">
								<div class="st_info" onclick="location='/rental/detail?stadium=${st.stadium_name}'" >
									<p style="margin: 0px;">구장정보</p>
								</div>
								<div class="cancel">
								   <p id="st"style="margin:0px;" onclick="cancel2()" style="cursor: pointer;" data-value="${st.stadium_match_no}" data-price="${st.price}">신청취소</p>
								</div>
							</div>
					</a>
					</li>
				</ul>
			</div>
			</c:forEach>
		</c:if>
  </div>
</div>
       </div>
       
     </section>
   </div>

  <jsp:include page="../include/footer.jsp" />
</body>
</html>