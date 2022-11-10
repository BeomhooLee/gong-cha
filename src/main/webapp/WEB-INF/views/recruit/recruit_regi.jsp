<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="/resources/css/recruit_regi.css" />

<script type="text/javascript">

function check(){
	 if($.trim($("#stadium_name").val())==''){
			alert("경기장을 선택해주세요!");		
			return false;
		}
	    if($.trim($("#stadium_match_no").val())==''){
			alert("경기 날짜를 선택해주세요!");		
			return false;
		}
	    
	    if($.trim($("#match_level").val())==''){
			alert("실력을 선택해주세요!");		
			return false;
		}
    if($.trim($("#title").val())==''){
       alert("제목을 입력해주세요!");
       $("#title").val("").focus();
       return false;
    }
    if($.trim($("#recruit_content").val())==''){
       alert("내용을 입력해주세요!!");
       $("#recruit_content").val("").focus();
       return false;
    }
   
 }
 
$(function(){
 	$("#stadium_match_no").hide();
	$('#match_level').hide();
	
	$("#stadium_name").change(function(){
		if($("#stadium_name").val() == ''){
			$("#stadium_match_no").hide();
			$("#stadium_match_no").val('');
			$('#match_level').hide();
			$("#match_level").val('');
			$("#stadium_match_no").children().remove();
		}else{
			var stn=$('#stadium_match_no');
			stn.show();
			const stadium_name=$('#stadium_name option:selected').val();

			$.ajax({
				url:"stadium_name_check",
				type:"post",
				data:{
					"stadium_name":stadium_name
				},
				success:function(data){
					var obj = JSON.parse(data);
					$(stn).children().remove();
					$(stn).append("<option value=''>경기 날짜 선택</option>");
					
					for(var i=0; i<obj.sn.length; i++){
						$('#stadium_match_no').append(
								"<option value='"+obj.sn[i].stadium_match_no+"'>"+obj.sn[i].match_date+" / "+obj.sn[i].start_time+"~"+obj.sn[i].end_time+
								"</option>"
							);
				
					}
					
					
				}
			
			
			});
			$("#stadium_match_no").change(function(){
			if($("#stadium_match_no").val() == ''){
				$("#match_level").hide();
				$("#match_level").val('');
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
		<form action="/recruit/recruit_regi_ok" method="post"
			onsubmit="return check();">
			
			<div id="select_contain">
				<span>내 경기 선택</span>&nbsp;&nbsp;
				 <select name="stadium_name" id="stadium_name">
					<option value=''>--경기장 선택--</option>
					<c:forEach var="m" items="${my}">
						<option value="${m.stadium_name}">${m.stadium_name}</option>
					</c:forEach>
				</select> 
				<select name="stadium_match_no" id="stadium_match_no"></select> 
				<select name="match_level" id="match_level">
					<option value=''>--선택--</option>
					<option value="1">초보</option>
					<option value="2">중수</option>
					<option value="3">고수</option>
				</select>

			</div>

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="title" placeholder="제목"
					name="title"> <label for="title">제목을 입력해주세요</label>
			</div>

			<div class="form-floating" style="margin-top: 30px;">
				<textarea class="form-control" placeholder="Leave a comment here"
					id="recruit_content" style="height: 500px; resize: none;" name="recruit_content"></textarea>
				<label for="recruit_content">내용을 입력해주세요</label>
			</div>

			<div id="btn_contain" style="margin-top: 20px;">
				<button type="submit">글등록</button>
				<button type="button" id="btn_list" onclick="location='/recruit'">목록</button>
			</div>
		</form>
	</div>
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>