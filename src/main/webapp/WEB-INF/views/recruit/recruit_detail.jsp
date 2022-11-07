<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../include/header.jsp" />
<script>
	function del_check(url){
		var del_text = confirm('게시글을 삭제하시겠습니까?');
		
		if(del_text == true){
			location = url;
		}
	}
</script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/recruit_detail.css" />
<div class="contai">
<div id="recruit_wrapper">

	<div id="body">
		<div id="map"></div>

				<div class="contents-box">
				  <div class="conten">
					<div class="date">${fn:substring(o.match_date,0,16)} ~ ${o.end_time }</div>
					
					
					<span class="edit">
					<c:if test="${t.mem_id eq id}">
					<a href="recruit_edit?recruit_no=${o.recruit_no}">수정</a> · <a href="recruit_del?recruit_no=${o.recruit_no}" onclick="del_check('recruit_del')">삭제</a></c:if>
					</span>
					
					
					<div class="location">${o.stadium_name}</div>
					<div class="address">
					<span>${o.address}</span>
					<span> 
					 	<c:if test="${o.match_level == 1}">초보</c:if>
						<c:if test="${o.match_level == 2}">중급</c:if>
						<c:if test="${o.match_level == 3}">상급</c:if>
					</span> 
					<span>${o.price}원</span></div>
					<div class="address_buttons">
						<a pf-active="false" class="copy_address_button"> <span
							class="text">주소 복사하기</span></a>

					</div>
					<div class="user">
						<p>${o.mem_id}</p>
					</div>
						<p style="font-size: 13px;">${fn:substring(o.regdate,0,16) }</p>

					<div class="contents">
						<div>${cont}</div>
					</div>

					<div class="comment">
						<div class="pre_head">
							<div class="title">댓글 (0개)</div>
						</div>
						
					</div>
					<div class="commentWriter">
					  <div class="comment_inbox">
					    <em class="name">${o.mem_id}</em>
					    <textarea class="inbox_text" placeholder="댓글을 남겨보세요" rows="1" oninput='this.style.height = ""; this.style.height = this.scrollHeight + "px"'
					     style="overflow: hidden;overflow-wrap: break-word; height: 17px;"></textarea>
					    
					    <div class="comment_regi">
					    <a href="#" role="button" class="c_regi">등록</a>
					  </div>
					  </div>
					  
					</div>
				</div>
			  </div>
<%-- 			  </c:forEach> --%>
			</div>


		</div>
	</div>
<!-- 카카오맵 api -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1e91324cb846f49c6af089e52a7498a"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.31180981633277, 126.8289844683709), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.31180981633277, 126.8289844683709); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>

		<jsp:include page="../include/footer.jsp" />
		</body>
		</html>