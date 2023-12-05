<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 태그 파트 */
body {
	height: 100vh;
}

input {
	display: block;
}

section {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-bottom: 50px; /* 여분의 여백으로 풋터가 바닥에 유지되도록 설정 */
}

.menu-info-review-tab {
	display: flex;
}

.store-image {
	width: 250px;
	height: 250px;
}

.menu-info-review-tab {
	display: flex;
	width: 60%;
	justify-content: space-around;
	font-size: 22px;
	margin-top: 30px;
}

.menu-info-review-tab li {
	width: 33.333333333333333333333333333%;
	text-align: center;
	padding: 5px 0;
}

.menu-tab {
	border-top: 2px solid black;
	background-color: rgb(244,243,243);
}

.info-tab, .review-tab {
	border-bottom: 2px solid black;
}

.menu-sub-tab {
	width: 60%;
}

@media ( max-width :767px) {
	.menu-sub-tab {
		width: 54%;
	}
	.modify-delete, .insert-cancel {
		width: 16%;
	}
	.menu-modify-btn-without-c, .menu-delete-btn {
		width: 50%;
	}
	.menu-image {
		width: 100px;
		height: 100px;
	}
}

.store-name {
	font-size: 3rem;
	margin-bottom: 1%;
}

.classification {
	display: flex;
	align-items: center;
	font-size: 28px;
	height: 45px;
}

.classification>a {
	padding-left: 10px;
	padding-right: 10px;
}

.classification>input {
	margin-left: 10px;
	margin-right: 10px;
	font-size: 20px;
}

.menu-image-link {
	width: 19.5%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.menu-image {
	width: 120px;
	height: 120px;
}

.rating-count-minprice {
	display: flex;
	width: 30%;
	justify-content: space-between;
	align-items: center;
}

.old-menu-classification {
	display: inline-block;
}

.new-menu-classification {
	display: inline-block;
}

.menu-classification {
	display: flex;
	padding-left: 10px;
}

.menu-classification>input {
	font-size: 15px;
}

.CModify {
	width: 12%;
	height: 70%;
}

.menu-info-with-btn {
	display: flex;
	justify-content: space-between;
	height: 160px;
	border-top: 2px solid #d9d9d9;
}

.input-menu-image {
	width: 30%;
	height: 50%;
	margin: auto;
}

.input-menu-content {
	width: 45%;
	height: 100%;
	padding-left: 70px;
	display: flex;
	flex-direction: column;
	justify-content: space-around;
}

#menu-status-text {
	padding-left: 5px;
	padding-right: 5px;
}

.now-menu-status {
	display: flex;
	height: 30px;
}

.now-menu-status {
	display: flex;
	height: 30px;
}

.menu-name, .menu-content, .menu-price {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.menu-status {
	width: 50%;
}

#menu-status-text {
	padding-left: 5px;
	padding-right: 5px;
}

#menu-status-text {
	padding-left: 5px;
	padding-right: 5px;
}

.modify-delete, .insert-cancel {
	display: flex;
	justify-content: space-around;
	align-items: center;
	width: 15%;
}

.menu-modify-btn-without-c, .menu-delete-btn, .insert-menu-btn,
	.cancel-btn {
	width: 30%;
	height: 50%;
}

.info-sub-tab {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.info-sub-tab-with-btn {
	display: flex;
	height: 100%;
}

.store-description, .operating-time {
	display: flex;
	align-items: center;
}

.store-description {
	height: 200px;
}

.operating-time {
	height: 33%;
	padding-top: 10px;
}

.store-description>div, .operating-time>div, #seller-info {
	width: 22%;
	height: 25%;
	text-align: center;
}

#seller-info {
	margin-top: 5%;
}

textarea {
	width: 78%;
	height: 100%;
}
.operating-time>input {
	width: 78%;
}
.seller-info {
	display: flex;
	padding-top: 10px;
}

.seller-name {
	display: flex;
}

.seller-name>div, .store-address>div, .seller-regcode>div {
	width: 36%;
}

.seller-name>input, .store-address>input, .seller-regcode>input {
	width: 64%;
}

.store-address {
	display: flex;
}

.total-address {
	display: flex;
	flex-direction: column;
}
.total-address>input {
	width: 319px;
	margin-bottom: 15px;
}

.seller-regcode {
	display: flex;
}

.store-info-modify-btn {
	width: 20%;
	height: 40%;
	margin-left: 4%;
	margin-top: 18%;
}

.store-info-tab, .store-review-tab {
	display: flex;
	display: none;
	width: 40%;
	margin-top: 1%;
	flex-direction: column;
	justify-content: space-between;
}

