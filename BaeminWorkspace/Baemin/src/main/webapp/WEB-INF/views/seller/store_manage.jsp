<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		padding-top : 5%;
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
	.rating-review-minprice{
		display: flex;
		border: 1px solid black;
	}
	.menu-info-review-tab{
		display: flex;
		border: 1px solid black;
	}
	.tab-sub{
		border: 1px solid black;
	}
	.tab-sub-with-btn{
		display: flex;
		border: 1px solid black;
	}
	.store-description{
		display: flex;
	}
	.operating-time{
		display: flex;
	}
	.seller-info{
		display: flex;
	}
	.seller-name{
		display: flex;
	}
	.store-address{
		display: flex;
	}
	.seller-regcode{
		display: flex;
	}
/* 섹션 */
</style>
<script>
$(document).ready(function() {
	
	let sellerCode = ${param.sellerCode};
	let storeCode = ${param.storeCode};
	
	alert(sellerCode);
	alert(storeCode);
	
    // 메뉴 탭 클릭 시
    // $(".menu-list-tab").click(function() {
    	
    //   // 메뉴 데이터를 AJAX를 통해 가져와서 표시
    //   $.ajax({
    //     url: "${path}/store_manage", // 메뉴 데이터를 가져오는 서버 스크립트 URL로 변경해야 함
    //     method: "GET",
    //     data : "menuCode="+menuCode+"&storeCode="+storeCode,
    //     dataType: "json",
    //     success: function(data) {
    //       // 메뉴 데이터를 업데이트하고 표시
          
    //       // 이 부분에서 메뉴 데이터를 사용하여 메뉴 리스트를 구성
    //     },
    //     error: function(xhr, status, error) {
    //       // 오류 처리
    //       console.error("Error: " + error);
    //     }
    //   });
    // });

    // 정보 탭 클릭 시
    $(".store-info-tab").click(function() {
      // 정보 데이터를 AJAX를 통해 가져와서 표시
      $.ajax({
   	  	url: "${path}/store_manage", // 메뉴 데이터를 가져오는 서버 스크립트 URL로 변경해야 함
        method: "GET",
        data : "sellerCode="+sellerCode+"&storeCode="+storeCode,
        dataType: "json",
        success: function(data) {
          // 정보 데이터를 업데이트하고 표시
        	$(".tab-sub-with-btn").empty(); // 이전 내용 삭제
            $(".tab-sub-with-btn").append(`
            		<div class="tab-sub">
        			<div class="store-description">
        				<div>가게소개</div><div>${readtStoreDTA.storeDescription}</div>
        			</div>
        			<div class="operating-time">
        				<div>운영시간</div><div>${readtStoreDTA.operatingTime}</div>
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
        		</div>
        		<div class="modify-btn">수정하기</div>
            `);
          },
		  error: function(){
				 			alert( "연결은 되지만 로드 실패");
				 		}
      });
    });

    // 리뷰 탭 클릭 시
    // $(".store-review-tab").click(function() {
    //   // 리뷰 데이터를 AJAX를 통해 가져와서 표시
    //   $.ajax({
   	//   	url: "${path}/store_manage", // 메뉴 데이터를 가져오는 서버 스크립트 URL로 변경해야 함
    //     method: "GET",
	// 	// data : 닉네임, 메뉴명, 리뷰내용, 리뷰사진, (사장님 답글)
    //     dataType: "json",
    //     success: function(data) {
    //       // 리뷰 데이터를 업데이트하고 표시
    //       // 이 부분에서 리뷰 데이터를 사용하여 리뷰 탭의 내용을 업데이트
    //     },
    //     error: function(xhr, status, error) {
    //       // 오류 처리
    //       console.error("Error: " + error);
    //     }
    //   });
    // });
  });
  </script>
</head>
<body>
	<jsp:include page="../base/header.jsp" />
	<section>
	<div class="store-image">
		매장 대표 사진
	</div>
	<!-- 아래 div는 추후에 선으로 대체할 예정 -->
	<div>-------------------------------------------------------------------</div>
	<div class="store-name">${readStoreNmRtRcMp.storeName}</div>
	<div class="rating-review-minprice">
		<div>⭐: ${readStoreNmRtRcMp.storeRating}</div>
		<div>리뷰수: ${readStoreNmRtRcMp.reviewCount}</div>
		<div>최소주문금액: ${readStoreNmRtRcMp.minOrderPrice}</div>
	</div>
	<div class="menu-info-review-tab">
		<div class="menu-list-tab">메뉴</div>
		<div class="store-info-tab">정보</div>
		<div class="store-review-tab">리뷰</div>
	</div>
	<div class="tab-sub-with-btn">
		
		<div class="modify-btn">수정하기</div>
	</div>
	</section>
	<jsp:include page="../base/footer.jsp" />
</body>
</html>