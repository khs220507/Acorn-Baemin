<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Login Result</title>
<style>
/* CSS 스타일 정의 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.input-container {
	display: flex;
	align-items: center;
}

input[type="text"] {
	flex: 1;
}

button#checkDuplicate2, #searchpc, #signin_button {
	background-color: #82d9d0;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-left: 10px;
}

#checkDuplicate2 {
	font-size: 16px;
}

.container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.signup-title {
	text-align: center;
	padding: 20px;
	font-size: 18px;
}

h1 {
	color: #333;
}

.mail-check-box {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.mail-check-input {
	flex: 1;
	margin-right: 10px;
}

button#mail-Check-Btn {
	background-color: #82d9d0;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-left: -3px;
	height: 22px;
	width: 100px;
}

input#sellerEmail1 {
	width: 63%;
	height: 25px;
	padding: 10px;
	font-size: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input#sellerEmail2 {
	padding: 10px;
	font-size: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.signup-div {
	background-color: #fff;
	padding: 20px;
	max-width: 350px;
	width: 100%;
	border: 3px solid #82d9d0;
	box-shadow: 0px 0px 5px #ccc;
	border-radius: 10px;
}

.signup-div span {
	display: block;
	margin-top: 5px;
	margin-bottom: 5px;
	font-weight: bolder;
}

.input-container-id {
	display: flex;
	align-items: center;
}

button#signin_button {
	background-color: #82d9d0;
	height: 30px;
	color: white;
	border-radius: 4px;
	font-size: 15px;
	cursor: pointer;
	margin-left: 10px;
	width: 300px;
	display: block;
	margin: 10px auto;
}

button[id="checkDuplicate2"] {
	margin-top: 5px;
	width: 100px;
	height: 25px;
	text-align: center;
}

button[id="searchpc"] {
	display: flex;
	align-items: center;
	justify-content: center;
	/* Center content horizontally */
	width: 100px;
	height: 25px;
	margin-top: 5px;
	text-align: center;
}