.add-menu {
	display: flex;
	justify-content: center;
}

.input-menu-classification {
	height: 20%;
}

.menu-form {
	height: 200px;
	border-top: 1px solid #d9d9d9;
}

.menu-input-with-btn {
	display: flex;
	justify-content: space-between;
}

.input-menu-form {
	width: 38%;
}

.input-menu-form>input {
	width: 100%;
}

.seller-info-sub {
	width: 78%;
}

hr {
	width: 80%;
	border: 0px;
	height: 2px;
	background-color: #d9d9d9;
	margin-top: 1%;
	margin-bottom: 1%;
}

.star-rating {
	display: inline-flex;
	flex-direction: row;
	justify-content: flex-start;
}

.star-rating .star {
	width: 25px;
	height: 25px;
	margin-right: 5px;
	display: inline-block;
	background:
		url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FE2bww%2FbtsviSSBz4Q%2F5UYnwSWgTlFt6CEFZ1L3Q0%2Fimg.png')
		no-repeat;
	background-size: 100%;
	box-sizing: border-box;
}

.star-rating .star.on {
	background:
		url('https://blog.kakaocdn.net/dn/b2d6gV/btsvbDoal87/XH5b17uLeEJcBP3RV3FyDk/img.png')
		no-repeat;
	background-size: 100%;
	box-sizing: border-box;
}

.user-star-wrap {
	display: flex;
	align-items:center;
}

.review-image {
	width: 250px;
	height: 300px;
	border-radius: 5px;
}

