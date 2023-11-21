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

div {
	border: 1px solid black;
}

span {
	border: 1px solid black;
}
section {
	display: flex;
	flex-direction: column;
	align-items: center;
	flex: 7.8;
	width: 1280px;
	border: 1px solid black;
	padding-top: 5%;
	padding-top: 140px; /* 헤더 높이만큼 padding-top 추가 */
	margin-bottom: 50px; /* 여분의 여백으로 풋터가 바닥에 유지되도록 설정 */
}

section::-webkit-scrollbar { /* 스크롤바 없애기 */
	display: none;
}

button {
	outline: none;
	cursor: pointer; /* 손가락모양 */
}

.menu-info-review-tab {
	display: flex;
}

.store-image {
	width: 15.6%;
	height: 28%;
}

.rating-review-minprice {
	display: flex;
}

.menu-classification-list {
	display: inline-block;
}

.menu-classification {
	display: flex;
}

.menu-info-with-btn {
	display: flex;
}

.info-sub-tab-with-btn {
	display: flex;
}

.store-description {
	display: flex;
}

.operating-time {
	display: flex;
}

.seller-info {
	display: flex;
}

.seller-name {
	display: flex;
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
		
	}
	
	// 정보 탭 영역
	// 정보 탭을 클릭하면 가게정보 조회, 메뉴와 리뷰 탭 비활
	function storeInfo() {
		
		$(".menu-sub-tab, .store-review-tab").hide();
		$(".store-info-tab").show();
		
	}
	
	// 리뷰 탭 영역
	// 리뷰 조회
	function review(storeCode){
		// 리뷰 탭을 클릭하면 리뷰 리스트 조회, 메뉴와 정보 탭 비활
		$(".menu-sub-tab, .store-info-tab").hide();
		$(".store-review-tab").show();
		
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

</script>
</head>
<body>
	<jsp:include page="../base/header.jsp" />
	<section id="content">
	<c:set var="storeImage" value="${readStore.storeImage}" />
		<div class="store-image">
			<img alt="가게 로고" src="${path}/storeImages/${storeImage}">
		</div>
		<!-- 아래 div는 추후에 선으로 대체할 예정 -->
		<div>-------------------------------------------------------------------</div>
		<hr>
		<div class="store-name">${readStore.storeName}</div>
		<div class="rating-review-minprice">
			<div>⭐: ${avgRating}</div>
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
			<div>
				<!-- 메뉴 카테고리, 클릭 시 클릭한 카테고리로 -->
				<c:forEach items="${CList}" var="classificationList">
					<a href="#${classificationList.menuClassification}">${classificationList.menuClassification}</a>
				</c:forEach>
			</div>
			<div>
				<!-- 메뉴 리스트 -->
				<c:forEach items="${CList}" var="classificationList">
				<div class="classification">
					<a class="old-menu-classification" name="${classificationList.menuClassification}">${classificationList.menuClassification}</a>
				</div>
					<c:forEach items="${readMenuInfo}" var="menuList">
						<c:if
							test="${menuList.menuClassification eq classificationList.menuClassification}">
							<c:choose>
								<c:when
									test="${menuList.menuClassification eq classificationList.menuClassification}">
									<div class="menu-info-with-btn">
										<a href="${path}/sellerOption?menuCode=${menuList.menuCode}"><img alt="메뉴 사진" src="${path}/images/${readStore.storeImage}"></a>
										<div>
											<div class="menuName">${menuList.menuName}</div>
											<div class="menuName">${menuList.menuContent}</div>
											<div class="menuName">${menuList.menuPrice}</div>
											<span>상태 : <c:choose>
													<c:when test="${menuList.menuStatus eq 0}">판매중</c:when>
													<c:when test="${menuList.menuStatus eq 1}">매진</c:when>
												</c:choose>
											</span>
										</div>
									</div>
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
						<div>가게소개</div>
						<div id="store-description">${readStore.storeDescription}</div>
					</div>
					<div class="operating-time">
						<div>운영시간</div>
						<div id="operating-time">${readStore.operatingTime}</div>
					</div>
					<div class="seller-info">
						<div>사업자정보</div>
						<div class="seller-info-sub">
							<div class="seller-name">
								<div>대표자명</div>
								<div id="seller-name">${readSeller.sellerName}</div>
							</div>
							<div class="store-address">
								<div>매장주소</div>
								<div id="store-address">${readStore.storeAddress}</div>
							</div>
							<div class="seller-regcode">
								<div>사업자등록번호</div>
								<div id="seller-regcode">${readSeller.sellerRegCode}</div>
							</div>
						</div>
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
	</section>
	<jsp:include page="../base/footer.jsp" />
</body>
</html>