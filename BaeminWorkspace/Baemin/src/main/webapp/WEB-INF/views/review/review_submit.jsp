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

    <%

        try {
            // 리뷰 데이터 저장이 성공한 경우
    %>
            <script>
                alert("리뷰가 성공적으로 등록되었습니다.");
                window.location.href = "<%= request.getContextPath() %>/home"; // 리뷰 등록 성공 시 홈 화면의 URL로 이동
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