input[id="sellerPw"], input[id="confirmPassword"], input[id="sellerName"],
	input[id="sellerRegCode"], input[id="sellerPhone"], input[id="sellerEmail"],
	input[id="sellerBirth"] {
	width: 300px;
	height: 25px;
	padding: 10px;
	font-size: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[id="sellerId"] {
	width: 97%;
	height: 25px;
	padding: 10px;
	font-size: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="button"] {
	background-color: #82d9d0;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-left: 10px;
	width: auto;
}

.vertical-center {
	line-height: 30px;
	/* 이 값을 조정해서 세로 중앙 정렬의 높이를 조절할 수 있음 */
}

input:focus {
	border-color: #0982f0;
	/* 포커스 시 테두리 색상 설정 */
	outline: none;
	/* 포커스 아웃라인 제거 */
}

input:number {
	border-color: #0982f0;
	outline: none;
	width: 20px;
}

input[type="submit"] {
	font-weight: bolder;
	font-size: 18px;
	background-color: #48D1CC;
	color: white;
	height: 50px;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 250px;
	display: block;
	margin: 0 auto;
}

a {
	color: #007bff;
	text-decoration: none;
}

.options {
	display: flex;
	align-items: center;
	height: 20px;
}

.optlab1 {
	left: 0px;
}

.optlab2 {
	right: 0px;
}

.options label {
	margin-right: 20px;
	/* 각 옵션 사이의 간격 조절 */
	position: relative;
	padding: 5px;
	border-radius: 5px;
	cursor: pointer;
}

.options input[type="radio"] {
	margin-right: 5px;
}

.remember-me {
	display: flex;
	align-items: center;
	font-size: 12px;
}

.remember-links {
	font-size: 12px;
	left: 0px;
}

.signup-link {
	margin-top: 10px;
	text-align: right;
	font-size: 12px;
}

.right-links {
	text-align: right;
}

.kakao {
	margin-top: 20px;
	text-align: center;
}

section {
	width: 1280px;
	padding-top: 140px;
	margin-bottom: 50px;
}

td {
	display: flex;
}
</style>
<script>
	let mailCheck = 0;
	// 사장님 회원가입 부분 ajax. id 값을 가져옴.
	function signup() {

		let sellerId = $("#sellerId").val();
		let sellerPw = $("#sellerPw").val();
		let confirmPassword = $("#confirmPassword").val();
		let sellerName = $("#sellerName").val();
		let sellerRegCode = $("#sellerRegCode").val();
		let sellerPhone = $("#sellerPhone").val();
		let sellerEmail = $("#sellerEmail1").val();
		let sellerEmail2 = $("#sellerEmail2").val();
		let sellerBirth = $("#sellerBirth").val();
		let sellerGender = $('input[name=option]:checked').val();

		// 빈칸으로 가입되는경우 방지. 유효성 검사
		if (sellerId === "" || sellerPw === "" || confirmPassword === ""
				|| sellerName === "" || sellerRegCode === ""
				|| sellerPhone === "" || sellerEmail === ""
				|| sellerBirth === "" || sellerGender === undefined) {
			alert("모든 항목을 입력하세요.");
			return;
		}
		if (mailCheck == 1) {
			if (confirmPassword == sellerPw) {

				let info = {
					sellerId : sellerId,
					sellerPw : sellerPw,
					sellerName : sellerName,
					sellerRegCode : sellerRegCode,
					sellerPhone : sellerPhone,
					sellerEmail : sellerEmail + sellerEmail2,
					sellerBirth : sellerBirth,
					sellerGender : sellerGender
				};

				let infos = JSON.stringify(info);

				$.ajax({
					type : "POST",
					url : "/baemin/seller_signup",
					data : infos,
					contentType : "application/json", // 필수
					success : function(data) {
						alert("가입축하 q(≧▽≦q)");
						window.location.href = "${path}/login";
					},
					error : function() {
						alert("입력한 정보를 확인해주세요.");
					}
				});
			}
		}
	}
	////중요/////
	$(document).ready(function() {
						let sellerIdValid = false;
						let sellerPwValid = false;
						let confirmPasswordValid = false;
						let sellerNameValid = false;
						let sellerRegCodeValid = false;
						let sellerPhoneValid = false;
						let sellerEmailValid = false;

						// 아이디 유효성 검사
						$("#sellerId").on("focusout", function() {
							let idCheck = /^[a-z0-9]{6,8}$/; // 영어 소문자와 숫자만 허용		
							let sellerId = $(this).val();
							if (sellerId === "" || !idCheck.test(sellerId)) {
								$(this).css("border-color", "red");
								sellerIdValid = false;
								alert("아이디는 영어 소문자와 숫자의 조합으로 6~8자여야 합니다.");
							} else {
								$(this).css("border-color", "");
								sellerIdValid = true;
							}
						});

						// 아이디 중복 확인
						$("#checkDuplicate2").click(function() {
							if ($("#sellerId").val() == "") {
								alert("아이디를 입력해주세요.");
							} else {
								// 유효성검사
								let idCheck = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{6,8}$/;
								let sellerId = $("#sellerId").val();

								if (!idCheck.test(sellerId)) {
									alert("아이디는 영문과 숫자 조합으로 6~8자여야 합니다.");
									return;
								}

								$.ajax({
									url : "/baemin/checkDuplicate2",
									type : "POST",
									data : {
										sellerId : sellerId
									},
									success : function(data) {
										if (data === "yes") {
											$("#sellerId").css("color","red");
											alert("중복된 아이디 입니다.");
											id_check = false;
											$("#sellerId").val("");
										} else {
											$("#sellerId").css("border-color","");
											alert("사용 가능한 아이디 입니다.");
											id_check = true;
										}
									},
									error : function() {
										alert("에러 발생");
									}
								});
							}
							toggleIdConfirmButton();
						});

						// 비밀번호 유효성 검사
						$("#sellerPw").on("input",function() {
							let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

							if ($(this).val() === ""
									|| !pwdCheck.test($(this).val())) {
								$(this).css("border-color","red");
								sellerPwValid = false;
							} else {
								$(this).css("border-color", "");
								sellerPwValid = true;
							}
						});

						// 비밀번호 확인
						$("#confirmPassword").on("input",function() {
							if ($(this).val() === ""
									|| !sellerPwValid
									|| $("#sellerPw").val() !== $(this).val()) {
								$(this).css("border-color", "red");
								confirmPasswordValid = false;
							} else {
								$(this).css("border-color", "");
								confirmPasswordValid = true;
							}
						});

						// 사장님 이름
						$("#sellerName").on("input",function() {
							let sellerName = $(this).val();
							let namePattern = /^[가-힣a-zA-Z]{1,16}$/; // 한글과 영어 대소문자만 허용, 최대 16자까지
							if (sellerName === ""
									|| !namePattern.test(sellerName)) {
								$(this).css("border-color", "red");
								sellerNameValid = false;
							} else {
								$(this).css("border-color", "");
								sellerNameValid = true;
							}
						});

						// 사업자 등록번호
						$("#sellerRegCode").on("input",function() {
							let regCodeCheck = /^\d{10}$/;

							if ($(this).val() === "" || !regCodeCheck.test($(this).val())) {
								$("#regCodeError").text("사업자등록번호 형식에 맞지 않습니다.");
								$(this).css("border-color", "red");
								sellerRegCodeValid = false;
							} else {
								$("#regCodeError").text("");
								$(this).css("border-color", "");
								sellerRegCodeValid = true;
							}
						});
						
						// 사업자등록번호 중복 확인
						$("#sellerRegCode").on('focusout',function() {
							var sellerInput = $(this).val();
							if (sellerInput == "") {
							} else {
								$.ajax({
											url : "/baemin/checkDuplicateRegCode",
											type : "POST",
											data : {
												sellerRegCode : $("#sellerRegCode").val()
											},
											success : function(data) {
												if (data === "yes") {
													$("#sellerRegCode").css("border-color","red");
													alert("중복된 사업자등록번호 입니다.");
													Code_check = false;
													$("#sellerRegCode").val("");
												} else {
													$("#sellerRegCode").css("border-color","");
													Code_check = true;
												}
											},
											error : function() {
												alert("에러발생");
											}
										});
							}
						});

						// 연락처 유효성 검사
						$("#sellerPhone").on("input",function() {
							let phoneCheck = /^[0-9]{11}$/;
							if (!/^[0-9]*$/.test($(this).val())) {
								$(this).val('');
							}
							if ($(this).val() === "" || !phoneCheck.test($(this).val())) {
								$(this).css("border-color","red");
								sellerPhoneValid = false;
							} else {
								$(this).css("border-color", "");
								sellerPhoneValid = true;
							}
						});

						// 연락처 중복 확인
						$("#sellerPhone").on('focusout',function() {
							var sellerInput = $(this).val();
							if (sellerInput == "") {
							} else {
								$.ajax({
											url : "/baemin/checkDuplicatePhone2",
											type : "POST",
											data : {
												sellerPhone : $("#sellerPhone").val()
											},
											
											success : function(data) {
												
												if (data === "yes") {
													$("#sellerPhone").css("border-color","red");
													alert("중복된 연락처 입니다.");
													phone_check = false;
													$("#sellerPhone").val("");
												} else {
													$("#sellerPhone").css("border-color","");
													phone_check = true;
												}
											},
											error : function() {
												alert("에러발생");
											}
										});
							}
						});
						
						// 이메일 인증
						$('#mail-Check-Btn').click(function() {
							const email = $('#sellerEmail1').val()
									+ $('#sellerEmail2').val(); // 이메일 주소값 얻어오기!
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
							}); // end ajax
						}); // end send email
						
						$('#sellerEmail2').change(function() {
							var selectedEmail = $(this).val();

							if (selectedEmail === 'custom') {
								$('#customEmail').css('display', 'block'); // 커스텀 이메일 입력 필드 표시
							} else {
								$('#customEmail').css('display', 'none'); // 커스텀 이메일 입력 필드 숨김
							}
						});

						// 인증번호 비교 
						// blur -> focus가 벗어나는 경우 발생
						$('.mail-check-input').blur(function() {
							const inputCode = $(this).val();
							const $resultMsg = $('#mail-check-warn');

							if (inputCode === code) {
								$resultMsg.html('인증번호가 일치합니다.');
								$resultMsg.css('color', 'green');
								$('#mail-Check-Btn').attr('disabled', true);
								$('#sellerEmail1').attr('readonly', true);
								$('#sellerEmail2').attr('readonly', true);
								$('#sellerEmail2').attr('onFocus','this.initialSelect = this.selectedIndex');
								$('#sellerEmail2').attr('onChange','this.selectedIndex = this.initialSelect');
								mailCheck = 1;
							} else {
								$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
								$resultMsg.css('color', 'red');
								mailCheck = 0;
							}
						});

					});

	
	// 아이디 확인 버튼 토글
	function toggleIdConfirmButton() {
		if (sellerIdValid) {
			$("#id_Confirm").show();
		} else {
			$("#id_Confirm").hide();
		}
	}

	// 생년월일 유효성 검사
	$("#sellerBirthdate").on("input",function() {
		let birthdateCheck = /^(19\d\d|20[0-2]\d)-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$/;

		if ($(this).val() === ""
				|| !birthdateCheck.test($(this).val())) {
			$(this).css("border-color", "red");
			sellerBirthdateValid = false;
		} else {
			$(this).css("border-color", "");
			sellerBirthdateValid = true;
		}
	});

	// 회원가입 버튼 클릭 시 유효성 검사 및 서버 전송
	$("#signin_button").click(function() {
		if (sellerIdValid && sellerPwValid && confirmPasswordValid) {
			// 서버로 전송할 로직 추가
			alert("회원가입이 완료되었습니다.");
		} else {
			alert("입력 정보를 확인해주세요.");
		}
	});
	
	// Enter 키 누를 시 로그인 button click과 같은 효과
	document.addEventListener("DOMContentLoaded", function() {
		const form = document.getElementById("signin_button");

		form.addEventListener("keypress", function(event) {
			if (event.key === "Enter") {
				event.preventDefault();
				login();
			}
		});
	});
