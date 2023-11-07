<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<body>

	카카오페이 결제가 정상적으로 완료되었습니다. 결제일시: ${info.approved_at}
	<br /> 주문번호: ${info.partner_order_id}
	<br /> 상품명: ${info.item_name}
	<br /> 상품수량: ${info.quantity}
	<br /> 결제금액: ${info.amount.total}
	<br /> 결제방법: ${info.payment_method_type}
	<br />

</body>
</html>