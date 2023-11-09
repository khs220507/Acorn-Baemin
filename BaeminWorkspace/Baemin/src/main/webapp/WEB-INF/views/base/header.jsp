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
	height: 100vh;
}

ul {
	list-style: none;
}

/* 헤더 ////////////////////////////////////////////////////*/
header {
	display: flex;
	flex: 1.2;
	justify-content: center;
	align-items: center;
	width: 100vw;
	background-color: #48D1CC;
	position: relative;
}

.header-wrap {
	width: 1280px;
	display: flex;
}

.logo {
	flex: 2.5;
	display: flex;
	justify-content: flex-start;
	align-items: center;
}

.logo a {
	color: white;
	font-size: 40px;
}

.info-wrap {
	flex: 5;
}

.address-wrap {
	width: 400px;
	display: flex;
	margin: 0 auto;
	justify-content: center;
	align-items: center;
}

.address-wrap p {
	flex: 5;
	color: white;
	font-size: 20px;
	cursor: pointer;
}

.address-wrap img {
	width: 20px;
	height: 20px;
	cursor: pointer;
}

.map-icon {
	margin-left: 10px;
}

.search-wrap {
	width: 400px;
	height: 35px;
	display: flex;
	align-items: center;
	background-color: white;
	border-radius: 10px;
	margin: 10px auto;
}

.search-wrap input {
	width: 360px;
	height: 30px;
	margin-left: 10px;
	border: none;
	outline: none;
}

.search-btn {
	border: none;
	background: none;
}

.search-wrap img {
	width: 25px;
	height: 25px;
	cursor: pointer;
}

