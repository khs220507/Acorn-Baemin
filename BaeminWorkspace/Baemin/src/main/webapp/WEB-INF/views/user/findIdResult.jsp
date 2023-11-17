<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기 결과</title>
</head>
<body>
    <h1>아이디 찾기 결과</h1>
    <p id="customerId" style="display: none;">손님 아이디 : ${customerId}</p>
    <p id="sellerId" style="display: none;">사장님 아이디: ${sellerId}</p>

    <script>
        let customerId = "${customerId}";
        let sellerId = "${sellerId}";

        // 결과를 보여줄 요소 선택
        let customerElement = document.getElementById("customerId");
        let sellerElement = document.getElementById("sellerId");

        // customerId가 존재하면 해당 요소 보이기
        if (customerId && customerId.length > 0) {
            customerElement.style.display = "block";
        }

        // sellerId가 존재하면 해당 요소 보이기
        if (sellerId && sellerId.length > 0) {
            sellerElement.style.display = "block";
        }
    </script>
</body>
</html>
