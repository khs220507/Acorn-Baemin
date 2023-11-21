<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 태그 파트 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
}

body {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100vh;
}

ul {
	list-style: none;
}

input {
	display: block;
}

section {
	display: flex;
	flex-direction: column;
	align-items: center;
	flex: 7.8;
	width: 1280px;
	padding-top: 5%;
	padding-top: 140px; /* 헤더 높이만큼 padding-top 추가 */
	margin-bottom: 50px; /* 여분의 여백으로 풋터가 바닥에 유지되도록 설정 */
}

button {
	outline: none;
	cursor: pointer; /* 손가락모양 */
}
.wrap-all{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 75%;
	position: relative;
}
.line{
	background-color: #d9d9d9;
	height: 2px;
	border: 0px;
	width: 100%;
}
.thin-line{
	background-color: #d9d9d9;
	height: 1px;
	border: 0px;
	width: 100%;
}
.menu-info-review-tab {
	display: flex;
	width: 80%;
    justify-content: space-around;
    font-size: 22px;
    margin-top: 30px;
	padding: 5px 0;
}
.menu-info-review-tab li{
	width: 33.333333333333333333333333333%;
    text-align: center;
	padding: 5px 0;
}
.menu-tab{
	border-top: 1px solid black;
}
.info-tab{
	border-bottom: 1px solid black;
}
.review-tab{
	border-bottom: 1px solid black;
}
.menu-sub-tab{
	width: 80%;
}
.click-category{
	display: flex;
	justify-content: space-around;
	padding: 5px 0;
}
.classification{
	padding: 5px 10px;
}
.old-menu-classification{
	font-size: 20px;
}
.store-image {
	width: 250px;
	height: 250px;
	margin: 10px;
}
.store-name{
	font-size: 27px;
	margin: 15px;
}
.rating-review-minprice {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 33%;
}
.menu-img{
	width: 100px;
	height: 100px;
}
.menu-classification-list {
	display: inline-block;
}

.menu-classification {
	display: flex;
}

.menu-info-with-btn {
	display: flex;
	align-items: center;
	padding: 10px;

}
.menuName-wrap{
	margin-left: 20px;
	line-height: 23px;
}
.menuName-bigger{
	font-size: 20px;
}
.info-sub-tab-with-btn {
	display: flex;
}
.info-sub-tab{
	margin-top: 50px;
}
.store-description {
	display: flex;
	flex-direction: column;
	line-height: 20px;
}
.introduce-title{
	font-size: 19px;
}

.operating-time {
	display: flex;
	flex-direction: column;
	margin:20px 0;
	line-height: 20px;
}

.seller-info {
	display: flex;
	flex-direction: column;
}
.seller-info-sub{
	line-height: 20px;
}

.seller-name {
	display: flex;
}
.introduce-small-title{
	width: 140px;
}

.store-address {
	display: flex;
}

.seller-regcode {
	display: flex;
}