.review-wrap {
	margin-top: 20px;
	padding-bottom: 20px;
	border-bottom: 1px #d9d9d9 solid;
}
.reply-review-wrap {
	margin-top:10px;
}
.reply-review {
	padding-top: 5px;
}
.submitReplyBtn {
	padding-left: 4px;
}
</style>
<script>
	$(document).ready(function() {
		// 삭제된 메뉴는 보이지 않게 처리
		$("div.menu-info-with-btn").each(function() {
		    var statusText = $(this).find("span").text();
		    if (statusText.includes("삭제")) {
		        $(this).hide();
		    }
		});
		

		// 취소 버튼을 클릭시 전영역에 걸쳐서 활성/비활성화
		$(".cancel-btn").click(function() {
			$(".menu-form, .reply-form").hide();	// 입력 form 비활
			$(".active-reply-form-btn").show();	// 답글 달기 활성화
			$(this).hide();
		});
		
});

	// 메뉴/정보/리뷰 탭 영역
	
	// 메뉴 탭 영역
	// 메뉴 탭을 클릭하면 메뉴 리스트 조회, 정보와 리뷰 탭 비활
	function sellerMenu(){
		
		$(".menu-sub-tab").show();
		$(".store-info-tab, .store-review-tab").hide();
		
		$(".menu-tab").css("border-top", "2px solid black").css("border-bottom", "none").css("background-color", "rgb(244,243,243)");
		$(".info-tab").css("border-top", "none").css("border-bottom", "2px solid black").css("background-color", "white");
		$(".review-tab").css("border-top", "none").css("border-bottom", "2px solid black").css("background-color", "white");
		
	}
	// + 버튼을 클릭하면 메뉴정보 입력 폼 활성화
	function addMenuBtn(){
		
        $(".menu-form, .cancel-btn").show();
        
	}
	
	// 메뉴 등록
	function addMenu() {
		
		let formData = new FormData(document.querySelector(".menu-form"));
		
		$.ajax({
			type : "POST",
			url : "${path}/sellerMenu",
			enctype : 'multipart/form-data',
			data : formData,
			processData : false, // 데이터 처리를 비활
			contentType : false, // 컨텐츠 타입을 비활
			success : function() {
				alert("등록되었습니다!");
				window.location.reload();
			},
			error : function() {
				alert("메뉴 등록 실패");
			}
		});
	}
	
	// 메뉴 분류 수정
	function modifyMenuClassification(Code, element){
		let storeCode = Code;
		let menuClassification = $(element).closest('.classification').find('.old-menu-classification').text();
		let newMenuClassification = $(element).closest('.classification').find('.new-menu-classification').val();
	    
	    console.log(storeCode);
	    console.log(menuClassification);
	    console.log(newMenuClassification);
		
		let info = {
				storeCode : storeCode,
				menuClassification : menuClassification,
				newMenuClassification : newMenuClassification
		}
		
		let infos = JSON.stringify(info);
		
		$.ajax({
			type : "PUT",
			url : "${path}/updateSellerClassification",
			data : infos,
   			contentType : "application/json", // 필수
			success : function(){
				alert("수정완료");
   				window.location.reload();
			},
			error: function (xhr, status, error) {
		        console.error(xhr.responseText);
		        console.error(status);
		        console.error(error);
		        alert("서버 오류 발생");
		    }
		});
	}
	// 메뉴 수정
	function menuModifyBtnWithoutC(obj){
		let myForm = obj.parentElement.parentElement ;
		//let formData = new FormData(document.querySelector(".menu-info-with-btn"));
		let formData = new FormData(myForm);
   		
   		$.ajax({
   			type : "POST",
   			url : "${path}/updateSellerMenu",
			data : formData,
   			enctype : 'multipart/form-data',
   			processData : false, // 데이터 처리를 비활
   			contentType : false, // 컨텐츠 타입을 비활
   			success : function() {
   				alert("변경되었습니다");
   				window.location.reload();
   			},
   			error : function() {
   				alert("error");
   			}
   		});
   		
	}
	
	// 메뉴 삭제
	function deleteMenu() {
		$.ajax({
			type: "PUT",
			url: "${path}/sellerMenu", //path Variable  ,
			success : function (data){
				window.location.reload();
			},
			error : function() {
				alert("error");
			}
		});
	}

	
	// 정보 탭 영역
	// 정보 탭을 클릭하면 가게정보 조회, 메뉴와 리뷰 탭 비활
	function storeInfo() {
		
		$(".menu-sub-tab, .store-review-tab").hide();
		$(".store-info-tab").show();
		
		$(".menu-tab").css("border-top", "none").css("border-bottom", "2px solid black").css("background-color", "white");
		$(".info-tab").css("border-top", "2px solid black").css("border-bottom", "none").css("background-color", "rgb(244,243,243)");
		$(".review-tab").css("border-top", "none").css("border-bottom", "2px solid black").css("background-color", "white");
		
		$.ajax({
			type : "GET",
			url : "${path}/infoManage",
			success : function(response){
				let readStore = response.readStore;
				let readSeller = response.readSeller;
				
				// 가게 소개 정보 적용
	            $("#store-description").val(readStore.storeDescription);
	            $("#operating-time").val(readStore.operatingTime);

	            // 사업자 정보 적용
	            $("#seller-name").val(readSeller.sellerName);
	            $("#store-address").val(readStore.storeAddress);
	            $("#store-detail-address").val(readStore.storeAddressDetail);
	            $("#seller-regCode").val(readSeller.sellerRegCode);
			},
			error : function(){
				alert("실패");
			}
		});
	}
	
	// 가게정보 수정
	function modifyStoreInfo(Code, element){
		
		let storeCode = Code;
		let storeDescription = $(element).closest('.store-info-tab').find('#store-description').val();
		let operatingTime = $(element).closest('.store-info-tab').find('#operating-time').val();
	    let storeAddress = $(element).closest('.store-info-tab').find('#store-address').val();
	    let storeAddressDetail = $(element).closest('.store-info-tab').find('#store-detail-address').val();
	    let storeInfo = {
	    		storeCode : storeCode,
		    	storeDescription : storeDescription,
		    	operatingTime : operatingTime,
		    	storeAddress : storeAddress,
		    	storeAddressDetail : storeAddressDetail
	    	}
	    
	    console.log(storeInfo);
	    
   		let infos = JSON.stringify(storeInfo);

	    console.log(infos);
	    
   		$.ajax({
   			type : "PUT",
   			url : "${path}/infoManage",
   			data : infos,
   			dataType : "text",
   			contentType : "application/json", // 필수
   			success : function() {
   				alert("변경되었습니다");
   			},
   			error : function(e) {
   				console.log(e)
   				alert("error");
   			}
   		}); 
	}
	
	
	// 리뷰 탭 영역
	// 리뷰 조회
	function review(storeCode){
		// 리뷰 탭을 클릭하면 리뷰 리스트 조회, 메뉴와 정보 탭 비활
		$(".menu-sub-tab, .store-info-tab").hide();
		$(".store-review-tab").show();
		
		$(".menu-tab").css("border-top", "none").css("border-bottom", "2px solid black").css("background-color", "white");
		$(".info-tab").css("border-top", "none").css("border-bottom", "2px solid black").css("background-color", "white");
		$(".review-tab").css("border-top", "2px solid black").css("border-bottom", "none").css("background-color", "rgb(244,243,243)");
		
		$.ajax({
		    type: "GET",
		    url: "${path}/reviewAnswer",
		    data: { storeCode: storeCode },  // Add this line to send the storeCode
		    success: function(response) {
		        let reviewList = response.readReview;
		        let answerList = response.readAnswer;
		        console.log(response);
		    },
		    error: function(e) {
		        console.log(e);
		        alert("error");
		    }
		});
		
	}
	
	function submitReply(button) {
	      // Get the review code from somewhere (e.g., a hidden input field)
	     
	     var reviewCode = $(button).siblings("input[name='reviewCode']").val();
	     var answerContent = $(button).siblings("#replyContent").val();
	   
	      $.ajax({
	         type: "POST",
	         url: "${path}/submitAnswer",
	         contentType: "application/x-www-form-urlencoded",
	         data: {
	             reviewCode: reviewCode,
	             answerContent: answerContent
	         },
	         success: function () {
	            console.log("답글이 성공적으로 등록되었습니다!");
	            
	            var ownerReplyDiv = $(button).closest('.review-wrap').find('.reply-review');
	            var ownerReplyContent = '<div>[사장님]</div><div>' + answerContent + '</div>';
	            ownerReplyDiv.html(ownerReplyContent);
	         },
	         error: function () {
	            console.error("답글 등록 실패!");
	         }
	      });
	   }

