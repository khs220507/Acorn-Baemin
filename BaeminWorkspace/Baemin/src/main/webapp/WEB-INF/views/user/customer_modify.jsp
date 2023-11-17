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
	input[id="postCode"] {
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

	footer {}

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
		    
		 // 빈칸으로 수정되는경우 방지. 유효성 검사
			if (userPw === "" || confirmPassword === ""
					|| userNickname === "" || userPhone === ""
					|| userEmail === "" ) {
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
		                    alert("수정 성공");
		                    window.location.href = "http://localhost:8080/baemin/home";
		                },
		                error: function (xhr, status, error) {
		                    console.log("Update error:", status, error);
		                    alert("수정 정보를 확인해주세요");
		                    $('#resultDiv').text('수정 실패');
		                }
		            });
		        
		    } else if (confirmPassword != userPw) {
		        alert("비밀번호를 확인해주세요 ┑(￣Д ￣)┍");
		        $("#userPw").val("");
		        $("#confirmPassword").val("");
		    }
		}
 


// 닉네임, 연락처, 이메일 중복 확인
// function checkForDuplicates() {
//     return new Promise(function (resolve, reject) {
//         let userNickname = $('#userNickname').val();
//         let userPhone = $('#userPhone').val();
//         let userEmail = $('#userEmail').val();

//         $.ajax({
//             type: 'POST',
//             url: '/baemin/checkForDuplicates',
//             data: {
//                 nickname: userNickname,
//                 phone: userPhone,
//                 email: userEmail
//             },
//             success: function (data) {
//                 resolve(data);
//             },
//             error: function () {
//                 console.log('중복 확인 중 오류가 발생했습니다.');
//                 reject();
//             }
//         });
//     });
// }



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
                document.getElementById('postCode').value = data.zonecode;
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
						<td><span><input type="text" id="userNickname" placeholder="닉네임" class="vertical-center"
									value="${userInfo.userNickname}"> </span></td>
					</table>
				</span>

				<table>
					<td>비밀번호</td>
					<td><span><input type="password" id="userPw" name="m_password"
								placeholder="영문, 숫자, 특수문자 조합 8~16자" class="vertical-center"
								maxlength="16"></span></td>
				</table>
				<table>
					<td>비밀번호 확인</td>
					<td><span><input type="password" id="confirmPassword" name="confirmPassword"
								placeholder="비밀번호 확인" class="vertical-center" maxlength="16"> </span></td>
				</table>
				

				<table>
					<td>연락처</td>
					<td><span> <input type="tel" id="userPhone" placeholder="연락처('-' 없이 11자리)"
								class="vertical-center" pattern="[0-9]{11}" title="숫자 11개를 입력하세요"
								value="${userInfo.userPhone}"></span></td>
				</table>
				<table>
					<td>이메일</td>
					<td><span> <input type="email" id="userEmail" placeholder="이메일" class="vertical-center"
								value="${userInfo.userEmail}">
						</span></td>
				</table>

				<span class="input-container-address">
					<table>
						<td>주소</td>
						<td><span><input type="text" id="postCode"
								name="postCode" placeholder="우편번호" class="vertical-center"></span>
							<button value="우편번호 찾기" class="vertical-center" id="searchpc" onclick="sample6_execDaumPostcode()"
								style="width: 100px;">우편번호 찾기</button></td>
					</table>
				</span> <input type="text" id="userAddress" placeholder="주소"
					class="vertical-center"> <span> <input type="text"
					id="userAddressdetail" placeholder="상세주소" class="vertical-center">
				</span>

				<button onclick="updatecustomer()" value="수정완료" id="modify_button">수정완료</button>

			</div>

		
		</div>

	</section>
	<jsp:include page="../base/footer.jsp" />


</body>

</html>