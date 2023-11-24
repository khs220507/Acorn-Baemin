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
		color: #007bff;
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

	button#checkDuplicate,
	#searchpc,
	#modify_button {
		background-color: #48D1CC;
		color: white;
		border: none;
		border-radius: 4px;
		cursor: pointer;
		margin-left: 10px;
	}
	button#signout_button{
		background-color: red;
		color: white;
		border: none;
		border-radius: 4px;
		cursor: pointer;
		margin-left: 10px;
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

	.container {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	.modify-title {
		text-align: center;
		padding: 20px;
		font-size: 20px;
	}

	h1 {
		color: #333;
	}
	
	.modify-div span {
		display: block;
		margin-top: 5px;
		margin-bottom: 5px;
		font-weight: bolder;
	}

	.modify-div {
		background-color: #fff;
		padding: 20px;
		max-width: 350px;
		width: 100%;
		border: 3px solid #48D1CC;
		box-shadow: 0px 0px 5px #ccc;
		border-radius: 10px;
	}

	.input-container-id {
		display: flex;
		align-items: center;
	}

	.input-container-address {
		display: flex;
		align-items: center;
	}

	button#modify_button {
		background-color: #48D1CC;
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

	input[id="userPw"],
	input[id="confirmPassword"],
	input[id="userNickname"],
	input[id="userPhone"],
	input[id="userEmail"],
	input[id="sellerBirth"],
	input[id="userAddress"],
	input[id="userAddressdetail"] {
		width: 300px;
		height: 25px;
		padding: 10px;
		font-size: 15px;
		border: 1px solid #ccc;
		border-radius: 4px;
	}

	input[id="sellerId"],
	input[id="userPostCode"] {
		width: 97%;
		height: 25px;
		padding: 10px;
		font-size: 15px;
		border: 1px solid #ccc;
		border-radius: 4px;
	}

	input[type="button"] {
		background-color: #48D1CC;
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
function updatecustomer() {
		console.log("Update button clicked");	
		    let userCode = $('#userInfo').val();
		    let userNickname = $('#userNickname').val();
		    let userPw = $("#userPw").val();
		    let confirmPassword = $("#confirmPassword").val();
		    let userPhone = $('#userPhone').val();
		    let userEmail = $('#userEmail').val();
		    let userPostCode = $('#userPostCode').val();
		    let userAddress = $('#userAddress').val();
		    let userAddressDetail = $('#userAddressdetail').val();

		    
		 // 빈칸으로 수정되는경우 방지
			if (userPw === "" || confirmPassword === ""
					|| userNickname === "" || userPhone === ""
					|| userEmail === "" || userPostCode === "" || userAddress === "" || userAddressDetail === "" ) {
				alert("모든 항목을 입력하세요.");
				return
			}
		
		    if (confirmPassword == userPw) {	     

		            let info = {
		                userCode: userCode,
		                userNickname: userNickname,
		                userPw: userPw,
		                userPhone: userPhone,
		                userEmail: userEmail,
		                userPostCode: userPostCode,
		                userAddress: userAddress,
		                userAddressDetail: userAddressDetail
		            };
		            let infos = JSON.stringify(info);
		
		            $.ajax({
		                type: 'POST',
		                url: '/baemin/updateUserInfo',
		                data: infos,
		                contentType: "application/json",
		                success: function (data) {
		                    console.log("Update success:", data);
		                    alert("수정 성공.");
		                    window.location.href = "http://localhost:8080/baemin/home";
		                },
		                error: function (xhr, status, error) {
		                    console.log("Update error:", status, error);
		                    alert("수정 정보를 확인해주세요.");
		                    $('#resultDiv').text('수정 실패.');
		                }
		            });
		        
		    } else if (confirmPassword != userPw) {
		        alert("비밀번호를 확인해주세요.");
		        $("#userPw").val("");
		        $("#confirmPassword").val("");
		    }
		}
 
		////중요/////
		$(document).ready(function() {
			let userNicknameValid = false;
			let userPwValid = false;
			let confirmPasswordValid = false;
			let userPhoneValid = false;
			let userEmailValid = false;
			let userPostCodeValid = false;
			let userAddressValid = false;
			let userAddressDetailValid = false;
			
			let timeoutId;

			// 닉네임 유효성 검사
			$("#userNickname").on("input", function() {
			    let userNickname = $(this).val();
			    let nicknameCheck = /^[a-zA-Z0-9_\u3131-\uD79D]{2,6}$/;

			    if (!nicknameCheck.test(userNickname)) {
			        $(this).css("border-color", "green");
			    } else {
			        $(this).css("border-color", ""); // 초기화
			        clearTimeout(timeoutId);
			        timeoutId = setTimeout(function() {
			            checkNicknameDuplicate(userNickname);
			        }, 500); 
			    }
			});

			// 닉네임 중복검사
			function checkNicknameDuplicate(userNickname) {
				if(hiddenNickname != userNickname){				
				    $.ajax({
				        url: "/baemin/checkDuplicateNick",
				        type: "POST",
				        data: {
				            userNickname: userNickname
				        },
				        success: function(data) {
				            if (data.toLowerCase() === "yes") {
				                $("#userNickname").css("border-color", "red");
				                alert("중복된 닉네임 입니다.");
				                $("#userNickname").val("");
				            } else {
				                $("#userNickname").css("border-color", "");
				            }
				        },
				        error: function() {
				            alert("에러발생");
				        }
				    });
				}
			}

			
			// 비밀번호 유효성 검사
			$("#userPw").on("input",function() {
				let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
				if ($(this).val() === "" || !pwdCheck.test($(this).val())) {
					$(this).css("border-color","red");
					userPwValid = false;
				} else {
					$(this).css("border-color", "");
					userPwValid = true;
				}
			});
			
			// 비밀번호 확인
			$("#confirmPassword").on("input",function() {
				if ($(this).val() === "" || $("#userPw").val() !== $(this).val()) {	// !userPwValid || 
					$(this).css("border-color", "red");
					confirmPasswordValid = false;
				} else {
					$(this).css("border-color", "");
					confirmPasswordValid = true;
				}
			});					

			// 연락처 유효성 검사
			const previousPhoneNumber = ""; 
			$("#userPhone").on("input", function() {
			    let phoneCheck = /^[0-9]{11}$/;
			
			    if (!/^[0-9]*$/.test($(this).val())) {
			        $(this).val('');
			    } else if ($(this).val() === previousPhoneNumber) { 
			        $(this).css("border-color", ""); 
			        phone_check = true; 
			    } else if ($(this).val() === "" || !phoneCheck.test($(this).val())) {
			        $(this).css("border-color", "red");
			        phone_check = false;
			    } else {
			        $(this).css("border-color", "");
			        phone_check = true;
			    }
			});

			// 연락처 중복 확인
			$("#userPhone").on('focusout', function() {
			    var userInput = $(this).val();
			    var hiddenUserPhone = $("#hiddenUserPhone").val();
			    if (userInput == "" || userInput === previousPhoneNumber || userInput === hiddenUserPhone) {
			        return;
			    } else {
			        $.ajax({
			            url: "/baemin/checkDuplicatePhone",
			            type: "POST",
			            data: {
			                userPhone: userInput
			            },
			            success: function(data) {
			                if (data === "yes") {
			                    $("#userPhone").css("border-color", "red");
			                    alert("중복된 연락처 입니다.");
			                    phone_check = false;
			                    $("#userPhone").val("");
			                } else {
			                    $("#userPhone").css("border-color", "");
			                    phone_check = true;
			                }
			            },
			            error: function() {
			                alert("에러발생.");
			            }
			        });
			    }
			});

				
			// 이메일 유효성 검사
			const previousEmail = "";
			$("#userEmail").on("input", function() {
				let emailCheck = /^[a-zA-Z0-9._-]+@(example\.com|gmail\.com|naver\.com|kakao\.com)$/;
				if (!$(this).val().includes('@') || !emailCheck.test($(this).val())) {
			        $(this).css("border-color", "red");
			    } else {
			        let parts = $(this).val().split('@');
			        let domain = parts[1] || ''; // 도메인 부분을 가져옴
			        let validDomains = ['example.com', 'gmail.com', 'naver.com', 'kakao.com'];
			        if (!validDomains.includes(domain)) {
			            $(this).css("border-color", "red");
			        } else {
			            $(this).css("border-color", ""); // 초기화
			        }
			    }
			});
			
			// 이메일 중복 확인
    			
			$("#userEmail").on('focusout', function() {
			    var userInput = $(this).val();
			    var hiddenUserEmail = $("#hiddenUserEmail").val();
			    
			    if ( userInput === hiddenUserEmail) {
			    	return ;
			    } else {
			        $.ajax({
			            url: "/baemin/checkDuplicateEmail",
			            type: "POST",
			            data: {
			            	userEmail: userInput
			            },
			            success: function(data) {
			                if (data === "yes") {			                	
			                    $("#userEmail").css("border-color", "red");
			                    alert("중복된 이메일 입니다.");
			                    email_check = false;
			                    $("#userEmail").val("");						                    
			                } else {
			                    $("#userEmail").css("border-color", "");
			                    email_check = true;
			                }
			            },			            
			            error: function() {
			                alert("에러발생.");
			            }
			        });
			    }
			});
			
			// 회원가입 버튼 클릭 시 유효성 검사 및 서버 전송
			$("#signin_button").click(function() {
				if (userIdValid && userPwValid 	&& confirmPasswordValid  && userNicknameValid && userEmailValid
				&& userPostCodeValid && userAddressValid && userAddressDetailValid) {						
					alert("정보수정이 완료되었습니다.");
				} else {
					alert("입력 정보를 확인해주세요.");
				}
			});
			
			
		});
		
		
		// Enter 키 누를 시 로그인 button click과 같은 효과
		document.addEventListener("DOMContentLoaded", function() {
			const form = document.getElementById("modify_button");
		
			form.addEventListener("keypress", function(event) {
			if (event.key === "Enter") {
			    event.preventDefault(); 
			    login(); 
			}
	  	 });			
		});
	 

		// 회원 탈퇴
		   function signoucustomer() {
			    let confirmResult = confirm("정말 탈퇴하시겠습니까?");

			    if (confirmResult) {
			    	window.location.href='/baemin/customerSignoutStatus' 
			    }
			    alert("회원탈퇴 완료되었습니다.");
			    
			}

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
        	
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
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

	<jsp:include page="../base/header.jsp" />

	<section id="content">

		<div class="container">

			<!-- 회원가입 폼 -->
			<div class="modify-div">

				<div class="modify-title">
					<h1>내 정보 수정</h1>
				</div>

				<span class="input-container-id">

					<table>
					    <td>닉네임</td>
					    <td>
					        <span>
					            <input type="text" id="userNickname" placeholder="한글, 영문(소문자), 숫자 2~6자 가능" class="vertical-center" value="${userInfo.userNickname}">
					            <input type="hidden" id="hiddenNickname" value="${userInfo.userNickname}">
					        </span>
					    </td>
					</table>

				</span>

				<table>
					<td>비밀번호</td>
					<td><span><input type="password" id="userPw" name="m_password"
								placeholder="영문, 숫자, 특수문자 조합 8~16자" class="vertical-center"
								maxlength="16" value="${userInfo.userPw}"></span></td>
				</table>
				<table>
					<td>비밀번호 확인</td>
					<td><span><input type="password" id="confirmPassword" name="confirmPassword"
								placeholder="비밀번호 확인" class="vertical-center" maxlength="16"> </span></td>
				</table>
				

				<table>
					<td>연락처</td>
					<td><span> <input type="tel" id="userPhone"
							placeholder="연락처('-' 없이 숫자 11자리)" class="vertical-center"
							pattern="[0-9]{11}" title="숫자 11개를 입력하세요" value="${userInfo.userPhone}"></span></td>
							<input type="hidden" id="hiddenUserPhone" value="${userInfo.userPhone}">
				</table>
				<table>
					<td>이메일</td>
					<td><span> <input type="email" id="userEmail" placeholder="이메일" class="vertical-center"
								value="${userInfo.userEmail}"></span></td>
								<input type="hidden" id="hiddenUserEmail" value="${userInfo.userEmail}">
				</table>

				<span class="input-container-address">
					<table>
						<td>주소</td>
						<td><span><input type="text" id="userPostCode" name="userPostCode" placeholder="우편번호" class="vertical-center" value="${userInfo.userPostCode}" readonly></span>
							<button value="우편번호 찾기" class="vertical-center" id="searchpc" onclick="sample6_execDaumPostcode()"

								style="width: 100px;" >우편번호 찾기</button></td>
					</table>
				</span> <input type="text" id="userAddress" placeholder="주소"
					class="vertical-center" value="${userInfo.userAddress }" readonly> 
					<span> <input type="text"
					id="userAddressdetail" placeholder="상세주소" class="vertical-center" value="${userInfo.userAddressDetail }">
				</span>

				<button onclick="updatecustomer()" value="수정완료" id="modify_button">수정완료</button>
				<button onclick="signoucustomer()" value="회원탈퇴" id="signout_button">회원탈퇴</button>

			</div>

		
		</div>

	</section>
	<jsp:include page="../base/footer.jsp" />


</body>

</html>