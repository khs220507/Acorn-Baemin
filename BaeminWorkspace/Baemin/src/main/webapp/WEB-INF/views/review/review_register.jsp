<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	justify-content: center;
}

.review-input-box {
	margin: 20px 0px 20px 0px;
	width: 400px;
	height: 200px;
}

.review-rating-wrap {
	display: flex;
	flex-direction: column;
}

.review-rating-wrap {
display: flex;

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
  background: url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FE2bww%2FbtsviSSBz4Q%2F5UYnwSWgTlFt6CEFZ1L3Q0%2Fimg.png') no-repeat; 
  background-size: 100%; 
  box-sizing: border-box; 
}
.star_rating .star.on {
  width: 25px; 
  height: 25px;
  margin-right: 10px;
  display: inline-block; 
  background: url('https://blog.kakaocdn.net/dn/b2d6gV/btsvbDoal87/XH5b17uLeEJcBP3RV3FyDk/img.png') no-repeat;
  background-size: 100%; 
  box-sizing: border-box; 
}



</style>



<body>



	<jsp:include page="../base/header.jsp" />

	<section>

		<div class="review-title">
			<div class="review-title-inner">
				<h1>리뷰쓰기</h1>
			</div>
		</div>

		<div class="order-date-state">
			<div class="order-date">10.19(목)</div>
			<div class="order-state">픽업완료</div>
		</div>

		<div class="order-info-wrap">
			<div class="order-info-image">
				<img class="order-info-image" src="resources/images/food.png">
			</div>
			<div class="order-detail-wrap">
				<div class="order-store-name">BBQ 홍대점</div>
				<div class="order-info-detail">황올 반+양념 반 외 2개 35,900원</div>
			</div>
		</div>

		<div class="review-input-box-wrap">
			<form action="/baemin/submitReview" method="post">
            <textarea name="reviewText" class="review-input-box" placeholder="리뷰를 입력하세요"></textarea>
            <div class="review-rating-wrap">
                <div class="review-rating-title">음식은 어떠셨어요?</div>
                <div class="star_rating">
                    <span class="star" value="1"> </span>
                    <span class="star" value="2"> </span>
                    <span class="star" value="3"> </span>
                    <span class="star" value="4"> </span>
                    <span class="star" value="5"> </span>
                </div>
                <input type="hidden" name="rating" id="rating" value="0">
                <button type="submit" class="review-register-btn">리뷰 등록</button>
            </div>
        </form>
</div>


	</section>
	<jsp:include page="../base/footer.jsp" />
	
	
	<script>
    $(document).ready(function() {
        $('.star_rating > .star').click(function() {
            var rating = $(this).attr('value');
            $('#rating').val(rating);
            $(this).parent().children('span').removeClass('on');
            $(this).addClass('on').prevAll('span').addClass('on');
        });
    });
</script>

</body>
</html>