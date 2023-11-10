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
	overflow-y: auto; /*섹션의 내용이 넘치는 경우 스크롤이 가능*/
	-ms-overflow-style: none; /* 스크롤바 없애기 */
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

.modify-delete {
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
	
		// 메뉴 탭 영역
		// + 버튼을 클릭하면 메뉴정보 입력 폼 활성화
		$(".add-menu").click(function() {
			$(".menu-form").show();
			$(".cancel-btn").show();
		});
		
		// 메뉴 등록
		$(".insert-menu-btn").click(function() {
			let formData = new FormData(document.querySelector(".menu-form"));
			console.log(formData);
			$.ajax({
				type : "post",
				url : "${path}/store_manage",
				enctype : 'multipart/form-data',
				data : formData,
				processData : false, // 데이터 처리를 비활성화
				contentType : false, // 컨텐츠 타입을 비활성화
				success : function(data) {
					window.location.reload();
				},
				error : function() {
					alert("연결은 됐는데 실패");
				}
			});
		});
		
		// 취소 버튼을 클릭시 전영역에 걸쳐서 활성/비활성화
		$(".cancel-btn").click(function() {
			$(".menu-form").hide();	// 입력 form 비활
			$(".reply-form").hide();	// 답변 form 비활
			$(".active-reply-form-btn").show();	// 답글 달기 활성화
			$(this).hide();
		});
		
		
		// 정보 탭 영역
		// 수정
		function modifyStoreInfo(sellerCode, storeCode){
        $.ajax({
            url: "{path}/store_manage/{sellerCode},{storeCode}",
            method: 'get',
            success: function(data) {
            	console.log(data);
                // AJAX 요청이 성공하면 데이터를 가져와서 input 태그에 적절히 설정합니다.
                $("input[name='storeDescription']").val(data.storeDescription);
                $("input[name='operatingTime']").val(data.operatingTime);
                $("input[name='sellerName']").val(data.sellerName);
                $("input[name='storeAddress']").val(data.storeAddress);
                $("input[name='sellerRegCode']").val(data.sellerRegCode);
            },
            error: function() {
                alert("fail");
	            }
	        });
			
		}
		
		// 리뷰 탭 영역
		// 답글달기 버튼을 클릭하면 메뉴정보 입력 폼 활성화
		$(".active-reply-form-btn").click(function() {
			$(".reply-form").show();
			$(this).hide();
			$(".cancel-btn").show();
		});
		
});

	// 메뉴 수정
	function menuModifyBtnWithoutC(Code, element){
		
		let menuCode = Code;
		let menuName = $(element).closest('.menu-info-with-btn').find('.menuName').val();
		let menuImage = $(element).closest('.menu-info-with-btn').find('.menuImage').val();
	    let menuContent = $(element).closest('.menu-info-with-btn').find('.menuContent').val();
	    let menuPrice = $(element).closest('.menu-info-with-btn').find('.menuPrice').val();
	    let menuStatus = $(element).closest('.menu-info-with-btn').find('.menuStatus').val();
	    
	    let info = {
		    	menuCode : menuCode,
		    	menuName : menuName,
		    	menuImage : menuImage,
		    	menuContent : menuContent,
		    	menuPrice : menuPrice,
		    	menuStatus : menuStatus
	    	}
	    
	    alert(info);
	    console.log(info);
	    
   		let infos = JSON.stringify(info);
       	
   		$.ajax({
   			type : "Put",
   			url : "/baemin/store_manage",
   			data : infos,
   			contentType : "application/json", // 필수
   			success : function(data) {
   				alert("변경되었습니다");
   				window.location.reload();
   			},
   			error : function() {
   				alert("error");
   			}
   		})
	};
	
	// 메뉴 삭제
	function deleteMenu(menuCode) {
		$.ajax({
			type: "DELETE",
			url: "${path}/store_manage/"+menuCode, //path Variable  ,
			success : function (data){
				window.location.reload();
			},
			error : function() {
				alert("error");
			}
		});
	}
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
			<div>⭐: ${readStore.storeRating}</div>
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
										<a href="${path}/sellerOption?menuCode=${menuList.menuCode}"><div>${menuList.menuImage}</div></a>
										<input type="file" name="menuImageFile">
										<div>
											<input type="text" class="menuName" value="${menuList.menuName}">
											<input type="text" class="menuContent" value="${menuList.menuContent}">
											<input type="text" class="menuPrice" value="${menuList.menuPrice}">
											<span>상태 :
											    <c:choose>
											        <c:when test="${menuList.menuStatus eq 0}">판매중</c:when>
											        <c:when test="${menuList.menuStatus eq 1}">매진</c:when>
											    </c:choose>
											</span>
											<select class="menuStatus">
												<option value="0">판매중</option>
												<option value="1">솔드아웃</option>
											</select>
										</div>
										<div class="modify-delete">
											<button class="menu-modify-btn-without-c"
												onclick="menuModifyBtnWithoutC(${menuList.menuCode}, this)">수정</button>
											<button class="menu-delete-btn"
												onclick="deleteMenu(${menuList.menuCode})">삭제</button>
										</div>
									</div>
								</c:when>
							</c:choose>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
			<!-- 메뉴 등록 폼 -->
			<form class="menu-form" style="display: none;">
				<div class="menu-classification">
					<input type="text" name="menuClassification" placeholder="메뉴분류">
				</div>
				<div class="menu-info-with-btn">
					<input type="file" name="menuImageFile">
					<div>
						<input type="text" name="menuName" placeholder="메뉴명"><br />
						<input type="text" name="menuContent" placeholder="메뉴설명"><br />
						<input type="number" name="menuPrice" placeholder="메뉴가격">
						<select name="menuStatus">
							<option value="0">판매중</option>
							<option value="1">솔드아웃</option>
						</select>
					</div>
				</div>
				<button type="button" class="insert-menu-btn">등록하기</button>
				<button type="button" class="cancel-btn">취소하기</button>
			</form>
			<!-- 얘를 클릭하면 등록 폼이 활성화 -->
			<div class="add-menu">+</div>
		</div>
		<!-- 가게 정보 탭 -->
		<div class="store-info-tab">
			<div class="info-sub-tab-with-btn">
				<div class="info-sub-tab">
					<div class="store-description">
						<div>가게소개</div>
						<input type="text" class="store-introduce" value="${readStore.storeDescription}">
					</div>
					<div class="operating-time">
						<div>운영시간</div>
						<input type="text" class="store-operate-time" value="${readStore.operatingTime}">
					</div>
					<div class="seller-info">
						<div>사업자정보</div>
						<div class="seller-info-sub">
							<div class="seller-name">
								<div>대표자명</div>
								<input type="text" value="${readSeller.sellerName}">
							</div>
							<div class="store-address">
								<div>매장주소</div>
								<input type="text" value="${readStore.storeAddress}">
							</div>
							<div class="seller-regcode">
								<div>사업자등록번호</div>
								<input type="text" value="${readSeller.sellerRegCode}">
							</div>
						</div>
					</div>
				</div>
				<button class="store-info-modify-btn"
					onclick="modifyStoreInfo(${readSeller.sellerCode}, ${readStore.storeCode})">수정하기</button>
			</div>
		</div>
		<!-- 리뷰 리스트 나오는 탭 -->
		<div class="store-review-tab">
			<!--<c:forEach items="${reviewList}" var="review-list">
			</c:forEach> -->
			<div class="review-answer">
				<div>(닉네임)</div>
				<div>
					<!-- ${review-list.reviewRating} -->
				</div>
				<div>주문메뉴 : (메뉴명)</div>
				<div>
					<!-- ${review-list.reviewContent} -->
					<div>리뷰등록날짜</div>
					<!-- 답글 달기를 누르면 답변내용을 입력하는 폼 활성화 -->
					<form class="reply-form" style="display: none;">
						<textarea placeholder="답글 내용을 입력해주세요" rows="5" cols="30"></textarea>
						<button type="button" class="insert-answer-btn">등록</button>
					</form>
				</div>
				<button class="active-reply-form-btn">답글달기</button>
				<!-- 답글이 생기면 답글달기 버튼 사라지고 수정 삭제 버튼 생성-->
				<button class="reply-modify-btn" style="display: none">수정</button>
				<button class="reply-delete-btn" style="display: none">삭제</button>
				<button class="cancel-btn" style="display: none">취소</button>
			</div>
		</div>
	</section>
	<jsp:include page="../base/footer.jsp" />
</body>
</html>