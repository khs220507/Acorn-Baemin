<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
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
	padding: 0;
	box-sizing: border-box;
	font-family: 'BMHANNAPro';
}

body {
	display: flex;
	flex-direction: column;
	align-items: center;
}

ul {
	list-style: none;
}
input, option, select{
font-family: '';
}
/* 헤더 ////////////////////////////////////////////////////*/
header {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 99vw;
	height: 140px;
	background-color: white;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 99999;
	border-bottom: 1px solid #d9d9d9;
}

.login-btn {
	color: black;
	font-size: 20px;
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

.small-font {
	font-size: 30px;
}

.rider-img {
	width: 85px;
	height: 70px;
}

.logo a {
	color: black;
	font-size: 50px;
	font-weight: bold;
}


.search-wrap {
	width: 250px;
	height: 40px;
	display: flex;
	align-items: flex-end;
	background-color: white;
	border-bottom: 2px solid black;
	position: absolute;
    right: 0;
    top: -30px;
}

.search-wrap input {
	width: 360px;
	height: 30px;
	margin-left: 10px;
	border: none;
	outline: none;
	font-size: 17px;
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

/* 메뉴바 */
.wrap-menu-address {
	display: flex;
	flex-direction: column;
	justify-content: center;
	position: relative;
	top: 10px;
}

.menu-wrap {
	display: flex;
	align-items: center;
	margin-top: 20px;
}

.menu-wrap li {
	font-size: 22px;
	font-weight: bold;
}
.menu-wrap li:hover{
	color: #48D1CC;
}

.menu-bar {
	color: #d9d9d9;
	margin: 10px;
	font-size: 20px;
}
/* 섹션 ////////////////////////////////////////////////////////*/
section {
	width: 1280px;
	margin-bottom: 50px; /* 여분의 여백으로 풋터가 바닥에 유지되도록 설정*/
	padding-top: 160px;
}

/* 배민 폰트*/
@font-face {
	font-family: 'BMHANNAPro';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.0/BMHANNAPro.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>

<header>

	<div class="header-wrap">
		<div class="logo">
			<img class="rider-img" src="${path}/resources/icons/배민캐릭터로고.png">
			<a href="/baemin/home">배달<span class="small-font">의</span>민족
			</a>
		</div>

		<div class="wrap-menu-address">
			<form class="search-wrap" action="${path }/search" method="get"
				onsubmit="return validateForm()">
				<input type="text" name="searchTerm">
				<button class="search-btn" type="submit">
					<img
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAACXBIWXMAAAsTAAALEwEAmpwYAAACiklEQVR4nO2ZzWtTURDFf25ixSiIiO22FdutG8FFa2PpX+CytRQLotD/waILrXv3piCIyySk7VYXfrRd+rVx407blaI2FSNXbyAMk7SJM3kv+g4MhMA95x3umzsz90GGDKnEELAArABbwDZQi/EJ2ASKwFVgkBRiEqgAP4D6AWMPKAMTpABngLUOHr5VVIGRpEzMAV8MTDTiMzDbaxO32jzQa+AOMAWMAkdjjMX/7gJv2qxf6pWJ2y0e4AVQ6IDnAvA0KTNziugucA041AVfWHM9ckjeGRwTW+ZEOF7HDbjDybWj5MwwDpCn066RiQYuxnrTrFHBoU7IrQ+vkzVuKDrjlgIVQf68y5zYD4HzpdAqWbYde4I8vAZeKCgdwGkL4gVB/Ap/vBWa8xakK4I0FDtvLAvNBxakW4I0VGdvTAvNDQvSbUF6Fn+MCs2PFqSy6ubxR15ofvcwcgx/HFeq/D/xar23IN1MQbI/syAtCtIwT3jjntC871EQw1DkjXdC87IF6aDSooQm0gtTSpd90oq8rEyDXk2jzMmipcCE0l6Hyc4ai4rOOWuRqhCoGd9JFZTB6iEOGImFqVlox6iln1RG3XAzeQonzCpbX4uTXbeXD4vKToR4AuRwxJIi2uhQL3V4OsnEllEFBpIwU49D0XKszmOxAczH39Ox2Mk60S5K3jszo+SMV5SBw55mhpWLiU7jJ/AYWE/aDPHKpqR0AO3iG/AIOP+b4U8urO6zptILM8Tbjvk4Y2/EIzS0GF+BD/GqJzSAV4ATyvpUmflb5JSWqC5i1fs066WZtcxMAsj9bzuzDhyhDzBwgNOs598fPXbmJn2GnGKm70xoZvrWRHPOuH0szZCB1vgFpd/exdTtQfAAAAAASUVORK5CYII=">
				</button>
			</form>

			<!-- 로그인시 -->
			<div id="loginStatus">


				<%
				Integer userCodeInfo = (Integer) session.getAttribute("userCode");
				if (userCodeInfo != null) {
					
				%>
				
					<p class="hello-msg">
						안녕하세요,
						<%=userCodeInfo%>
						님
					</p>

					<!-- 로그인 했을 때 -->
					<ul class="menu-wrap-ul">
						<li class="menu-wrap"><img class="menu-icon"
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAAsTAAALEwEAmpwYAAABMklEQVR4nO3aPU4DMRCGYUuhgZJU/JSEkiwtERULXCDcASQirsE1wm0ioeQWQEcq6HjRaFPR0PBJY/Z7pOnH47VXHrsUMzMzMzMzs18B18ATsACek8Rik9NlUQIegC/yitxmqsEPgU/yixx3FQVoqUerKEBDPU4UBdgCluQXm+LgzwsQgFHyIsTgj4oSMADGwBS4SRLTTU6amTczM+sAh8Ad8JgsIqeDogRcAWvyWsuOxMAO8EZ+L8C2ogDn1GOiKMCEepyplsArfV0CITYY4J28IreLogTsA7cJfns/I3Lakw7ezMz6jq493iRsijbypihwDKzIK1r2I+XMr8hvKfkSgFPqMVYUoKXnl6PDSq7HPyTX4yEeH1TwQOK+KNEdiecJn8jM5UdhMzMzMzMzK//DN5h1UDYzOEebAAAAAElFTkSuQmCC">
							<ul class="hidden-menu">
								<li><img
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAAsTAAALEwEAmpwYAAACZUlEQVR4nO3aS4hPURwH8CPPlGkKoTxKLMTOwsajKDMrWwtZoDwXliRSomTDwsIjk5KyILYWlCKxIEqKFBbKayHPEh+d5j81aboz///879zz///Pp872dO63e3/nnkcIWZZlWZZlg2A8FmBhQesO7QZdOI9vRuYJ1oR2gevq9x3LQqvDYo07G1odekcRwDscT6Rtj59yIwHMx1/t4W18oxsJ4Zz2cbuRACbiIF60wdsQxz+t7hCK4KbW0tXsAE5pHa+b+vARdmgd10KzYbXWcaCMAKZrHT1NDyDCR61hZigD7ujEAjgAZ3RiARyAvTqxAA7Aep1aACPMlbY/cbYKZcE4fJGue6U9/AA8lK6NoWy4KE2344buWASwT3oeY0bpDx9hg7SK3oWmL32LYNEwg3qDVyW2l7hb2wNcEio6OPlZEMCK0O7wtCCALaHd4UpBACdDu8PhggC+4nTJ+/+HsK7KAHqk4XL8O60igKn4JA3bxjyAqHaGkIKroQqYlMi6oJoABm2UVh1CtdOu/jchVuXPFTz8pUqKYEFh7K0tlso+Bo/1Z+2QA8kqhilxakJfrW3F5FH0twTHanP+CSwPqdJ/0eL5EN/qM8xroL89+D3E0feRkBr9+4UPCgrW/XoKVryBVlvvV7f9VQ+sGkHVXtnEW2sPQkqwewQB7Kqjv7jxUeRHSAk2jyCATXX092iYvt6HlGAOfhUMOO4iza6jv6PDBNAXUoMDBQPeX2df3QWfwft4ShVSpL8WDL5H8AE7R/FW3fhvNrjV0D3AsYQJWFpr45u06FqOWc0ZYZZlWZZlWehs/wCBV7DzRAFk9gAAAABJRU5ErkJggg==">
									<a class="menu-items" href="${path }/">장바구니</a></li>
								<li><img
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAACXBIWXMAAAsTAAALEwEAmpwYAAACPklEQVR4nO3aPWsUQRwH4DGC7/EDCIpRooJaWdhYiDYWFgGxsFFQRFELNYW12IR8BKOWotiIL0F7IY2CNsFWUFQk4gu+J3lkyApXRM3N7eZ2wj6wcHB3/5sfszc7O7MhNBqNRqPRyA424BweYBwf8QXP8RBnsT6hbl9R92FR60tRe7z4rfjehmpSzQLbcd/cTOE6Ns2h7mbcKL4zF/ewLVQFizHcRoNafcd5LJqlbg8Gi8+0axJDsW1lh+1to1f/5SaWttRdhlsl1I293Vtmz95XnlEsKY74nyxLDN1TRuBh5RvBlQrqDpUxQE3Jx2RHA5mZ0y83d1PDbpSvvpTAg/J1NiXwA/kaTQn8XL7GUwJ/lK8PKYG/y9e3lMCv5etlSuCn8vUkJfA1+RpJCXxKvk6kBF6PafmJbV7XduAIj+VnLKTCGfk52UngFZiQj/dYmRw4wiX5uBhKWs96o/7eYnXHgSOcthAvRX9TLKU+Ul9jpSzgtcLWOClXP7FNW0IVcFz9HK0k7B+4qj4uh6qZ2S2owwws3s0trzxwy85hNyckE0krk53ATnzuQti4fbqro8anwt55Xgr6gX2hmzCAX/O0jXIw1AGOVbwHFcMeCXWCQ/hZQdh49hwOdYT9+Fpi2Dg+DIQ6w56SRu9P2B1yYGZf+UUHYV9hR8gJ1iTOyJ5hbcgRVuFOG2Fvd7xE021YhAv/uWxNF48flXtPW4MR/MMsYeMAdyAsROgvnsx7VxzxdX+329VoNBqNRiPMi9/bQE5mUguLBwAAAABJRU5ErkJggg==">
									<a class="menu-items" href="${path }/zzim">찜</a></li>
								<li><img
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAAsTAAALEwEAmpwYAAACNUlEQVR4nO2Zu27UQBRAh0cRECH5BUSLoEARX4BEUhDxNSsRVqILElUU0qRBoUGIX6FKSQNRlCq7SLTZoIOG2MRyYnvGM7O+9t4juVjdedw5Gs+1vcYoiqK0ALhvFjlXYAq8qRvcxoDlhPEVh/42x6mJDZf8Bt4Bq4XYPWCUSbLX24TxSUP8HykF5NjJtnLjXGWSxcfAr4r468B45fzzECAaFRAbmslviXHNLRG65evic98B48KhtVU8nbPTOI9PromvFBaSL8wnXhw/r07zFWAuE+myLP6fvxMBklABJfpnuO8CuHg69Loq5mnVV4IAb1zmce3rMnYQvgmoAAdcRLv2lbADRr5XxTyt+nYuoGtUQIm5GyZhyRtEGTQOY/qgAkroDmgQFAwNE6QseVoGHeh8B5hFF0BASWtTJiUKCMJlzrr2LuMF4ZuACvDERXpdewk7YBSzrDWNKU5A10jPLzkqoIRZNIgtAHgGfAKOgBkCSSIAuAm8B/4gnFQC9ugJ0QUAL+kRUQUAt4CfyOcYeA7ciS1gE/mcAY8q8g8WsI98PtfkHyzgEPm8SClginwepBRwhnyWKnK/HUPAhJ7uAOBhqd3pUM+A9YrcN0rtvg21CnypyP1rqd2HoT4FzoDHpbyfXPOyttH2SfAH8jmx5RC4a2+J7HeR7/aFzluABXhF/9k0IQC79JedoMVbgBvZvy/ivwcUOAe2be4mFsAacJCdCxK/CM2y3D4CT6MtXFEURTHD5S+dwCdTx4ClcAAAAABJRU5ErkJggg==">
									<a class="menu-items" href="${path }/orderList">주문내역</a></li>
								<li><img
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAtElEQVR4nO2SMQrCQBBFF1LkCgpa5xzeySvoXRICQdJppwfQyhukU9FYpHxhYQpZyYhm7PbBwMLu/gcz41zEAmAOlEArVQGZZfiVd27+zkJQMkxhIWgVwePfgruFoFIEuYUgk4GGXIDZaMHLJhW+51K5WXhkECABFsAa2AFn4Cnlz1tgJW+Sb4JTYAk0ynqGNPIn/RQ+BU78zhGYaIKa8Ww0QWcg6DSBCU4RHAzy9+qgIy6gBwTxryZ9UBmqAAAAAElFTkSuQmCC">
									<a class="menu-items" href="${path }/selectUserInfo2?userCode=<%=userCodeInfo%>">내정보수정</a></li>
								<li><img
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAABhElEQVR4nO2ZTUrDQBiGQw+gpoqrKCj4d4lurD+n0I2eQd278AaKiB5EULQFEdSlV7D1Bi7MI8FJGQYsGr/50inzwCyyeb/3nSQzky9JEolEIsECzAMtoF1xtAqNOoyvAPfIcQcsa876O/L0gUwjwJVV9APoANcVR8dolFxoBChmqqQtoLdp6fVkXA4vmFsFGwJ6DUsvl3E5vOCAUdb8kRhgTO/ADLADvElp1jJbwIK0ptcAQGr2lTNgQsahboAjS+4BmJRxqRdgy9lXHoEpGadK7wCwD3xass9AU0JbcxXac0K8ANNS+pUCmPP+wR/Gk61trtNaAgBrzoxW5byuAKtBBygA1oFj4OSX43VkHiGhl7gppe81ACEvo8B20BsZcBj6USI1h7nTIA9zLsBi4htPq9AssKvVlfARQFxTtRgeNMc6QB56Y6tvFdwQ+iorUelKXA7KfTdmu/9o7nbraO7OOXdBip5Ke92EWAJuBc3fFJoq5p0gmcAvpkzdeCQSiSRSfAEe/GNDlGJX4gAAAABJRU5ErkJggg==">
									<a class="menu-items" href="${path }/logout">로그아웃</a></li>
							</ul></li>
					</ul>
			
				<!-- 로그인 했을 때 -->
				<ul class="menu-wrap">
					<a href="${path}/selectUserInfo2?userCode=<%=userCodeInfo%>"><li>내정보수정</li></a>
					<span class="menu-bar">|</span>
					<a href="${path }/orderList"><li>주문내역</li></a>
					<span class="menu-bar">|</span>
					<a href="${path }/orderList"><li>알림</li></a>
					<span class="menu-bar">|</span>
					<a href="${path }/zzim"><li>찜</li></a>
					<span class="menu-bar">|</span>
					<a href="${path }/logout"><li>로그아웃</li></a>
				</ul>

			</div>
			<%
			} else {
			%>
			<!-- 로그인 안했을 때 -->
			<ul class="menu-wrap">
				<a href="${path }/login"><li>내정보수정</li></a>
				<span class="menu-bar">|</span>
				<a href="${path }/login"><li>주문내역</li></a>
				<span class="menu-bar">|</span>
				<a href="${path }/orderList"><li>알림</li></a>
				<span class="menu-bar">|</span>
				<a href="${path }/login"><li>찜</li></a>
				<span class="menu-bar">|</span>
				<a href="${path }/login"><li>로그인</li></a>
			</ul>
			<%
			}
			%>

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