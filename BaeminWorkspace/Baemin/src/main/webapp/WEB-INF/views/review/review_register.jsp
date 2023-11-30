<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

a {
	text-decoration: none;
}

section {
	flex: 7.8;
}

}
body {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100vh;
}

.review-title {
	width: 1280px;
	border-bottom: 1px solid #d9d9d9;
	margin: 0 auto;
	margin-left: 100px;
	margin-right: 100px;
}

.order-date-state {
	margin-left: 100px;
	margin-right: 100px;
	display: flex;
}

.order-date {
	margin-right: 10px;
}

.order-info-wrap {
	display: flex;
	margin-left: 100px;
	margin-right: 100px;
	border-bottom: 1px #d9d9d9 solid;
}

.order-info-image {
	width: 100px;
}

.order-detail-wrap {
	margin: auto 0;
	margin-left: 10px;
	margin-right: 10px;
}

.review-input-box-wrap {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
}

.review-content-wrap {
	margin-top: 20px;
	border: 2px solid #48D1CC;
	border-radius: 5px;
	margin-bottom: 20px;
	font-size: 17px;
	border: 2px solid #48D1CC;
}

.review-input-box {
	width: 500px;
	height: 200px;
	border: none;
}

.test {
	display: flex;
	align-items: center;
}

.review-file {
	width: 100%;
	border: 2px solid #d9d9d9;
	border-radius: 5px;
	margin-bottom: 20px;
}

.review-rating-wrap {
	display: flex;
	flex-direction: column;
	text-align: center;
}

.review-rating-wrap {
	align-items: center;
}

.review-rating {
	margin: 0 auto;
}

.review-register-btn {
	margin: 0 auto;
	width: 100px;
}

.star_rating {
	box-sizing: border-box;
	display: inline-flex;
	flex-direction: row;
	justify-content: flex-start;
}

.star_rating .star {
	width: 25px;
	height: 25px;
	margin-right: 10px;
	display: inline-block;
	background:
		url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FE2bww%2FbtsviSSBz4Q%2F5UYnwSWgTlFt6CEFZ1L3Q0%2Fimg.png')
		no-repeat;
	background-size: 100%;
	box-sizing: border-box;
}

.star_rating .star.on {
	width: 25px;
	height: 25px;
	margin-right: 10px;
	display: inline-block;
	background:
		url('https://blog.kakaocdn.net/dn/b2d6gV/btsvbDoal87/XH5b17uLeEJcBP3RV3FyDk/img.png')
		no-repeat;
	background-size: 100%;
	box-sizing: border-box;
}

.review-rating-title {
	margin-bottom: 20px;
}

.review-register-btn-wrap {
	margin-top: 20px;
}

.review-register-btn {
	
}
input{
	font-family: '';
}

textarea {
	width: 100%;
	height: 200px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 2px #1E90FF;
	border-radius: 5px;
	font-size: 16px;
	resize: both;
	outline: none;
    resize: none;
}




</style>

<script>
	
</script>

<body>

<c:set var="path" value="<%=request.getContextPath()%>"></c:set>

	<jsp:include page="../base/header.jsp" />


	<section id="content">

		<div class="review-title">
			<div class="review-title-inner">
				<h1>리뷰쓰기</h1>
			</div>
		</div>

		<div class="order-date-state">
			<div class="order-date">${orderDate}</div>
			<div class="order-state">${orderStatus}</div>
		</div>

		<div class="order-info-wrap">
			<div class="order-info-image">
				<img class="order-info-image" src="${path}/images/${orderStoreImage}">
			</div>
			<div class="order-detail-wrap">
				<div class="order-store-name">${orderStoreName}</div>
				<div class="order-info-detail">${orderMenuName} ${orderMenuPrice}원</div>
			</div>
		</div>

		<div class="review-input-file-wrap">
			<form enctype="multipart/form-data" method="POST"
				action="/baemin/submitReview">
				<div class="review-input-box-wrap">
					<div class="review-content-wrap">
						<textarea name="reviewContent" class="review-input-box"
							placeholder="리뷰를 입력하세요"></textarea>
					</div>
					<div class="test">
						<input type="file" name="reviewImage" class="review-file">
					</div>
				</div>
				<div class="review-rating-wrap">

					<div class="review-rating-title">음식은 어떠셨어요?</div>

					<div class="star_rating">
						<span class="star" data-value="1"> </span> <span class="star"
							data-value="2"> </span> <span class="star" data-value="3">
						</span> <span class="star" data-value="4"> </span> <span class="star"
							data-value="5"> </span>
					</div>
					<input type="hidden" name="reviewRating" id="rating" value="0">
					<input type="hidden" name="reviewDate" id="reviewDate" value="0">
					<div class="review-register-btn-wrap">
						<button type="submit" class="review-register-btn"
							onclick="writeReview()">리뷰 등록</button>

					</div>
				</div>
			</form>
		</div>


	</section>
	<jsp:include page="../base/footer.jsp" />


	<script>
		$(document).ready(function() {
			$('.star_rating > .star').click(function() {
				var rating = $(this).data('value');
				$('#rating').val(rating);
				$(this).parent().children('span').removeClass('on');
				$(this).addClass('on').prevAll('span').addClass('on');
			});
		});
	</script>

</body>
</html>