</script>
</head>
<body>
	<jsp:include page="../base/sellerHeader.jsp" />
	<section id="content">
		<c:set var="storeImage" value="${readStore.storeImage}" />
		<div>
			<img alt="가게 로고" class="store-image"
				src="${path}/storeImages/${readStore.storeImage}">
		</div>
		<!-- 아래 div는 추후에 선으로 대체할 예정 -->
		<hr>
		<div class="store-name">${readStore.storeName}</div>
		<div class="rating-count-minprice">
			<div class="rating">⭐: ${readStore.storeRating}</div>
			<div class="count">리뷰수: ${readStore.reviewCount}</div>
			<div class="minprice">최소주문금액: ${readStore.minOrderPrice}원</div>
		</div>
		<ul class="menu-info-review-tab">
			<li class="menu-tab" onclick="sellerMenu()">메뉴</li>
			<li class="info-tab" onclick="storeInfo()">정보</li>
			<li class="review-tab" onclick="review(${readStore.storeCode})">리뷰</li>
		</ul>
		<!-- 메뉴 리스트 나오는 탭 -->
		<div class="menu-sub-tab">
			<div class="classification">
				<!-- 메뉴 카테고리, 클릭 시 클릭한 카테고리로 -->
				<c:forEach items="${CList}" var="classificationList">
					<a href="#${classificationList.menuClassification}">${classificationList.menuClassification}</a>
				</c:forEach>
			</div>
			<div>
				<!-- 메뉴 리스트 -->
				<c:forEach items="${CList}" var="classificationList">
					<div class="classification">
						<a class="old-menu-classification"
							id="${classificationList.menuClassification}">${classificationList.menuClassification}</a>
						<input type="text" class="new-menu-classification"
							placeholder="메뉴분류 입력">
						<button class="CModify"
							onclick="modifyMenuClassification(${readStore.storeCode}, this)">수정</button>
					</div>
					<c:forEach items="${readMenuInfo}" var="menuList">
						<c:if
							test="${menuList.menuClassification eq classificationList.menuClassification}">
							<c:choose>
								<c:when
									test="${menuList.menuClassification eq classificationList.menuClassification}">
									<form class="menu-info-with-btn">
										<div class="modify-form" style="display: flex">
											<a class="menu-image-link" href="${path}/sellerOption?menuCode=${menuList.menuCode}">
												<img class="menu-image" alt="메뉴사진" src="${path}/images/${menuList.menuImage}">
											</a>
											<input type="file" class="input-menu-image" name="menuImageFile">
											<div class="input-menu-content">
												<input type="text" class="menu-name" name="menuName" value="${menuList.menuName}">
												<input type="text" class="menu-content" name="menuContent" value="${menuList.menuContent}">
												<input type="text" class="menu-price" name="menuPrice" value="${menuList.menuPrice}">
												<div class="now-menu-status">
													<span id="menu-status-text">상태 : <c:choose>
															<c:when test="${menuList.menuStatus eq 0}">판매중</c:when>
															<c:when test="${menuList.menuStatus eq 1}">매진</c:when>
															<c:when test="${menuList.menuStatus eq 2}">삭제</c:when>
														</c:choose>
													</span>
													<select class="menu-status" name="menuStatus">
														<option value="0">판매중</option>
														<option value="1">매진</option>
													</select>
													<input type="hidden" class="menu-code" name="menuCode" value="${menuList.menuCode}">
												</div>
											</div>
										</div>
										<div class="modify-delete">
											<button type="button" class="menu-modify-btn-without-c"
												onclick="menuModifyBtnWithoutC(this)">수정</button>
											<button type="button" class="menu-delete-btn"
												onclick="deleteMenu()">삭제</button>
										</div>
									</form>
								</c:when>
							</c:choose>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
			<!-- 메뉴 등록 폼 -->
			<form class="menu-form" style="display: none;">
				<div class="input-menu-classification">
					<input type="text" name="menuClassification" placeholder="메뉴분류">
				</div>
				<div class="menu-input-with-btn">
					<input type="file" name="menuImageFile" accept="image/*" required>
					<!-- 이미지 등록 input, 이미지파일만 필수로 제한 -->
					<div class="input-menu-form">
						<input type="hidden" name="storeCode" value="${readStore.storeCode}"><br />
						<input type="text" name="menuName" placeholder="메뉴명"><br />
						<input type="text" name="menuContent" placeholder="메뉴설명"><br />
						<input type="number" name="menuPrice" placeholder="메뉴가격"><br />
						<select name="menuStatus">
							<option value="0">판매중</option>
							<option value="1">솔드아웃</option>
						</select>
					</div>
					<div class="insert-cancel">
						<button type="button" class="insert-menu-btn" onclick="addMenu()">등록하기</button>
						<button type="button" class="cancel-btn">취소하기</button>
					</div>
				</div>

			</form>
			<!-- 얘를 클릭하면 등록 폼이 활성화 -->
			<div class="add-menu" onclick="addMenuBtn()">
				<img src="${path}/resources/icons/addoption.png">
			</div>
		</div>
		<!-- 가게 정보 탭 -->
		<div class="store-info-tab">
			<div class="info-sub-tab-with-btn">
				<div class="info-sub-tab">
					<div class="store-description">
						<div>가게소개</div>
						<textarea id="store-description">
						  ${readStore.storeDescription}
						</textarea>
					</div>
					<div class="operating-time">
						<div>운영시간</div>
						<input type="text" id="operating-time" value="">
					</div>
					<div class="seller-info">
						<div id="seller-info">사업자정보</div>
						<div class="seller-info-sub">
							<div class="seller-name">
								<div>대표자명</div>
								<input type="text" id="seller-name" value="" readonly>
							</div>
							<div class="store-address">
								<div class="total-address">매장주소
								<input type="text" id="store-address" value="">
								<input type="text" id="store-detail-address" value="">
								</div>
							</div>
							<div class="seller-regcode">
								<div>사업자등록번호</div>
								<input type="text" id="seller-regCode" value="" readonly>
							</div>
						</div>
					</div>
				</div>
				<button class="store-info-modify-btn"
					onclick="modifyStoreInfo(${readStore.storeCode}, this)">수정하기</button>
			</div>
		</div>
		<!-- 리뷰 탭 -->
		<div class="store-review-tab">
			
			<c:forEach var="item" items="${reviewList}">
				<div class="review-wrap">
					<div class="user-star-wrap">
						<div>${item.userNickName}</div>
						<!-- Display stars based on the rating -->
						<div class="star-rating">
							<c:forEach begin="1" end="${item.reviewRating}">
								<span class="star on"></span>
							</c:forEach>
							<c:forEach begin="${item.reviewRating + 1}" end="5">
								<span class="star"></span>
							</c:forEach>
						</div>
					</div>
					<div>주문메뉴 : ${item.orderMenuName}</div>
					<div>${item.reviewContent}</div>

					<c:if test="${not empty item.reviewImageName}">

						<img class="review-image"
							src="/baemin/reviewImages/${item.reviewImageName}"
							alt="Review Image">
					</c:if>

					
					<div class="reply-review-wrap">
					<c:if test="${not empty item.answerContent}">
						<div class="owner">[사장님]</div>
						<div>${item.answerContent}</div>
		
						</c:if>
						<c:if test="${empty item.answerContent}">
							<div class="reply-review">
							<input type="hidden" name="reviewCode" value="${item.reviewCode}">
							<input type="hidden" name="storeCode" value="${item.storeCode}">
							<p style="margin-bottom: 5px;">답글달기</p>
							<textarea id="replyContent" placeholder="답글을 남겨주세요"></textarea>
							<button id="submitReplyBtn" onclick="submitReply(this)">등록</button>
						</div>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
		
	</section>
	<%@ include file="../base/footer.jsp"%>
	<script>
		$(function () {
		    $(".menuC").on("click", function(){
		        let headerHeight = $("header").outerHeight();
		        let href = $(this).attr("href");
		        let target = $(href == "#" || href == "" ? "body" : href);
		        let position = target.offset().top - headerHeight;
		        $("html, body").animate({ scrollTop: position }, 600, "swing");
		    });
		});
	</script>
</body>
</html>
