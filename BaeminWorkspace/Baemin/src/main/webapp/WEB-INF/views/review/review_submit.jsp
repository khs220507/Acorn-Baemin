<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 제출 결과</title>
    <script src="https://ajax.googleapis.com/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
    <!-- 스타일 부분은 동일합니다 -->
</style>
<body>
    <jsp:include page="../base/header.jsp" />
    <%@ page import="com.acorn.baemin.domain.ReviewDTO" %>

    <%
        // 필요한 패키지 및 클래스 임포트 및 데이터베이스 연동 설정 (이전 코드와 동일)
  
        String reviewRating = request.getParameter("rating"); // 평점은 "rating"로 변경
        String reviewContent = request.getParameter("reviewText"); // 리뷰 내용은 "reviewText"로 변경

        // 리뷰 데이터를 데이터베이스에 저장
        ReviewDTO review = new ReviewDTO();
        review.setReviewRating(Integer.parseInt(reviewRating)); // 평점은 숫자로 변환
        review.setReviewContent(reviewContent);

        // 데이터베이스 연동 코드 작성 (마이바티스 또는 JDBC 사용)

        try {
            // 리뷰 데이터 저장이 성공한 경우
    %>
            <script>
                alert("리뷰가 성공적으로 등록되었습니다.");
                window.location.href = "home/home.jsp"; // 리뷰 등록 성공 시 홈 화면의 URL로 이동
            </script>
    <%
        } catch (Exception e) {
            // 리뷰 데이터 저장이 실패한 경우
    %>
            <script>
                alert("리뷰 등록에 실패했습니다. 다시 시도해 주세요.");
                window.location.href = "review/review_register.jsp"; // 리뷰 등록 실패 시 리뷰 작성 페이지로 돌아가기
            </script>
    <%
        }
    %>

    <jsp:include page="../base/footer.jsp" />
</body>
</html>
