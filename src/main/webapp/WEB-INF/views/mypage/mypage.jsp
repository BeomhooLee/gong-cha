<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/mypage.css" />


<script>
function font2(){
    var style = $('input[name="style"]:checked').val();
    var style_text = $("label[for='"+style+"']").text(); // 라벨값을 불러온다.
    
    if(style_text == '공격') {
        return document.getElementById('font2').innerText = '공격형'
    } else if (style_text == '밸런스') {
        return document.getElementById('font2').innerText = '밸런스형'
    } else if (style_text == '수비') {
        return document.getElementById('font2').innerText = '수비형'
    }
}

function font1(){
    var strength = $('input[name="strength"]:checked').val();
    var strength_text = $("label[for='"+strength+"']").text(); // 라벨값을 불러온다.
    
    if(strength_text == '체력') {
        return document.getElementById('font1').innerText = '체력'
    } else if (strength_text == '드리블') {
        return document.getElementById('font1').innerText = '드리블'
    } else if (strength_text == '슛') {
        return document.getElementById('font1').innerText = '슛'
    } else if (strength_text == '패스') {
        return document.getElementById('font1').innerText = '패스'
    } else if (strength_text == '피지컬') {
        return document.getElementById('font1').innerText = '피지컬'
    } else if (strength_text == '스피드') {
        return document.getElementById('font1').innerText = '스피드'
    }
} 

</script>

<div id="MYPAGE">
	<div id="content_wrap">
		<div id="content_header"></div>

		<div id="content_body_double">
			<div id="content_body_left">
				<section id="se_le">
					<div id="my_profile">
						<img id="profile_img" src="/resources/images/gg.jpg" alt="지지" />
						<div
							style="display: flex; align-items: center; justify-content: center;">
							<h1 id="my_name">${id}</h1>
							<p id="txt_body2" >
								<font id="font1">드리블</font> · <font id="font2">밸런스형 </font>
							</p>
						</div>
					</div>
					<div id="my_info">
						<li id="my_cash_info">
							<div>
								<p style="font-size: 12px; margin-bottom: 0rem;">나의 캐시</p>
								<p
									style="font-size: 20px; font-weight: 700; margin-bottom: 0rem;">${m.cash}원</p>
							</div> <a href="/member/cash" style="text-decoration: none;">
								<div id="my_cash">
									<span>충전하기</span>
								</div>
						</a>
						</li>
						<li id="my_board"><a href="#" id="board_dis"><div>내가
									쓴글 보기</div> <svg xmlns="http://www.w3.org/2000/svg" width="30"
									height="30" fill="currentColor" class="bi bi-clipboard"
									viewBox="0 0 16 16">
  <path
										d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z" />
  <path
										d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z" />
</svg></a></li>
						<li><a href="#" id="my_reply">
								<div id="reply_title">
									<h3>내가 쓴 댓글 보기</h3>
								</div> <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
									fill="currentColor" class="bi bi-reply" viewBox="0 0 16 16">
  <path
										d="M6.598 5.013a.144.144 0 0 1 .202.134V6.3a.5.5 0 0 0 .5.5c.667 0 2.013.005 3.3.822.984.624 1.99 1.76 2.595 3.876-1.02-.983-2.185-1.516-3.205-1.799a8.74 8.74 0 0 0-1.921-.306 7.404 7.404 0 0 0-.798.008h-.013l-.005.001h-.001L7.3 9.9l-.05-.498a.5.5 0 0 0-.45.498v1.153c0 .108-.11.176-.202.134L2.614 8.254a.503.503 0 0 0-.042-.028.147.147 0 0 1 0-.252.499.499 0 0 0 .042-.028l3.984-2.933zM7.8 10.386c.068 0 .143.003.223.006.434.02 1.034.086 1.7.271 1.326.368 2.896 1.202 3.94 3.08a.5.5 0 0 0 .933-.305c-.464-3.71-1.886-5.662-3.46-6.66-1.245-.79-2.527-.942-3.336-.971v-.66a1.144 1.144 0 0 0-1.767-.96l-3.994 2.94a1.147 1.147 0 0 0 0 1.946l3.994 2.94a1.144 1.144 0 0 0 1.767-.96v-.667z" />
