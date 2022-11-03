<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="/resources/css/recruit_regi.css" />

<script type="text/javascript">

function check(){
	 if($.trim($("#city").val())=="none"){
			alert("지역을 선택해주세요!");		
			return false;
		}
	    if($.trim($("#stadium_match_no").val())=="none"){
			alert("경기장을 선택해주세요!");		
			return false;
		}
	    if($.trim($("#match_level").val())=="none"){
			alert("실력을 선택해주세요!");		
			return false;
		}
    if($.trim($("#title").val())==""){
       alert("제목을 입력해주세요!");
       $("#title").val("").focus();
       return false;
    }
    if($.trim($("#recruit_content").val())==""){
       alert("내용을 입력해주세요!!");
       $("#recruit_content").val("").focus();
       return false;
    }
   
 }
 
 $(function(){
	$("#stadium_match_no").hide();
	$("#match_level").hide();
	
	$("#city").change(function(){
		if($("#city").val() == "none"){
			$("#stadium_match_no").hide();
			$("#match_level").hide();
		}else{
			$("#stadium_match_no").show();
			
			$("#stadium_match_no").change(function(){
				if($("#stadium_match_no").val() == "none"){
					$("#match_level").hide();
				}else{
					$("#match_level").show();
				
				}
			});
			}
		});
 });
</script>

<div class="recruit_container"
	style="margin: 20px auto; max-width: 1024px; width: 100%;">
	<p>용병 모집
	<div id="regi_form">
		<form action="recruit_regi_ok" method="post"
			onsubmit="return check();">
			<div id="select_contain">
				<span>내 경기 선택</span>&nbsp;&nbsp; <select name="city" id="city">
					<option value="none">지역 선택</option>
					<option value="서울특별시">서울특별시</option>
					<option value="경기도">경기도</option>
					<option value="부산광역시">부산광역시</option>
				</select> <select name="stadium_match_no" id="stadium_match_no">
					<option value="none">경기장 선택</option>
					<c:forEach var="m" items="${li}">
						<option value="${m.stadium_match_no}">${m.stadium_name}</option>
					</c:forEach>
				</select> <select name="match_level" id="match_level">
					<option value="none">실력 선택</option>
					<option value="1">실력 하</option>
					<option value="2">실력 중</option>
					<option value="3">실력 상</option>
				</select>

			</div>

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="title" placeholder="제목" name="title">
				<label for="title">제목을 입력해주세요</label>
			</div>

			<div class="form-floating" style="margin-top: 30px;">
				<textarea class="form-control" placeholder="Leave a comment here"
					id="recruit_content" style="height: 500px" name="recruit_content"></textarea>
				<label for="recruit_content">내용을 입력해주세요</label>
			</div>

			<div id="btn_contain" style="margin-top: 20px;">
				<button type="submit">글등록</button>
				<button type="button" id="btn_list" onclick="location='recruit'">목록</button>
			</div>
		</form>
	</div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>