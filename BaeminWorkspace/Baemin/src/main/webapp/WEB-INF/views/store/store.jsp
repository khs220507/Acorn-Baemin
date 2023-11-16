<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		// 메뉴/정보/리뷰 탭 영역
		// 메뉴 탭을 클릭하면 보여지고 정보와 리뷰 탭은 감추는 코드
		$(".menu-tab").click(function() {
			$(".menu-sub-tab").show();
			$(".store-info-tab").hide();
			$(".store-review-tab").hide();
		})
		// 정보 탭을 클릭하면 보여지고 메뉴와 리뷰 탭은 감추는 코드
		$(".info-tab").click(function() {
			$(".menu-sub-tab").hide();
			$(".store-info-tab").show();
			$(".store-review-tab").hide();
		})
		// 리뷰 탭을 클릭하면 보여지고 메뉴와 정보 탭은 감추는 코드
		$(".review-tab").click(function() {
			$(".menu-sub-tab").hide();
			$(".store-info-tab").hide();
			$(".store-review-tab").show();
		});
		
});

</script>
</head>
<body>
	<jsp:include page="../base/header.jsp" />
	<section>
		<div class="store-image">매장 대표 사진</div>
		<!-- 아래 div는 추후에 선으로 대체할 예정 -->
		<div>-------------------------------------------------------------------</div>
		<div class="store-name">${readStore.storeName}</div>
		<div class="rating-review-minprice">
		<!-- 평점을 가져오면서 평균내야함 -->
			<div>⭐: ${readStore.storeRating}</div>
			<!-- 매장코드에 맞는 리뷰 전체를 카운트해서 가져와야함 -->
			<div>리뷰수: ${readStore.reviewCount}</div>
			<div>최소주문금액: ${readStore.minOrderPrice}</div>
		</div>
		<ul class="menu-info-review-tab">
			<li class="menu-tab">메뉴</li>
			<li class="info-tab">정보</li>
			<li class="review-tab">리뷰</li>
		</ul>
		<!-- 메뉴 리스트 나오는 탭 -->
		<div class="menu-sub-tab">
			<div>	<!-- 메뉴 카테고리 -->
				<c:forEach items="${CList}" var="classificationList">
					<span>${classificationList.menuClassification}</span>
				</c:forEach>
			</div>
			<div>	<!-- 메뉴 리스트 -->
				<c:forEach items="${CList}" var="classificationList">
					<div class="menu-classification-list">
						${classificationList.menuClassification}</div>
					<c:forEach items="${readMenuInfo}" var="menuList">
						<c:if
							test="${menuList.menuClassification eq classificationList.menuClassification}">
							<c:choose>
								<c:when
									test="${menuList.menuClassification eq classificationList.menuClassification}">
									<div class="menu-info-with-btn">
										<!-- 메뉴 사진을 클릭하면 옵션을 선택하는 페이지로?-->
										<a href="${path}/option?menuCode=${menuList.menuCode}">${menuList.menuImage}</a>
										<div>
											<div class="menuName">${menuList.menuName}</div>
											<div class="menuName">${menuList.menuContent}</div>
											<div class="menuName">${menuList.menuPrice}</div>
											<span>상태 :
											    <c:choose>
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
						<div class="store-introduce">${readStore.storeDescription}</div>
					</div>
					<div class="operating-time">
						<div>운영시간</div>
						<div class="store-operate-time">${readStore.operatingTime}</div>
					</div>
					<div class="seller-info">
						<div>사업자정보</div>
						<div class="seller-info-sub">
							<div class="seller-name">
								<div>대표자명</div>
								<div>${readSeller.sellerName}</div>
							</div>
							<div class="store-address">
								<div>매장주소</div>
								<div>${readStore.storeAddress}</div>
							</div>
							<div class="seller-regcode">
								<div>사업자등록번호</div>
								<div>${readSeller.sellerRegCode}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 리뷰 리스트 나오는 탭 -->
		<div class="store-review-tab">
			<c:forEach items="${reviewList}" var="review-list">
				<div class="review-answer">
					<div>
						${review-list.reviewRating}
					</div>
						주문내역에서 가져오기
					<div>주문메뉴 : (메뉴명)</div>
					<div>
						${review-list.reviewContent}
						<div>리뷰등록날짜</div>
					</div>
					<div>
						<div>
							<textarea></textarea>
						</div>
						<button>등록하기</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
	<jsp:include page="../base/footer.jsp" />
</body>
</html>