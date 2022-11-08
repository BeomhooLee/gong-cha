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
function reset(){
	var reset = confirm('정말 취소 하시겠습니까?');
	
	var stNo = $('input[type="hidden"][name="stNo"]').val();
	console.log(stNo);
	var sendData = {"stadium_match_no" : stNo}
	if(reset == true){
		$.ajax({
			url : "/historyDel",
			method : 'POST',
			data : JSON.stringify(sendData),
			contentType : 'application/json; charset=UTF-8',
			dataTye : "text",
			success : function(data) {
				alert(data);
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
       <svg style="width:20px; height:20px;"xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M177.1 228.6L207.9 320h96.5l29.62-91.38L256 172.1L177.1 228.6zM255.1 0C114.6 0 .0001 114.6 .0001 256S114.6 512 256 512s255.1-114.6 255.1-255.1S397.4 0 255.1 0zM435.2 361.1l-103.9-1.578l-30.67 99.52C286.2 462.2 271.3 464 256 464s-30.19-1.773-44.56-4.93L180.8 359.6L76.83 361.1c-14.93-25.35-24.79-54.01-27.8-84.72L134.3 216.4L100.7 118.1c19.85-22.34 44.32-40.45 72.04-52.62L256 128l83.29-62.47c27.72 12.17 52.19 30.27 72.04 52.62L377.7 216.4l85.23 59.97C459.1 307.1 450.1 335.8 435.2 361.1z"/></svg>
       <p class="match_title">매치 현황</p>
       </div>
          <c:forEach var="sm" items="${social_hisotry}">
          <div id="list">
				<ul>
					<li class="item">
						<a href="social" style="outline: none; color: #222836; text-decoration: none; cursor: pointer;">
							<div class="time">
								<p>${fn:substring(sm.match_date,0,10)}</p>
							</div>
							<div class="info" style="width: 45%;">
								<div class="title">
									<h3>HM풋살파크 안산 고잔점 A구장 *주차16자리*</h3>									
								</div>
								<div class="option">
									<span class="isMix">남녀모두</span><span>6vs6</span><span>3파전</span><span>모든레벨</span>
								</div>
							</div>
	
							<div class="reserv_option">
								<div class="st_info">
									<p style="margin: 0px;">구장정보</p>
								</div>
								<div class="cancel">
								   <p style="margin:0px;" onclick="reset()">신청취소</p>
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
							<input type="hidden" value="${st.stadium_match_no}" name="stNo">
							<div class="reserv_option">
								<div class="st_info" onclick="location='/rental/detail?stadium=${st.stadium_name}'" >
									<p style="margin: 0px;">구장정보</p>
								</div>
								<div class="cancel">
								   <p style="margin:0px;" onclick="reset()" style="cursor:pointer;">신청취소</p>
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