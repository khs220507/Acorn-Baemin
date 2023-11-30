<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
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

button#checkDuplicate, #searchpc, #signin_button {
	background-color: #82d9d0;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-left: 10px;
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

input#userEmail1 {
	width: 63%;
	height: 25px;
	padding: 10px;
	font-size: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input#userEmail2 {
	width: 10%;
	padding: 10px;
	font-size: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
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

.btn-primary {
	/* Button styles */
	
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

.input-container-address {
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

button[id="checkDuplicate"] {
	margin-top: 5px;
	width: 100px;
	height: 25px;
	text-align: center;
}

#checkDuplicate {
	font-size: 16px;
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

input[id="userPw"], input[id="confirmPassword"], input[id="userName"],
	input[id="userNickname"], input[id="userPhone"], input[id="userEmail"],
	input[id="userBirth"], input[id="userAddress"], input[id="userAddressdetail"]
	{
	width: 300px;
	height: 25px;
	padding: 10px;
	font-size: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[id="userId"], input[id="userPostCode"] {
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
	function signup() {
		let userId = $("#userId").val();
		let userPw = $("#userPw").val();
		let confirmPassword = $("#confirmPassword").val();
		let userName = $("#userName").val();
		let userNickname = $("#userNickname").val();
		let userPhone = $("#userPhone").val();
		let userEmail = $("#userEmail1").val();
		let userEmail2 = $("#userEmail2").val();
		let userBirth = $("#userBirth").val();
		let userGender = $('input[name=option]:checked').val();
		let userPostCode = $("#userPostCode").val();
		let userAddress = $("#userAddress").val();
		let userAddressDetail = $("#userAddressdetail").val();
		
		// 빈칸으로 가입되는 경우 방지. 유효성 검사
		if (userId === "" || userPw === "" || confirmPassword === ""
				|| userName === "" || userNickname === "" || userPhone === ""
				|| userEmail === "" || userBirth === ""
				|| userGender === undefined || userPostCode === ""
				|| userAddress === "" || userAddressDetail === "") {
			alert("모든 항목을 입력하세요.");
			return;
		}

		if (mailCheck == 1) {
			if (confirmPassword == userPw) {
				let info = {
					userId : userId,
					userPw : userPw,
					userName : userName,
					userNickname : userNickname,
					userPhone : userPhone,
					userEmail : userEmail + userEmail2,
					userBirth : userBirth,
					userGender : userGender,
					userPostCode : userPostCode,
					userAddress : userAddress,
					userAddressDetail : userAddressDetail,
				};

				let infos = JSON.stringify(info);
				$.ajax({
					type : "POST",
					url : "/baemin/customer_signup",
					data : infos,
					contentType : "application/json", // 필수
					success : function(data) {
						alert("회원가입 되었습니다.");
						window.location.href = "${path}/login";
					},
					error : function() {
						//alert("입력한 정보를 확인해주세요.");
					},
				});
			} else {
				alert("비밀번호가 일치하지 않습니다.");
			}
		} else {
			alert("이메일 인증을 완료해주세요.");
		}
	}

	//// 중요/////
	$(document).ready(function() {
						let userIdValid = false;
						let userPwValid = false;
						let confirmPasswordValid = false;
						let userNameValid = false;
						let userNicknameValid = false;
						let userEmailValid = false;
						// 아이디 유효성 검사
						$("#userId").on("focusout",function() {
							let idCheck = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{6,12}$/;
							let userId = $(this).val();
							if (userId === ""
									|| !idCheck.test(userId)) {
								$(this).css("border-color",	"red");
								userIdValid = false;
								alert("아이디는 영문과 숫자의 조합으로 6~12자여야 합니다.");
							} else {
								$(this).css("border-color", "");
								userIdValid = true;
							}
						});

						// 아이디 중복 확인
						$("#checkDuplicate").click(function() {
							// 입력안한 경우
							if ($("#userId").val() == "") {
								alert("아이디를 입력해주세요.");
							} else {
								// 유효성검사
								let idCheck = /^(?=.*[a-z])(?=.*[0-9])[a-z0-9]{6,8}$/;								
								let userId = $("#userId").val();

								if (!idCheck.test(userId)) {
									alert("아이디는 영문 소문자와 숫자 조합으로 6~12자여야 합니다.");
									return;
								}

								// 유효성 검사 통과시 중복 확인 Ajax 요청
								$.ajax({
											url : "/baemin/checkDuplicate",
											type : "POST",
											data : {
												userId : userId
											},
											success : function(
													data) {
												if (data === "yes") {
													$("#userId").css("border-color","red");
													alert("중복된 아이디 입니다.");
													id_check = false;
													$("#userId").val("");
												} else {
													$("#userId").css("border-color","");
													alert("사용가능한 아이디 입니다.");
													id_check = true;
												}
											},
											error : function() {
												alert("에러발생");
											}
										});
							}
							toggleIdConfirmButton();
						});

						// 비밀번호 유효성 검사
						$("#userPw").on("input",function() {
							let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

							if ($(this).val() === ""
									|| !pwdCheck.test($(this).val())) {
								$(this).css("border-color", "red");
								userPwValid = false;
							} else {
								$(this).css("border-color", "");
								userPwValid = true;
							}
						});

						// 비밀번호 확인
						$("#confirmPassword").on("input",function() {
							if ($(this).val() === "" || !userPwValid || $("#userPw").val() !== $(this).val()) {
								$(this).css("border-color", "red");
								confirmPasswordValid = false;
							} else {
								$(this).css("border-color", "");
								confirmPasswordValid = true;
							}
						});

						// 손님 이름
						$("#userName").on("input", function() {
						    let userName = $(this).val();
						    let namePattern = /^[가-힣]{2,10}$|^[a-zA-Z]{2,10}$/;
						    let forbiddenChars = /[^\wㄱ-힣]/; // 특수문자, 공백, 숫자 제외
						
						    if (
						        userName === "" || !namePattern.test(userName) || forbiddenChars.test(userName)
						    ) {
						        $(this).css("border-color", "red");
						        userNameValid = false;
						    } else {
						        $(this).css("border-color", "");
						        userNameValid = true;
						    }
						});



						let timeoutId;

						// 닉네임 유효성 검사
						$("#userNickname").on("input",function() {
							let userNickname = $(this).val();
							let nicknameCheck = /^[a-zA-Z0-9\u3131-\uD79D]{3,20}$/; // 특수문자 제거

							if (nicknameCheck
									.test(userNickname)) {
								$(this).css("border-color", "");
								clearTimeout(timeoutId);
								timeoutId = setTimeout(
										function() {checkNicknameDuplicate(userNickname);
										}, 200);
							} else {
								$(this).css("border-color", "red");
							}
						});

						// 닉네임 중복 확인하는 함수
						function checkNicknameDuplicate(userNickname) {
							$.ajax({
								url : "/baemin/checkDuplicateNick",
								type : "POST",
								data : {
									userNickname : userNickname
								},
								success : function(data) {
									if (data.toLowerCase() === "yes") {
										$("#userNickname").css("border-color", "red");
										alert("중복된 닉네임 입니다.");
										$("#userNickname").val("");
									} else {
										$("#userNickname").css("border-color", "");
									}
								},
								error : function() {
									alert("에러발생");
								}
							});
						}

						// 연락처 유효성 검사
						$("#userPhone").on("input",function() {
							let phoneCheck = /^[0-9]{11}$/;
							if (!/^[0-9]*$/.test($(this).val())) {
								$(this).val('');
							}
							if ($(this).val() === "" || !phoneCheck.test($(this).val())) {
								$(this).css("border-color",	"red");
								userPhoneValid = false;
							} else {
								$(this).css("border-color", "");
								userPhoneValid = true;
							}
						});

						// 연락처 중복 확인
						$("#userPhone").on('focusout',function() {
							var userInput = $(this).val();
							if (userInput == "") {
							} else {
								$.ajax({
											url : "/baemin/checkDuplicatePhone",
											type : "POST",
											data : {
												userPhone : $("#userPhone").val()
											},
											success : function(data) {
												if (data === "yes") {
													$("#userPhone").css("border-color","red");
													alert("중복된 연락처 입니다.");
													phone_check = false;
													$("#userPhone").val("");
												} else {
													$("#userPhone").css("border-color","");
													phone_check = true;
												}
											},
											error : function() {
												alert("에러발생");
											}
										});
							}
						});
						
						// 이메일 유효성 검사
						$("#userEmail").on("input",function() {
							let emailCheck = /^[^@.]+$/; 
// 							let emailCheck = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
							if ($(this).val() === "" || !emailCheck.test($(this).val())) {
								$(this).css("border-color","red");
								userEmailValid = false;
							} else {
								$(this).css("border-color", "");
								userEmailValid = true;
							}
						});
						$("#anouncement").on("click", function() {
							alert("유효한 이메일을 적어주세요. 아이디, 비밀번호 찾기에 사용됩니다.");
						})

						// 이메일 중복 확인
						$("#userEmail").on('focusout',function() {
							var userInput = $(this).val();
							if (userInput == "") {
							} else {
								$.ajax({
											url : "/baemin/checkDuplicateEmail",
											type : "POST",
											data : {
												userEmail : $("#userEmail").val()
											},
											success : function(data) {
												if (data === "yes") {

													$("#userEmail").css("border-color","red");
													alert("중복된 이메일 입니다.");
													email_check = false;
													$("#userEmail").val("");
												} else {
													$("#userEmail").css("border-color","");

													email_check = true;
												}
											},
											error : function() {
												alert("에러발생");
											}
										});
							}
						});

						// 아이디 확인 버튼 토글
						function toggleIdConfirmButton() {
							if (userIdValid) {
								$("#id_Confirm").show();
							} else {
								$("#id_Confirm").hide();
							}
						}

						// 생년월일 유효성 검사
						$("#userBirth").on("change",function() {
							let birthdateCheck = /^(19\d\d|20[0-2]\d)-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$/;
							let today = new Date();
							let selectedDate = new Date($(this).val());
							let age = today.getFullYear() - selectedDate.getFullYear();

							if (!birthdateCheck.test($(this).val())) {
								alert("올바른 형식의 생년월일을 입력하세요. (YYYY-MM-DD)");
								$(this).val("");
								$(this).css("border-color","red");
							} else if (age < 14) {
								alert("만 14세 미만은 가입이 제한됩니다.");
								$(this).val("");
								$(this).css("border-color","red");
							} else {
								$(this).css("border-color", "");
							}
						});

						// 회원가입 버튼 클릭 시 유효성 검사 및 서버 전송
						$("#signin_button").click(
								function() {
									if (userIdValid && userPwValid
											&& confirmPasswordValid
											&& userNicknameValid) {
										if (mailCheck === 1) {
											alert("이메일 인증번호가 일치하지 않습니다.");
										}
										signup();
										
										alert("회원가입이 완료되었습니다.");
									} else {
										//alert("입력 정보를 확인해주세요.");
									}
								});


						// 이메일 인증 보내기
						$('#mail-Check-Btn').click(function() {
								const email = $('#userEmail1').val()
										+ $('#userEmail2').val(); // 이메일 주소값 얻어오기!
								console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
								const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	
								$.ajax({
									type : 'GET',
									url : "${path}/mailCheck/" + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
									success : function(data) {
										console.log("data : " + data);
										checkInput.attr('disabled', false);
										code = data;
										alert('인증번호가 전송되었습니다.')
									}
								});
						});

						// 직접입력 옵션 선택 시 동적으로 입력 필드 보이기/숨기기
// 						document.getElementById("userEmail2").addEventListener("change", function() {
// 						    var directInput = document.getElementById("directEmailInput");
// 						    if (this.value === ".com") {
// 						        directInput.style.display = "block";
// 						    } else {
// 						        directInput.style.display = "none";
// 						    }
// 						});

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
						});

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
	
// 	function handleEmailSelection(selectedValue) {
// 	    if (selectedValue === "") {
// 	        document.getElementById("directEmailInput").style.display = "inline-block";
// 	        document.getElementById("directEmailInput").setAttribute("required", "required");
// 	    } else {
// 	        document.getElementById("directEmailInput").style.display = "none";
// 	        document.getElementById("directEmailInput").removeAttribute("required");
// 	    }
// 	}
</script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({

			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				autoClose: true;
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}

				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('userPostCode').value = data.zonecode;
				document.getElementById("userAddress").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("userAddressdetail").focus();
			}
		}).open();
	}
</script>


</head>

<body>

	<jsp:include page="../base/header_login.jsp" />

	<section id="content">

		<div class="container">

			<!-- 회원가입 폼 -->
			<div class="signup-div">

				<div class="signup-title">
					<h1>손님 회원가입</h1>
				</div>

				<span class="input-container-id">

					<table>
						<td>아이디</td>
						<td><span><input type="text" id="userId"
								name="userIdn" placeholder="영문, 숫자 조합 6~8자"
								class="vertical-center" maxlength="8"></span>
							<button id="checkDuplicate">중복확인</button></td>
					</table>
				</span>

				<table>
					<td>비밀번호</td>
					<td><span><input type="password" id="userPw"
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
					<td><span><input type="text" id="userName"
							placeholder="이름" class="vertical-center"> </span></td>
				</table>
				<table>
					<td>닉네임</td>
					<td><span> <input type="text" id="userNickname"
							placeholder="한글, 영문(소문자), 숫자 2~6자 가능" class="vertical-center">
					</span></td>
				</table>
				<table>
					<td>연락처</td>
					<td><span> <input type="tel" id="userPhone"
							placeholder="연락처('-' 없이 숫자 11자리)" class="vertical-center"
							pattern="[0-9]{11}" title="숫자 11개를 입력하세요"></span></td>
				</table>
				<table>
					<div class="form-group email-form">
						<label for="email">이메일</label> <span></span>
						<div class="input-group">
							<input type="text" class="form-control" name="userEmail1"
								id="userEmail1" placeholder="이메일">

							<select class="form-control" name="userEmail2" id="userEmail2">
								<option value="@gmail.com.com">@
									<div class="mail">gmail.com</div>
								</option>
								<option value="@naver.com.com">@
									<div class="mail">naver.com</div>
								</option>
								<option value="kakao.com.com">@
									<div class="mail">kakao.com</div>
								</option>
								<option value=".com">직접입력</option>
							</select> 
<!-- 							<input type="text" class="form-control" name="directEmailInput" id="directEmailInput" placeholder="직접 이메일 입력" style="display: none;"> -->
<!-- 							<input type="text" class="form-control" id="customEmail" name="customEmail" style="display: none;" placeholder="도메인을 포함한 이메일 주소를 입력하세요"> -->
						</div>
						<div class="mail-check-box">
							<input class="form-control mail-check-input"
								id="Certification-Number" placeholder="인증번호 6자리를 입력해주세요"
								disabled="disabled" maxlength="6">
							<button type="button" class="btn btn-primary" id="mail-Check-Btn">인증번호발송</button>
						</div>

						<span id="mail-check-warn"></span>
					</div>
				</table>
				<table>
					<td>생년월일</td>
					<td><span> <input type="date" id="userBirth"
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

				<span class="input-container-address">
					<table>
						<td>주소</td>
						<td><span> <input type="text" id="userPostCode"
								name="userPostCode" placeholder="우편번호" class="vertical-center">
						</span>
							<button value="우편번호 찾기" class="vertical-center" id="searchpc"
								style="width: 100px;" onclick="sample6_execDaumPostcode()">우편번호
								찾기</button></td>
					</table>
				</span> <input type="text" id="userAddress" placeholder="주소"
					class="vertical-center"> <span> <input type="text"
					id="userAddressdetail" placeholder="상세주소" class="vertical-center">
				</span>
				<button onclick="signup()" value="회원가입" id="signin_button">회원가입</button>

			</div>


		</div>

	</section>
	<jsp:include page="../base/footer.jsp" />


</body>

</html>