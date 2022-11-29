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
<input type="hidden" name="black_list_no" id="black_list_no" value="${o.black_list_no}" />
<div class="contai">
<div id="recruit_wrapper">

	<div id="body">
		<div id="map"></div>

				<div class="contents-box">
				  <div class="conten">
					<div class="date">${o.black_list_title}</div>
					
					
					<span class="edit">
					<c:if test="${t eq o.mem_id}">
					<a href="/side_menu/black_list_edit?no=${o.black_list_no}">수정</a> · <a href="/side_menu/black_list_del?no=${o.black_list_no}" onclick="del_check('black_list__del')">삭제</a></c:if>
					</span>
			
					<div class="user">
						<p id="mem_id">${o.mem_id}</p>
					</div>
						<p style="font-size: 13px;">${fn:substring(o.regdate,0,16) }</p>

					<div class="contents">
						<div>${cont}</div>
					</div>

					<div class="comment">
						<div class="pre_head">
							<div class="title">댓글 (0개)</div>
						</div>
					<div class="reply"></div>
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

			</div>


		</div>
	</div>

		<jsp:include page="../include/footer.jsp" />
		</body>
		</html>