</script>

</head>

<body>
	<jsp:include page="../base/header_login.jsp" />
	<section id="content">


		<div class="container">

			<!-- 회원가입 폼 -->
			<div class="signup-div">

				<div class="signup-title">
					<h1>사장님 회원가입</h1>
				</div>


				<span class="input-container-id">
					<table>
						<td>아이디</td>
						<td><span><input type="text" id="sellerId"
								name="sellerIdn" placeholder="영문, 숫자 조합 6~8자"
								class="vertical-center" maxlength="8"></span>
							<button id="checkDuplicate2">중복확인</button></td>
					</table>
				</span>

				<table>
					<td>비밀번호</td>
					<td><span><input type="password" id="sellerPw"
							name="m_password" placeholder="영문, 숫자, 특수문자 조합 8~16자"
							class="vertical-center" maxlength="16"></span></td>
				</table>
				<table>
					<td>비밀번호 확인</td>
					<td><span><input type="password" id="confirmPassword"
							name="confirmPassword" placeholder="비밀번호 확인"
							class="vertical-center" maxlength="16"> </span></td>
				</table>
				<table>
					<td>이름</td>
					<td><span> <input type="text" id="sellerName"
							placeholder="이름" class="vertical-center"> <span
							id="nameError" style="color: red; font-size: 12px;"></span>
					</span></td>
				</table>

				<table>
					<td>사업자등록번호</td>
					<td><span> <input type="text" id="sellerRegCode"
							placeholder="사업자등록번호" class="vertical-center"> <span
							id="regCodeError" style="color: red; font-size: 12px;"></span>
					</span></td>
				</table>
				<table>
					<td>연락처</td>
					<td><span> <input type="tel" id="sellerPhone"
							placeholder="연락처('-' 없이 11자리)" class="vertical-center"
							pattern="[0-9]{11}" title="숫자 11개를 입력하세요"></span></td>
				</table>

				<table>
					<div class="form-group email-form">
						<label for="email">이메일</label> <span></span>
						<div class="input-group">
							<input type="text" class="form-control" name="sellerEmail1"
								id="sellerEmail1" placeholder="이메일"> <select
								class="form-control" name="sellerEmail2" id="sellerEmail2">
								<option value="@gmail.com.com">@
									<div class="mail">gmail.com</div>
								</option>
								<option value="@naver.com.com">@
									<div class="mail">naver.com</div>
								</option>
								<option value="@daum.net.net">@
									<div class="mail">daum.net</div>
								</option>
								<option value="@lycos.com.com">@
									<div class="mail">lycos.com</div>
								</option>
								<option value="custom">직접 입력</option>

							</select> <input type="text" class="form-control" id="customEmail"
								name="customEmail" style="display: none;"
								placeholder="도메인을 포함한 이메일 주소를 입력하세요">


						</div>
						<div class="mail-check-box">
							<input class="form-control mail-check-input"
								id="Certification-Number" placeholder="인증번호 6자리를 입력해주세요"
								disabled="disabled" maxlength="6">
							<button type="button" class="btn btn-primary" id="mail-Check-Btn">인증번호발송</button>
						</div>

						<span id="mail-check-warn" style="font-size: 12px;"></span>
					</div>
				</table>

				<!-- 				<table> -->
				<!-- 					<td>이메일</td> -->
				<!-- 					<td><span> <input type="email" id="sellerEmail" -->
				<!-- 							placeholder="이메일" class="vertical-center"> -->
				<!-- 					</span></td> -->
				<!-- 				</table> -->
				<table>
					<td>생년월일</td>
					<td><span> <input type="date" id="sellerBirth"
							placeholder="생년월일 8자리" class="vertical-center">
					</span></td>
				</table>
				<table>
					<tr>
						<td>성별</td>
						<td>
							<div class="options">
								<label class="optlab1"><input type="radio" name="option"
									id="maleOption" value="0">남</label> <label class="optlab2"><input
									type="radio" name="option" id="femaleOption" value="1">여</label>
							</div>
						</td>
					</tr>
				</table>

				<button onclick="signup()" value="회원가입" id="signin_button">회원가입</button>

			</div>



		</div>

	</section>
	<jsp:include page="../base/footer.jsp" />


</body>

</html>