.store-info-tab, .store-review-tab {
	display: none;
}
.zzim{
border: none;
background-color: white;
display: flex;
position: absolute;
right: 60px;
top: 0px;
}
.zzim img{
width: 20px;
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
		
});

	// 메뉴/정보/리뷰 탭 영역
	
	// 메뉴 탭 영역
	// 메뉴 탭을 클릭하면 메뉴 리스트 조회, 정보와 리뷰 탭 비활
	function sellerMenu(){
		
		$(".menu-sub-tab").show();
		$(".store-info-tab, .store-review-tab").hide();

		$(".menu-tab").css("border-top", "1px solid black").css("border-bottom", "none");
		$(".info-tab").css("border-top", "none").css("border-bottom", "1px solid black");
		$(".review-tab").css("border-top", "none").css("border-bottom", "1px solid black");

		
	}
	
	// 정보 탭 영역
	// 정보 탭을 클릭하면 가게정보 조회, 메뉴와 리뷰 탭 비활
	function storeInfo() {
		
		$(".menu-sub-tab, .store-review-tab").hide();
		$(".store-info-tab").show();

		$(".menu-tab").css("border-top", "none").css("border-bottom", "1px solid black");
		$(".info-tab").css("border-top", "1px solid black").css("border-bottom", "none");
		$(".review-tab").css("border-top", "none").css("border-bottom", "1px solid black");
	}
	
	// 리뷰 탭 영역
	// 리뷰 조회
	function review(storeCode){
		// 리뷰 탭을 클릭하면 리뷰 리스트 조회, 메뉴와 정보 탭 비활
		$(".menu-sub-tab, .store-info-tab").hide();
		$(".store-review-tab").show();
		
		$(".menu-tab").css("border-top", "none").css("border-bottom", "1px solid black");
		$(".info-tab").css("border-top", "none").css("border-bottom", "1px solid black");
		$(".review-tab").css("border-top", "1px solid black").css("border-bottom", "none");
		
		$.ajax({
			type : "GET",
   			url : "${path}/reviewAnswer",
   			success : function(response) {
   				let reviewList = response.readReview;
   				let answerList = response.readAnswer;
   				console.log(res);
   				alert("조회완료");
   			},
   			error : function(e) {
   				console.log(e)
   				alert("error");
   			}
		});
		
	}
	//찜 취소
	function zzimDelete(zzimSCode,zzimUCode) {
		let storeCode = zzimSCode;
	    let userCode = zzimUCode;
  	 	let info = {storeCode : storeCode,
  	 			userCode : userCode}
   		let infos = JSON.stringify(info);
	    $.ajax({
   			type : "DELETE",
   			url : "/baemin/zzimClear",
   			data : infos,
   			contentType : "application/json", // 필수
   			success : function(data) {
   				window.location.reload();
   			},
   			error : function() {
   				alert("잠시후 다시 시도해 주세요.");
   			}
   		})	
	}
	
	//찜 하기
 	function zzimInsert( zzimSCode , zzimUCode) {
 		if(zzimSCode != null){
 			let storeCode = zzimSCode;
 		    let userCode = zzimUCode;
 	  	 	let info = {storeCode : storeCode,
 	  	 			userCode : userCode}
 	   		let infos = JSON.stringify(info);
   		$.ajax({
   			type : "POST",
   			url : "/baemin/zzimInsert",
   			data : infos,
   			contentType : "application/json", // 필수
   			success : function(data) {
   				window.location.reload();
   			},
   			error : function() {
   				alert("잠시후 다시 시도해 주세요.");
   			}
   		})
 		}else{
			alert("로그인 후 가능합니다.");
		}
	}; 
