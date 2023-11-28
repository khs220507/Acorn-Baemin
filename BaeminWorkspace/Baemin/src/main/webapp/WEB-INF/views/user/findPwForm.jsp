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
/*.findPw-form {
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
}*/
</style>
</head>

<jsp:include page="../base/header_login.jsp" />

<body>

	<!-- 비밀번호 찾기 폼 -->
<%-- 	<form class="findPw-form" action="${path}/findPw" method="post" id="findPw-form"> --%>
<!-- 		<div class="findPw-title"> -->
<!-- 			<h1>비밀번호 찾기</h1> -->
<!-- 			<br> -->
<!-- 		</div> -->
<!-- 		아이디 : <input type="text" name="Id" required><br> <br> -->
		
<!-- 		<table> -->
<!-- 			<div class="form-group email-form"> -->
<!-- 				<label for="email"> -->
				
<!-- 				<div class="input-group" style="display: flex; align-items: center;"> -->
				
<!-- 					이메일 :      <input type="email" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일" value=".com" required> -->


					
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			</label> -->
<!-- 			<div class="mail-check-box"> -->
<!-- 				<input class="form-control mail-check-input" -->
<!-- 					id="Certification-Number" placeholder="인증번호 6자리를 입력해주세요" disabled="disabled" maxlength="6"> -->
<!-- 				<button type="button" class="btn btn-primary" id="mail-Check-Btn">인증번호발송</button> -->
<!-- 			</div> -->

<!-- 			<span id="mail-check-warn"></span> -->
<!-- 			</div> -->
<!-- 		</table> -->
<!-- 		<input type="submit" id="findPwForm" value="비밀번호 찾기"> -->
	</form>
<script>

// $(document).ready(function() {
// 	let mailCheck = 0;
// 	let code = '';
	
// 	$('#findPwForm').prop('disabled', true);
// 	//이메일 인증 보내기
// 	$('#mail-Check-Btn').click(function() {
// 			const email = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
// 			console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
// 			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	
// 			$.ajax({
// 				type : 'GET',
// 				url : "/baemin/mailCheck/" + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
// 				success : function(data) {
// 					console.log("data : " + data);
// 					checkInput.attr('disabled', false);
// 					code = data;
// 					alert('인증번호가 전송되었습니다.')
// 				}
// 			});
// 	});
	
// 	// 인증번호 비교 
// 	$('.mail-check-input').blur(function() {
// 		const inputCode = $(this).val();
// 		const $resultMsg = $('#mail-check-warn');
	
// 		if (inputCode === code) {
// 			$resultMsg.html('인증번호가 일치합니다.');
// 			$resultMsg.css('color', 'green');
// 			$('#mail-Check-Btn').attr('disabled', true);
// 			$('#userEmail1').attr('readonly', true);
// 			$('#userEmail2').attr('readonly', true);
// 			$('#userEmail2').attr('onFocus','this.initialSelect = this.selectedIndex');
// 			$('#userEmail2').attr('onChange','this.selectedIndex = this.initialSelect');
// 			mailCheck = 1;
// 		} else {
// 			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!');
// 			$resultMsg.css('color', 'red');
// 			mailCheck = 0;
// 		}
// 		$('#findPwForm').prop('disabled', mailCheck !== 1);
// 		 if (inputCode === code) {
// 	            $resultMsg.html('인증번호가 일치합니다.');
// 	            $resultMsg.css('color', 'green');
// 	            $('#mail-Check-Btn').attr('disabled', true);
// 	            $('#userEmail1').attr('readonly', true);
// 	            $('#userEmail2').attr('readonly', true);
// 	            mailCheck = 1;
// 	        } else {
// 	            $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!');
// 	            $resultMsg.css('color', 'red');
// 	            mailCheck = 0;
// 	        }
// 	        // Enable/disable the button based on verification
// 	        $('#findPwForm').prop('disabled', mailCheck !== 1);

// 	});
// });
// $(document).ready(function() {
//     // .com 값을 갖는 input 요소의 값을 숨깁니다.
//     $('#userEmail1').focus(function() {
//         if ($(this).val() === '.com') {
//             $(this).val('');
//         }
//     });

//     $('#userEmail1').blur(function() {
//         if ($(this).val() === '') {
//             $(this).val('.com');
//         }
//     });
// });

</script>


</body>
</html>

<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
.findId-form {
	background-color: #fff;
	padding: 20px;
	max-width: 350px;
	/* 폼의 최대 너비 설정 */
	width: 100%;
	border: 3px solid #82d9d0;
	box-shadow: 0px 0px 5px #ccc;
	border-radius: 10px;
	position: absolute;
	top: 250px;
}
.findId-title{
	text-align: center;
	
}
</style>
</head>

<jsp:include page="../base/header_login.jsp" />

<body>

    <form class="findId-form" action="${path}/findPw" method="post" id="findId-form">
        <div class="findId-title">
            <h1>비밀번호 찾기</h1>
            <br>
        </div>

        <form>
            아이디 : <input type="text" name="Id" required><br>
            이메일 : <input type="email" name="email" required>
            <input type="submit" id="findPwForm" value="비밀번호 찾기">
        </form>
    </form>

    <!-- 여기서 결과를 표시할 부분 -->
    <div>
        <!-- 손님 비밀번호 찾기 결과 -->
        <c:if test="${not empty customerPw}">
            <p>손님 비밀번호는 ${customerPw} 입니다.</p>
        </c:if>

        <!-- 사장님 비밀번호 찾기 결과 -->
        <c:if test="${not empty sellerPw}">
            <p>사장님 비밀번호는 ${sellerPw} 입니다.</p>
        </c:if>
    </div>

</body>
</html>