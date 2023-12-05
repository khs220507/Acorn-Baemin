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
	padding-bottom: 50px; /* 여분의 여백으로 풋터가 바닥에 유지되도록 설정 */
}
button {
	outline: none;
	cursor: pointer; /* 손가락모양 */
}
.wrap-all {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 75%;
	position: relative;
}
.line {
	background-color: #d9d9d9;
	height: 2px;
	border: 0px;
	width: 100%;
}
.thin-line {
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
.menu-info-review-tab li {
	width: 34%;
	text-align: center;
	padding: 5px 0;
}
.menu-tab {
	border-top: 2px solid black;
	background-color: rgb(244,243,243);
}
.info-tab {
	border-bottom: 2px solid black;
}
.review-tab {
	border-bottom: 2px solid black;
}
.menu-sub-tab {
	width: 80%;
}
.click-category {
	display: flex;
	justify-content: space-around;
	padding: 5px 0;
}
.classification {
	padding: 5px 10px;
}

.old-menu-classification {
	font-size: 20px;
}
.store-image img {
	width: 250px;
	height: 250px;
	margin: 10px;
}
.store-name {
	font-size: 27px;
	margin: 15px;
}
.rating-review-minprice {
	display: flex;
	align-items: end;
	justify-content: space-between;
	width: 33%;
}
.menu-img img {
	width: 100px;
	height: 100px;
}
.menu-img{
	position: relative;
}
.ready-msg{
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.521);
	position: absolute;
	top: 0;
	left: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}