</script>
</head>
<body>
	<jsp:include page="../base/header.jsp" />
	<section id="content">
	<c:set var="storeImage" value="${readStore.storeImage}" />
	<div class="wrap-all">
		<div class="store-image">
			<img alt="가게 로고" src="${path}/storeImages/${storeImage}">
		</div>
		<c:set value="${readStore.storeCode}" var="zzimSCode"/>
		<%Integer zzimUCode = (Integer) session.getAttribute("userCode");
		int ZCheck = (int) session.getAttribute("ZCheck");
		if (ZCheck == 0) {%>
			<button class="zzim" onclick="zzimDelete(${zzimSCode},<%=zzimUCode%>)"><img src="${path}/resources/icons/Heart0.png"></button>
		<%}else{ %>
			<button class="zzim" onclick="zzimInsert(${zzimSCode},<%=zzimUCode%>)"><img src="${path}/resources/icons/Heart1.png"></button>
		<%} %>
		<!-- 아래 div는 추후에 선으로 대체할 예정 -->
		<hr class="line">
		<div class="store-name">${readStore.storeName}</div>
		<div class="rating-review-minprice">
			<div>⭐: ${avgRating}점</div>
			<div>리뷰수: ${RCount}</div>
			<div>최소주문금액: ${readStore.minOrderPrice}원</div>
		</div>
		<ul class="menu-info-review-tab">
			<li class="menu-tab" onclick="sellerMenu()">메뉴</li>
			<li class="info-tab" onclick="storeInfo()">정보</li>
			<li class="review-tab" onclick="review(${readStore.storeCode})">리뷰</li>
		</ul>
		<!-- 메뉴 리스트 나오는 탭 -->
		<div class="menu-sub-tab">
			<div class="click-category">
				<!-- 메뉴 카테고리, 클릭 시 클릭한 카테고리로 -->
				<c:forEach items="${CList}" var="classificationList">
					<a href="#${classificationList.menuClassification}">${classificationList.menuClassification}</a>
				</c:forEach>
			</div>
			<hr class="thin-line">
			<div>
				<!-- 메뉴 리스트 -->
				<c:forEach items="${CList}" var="classificationList">
				<div class="classification">
					<a class="old-menu-classification" name="${classificationList.menuClassification}">${classificationList.menuClassification}</a>
				</div>
				<hr class="thin-line">
					<c:forEach items="${readMenuInfo}" var="menuList">
						<c:if
							test="${menuList.menuClassification eq classificationList.menuClassification}">
							<c:choose>
								<c:when
									test="${menuList.menuClassification eq classificationList.menuClassification}">
									<div class="menu-info-with-btn">
										<a class="menu-img" href="${path}/option?menuCode=${menuList.menuCode}"><img alt="메뉴 사진" src="${path}/images/${readStore.storeImage}"></a>
										<div class="menuName-wrap">
											<div class="menuName menuName-bigger">${menuList.menuName}</div>
											<div class="menuName">${menuList.menuContent}</div>
											<div class="menuName">${menuList.menuPrice}</div>
											<c:choose>
													<c:when test="${menuList.menuStatus eq 1}">(준비중)</c:when>
												</c:choose>
											</span>
										</div>
									</div>
									<hr class="thin-line">
								</c:when>
							</c:choose>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
		<!-- 가게 정보 탭 -->
		<div class="store-info-tab">
			<div class="info-sub-tab-with-btn">
				<div class="info-sub-tab">
					<div class="store-description">
						<div class="introduce-title">가게소개</div>
						<div id="store-description">${readStore.storeDescription}</div>
					</div>
					<div class="operating-time">
						<div class="introduce-title">운영시간</div>
						<div id="operating-time">${readStore.operatingTime}</div>
					</div>
					<div class="seller-info">
						<div class="introduce-title">사업자정보</div>
					
						<table class="seller-info-sub">
							<tr class="seller-name">
								<td class="introduce-small-title">대표자명</td>
								<td>${readSeller.sellerName}</td>
							</tr>
							<tr class="store-address">
								<td class="introduce-small-title">매장주소</td>
								<td>${readStore.storeAddress}</td>
							</tr>
							<tr class="seller-regcode">
								<td class="introduce-small-title">사업자등록번호</td>
								<td>${readSeller.sellerRegCode}</td>
							</tr>
						</table>

					</div>
				</div>
			</div>
		</div>
		<!-- 리뷰 리스트 나오는 탭 -->
		<div class="store-review-tab">
			<c:forEach items="${review}" var="readReview">
				<div class="review-answer">
					<div class="review">
						<div>(닉네임)</div>
						<div>
						<c:set var="reviewRating" value="${reviewList.reviewRating}" />
	
							<p>평점: ${reviewRating} (별 ${fn:substringBefore(reviewRating, '.')}개)</p>
							
							<c:forEach var="star" begin="1" end="${fn:substringBefore(reviewRating, '.')}">
							    ★
							</c:forEach>
							
							<c:forEach var="star" begin="${fn:substringBefore(reviewRating, '.') + 1}" end="5">
							    ☆
							</c:forEach>
						</div>
						<div>주문메뉴 : (메뉴명)</div>
					</div>
					<div class="reviewImage">리뷰사진</div>
					<!-- 답글 -->
					<div>
						<div class = answer>
							<span>사장님</span><br />
							<div>답글 내용</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</section>
	<jsp:include page="../base/footer.jsp" />
</body>
</html>