</svg>
						</a></li>
					</div>
				</section>
			</div>

			<div id="content_body_wrap">
				<section class="se_ri">
					<div class=section_title>
						<h5>나의 공차</h5>
					</div>
					<div class="my_menu">
						<ul class="my_menu_list">
							<li><a href="/mypage/my_history">
									<div class="my_list_label">
										<img
											src="https://plab-football.s3.amazonaws.com/static/img/ic_myplab_color.svg"
											alt="신청 내역" />
										<p>신청 내역</p>
									</div>
							</a></li>
							<li><a href="#">
									<div class="my_list_label">
										<img
											src="https://plab-football.s3.amazonaws.com/static/img/ic_point_color.svg"
											alt="충전 내역" />
										<p>충전 내역</p>
									</div>
							</a></li>
							<li><a class="btn btn-primary" data-bs-toggle="modal"
								href="#exampleModalToggle" role="button">

									<div class="my_list_label">
										<img
											src="https://plab-football.s3.amazonaws.com/static/img/ic_playstyle.svg"
											alt="플레이 스타일" />
										<p>플레이 스타일</p>
									</div>

							</a></li>
							<li><a href="profile">
									<div class="my_list_label">
										<img
											src="https://plab-football.s3.amazonaws.com/static/img/ic_setting_color.svg"
											alt="정보 수정" />
										<p>정보 수정</p>
									</div>
							</a></li>
							<li>
				        <a href="pwd_change">
				          <div class="my_list_label">
				            <img src="https://plab-football.s3.amazonaws.com/static/img/ic_pw_color.svg" alt="비밀번호 번경" />
				            <p>비밀번호 변경</p>
				          </div>
				        </a>
				        </li>
							<li><a href="logout">
									<div class="my_list_label">
										<img
											src="https://plab-football.s3.amazonaws.com/static/img/ic_logout_color.svg"
											alt="로그 아웃" />
										<p>로그 아웃</p>
									</div>
							</a></li>
						</ul>
					</div>
				</section>
				
				<section class="se_ri">
				  <div class="section_title">
				    <h3 style="line-height: 32px;">더보기</h3>
				  </div>
				  <div class="my_menu">
				    <ul class="my_menu_list">
				      <li>
				        <a href="#">
				          <div class="my_list_label">
				            <img src="https://plab-football.s3.amazonaws.com/static/img/ic_notice_color.svg" alt="공지사항"/>
				            <p>공지사항</p>
				          </div>
				        </a>
				      </li>
				      <li>
				        <a href="#">
				          <div class="my_list_label">
				            <img src="/resources/images/favicon.ico" height="24"/>
				            <p>공차 소개
				          </div>
				        </a>
				      </li>
				      <li>
				        <a href="#">
				          <div class="my_list_label">
				            <img src="https://plab-football.s3.amazonaws.com/static/img/ic_manager_color.svg" alt="매니저 지원" />
				            <p>매니저 지원</p>
				          </div>
				        </a>
				      </li>
				      
				    </ul>
				  </div>
				</section>
			</div>

		</div>

	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModalToggle" aria-hidden="true"
	aria-labelledby="exampleModalToggleLabel" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalToggleLabel">플레이
					스타일</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="modal_fieldset">
					<h4 class="h4_ti" id="my_style">좋아하는 스타일</h4>
					<ul class="modal_radio">
						<li class="radio_items"><input type="radio"
							class="radio_item" id="ATTACK" value="ATTACK" name="style" /> <label
							class="check_label" for="ATTACK">공격</label></li>
						<li class="radio_items"><input type="radio"
							class="radio_item" id="BALANCE" value="BALANCE" name="style" />
							<label class="check_label" for="BALANCE">밸런스</label></li>
						<li class="radio_items"><input type="radio"
							class="radio_item" id="DEFENCE" value="DEFENCE" name="style" />
							<label class="check_label" for="DEFENCE">수비</label></li>
					</ul>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary modal_btn hover focus"
					data-bs-target="#exampleModalToggle2" data-bs-toggle="modal"
					onclick="font2()">다음</button>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="exampleModalToggle2" aria-hidden="true"
	aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<button class="btn btn-primary back"
					data-bs-target="#exampleModalToggle" data-bs-toggle="modal"
					style="display: flex; align-items: center;">
					<svg style="margin-right: 10px;" xmlns="http://www.w3.org/2000/svg"
						width="16" height="16" fill="currentColor"
						class="bi bi-arrow-left" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
							d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
</svg>
					이전
				</button>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="modal_fieldset">
					<h4 class="h4_ti" id="my_strength">자신있는 능력</h4>
					<ul class="modal_radio">
						<li class="radio_items"><input type="radio"
							class="radio_item" id="SHOOT" value="SHOOT" name="strength" /> <label
							class="check_label" for="SHOOT">슛</label></li>
						<li class="radio_items"><input type="radio"
							class="radio_item" id="PASS" value="PASS" name="strength" /> <label
							class="check_label" for="PASS">패스</label></li>
						<li class="radio_items"><input type="radio"
							class="radio_item" id="DRIBBLE" value="DRIBBLE" name="strength" />
							<label class="check_label" for="DRIBBLE">드리블</label></li>
						<li class="radio_items"><input type="radio"
							class="radio_item" id="STAMINA" value="STAMINA" name="strength" />
							<label class="check_label" for="STAMINA">체력</label></li>
						<li class="radio_items"><input type="radio"
							class="radio_item" id="SPEED" value="SPEED" name="strength" /> <label
							class="check_label" for="SPEED">스피드</label></li>
						<li class="radio_items"><input type="radio"
							class="radio_item" id="PHYSICAL" value="PHYSICAL" name="strength" />
							<label class="check_label" for="PHYSICAL">피지컬</label></li>
					</ul>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary modal_btn"
					data-bs-dismiss="modal" onclick="font1()">저장하기</button>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>