.ready-msg p{
	color: white;
	font-size: 20px;
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
.menuName-wrap {
	margin-left: 20px;
	line-height: 23px;
}
.menuName-bigger {
	font-size: 20px;
}
.info-sub-tab {
	margin-top: 50px;
	margin-bottom: 25px;
}
.store-description {
	display: flex;
	flex-direction: column;
	line-height: 20px;
}
.introduce-title {
	font-size: 19px;
}
.operating-time {
	display: flex;
	flex-direction: column;
	margin: 20px 0;
	line-height: 20px;
}
.seller-info {
	display: flex;
	flex-direction: column;
}
.seller-info-sub {
	line-height: 20px;
}
.seller-name {
	display: flex;
}
.introduce-small-title {
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
.store-info-tab{
	width: 40%;
	margin-bottom: 40p
	x;
}
.zzim {
	border: none;
	background-color: white;
	display: flex;
	position: absolute;
	right: 60px;
	top: 0px;
}
.zzim img {
	width: 20px;
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
	margin-top: 5px;
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=882eaf7bb4b6e556ac95cc08a1a01c24&libraries=services"></script>
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

		$(".menu-tab").css("border-top", "2px solid black").css("border-bottom", "none").css("background-color", "rgb(244,243,243)");
		$(".info-tab").css("border-top", "none").css("border-bottom", "2px solid black").css("background-color", "white");;
		$(".review-tab").css("border-top", "none").css("border-bottom", "2px solid black").css("background-color", "white");;
	}
	
	// 정보 탭 영역
	// 정보 탭을 클릭하면 가게정보 조회, 메뉴와 리뷰 탭 비활
	function storeInfo() {
		
		$(".menu-sub-tab, .store-review-tab").hide();
		$(".store-info-tab").show();
		
		$(".menu-tab").css("border-top", "none").css("border-bottom", "2px solid black").css("background-color", "white");
		$(".info-tab").css("border-top", "2px solid black").css("border-bottom", "none").css("background-color", "rgb(244,243,243)");
		$(".review-tab").css("border-top", "none").css("border-bottom", "2px solid black").css("background-color", "white");

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 1 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${readStore.storeAddress}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${readStore.storeName}</div>'
	        });
	        infowindow.open(map, marker);
	        
			map.realyout();
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
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
   			url : "${path}/zzimClear",
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
   			url : "${path}/zzimInsert",
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
			<c:set value="${readStore.storeCode}" var="zzimSCode" />
			<%
			Integer zzimUCode = (Integer) session.getAttribute("userCode");
			int ZCheck = (int) session.getAttribute("ZCheck");
			if (ZCheck == 0) {
			%>
			<button class="zzim"
				onclick="zzimDelete(${zzimSCode},<%=zzimUCode%>)">
				<img src="${path}/resources/icons/Heart0.png">
			</button>
			<%
			} else {
			%>
			<button class="zzim"
				onclick="zzimInsert(${zzimSCode},<%=zzimUCode%>)">
				<img src="${path}/resources/icons/Heart1.png">
			</button>
			<%
			}
			%>
			<hr class="line">
			<div class="store-name">${readStore.storeName}</div>
			<div class="rating-review-minprice">
				<div>⭐: ${readStore.storeRating}점</div>
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
						<a class="menuC" href="#${classificationList.menuClassification}">${classificationList.menuClassification}</a>
					</c:forEach>
				</div>
				<hr class="thin-line">
				<div>
					<!-- 메뉴 리스트 -->
					<c:forEach items="${CList}" var="classificationList">
						<div class="classification">
							<a class="old-menu-classification"
								name="${classificationList.menuClassification}">${classificationList.menuClassification}</a>
						</div>
						<hr class="thin-line">
						<c:forEach items="${readMenuInfo}" var="menuList">
							<c:if
								test="${menuList.menuClassification eq classificationList.menuClassification}">
								<c:choose>
									<c:when
										test="${menuList.menuClassification eq classificationList.menuClassification}">
										<div class="menu-info-with-btn">

											<c:choose>
												<c:when test="${menuList.menuStatus eq 1}">
												<!-- 영업준비중일때 -->
													<a class="menu-img"><img alt="메뉴 사진" src="${path}/images/${menuList.menuImage}">
													<div class="ready-msg">
														<p>준비중</p>
													</div>
													</a>
													<div class="menuName-wrap">
														<div class="menuName menuName-bigger">${menuList.menuName}</div>
															<div class="menuName">${menuList.menuContent}</div>
															<div class="menuName">${menuList.menuPrice}원</div>
													</div>
												</c:when>

												<c:when test="${menuList.menuStatus eq 0}">
													<!-- 영업중일때 -->
													<a class="menu-img"
													href="${path}/option?menuCode=${menuList.menuCode}"><img
													alt="메뉴 사진" src="${path}/images/${menuList.menuImage}"></a>

													<div class="menuName-wrap">
														<a class="menu-img"
															href="${path}/option?menuCode=${menuList.menuCode}"><div class="menuName menuName-bigger">${menuList.menuName}</div></a>
															<a class="menu-img"
															href="${path}/option?menuCode=${menuList.menuCode}"><div class="menuName">${menuList.menuContent}</div></a>
															<a class="menu-img"
															href="${path}/option?menuCode=${menuList.menuCode}"><div class="menuName">${menuList.menuPrice}원</div></a>
													</div>
												</c:when>
											</c:choose>	
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
									<td>${readStore.storeAddress}, ${readStore.storeAddressDetail}</td>
								</tr>
								<tr class="seller-regcode">
									<td class="introduce-small-title">사업자등록번호</td>
									<td>${readSeller.sellerRegCode}</td>
								</tr>
							</table>
						</div>
					</div>
						<!-- 카카오api를 이용하여 가게 주소를 기반으로 지도에 좌표찍기 -->
						<div id="map" style="width: 100%; height: 350px;"></div>
			</div>
			<!-- 리뷰 리스트 나오는 탭 -->
			<div class="store-review-tab">

				<c:forEach var="item" items="${RList}">
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
						<div>item.reviewImageName</div>
							<img class="review-image"
								src="$/baemin/reviewImages/${item.reviewImageName}"
								alt="Review Image">
						</c:if>
						<c:if test="${not empty item.answerContent}">
						<div>사장님</div>
						<div>${item.answerContent}</div>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<jsp:include page="../base/footer.jsp" />
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