.login-btn-wrap {
	flex: 2.5;
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

/* 로그인 안했을 때 */
.login-btn-wrap a {
	color: white;
	font-size: 30px;
}

/* 로그인 했을때 */
.menu-wrap-ul {
	position: relative;
}

.menu-icon {
	width: 40px;
	height: 40px;
}

.hidden-menu {
	width: 180px;
	height: 210px;
	background-color: rgba(71, 209, 205, 0.7);
	border-radius: 10px;
	padding: 10px;
	position: absolute;
	right: 0px;
	display: none;
	transition: .5s;
	z-index: 999;
}

.menu-wrap:hover .hidden-menu, .hidden-menu:hover {
	display: block;
}

.hidden-menu li {
	height: 40px;
	color: white;
	text-align: center;
	position: relative;
}

.hidden-menu img {
	width: 30px;
	height: 30px;
	position: absolute;
	left: 0px;
	top: -3px;
}
</style>

</head>
<body>

	<header>
		<div class="header-wrap">
			<div class="logo">
				<a href="/baemin/home">배달의민족</a>
			</div>
			<div class="info-wrap">
				<form class="search-wrap" action="${path }/search" method="get"
					onsubmit="return validateForm()">
					<input type="text" name="searchTerm">
					<button class="search-btn" type="submit">
						<img
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAADBElEQVR4nO1YzWsTQRQfFb1Z1Ioaj+rJq1Q9W8281NpaMOhB6sG/olUQeq34PwiibW+1Z7+gaJJ5m30vhsZPBKFFb3qsVSJvE7Q7u5UknU0b2R8MISTz2/dm3sfvrVIpUqRI0bMYXCr258iMA5tZIIPAZlmTWZXP5vdZ+T1bfXlAbSdkq94JzWYGGNeAsd7CWtOMj+A1Ht9Sw/PV6h5NeA8Yf7RoeGg1bgfvnkLcvSXhAoxPOzE84gjj4gWiQ10zfhjxIJB5H2sQoacJJ6BcGtCIGTld+cz65rRmnNSM5XhHzDvh7VLYmBcxhr8B8i61wqG5NKIZ38Y48izxcGrGvG38/EhtcW87PPJ/YLMQDScznWi1iSQs4fyden1nJ3yyz3ZCk1m9WCkdc299cPVBqQyFTbsnbwMKhT6Jf4v3oUqo6oTqfJZw2AW3ZjNq94nBpWK/colGhw1XG5f8kerke9dd8qtAHoRiFScc89+yknnGJb9qaJl1J1QuDbjkHyI8Y91wzSW/AsaV9Q84V3l12CX/ec87anXn7y75VVO3/HmANDSX/MIHViIrxzG6HDohxEySNwCEXxLNAdE2ieYAYzXZKsQ46ZJfs7ltdeQHvdMH6vUdQIbC/OamcgkZA+1OLKrSBTf4OGbroaFq8YhKWgsFkrhQ6NsM56jv79OEHyze+yoJyAxrl1PN5nGnajQ/N7dL9tunD+XySZUUZIaNmaYW2r2J4OQt46GxplSSCEZEwudxI2GugpdbSlgfxzThx7jRMkdmXHVlJrY1/N/49UWYSV2X5hSMoIgZYDwbCDa72kT3/wQqXUvcCdHrms2TfxnT6dLihGs5vWE4sZm2E7tlQxv7poDxRmA0h7VQV25CIDOsjIGtvpkTw6VUrq82YixE93fPiYYjlf1y9UG/IKwB4zdN5hew+SraRuSBdNiNmhRsByc2C6hgPtrxu5QTrgD/hRNsrvS+ExSfE/IaRvUKcuRdjThB+Fn1EnJRJ1ZUr0EHb+/MJzl9V3NIihQpUijn+A1qcPW2rNhwowAAAABJRU5ErkJggg==">
					</button>
				</form>
			</div>


			<div class="login-btn-wrap">

				<!-- 로그인 안했을 때 -->
				<!-- <a href="">로그인</a> -->

				<!-- 로그인 했을 때 -->
				<ul class="menu-wrap-ul">
					<li class="menu-wrap"><img class="menu-icon"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAAsTAAALEwEAmpwYAAABMklEQVR4nO3aPU4DMRCGYUuhgZJU/JSEkiwtERULXCDcASQirsE1wm0ioeQWQEcq6HjRaFPR0PBJY/Z7pOnH47VXHrsUMzMzMzMzs18B18ATsACek8Rik9NlUQIegC/yitxmqsEPgU/yixx3FQVoqUerKEBDPU4UBdgCluQXm+LgzwsQgFHyIsTgj4oSMADGwBS4SRLTTU6amTczM+sAh8Ad8JgsIqeDogRcAWvyWsuOxMAO8EZ+L8C2ogDn1GOiKMCEepyplsArfV0CITYY4J28IreLogTsA7cJfns/I3Lakw7ezMz6jq493iRsijbypihwDKzIK1r2I+XMr8hvKfkSgFPqMVYUoKXnl6PDSq7HPyTX4yEeH1TwQOK+KNEdiecJn8jM5UdhMzMzMzMzK//DN5h1UDYzOEebAAAAAElFTkSuQmCC">
						<ul class="hidden-menu">
							<li><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAAsTAAALEwEAmpwYAAACZUlEQVR4nO3aS4hPURwH8CPPlGkKoTxKLMTOwsajKDMrWwtZoDwXliRSomTDwsIjk5KyILYWlCKxIEqKFBbKayHPEh+d5j81aboz///879zz///Pp872dO63e3/nnkcIWZZlWZZlg2A8FmBhQesO7QZdOI9vRuYJ1oR2gevq9x3LQqvDYo07G1odekcRwDscT6Rtj59yIwHMx1/t4W18oxsJ4Zz2cbuRACbiIF60wdsQxz+t7hCK4KbW0tXsAE5pHa+b+vARdmgd10KzYbXWcaCMAKZrHT1NDyDCR61hZigD7ujEAjgAZ3RiARyAvTqxAA7Aep1aACPMlbY/cbYKZcE4fJGue6U9/AA8lK6NoWy4KE2344buWASwT3oeY0bpDx9hg7SK3oWmL32LYNEwg3qDVyW2l7hb2wNcEio6OPlZEMCK0O7wtCCALaHd4UpBACdDu8PhggC+4nTJ+/+HsK7KAHqk4XL8O60igKn4JA3bxjyAqHaGkIKroQqYlMi6oJoABm2UVh1CtdOu/jchVuXPFTz8pUqKYEFh7K0tlso+Bo/1Z+2QA8kqhilxakJfrW3F5FH0twTHanP+CSwPqdJ/0eL5EN/qM8xroL89+D3E0feRkBr9+4UPCgrW/XoKVryBVlvvV7f9VQ+sGkHVXtnEW2sPQkqwewQB7Kqjv7jxUeRHSAk2jyCATXX092iYvt6HlGAOfhUMOO4iza6jv6PDBNAXUoMDBQPeX2df3QWfwft4ShVSpL8WDL5H8AE7R/FW3fhvNrjV0D3AsYQJWFpr45u06FqOWc0ZYZZlWZZlWehs/wCBV7DzRAFk9gAAAABJRU5ErkJggg==">
								장바구니</li>
							<li><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAACXBIWXMAAAsTAAALEwEAmpwYAAACPklEQVR4nO3aPWsUQRwH4DGC7/EDCIpRooJaWdhYiDYWFgGxsFFQRFELNYW12IR8BKOWotiIL0F7IY2CNsFWUFQk4gu+J3lkyApXRM3N7eZ2wj6wcHB3/5sfszc7O7MhNBqNRqPRyA424BweYBwf8QXP8RBnsT6hbl9R92FR60tRe7z4rfjehmpSzQLbcd/cTOE6Ns2h7mbcKL4zF/ewLVQFizHcRoNafcd5LJqlbg8Gi8+0axJDsW1lh+1to1f/5SaWttRdhlsl1I293Vtmz95XnlEsKY74nyxLDN1TRuBh5RvBlQrqDpUxQE3Jx2RHA5mZ0y83d1PDbpSvvpTAg/J1NiXwA/kaTQn8XL7GUwJ/lK8PKYG/y9e3lMCv5etlSuCn8vUkJfA1+RpJCXxKvk6kBF6PafmJbV7XduAIj+VnLKTCGfk52UngFZiQj/dYmRw4wiX5uBhKWs96o/7eYnXHgSOcthAvRX9TLKU+Ul9jpSzgtcLWOClXP7FNW0IVcFz9HK0k7B+4qj4uh6qZ2S2owwws3s0trzxwy85hNyckE0krk53ATnzuQti4fbqro8anwt55Xgr6gX2hmzCAX/O0jXIw1AGOVbwHFcMeCXWCQ/hZQdh49hwOdYT9+Fpi2Dg+DIQ6w56SRu9P2B1yYGZf+UUHYV9hR8gJ1iTOyJ5hbcgRVuFOG2Fvd7xE021YhAv/uWxNF48flXtPW4MR/MMsYeMAdyAsROgvnsx7VxzxdX+329VoNBqNRiPMi9/bQE5mUguLBwAAAABJRU5ErkJggg==">
								찜</li>
							<li><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAAsTAAALEwEAmpwYAAACNUlEQVR4nO2Zu27UQBRAh0cRECH5BUSLoEARX4BEUhDxNSsRVqILElUU0qRBoUGIX6FKSQNRlCq7SLTZoIOG2MRyYnvGM7O+9t4juVjdedw5Gs+1vcYoiqK0ALhvFjlXYAq8qRvcxoDlhPEVh/42x6mJDZf8Bt4Bq4XYPWCUSbLX24TxSUP8HykF5NjJtnLjXGWSxcfAr4r468B45fzzECAaFRAbmslviXHNLRG65evic98B48KhtVU8nbPTOI9PromvFBaSL8wnXhw/r07zFWAuE+myLP6fvxMBklABJfpnuO8CuHg69Loq5mnVV4IAb1zmce3rMnYQvgmoAAdcRLv2lbADRr5XxTyt+nYuoGtUQIm5GyZhyRtEGTQOY/qgAkroDmgQFAwNE6QseVoGHeh8B5hFF0BASWtTJiUKCMJlzrr2LuMF4ZuACvDERXpdewk7YBSzrDWNKU5A10jPLzkqoIRZNIgtAHgGfAKOgBkCSSIAuAm8B/4gnFQC9ugJ0QUAL+kRUQUAt4CfyOcYeA7ciS1gE/mcAY8q8g8WsI98PtfkHyzgEPm8SClginwepBRwhnyWKnK/HUPAhJ7uAOBhqd3pUM+A9YrcN0rtvg21CnypyP1rqd2HoT4FzoDHpbyfXPOyttH2SfAH8jmx5RC4a2+J7HeR7/aFzluABXhF/9k0IQC79JedoMVbgBvZvy/ivwcUOAe2be4mFsAacJCdCxK/CM2y3D4CT6MtXFEURTHD5S+dwCdTx4ClcAAAAABJRU5ErkJggg==">
								주문내역</li>
							<li><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAtElEQVR4nO2SMQrCQBBFF1LkCgpa5xzeySvoXRICQdJppwfQyhukU9FYpHxhYQpZyYhm7PbBwMLu/gcz41zEAmAOlEArVQGZZfiVd27+zkJQMkxhIWgVwePfgruFoFIEuYUgk4GGXIDZaMHLJhW+51K5WXhkECABFsAa2AFn4Cnlz1tgJW+Sb4JTYAk0ynqGNPIn/RQ+BU78zhGYaIKa8Ww0QWcg6DSBCU4RHAzy9+qgIy6gBwTxryZ9UBmqAAAAAElFTkSuQmCC">
								내정보수정</li>
							<li><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAABhElEQVR4nO2ZTUrDQBiGQw+gpoqrKCj4d4lurD+n0I2eQd278AaKiB5EULQFEdSlV7D1Bi7MI8FJGQYsGr/50inzwCyyeb/3nSQzky9JEolEIsECzAMtoF1xtAqNOoyvAPfIcQcsa876O/L0gUwjwJVV9APoANcVR8dolFxoBChmqqQtoLdp6fVkXA4vmFsFGwJ6DUsvl3E5vOCAUdb8kRhgTO/ADLADvElp1jJbwIK0ptcAQGr2lTNgQsahboAjS+4BmJRxqRdgy9lXHoEpGadK7wCwD3xass9AU0JbcxXac0K8ANNS+pUCmPP+wR/Gk61trtNaAgBrzoxW5byuAKtBBygA1oFj4OSX43VkHiGhl7gppe81ACEvo8B20BsZcBj6USI1h7nTIA9zLsBi4htPq9AssKvVlfARQFxTtRgeNMc6QB56Y6tvFdwQ+iorUelKXA7KfTdmu/9o7nbraO7OOXdBip5Ke92EWAJuBc3fFJoq5p0gmcAvpkzdeCQSiSRSfAEe/GNDlGJX4gAAAABJRU5ErkJggg==">
								로그아웃</li>
						</ul></li>
				</ul>

			</div>
		</div>
	</header>

	<!-- 검색 -->
	<script>
		function validateForm() {
			var searchTerm = document.getElementsByName('searchTerm')[0].value;
			if (searchTerm.trim() === '') {
				alert('검색어를 입력하세요');
				return false;
			}
			return true;
		}
	</script>
</body>
</html>