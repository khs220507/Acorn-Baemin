<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set  var="path" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100vh;
}
section{
padding-top: 0px;
}


.nav-var {
	padding: 130px 0px 10px 0px;
	font-size: 20px;
	font-weight: bolder;
	display: flex;
	width: 1280px;
	margin: 0 auto;
	justify-content: space-between;
}

hr {
	margin: 0 auto;
	width: 100%;
	border-width: 2px;
}

.menu-img{
	width: 200px;
	height: 200px;
	margin: 20px auto;
	padding: 10px;
}

.menu-img img{
	width: 200px;
	height: 200px;
}

.menu-name {
	text-align: center;
	margin: 10px auto;
	font-size: 35px;
	margin: 0 auto;
	padding: 20px;
	width: 75%;
	border-top: 2px solid gray;
}

.option-list-wrap {
	width: 60%;
	margin: 0 auto;
	padding: 20px 60px;
	border-top: 1px solid #d9d9d9;
}

.option-category {
	font-size: 40px;
}

.option-list {
	padding: 10px 20px;
	font-size: 20px;
	display: flex;
	
}
.option-name{
margin-left: 10px;
width: 520px;
}
.plus-cart-but {
	display: flex;
	width: 100%;
	justify-content: center;
}
.plus-cart-but button{
background-color: white;
width: 170px;
height: 50px;
border: 2px solid #82d9d0;
border-radius: 10px;
font-size: 20px;
}
</style>

<script>

let resultArr = [];
let optionString ="" ;
function insertCart(){
	
	
	let option = 'input[name="option"]:checked';
	let optionList = document.querySelectorAll(option);
	resultArr = [];
	  optionList.forEach((el) => {
	    resultArr.push(el.value +"");
	  });
	  optionString = resultArr.toString();

}


function sendOptionJson() {
    let test  = { options :resultArr };
    optionString = resultArr.toString();
    document.frm.options.value  = optionString;
    document.frm.submit();
}



</script>

</head>
<body>
	<jsp:include page="../base/header.jsp" />
	<section id="content">

		<div>
			<form name="frm" method="post" action="${path}/cartList?menuCode=${menuCode}">
				<div>
					<div class="menu-img"><img alt="메뉴 사진" src="${path}/images/${MenuInfo.menuImage}"></div>
					<div class="menu-name">${MenuInfo.menuName}</div>
				</div>
				<div class="option-list-wrap">
					<c:forEach items="${Categorylist}" var="item">
						<div>
							<span class="option-category">${item}</span><br>
							<c:forEach items="${list}" var="items">
								<c:if test="${item eq items.optionCategory}">
									<c:choose>
										<c:when test="${items.optionSelectType eq 1 }">
											<div class="option-list">
												<input type="radio" name="option"
													value="${items.optionCode} / ${items.optionName} / ${items.optionPrice} / ${items.optionCategory}"
													onclick="insertCart()"> 
												<div class="option-name">${items.optionName}</div> <div>${items.optionPrice}원</div>
												<input type="hidden" name="${items.optionCode}"
													value="${items.optionCode}">
											</div>
										</c:when>
										<c:otherwise>
											<div class="option-list">
												<input type="checkbox" name="option"
													value="${items.optionCode} / ${items.optionName} / ${items.optionPrice} / ${items.optionCategory}"
													onclick="insertCart()"> 
													<div class="option-name">${items.optionName}</div> <div>${items.optionPrice}원</div>
												<input type="hidden" name="${items.optionCode}" value="${items.optionCode}" >
											</div>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
						</div>
					</c:forEach>
					<input type="hidden" name="options">
				</div>
				<div class="plus-cart-but">
					<button type="button" onclick="sendOptionJson()">장바구니에 추가</button>
				</div>
			</form>
		</div>

	</section>
	<jsp:include page="../base/footer.jsp" />
</body>
</html>