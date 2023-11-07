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
	justify-content: center;
	height: 100vh;
	width: 100vw;
}

ul {
	list-style: none;
}

.menu-info-review-tab {
	display: flex;
}

div {
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
}

button {
	outline: none;
	cursor: pointer; /* 손가락모양 */
}

.store-image {
	width: 15.6%;
	height: 28%;
	border: 1px solid black;
}

.rating-review-minprice {
	display: flex;
	border: 1px solid black;
}

.menu-sub-tab {
	border: 1px solid black;
}

.menu-classification-list {
	display: flex;
	border: 1px solid black;
}

.menu-classification {
	display: flex;
	border: 1px solid black;
}

.menu-info-with-btn {
	display: flex;
	border: 1px solid black;
}

.modify-delete {
	display: flex;
	border: 1px solid black;
}

.info-sub-tab-with-btn {
	display: flex;
	border: 1px solid black;
}

.info-sub-tab {
	border: 1px solid black;
}

.modify-btn {
	border: 1px solid black;
}

.store-description {
	display: flex;
	border: 1px solid black;
}

.operating-time {
	display: flex;
	border: 1px solid black;
}

.seller-info {
	display: flex;
	border: 1px solid black;
}

.seller-info-sub {
	border: 1px solid black;
}

.seller-name {
	display: flex;
	border: 1px solid black;
}

.store-address {
	display: flex;
	border: 1px solid black;
}

.seller-regcode {
	display: flex;
	border: 1px solid black;
}
.store-info-tab, .store-review-tab{
	display: none;
}
</style>
<script>
    $(document).ready(function() {
    	 //	let originalData;
    	 	$(".menu-tab").click(function() {
    			$(".menu-sub-tab").css("display","block");
    			$(".store-info-tab").css("display","none");
    			$(".store-review-tab").css("display","none");
			})
            $(".info-tab").click(function(){
    			$(".menu-sub-tab").css("display","none");
    			$(".store-info-tab").css("display","block");
    			$(".store-review-tab").css("display","none");
			})
            $(".review-tab").click(function(){
    			$(".menu-sub-tab").css("display","none");
    			$(".store-info-tab").css("display","none");
    			$(".store-review-tab").css("display","block");
            });
    	 	 $(".add-menu").click(function() {
    	 		$(".menu-form").css("display","block");
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
		<div class="store-name">${readStoreNmRtRcMp.storeName}</div>
		<div class="rating-review-minprice">
			<div>⭐: ${readStoreNmRtRcMp.storeRating}</div>
			<div>리뷰수: ${readStoreNmRtRcMp.reviewCount}</div>
			<div>최소주문금액: ${readStoreNmRtRcMp.minOrderPrice}</div>
		</div>
			<ul class="menu-info-review-tab">
				<li class="menu-tab">메뉴</li>
				<li class="info-tab">정보</li>
				<li class="review-tab">리뷰</li>
			</ul>
			<!-- 메뉴 리스트 나오는 탭 -->
				<div class="menu-sub-tab">
					<c:forEach items="${readMenuInfo}" var="list">
						<div class="menu-classification-list">
							<div>메인</div>
							<div>세트</div>
							<div>사이드</div>
							<div>음료</div>
						</div>
						
						<div class="menu-classification">
							<div>메인</div>
							<div>수정하기</div>
						</div>
						<div class="menu-info-with-btn">
							<div>${list.menuImage}</div>
							<div>
								<div>${list.menuName}</div>
								<div>${list.menuContent}</div>
								<div>${list.menuPrice}</div>
							</div>
							<div class="modify-delete">
								<div>수정</div>
								<div>삭제</div>
							</div>
						</div>
					</c:forEach>
					<form class="menu-form" style="display: none;">
					    <div class="menu-classification">
							<input type="text" placeholder="${list.menuClassification}">
							<button>등록하기</button>
					    </div>
					    <div class="menu-info-with-btn">
					        <input type="file" name="menu_img_upload">
					        <div>
								<input type="text" name="menu-name-input" placeholder="메뉴명"><br/>
								<input type="text" name="menu-content-input" placeholder="메뉴설명"><br/>
								<input type="number" name="meni-price-input" placeholder="메뉴가격">
					        </div>
					    </div>
					    <button>등록하기</button>
					</form>
					<div class="add-menu">+</div>
				</div>
				<!-- 가게 정보 나오는 탭 -->
				<div class="store-info-tab">
						<div class="info-sub-tab-with-btn">
							<div class="info-sub-tab">
								<div class="store-description">
									<div>가게소개</div><div>${readtStoreDTA.storeDescription}</div>
								</div>
								<div class="operating-time">
									<div>운영시간</div>
									<div>${readtStoreDTA.operatingTime}</div>
								</div>
								<div class="seller-info">
									<div>사업자정보</div>
									<div class="seller-info-sub">
										<div class="seller-name">
											<div>대표자명</div><div>${readSellerNmRn.sellerName}</div>
										</div>
										<div class="store-address">
											<div>매장주소</div><div>${readtStoreDTA.storeAddress}</div>
										</div>
										<div class="seller-regcode">
											<div>사업자등록번호</div><div>${readSellerNmRn.sellerRegCode}</div>
										</div>
									</div>
								</div>
							<div class="modify-btn">수정하기</div>
						</div>
					</div>
				</div>	
				<!-- 리뷰 리스트 나오는 탭 -->
				<div class="store-review-tab">
					<div class="review-answer">
						<div>(닉네임)</div><div>(별점)</div>
						<div>주문메뉴 : (메뉴명)</div>
						<div>(리뷰내용)</div>
						<!-- 답글 달기를 누르면 리뷰내용을 입력하는 input text 화면이 뜨도록 -->
						<div></div>
						<!-- 답글이 생기면 답글달기 버튼 사라지고 수정 삭제 버튼 생성-->
						<div>답글달기</div>
					</div>
				</div>
	</section>
	<jsp:include page="../base/footer.jsp" />
</body>
</html>