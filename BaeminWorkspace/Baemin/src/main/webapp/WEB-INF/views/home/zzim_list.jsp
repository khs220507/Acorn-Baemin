<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
<style>
/* reset css */
a {
	text-decoration: none;
	color: black;
}

button {
	outline: none;
	cursor: pointer; /* 손가락모양 */
}

* {
	margin: 0;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	display: flex;
	flex-direction: column;
	align-items: center;
}

hr {
	background-color: #d9d9d9;
	height: 3px;
	border: 0px;
}
/* 섹션  ////////////////////////////////////////////////////*/
.wrap-all{
	width:75%;
	margin:0 auto;
}
.zzim-title {
	margin-bottom: 10px;
}

.zzimList-wrap {
	display: flex;
	align-items: center;
	position: relative;
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 30px;
	padding-right: 30px;
	
}

.delete-icon {
	width: 20px;
	height: 20px;
	position: absolute;
	right: 40px;
	top: 10px;
	cursor: pointer;
}

.store-img {
	width: 100px;
	height: 100px;
	flex: 2;
}

.store-info-wrap {
	flex: 3;
	margin-left: 30px;
}
.store-info-wrap a{
	font-size: 17px;
}
.store-info-wrap p{
	font-size: 15px;
}
.store-code {
	display: none;
}

.scope-wrap {
	display: flex;
	margin-top: 3px;
	margin-bottom: 3px;
	align-items: center; 
}

.scope-star-img {
	width: 20px;
	height: 20px;
}

.store-msg {
	flex: 5;
	font-size: 15px;
}

/* 반응형 /////////////////////////////////////////////////////////////////*/
/* 중간화면 */
@media (max-width:1280px) {

section{
	width: 100vw;
}
.wrap-all{
	width: 75vw;

}
}

