<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    button#checkDuplicate,
    #searchpc,
    #modify_button {
        background-color: #82d9d0;
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

    .signup-title {
        text-align: center;
        padding: 20px;
        font-size: 20px;
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

    button#modify_button {
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

    input[id="sellerPw"],
    input[id="confirmPassword"],
    input[id="sellerName"],
    input[id="sellerRegCode"],
    input[id="sellerPhone"],
    input[id="sellerEmail"],
    input[id="sellerBirth"] {
        width: 300px;
        height: 25px;
        padding: 10px;
        font-size: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[id="sellerId"],
    input[id="postCode"] {
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
    .warning-button {
    /* 기본 스타일 */
    
}

.warning-button:hover {
    /* 호버 시 스타일 */
    /* 여기에 호버 시 버튼의 스타일을 추가하세요 */
     font-size: 1.5em;
}
</style>
<script>
    function updateseller() {
    	
        let sellerCode = <%=session.getAttribute("user") %>				//${'#modify.sellerCode'}.val();
        let sellerName = $('#sellerName').val();
        let sellerPw = $("#sellerPw").val();
        let confirmPassword = $("#confirmPassword").val();
        let sellerPhone = $('#sellerPhone').val();
        let sellerEmail = $('#sellerEmail').val();
        let sellerRegCode = $('#sellerRegCode').val();

        if (confirmPassword == sellerPw) {

            let info = {
                sellerCode: sellerCode,
                sellerName: sellerName,
                sellerPw: sellerPw,
                sellerPhone: sellerPhone,
                sellerEmail: sellerEmail,
                sellerRegCode: sellerRegCode
            };
            let infos = JSON.stringify(info);

            $.ajax({
                type: 'POST',
                url: '${path}/updateSellerInfo',
                data: infos,
                contentType: "application/json",
                success: function (data) {
                    alert("수정 성공.");
                    window.location.href = "${path}/sellerHome?sellerCode=" + sellerCode;
                },
                error: function () {
                    alert("수정 정보를 확인해주세요.");
                    $('#resultDiv').text('수정 실패');
                }
            });
        } else if (confirmPassword != sellerPw) {
            alert("비밀번호를 확인해주세요.");
            $("#sellerPw").val("");
            $("#confirmPassword").val("");
        }
    };
    
////중요/////
    $(document).ready(function () {
                let sellerIdValid = false;
                let sellerPwValid = false;
                let confirmPasswordValid = false;
                let sellerNameValid = false;
                let sellerRegCodeValid = false;

                // 비밀번호 유효성 검사
                $("#sellerPw").on("input",function () {
                    let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

                    if ($(this).val() === "" || !pwdCheck.test($(this).val())) {
                        $(this).css("border-color", "red");
                        sellerPwValid = false;
                    } else {
                        $(this).css("border-color", "");
                        sellerPwValid = true;
                    }
                });

                // 비밀번호 확인
                $("#confirmPassword").on("input", function () {
                    if ($(this).val() === "" || $("#sellerPw").val() !== $(this).val()) {	// !sellerPwValid ||
                        $(this).css("border-color", "red");
                        confirmPasswordValid = false;
                    } else {
                        $(this).css("border-color", "");
                        confirmPasswordValid = true;
                    }
                });
    
                // 사장님 이름
                $("#sellerName").on("blur",function() {
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

                // 사업자등록번호 유효성 검사
                $("#sellerRegCode").on("input", function () {
                    let regcodeCheck = /^[0-9]{10}$/;

                    if ($(this).val() === "" || !regcodeCheck.test($(this).val())) {
                        $(this).css("border-color", "red");
                        sellerRegCodeValid = false;
                    } else {
                        $(this).css("border-color", "");
                        sellerRegCodeValid = true;
                    }
                });
                
             	// 연락처 유효성 검사
                $("#sellerPhone").on("input", function () {
                    let phoneCheck = /^[0-9]{11}$/;

                    if ($(this).val() === "" || !phoneCheck.test($(this).val())) {
                        $(this).css("border-color", "red");
                        sellerPhoneValid = false;
                    } else {
                        $(this).css("border-color", "");
                        sellerPhoneValid = true;
                    }
                });

             	// 이메일 유효성 검사
                $("#sellerEmail").on("input", function () {
                    let emailCheck = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

                    if ($(this).val() === "" || !emailCheck.test($(this).val())) {
                        $(this).css("border-color", "red");
                        sellerEmailValid = false;
                    } else {
                        $(this).css("border-color", "");
                        sellerEmailValid = true;
                    }
                });

             // 회원가입 버튼 클릭 시 유효성 검사 및 서버 전송
    			$("#signin_button").click(function() {
    				if (sellerIdValid && sellerPwValid 	&& confirmPasswordValid  && sellerEmailValid
    					&& sellerNameValid && sellerRegCodeValid) {						
    					alert("정보수정이 완료되었습니다.");
    				} else {
    					alert("입력 정보를 확인해주세요.");
    				}
    			}); 
    });
      
   // 회원 탈퇴
   function signoutseller() {
	    let confirmResult = confirm("정말 탈퇴하시겠습니까?");

	    if (confirmResult) {
	        window.location.href='${path}/customerSignoutStatus';
	        alert("회원탈퇴 완료되었습니다.");
	    } else {
	        alert("회원탈퇴가 취소되었습니다.");
	    }
	}

   const signoutButton = document.getElementById('signout_button');

   signoutButton.addEventListener('mouseover', function () {
       signoutButton.textContent = '누르지마!!!';
   });

   signoutButton.addEventListener('mouseout', function () {
       signoutButton.textContent = '회원탈퇴';
   });

    

</script>

        </head>

        <body>

            <jsp:include page="../base/sellerHeader.jsp" />

            <section id="content">

                <div class="container">

                    <!-- 회원가입 폼 -->
                    <div class="signup-div">

                        <div class="signup-title">
                            <h1>내 정보 수정</h1>
                        </div>

                        <span class="input-container-id">

                            <table>
                                <td>이름</td>
                                <td><span><input type="text" id="sellerName" placeholder="이름" class="vertical-center"
                                            value="${userInfo.sellerName}"> </span></td>
                            </table>
                        </span>

                        <table>
                            <td>비밀번호</td>
                            <td><span><input type="password" id="sellerPw" name="m_password"
                                        placeholder="영문, 숫자, 특수문자 조합 8~16자" class="vertical-center"
                                        maxlength="16" value="${userInfo.sellerPw}"></span></td>
                        </table>
                        <table>
                            <td>비밀번호 확인</td>
                            <td><span><input type="password" id="confirmPassword" name="confirmPassword"
                                        placeholder="비밀번호 확인" class="vertical-center" maxlength="16"> </span></td>
                        </table>
                        <table>
                            <td>사업자등록번호</td>
                            <td><span> <input type="text" id="sellerRegCode" placeholder="사업자등록번호"
                                        class="vertical-center" value="${userInfo.sellerRegCode}">
                                </span></td>
                        </table>

                        <table>
                            <td>연락처</td>
                            <td><span> <input type="tel" id="sellerPhone" placeholder="연락처('-' 없이 11자리)"
                                        class="vertical-center" pattern="[0-9]{11}" title="숫자 11개를 입력하세요"
                                        value="${userInfo.sellerPhone}"></span></td>
                        </table>
                        <table>
                            <td>이메일</td>
                            <td><span> <input type="email" id="sellerEmail" placeholder="이메일" class="vertical-center"
                                        value="${userInfo.sellerEmail}">
                                </span></td>
                        </table>

                        <button onclick="updateseller()" value="수정완료" id="modify_button">수정완료</button>
						<!-- <input type="hidden" value="${userInfo.sellerCode}" id="userInfo">-->
						<button onclick="signoutseller()" value="회원탈퇴" id="signout_button" class="warning-button">회원탈퇴</button>
                    </div>
                </div>

            </section>
            <jsp:include page="../base/footer.jsp" />

        </body>

        </html>