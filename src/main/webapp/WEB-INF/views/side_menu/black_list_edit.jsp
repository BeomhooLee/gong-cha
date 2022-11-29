<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="/resources/css/recruit_regi.css" />

<script type="text/javascript">

function check(){
    if($.trim($("#black_list_title").val())==''){
       alert("제목을 입력해주세요!");
       $("#black_list_title").val("").focus();
       return false;
    }
    if($.trim($("#black_list_content").val())==''){
       alert("내용을 입력해주세요!!");
       $("#black_list_content").val("").focus();
       return false;
    }
   
 }
 		
</script>

<div class="recruit_container"
	style="margin: 20px auto; max-width: 1024px; width: 100%;">
	<p>용병 모집
	<div id="regi_form">
		<form action="/side_menu/black_list_edit_ok" method="post"
			onsubmit="return check();">
			<input type="hidden" name="black_list_no" id="black_list_no" value="${re.black_list_no}" />

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="black_list_title" placeholder="제목" value="${re.black_list_title}"
					name="black_list_title"> <label for="black_list_title">제목을 입력해주세요</label>
			</div>

			<div class="form-floating" style="margin-top: 30px;">
				<textarea class="form-control" placeholder="Leave a comment here"
					id="black_list_content" style="height: 500px; resize: none;" name="black_list_content">${cont}</textarea>
				<label for="black_list_content">내용을 입력해주세요</label>
			</div>

			<div id="btn_contain" style="margin-top: 20px;">
				<button type="submit">글수정</button>
				<button type="button" id="btn_list" onclick="location='/side_menu/black_list'">목록</button>
			</div>
		</form>
	</div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>