/* 작은화면 */
@media (max-width:767px) {
section{
	width: 100vw;
}
.wrap-all{
	width: 90vw;
}
.zzimList-wrap{
	flex-direction: column;
}
.store-info-wrap{
	margin-left: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-bottom: 7px;
}
}
</style>
</head>
<body>

	<%@ include file="../base/header.jsp"%>

	<section id="content">

		<div class="wrap-all">

			<h3 class="zzim-title">찜</h3>
			<hr>

			<c:forEach items="${zzimList }" var="zzimList">
				<div class="wrap-include-hr">
					<div class="zzimList-wrap">
						<img class="delete-icon"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAyklEQVR4nO2WQQ6DMAwE+QSofUgkr+T8/xBO5dDnUFE4tBEE27iKRFkpJ7JM7JAlTXPpLwWgA9Avo7P6iSiJ/czcAngAGKdBRM8Y410KNfsxV/k2fZgHycqnOcvc3J9MYAl8CyoGc9aq7AWrbdvzhBBuu2At3A2qgbtDhfs2lJ5ZjuGXSlW5V2qFu0Kl8J9ApWBNwrm32g3Oho/rMBw1jhMLwsESr0VpEskNzoYYdIGj1m8RtS4CvHJ10STSIT/mlSfVZc3Rf+kcegEOjsATVQE+UwAAAABJRU5ErkJggg==">
						<a href="${path}/store?storeCode=${zzimList.storeCode}"><img
							class="store-img"
							src="${path}/storeImages/${zzimList.storeImage }"></a>

						<div class="store-info-wrap">
							<a href="${path}/store?storeCode=${zzimList.storeCode}">${zzimList.storeName }
								<span class="store-code"> ${zzimList.storeCode }</span>
								
								<c:choose>
									<c:when test="${zzimList.storeStatus == 1 }">
										<span>(준비중입니다...)</span>
									</c:when>
								</c:choose>
								
							</a>
							<div class="scope-wrap">
								<img class="scope-star-img"
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAAEJ0lEQVR4nO2ZvW8bdRzGf1Q09r357MT3YikTZSgIwdAWCZA6MYBQ/oIKykCHDlUZujcUlQ2pVMAYJFQQUgckhKCxHb/cxU7sOunZvoiKdkCZUFGGVlS0gd/vQXcXv9upae4SG/mRnsny3ef5+vHd92xCJppoosAEW3sVdf0EGUfB0lTY2kPXlqaScRPq2jxsHag71ubJOAm/Ph+Crf+OuubAAzX1HoqzHBkXwU6cacHvuKp+QMZBAHkGNXWjCV5THXjAUm87r5FRF6r6221Tb8ADluL4LTLqQk1L9YW/pQDr8UUyyoKlvQRLZX3hvQDAuvIKGVXBUr/qqkwXfByozCyQkb1xWcpfPVNvh19zAkw/QiWeIKMmWMrH/SvTBr8243wCji+RURKKsxys+B994RvgLXjg5vQWLE04uOu8reioxY/B0uZgKWdhKdcGVqYd3IP3XJ6+hlLsLMrROazKx1BSdF/uE6grR7Chn4SdOIW6fgE1/Qpq6nVUtQKq6iaq6vbuV5kB8A1wDx4ox4CSZ7YadU1Xotu0KG/SFblAi5HrtBi5goJ0AcuRUyiIJ2HKz+0Ov5H4yF3AWktY9zrQfWMatjKd4H3g2UrDMlhxx4WI5+WGJcAQLw4OYOunUddZE757Heg39eEr0wHeCy+3wHvgJTBTAjUkBlN67wkV0t9FXdvumXoAlWH94Bvg3fCm9A8M8cxw34Oa+iaq2oNRqAxzJy8+RF56Zyj4Zoh1/QSqyr2DrAzz4LdgiG/8J/hWnZQjsOJ3DqIyzIHPi78hKx59KvhmCOf6vB6/5U9l5KEqwzx4G1ludk/wzRC2ImItntyPyjAXXsghFZN9ge94zq3MfBdkZZghOvDfo0i44NaIysynQVSGOfCG+DlADgUC3xGkHLvqZ2WYO3nxauDgzQCl2Cd+VYbtmOaFy/sXoBxb8qMyzHHeM83x6f2BBzmEUvT+XivTghfAcgJoln+Ai/vR/9XpF/dcmXwnPHOc5YGc+ELwAVbk9/2oTBM858G7ATL86cAD0FX5Sz8q44ELTXiW4UGXwl8EH6AYrfhVGbYD7pkDTYdvBgqPLAnTovx44NQ7dhlhC4ZwDlnhHM0JW/0qwxrwS5xrusQ9ds4RXICC9PoT19+8RGle/BoFofmnBkw5RrP8ZzQj/N0JzzXhWdpxGEiFXwsuQFH+cNf11xAzMISXB74/Kx6lGe6nXviw51QYSE6dDywAXZa+7QtuSpsw+d2fVduDpLk5mubudsM7pouhb4ILUJDudj6nin/SvDT/NL1FhRxGeuo8TYfve/AhsGQINDl1JxB4t8dmhDnw1JAoNcUF5Pk9/8aJn/kETU0t0GSIugFuhBh+JDF/qNtPtKgJ1BBvU1PKYTly3PfjJ589Tm9M5eji4V/wA+H9Pv5EE/1f9S9M4cKBWKiMUAAAAABJRU5ErkJggg==">
								<p>${zzimList.storeRating }</p>
								<p>(+${zzimList.reviewCount })</p>
							</div>
							<p>최소주문: ${zzimList.minOrderPrice }</p>
						</div>

						<p class="store-msg">${zzimList.storeDescription }</p>

					</div>
					<hr>
				</div>

			</c:forEach>
		</div>
	</section>

	<%@ include file="../base/footer.jsp"%>

	<script>
		// 찜 삭제
		$(document).on(
				'click',
				'.delete-icon',
				function() {
					$(this).closest('.wrap-include-hr').remove();
					let storeCode = $(this).closest('.zzimList-wrap').find(
							'.store-code').text().trim();

					deleteList(storeCode);
				});

		
		function deleteList(storeCode) {
			if (confirm("찜을 해제하시겠습니까?")) {
				$.ajax({
					type : "get",
					url : "${path}/zzimDelete",
					data : "storeCode=" + storeCode + "&userCode=" + <%= userCodeInfo%>,
					dataType : "text",
					success : function(data) {
						alert("찜이 해제되었습니다");
						window.location.reload();

					},
					error : function(err) {
						alert("삭제 요청에 실패했습니다.");
						alert(storeCode);
					}
				});
			}
		}
	</script>

</body>
</html>