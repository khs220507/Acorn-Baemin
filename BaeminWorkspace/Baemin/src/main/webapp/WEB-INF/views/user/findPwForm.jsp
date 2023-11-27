<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
.findPw-form {
	background-color: #fff;
	padding: 20px;
	max-width: 350px;
	width: 100%;
	border: 3px solid #82d9d0;
	box-shadow: 0px 0px 5px #ccc;
	border-radius: 10px;
	position: absolute;
	top: 250px;
}

.findPw-title {
	text-align: center;
}
</style>
</head>

<jsp:include page="../base/header_login.jsp" />

<body>

	<!-- 비밀번호 찾기 폼 -->
	<form class="findPw-form" action="${path}/findPw" method="post" id="findPw-form">
		<div class="findPw-title">
			<h1>비밀번호 찾기</h1>
			<br>
		</div>
		아이디 : <input type="text" name="Id" required><br> <br>
		<table>
			<div class="form-group email-form">
				이메일:<label for="email">
				<div class="input-group" style="display: flex; align-items: center;">
					<input type="email" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일"> 
					<select class="form-control" name="userEmail2" id="userEmail2" style="margin-left: 10px;">
						<option value="@gmail.com.com">@
							<div class="mail">gmail.com</div>
						</option>
						
						<option value="@naver.com.com">@
							<div class="mail">naver.com</div>
						</option>		
						
						<option value=".com">직접입력</option>				
					</select>
					<input type="text" class="form-control" name="directEmailInput" id="directEmailInput" placeholder="직접 이메일 입력" style="display: none;">
				</div>
			</div>
			</label>
			<div class="mail-check-box">
				<input class="form-control mail-check-input"
					id="Certification-Number" placeholder="인증번호 6자리를 입력해주세요" disabled="disabled" maxlength="6">
				<button type="button" class="btn btn-primary" id="mail-Check-Btn">인증번호발송</button>
			</div>

			<span id="mail-check-warn"></span>
			</div>
		</table>
		<input type="submit" id="findPwForm" value="비밀번호 찾기">
	</form>
<script>

$(document).ready(function() {
	let mailCheck = 0;
	//이메일 인증 보내기
	$('#mail-Check-Btn').click(function() {
			const email = $('#userEmail1').val()
					+ $('#userEmail2').val(); // 이메일 주소값 얻어오기!
			console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	
			$.ajax({
				type : 'GET',
				url : "/baemin/mailCheck/" + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
				success : function(data) {
					console.log("data : " + data);
					checkInput.attr('disabled', false);
					code = data;
					alert('인증번호가 전송되었습니다.')
				}
			});
	});
	
	// 인증번호 비교 
	$('.mail-check-input').blur(function() {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
	
		if (inputCode === code) {
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color', 'green');
			$('#mail-Check-Btn').attr('disabled', true);
			$('#userEmail1').attr('readonly', true);
			$('#userEmail2').attr('readonly', true);
			$('#userEmail2').attr('onFocus','this.initialSelect = this.selectedIndex');
			$('#userEmail2').attr('onChange','this.selectedIndex = this.initialSelect');
			mailCheck = 1;
		} else {
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!');
			$resultMsg.css('color', 'red');
			mailCheck = 0;
		}
		$('#findPwForm').prop('disabled', mailCheck !== 1);
	});
});

function handleEmailSelection(selectedValue) {
    if (selectedValue === "") {
        document.getElementById("directEmailInput").style.display = "inline-block";
        document.getElementById("directEmailInput").setAttribute("required", "required");
    } else {
        document.getElementById("directEmailInput").style.display = "none";
        document.getElementById("directEmailInput").removeAttribute("required");
    }
}



</script>


</body>
</html>