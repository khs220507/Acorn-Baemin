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

/* 헤더 ////////////////////////////////////////////////////*/
header {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 99vw;
	height: 140px;
	background-color: white;
	position: fixed;
	top:0;
	left:0;
	z-index: 99999;
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

.info-wrap {
	flex: 5;
}

.address-wrap {
	width: 400px;
	display: flex;
	margin: 0 auto;
	justify-content: center;
	align-items: center;
	border-bottom: 3px solid black;
	padding-bottom: 5px;
}

.address-wrap p {
	flex: 5;
	color: black;
	font-size: 18px;
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
	width: 410px;
	height: 40px;
	display: flex;
	align-items: center;
	background-color: white;
	border: 2px solid black;
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

.menu-bar {
	color: #d9d9d9;
	margin: 10px;
	font-size: 20px;
}

/* 카카오맵 모달 */
.kakao-map-modal {
	position: fixed;
	background-color: rgba(0, 0, 0, 0.4);
	top: 0;
	left: 0;
	height: 100vh;
	width: 100%;
	z-index: 999;
	display: none;
}

.kakao-map-modal-content {
	background-color: white;
	width: 700px;
	height: 600px;
	border-radius: 10px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 20px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
	text-align: center;
}

.close-btn img {
	width: 20px;
	height: 20px;
	position: absolute;
	top: 10px;
	right: 10px;
}

.kakao-map-wrap {
	width: 600px;
	height: 500px;
	margin: 0 auto;
	position: relative;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 999;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.set-address-btn {
	width: 600px;
	height: 50px;
	background-color: #48D1CC;
	border: none;
	border-radius: 10px;
	color: white;
	font-size: 18px;
	margin-top: 10px;
}
/* 슬라이더 ////////////////////////////////////////////////////*/
.slider-all-wrap {
	width: 100vw;
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	padding-top: 140px;
}

.slider-wrap {
	width: 99.5vw;
	height: 80%;
	position: relative;
	overflow: hidden;
}
.slider-box {
	width: 100%;
	height: 100%;
	position: relative;
}

.slider-img {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
  	left: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

.slider-img img {
	width: 100%;
	height: 100%;
	object-fit: fill;
	position: relative;
}

.pager {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 20px;
	display: flex;
	justify-content: center;
	gap: 20px;
	z-index: 1;
}

.pager a {
	width: 15px;
	height: 15px;
	background: rgba(0, 0, 0, .2);
	display: flex;
	border-radius: 50%;
	text-indent: -9999em;
}

a.active {
	background: #000;
}

.category-title {
	margin-top: 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
}
.category-title h2{
	font-size: 40px;
}
/* 섹션  ////////////////////////////////////////////////////*/
section {
	width: 1280px;
	display: flex;
	align-items: center;
	margin-bottom: 50px; /* 여분의 여백으로 풋터가 바닥에 유지되도록 설정*/
	margin: 0 auto;
}

table {
	width: 100%;
	height: 100%;
	text-align: center;
	display: flex;
	justify-content: center;
	margin-bottom: 40px;
	margin-top: 20px;
}

.category {
	width: 150px;
	height: 150px;
	border-radius: 10px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: 10px auto;
	border: 2px solid black;
}

td {
	width: 300px;
}

td img {
	width: 80px;
	height: 80px;
}
.category p{
	font-size: 18px;
	color: black;
}
/* 배민 폰트*/
@font-face {
font-family: 'BMHANNAPro';
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.0/BMHANNAPro.woff') format('woff');
font-weight: normal;
font-style: normal;
}

</style>
</head>
<body>
	<header>

		<div class="header-wrap">
			<div class="logo">
				<img class="rider-img" src="${path}/resources/icons/배민캐릭터로고.png">
				<a href="/baemin/home">배달<span class="small-font">의</span>민족
				</a>
			</div>

			<div class="wrap-menu-address">
				<div class="address-wrap">
					<p id="address">회원 기본 설정 주소</p>
					<img class="down-arrow-icon"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAABB0lEQVR4nO3XPyvFURzH8RciUVJKGZTBcDeLxWKyeAAmT4AnwKp4AEx3tpksNoPJYjEowx0MyqDoppTkT9fyGwzy597z+6fvq854Ou/PeAghhBBCCP/aFp7QKfg8ZW/3rF1CfCc79ykGNEsc0EwxYBjnJcRfYEQis3goMP4RDYmtFDhgVU72CojflaNBnOYYf4YhOZvGXQ7xbcwoyBLeEsa/Y1nBdhIO2FaCfhwniD/BgJJM4qaH+FtMKdkCXrqIf8WiitjsYsCGCunD4R/ij7I7lTKOq1/EX2NCRc398Pl5xryKW/9mwJqa2P8i/kCNjOLyU3wLY2qmkYW38vichBBCCCEE9fcBzZeL0obnNdUAAAAASUVORK5CYII=">
					<img class="map-icon"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAACXBIWXMAAAsTAAALEwEAmpwYAAADlUlEQVR4nO2YTUgVURTH/5op5WdRZErYpqSUonLTJ7V+lfa5qJ2rItr5fLQpSjOCIAyhhD72GURFm8zCImhnC8U+oLKEvqW0sojeixP/gdvjzcydefPuDOEPLgzv3PO/d94999w7B5ji/6cWQALAbQDDAL6yyXMvgFYAixFhGgD0AUhpNnnRVYgQ0wF0AUhygp8AnAewlatTzCbPjQAusE+KPmcAFIT9ErMA3OGkvgFoA1Cm4Sd92gF8V1anAiGuhBVKowwtrywH8JIa/QAKEQJdnMArAFVZ6Ijva2p1wjANjG8JpxUB6K1kmP3mszGskJI9ERTHqSkp2gi1SnZy2tib+cJyhkzwOebQvxzAGLUXwQAJDiZp1I52h/PDaRUvsU8cBujlYHIm2K2E2H8AaAEwny3O31IOK7ON9lswwBMOZnfNsM4VeYl0WmmTMHMK28cwwAQHK3GxV2awVdI2buNbQrto5BzrNJ5hYx+nXcIpnWravtj4Fiu3hJwzysFqXFJz3CFR2IXWQtrlgMw5/S4bNqZs9lae3FV8iZ8uvltovwsDdHIwSbF2tPlMvx3scxoG2MHBhlz6xRhCE5oHojBMbUnDOadMCZH6AHWXUVO0S2GImxz0aICax6h5AwbZzUGfAsgPQE80nlFzFwxSBOAtB5ZP2mxppNYbahvlEAe/H4DWA2olEAKy6T9zAquz0FmrnPYVCIlTnMTVLDSuU+MkQqSady/57F3jw3+dcrfKdDczivWJ+hBAns+9Iak3dEqZbWRC2z347aTPO81amBH2K+eKTvosYl/x2YcIUQBg0EOYWJfKQRPl0jwAz10K0RvTNm6Sd6U6B9169pG+m9LScNJhrBEfe/Av6zUq6un/6EVl40+zuYpYG1wK3RbS95HGeDInz5yjs2QlXWYDeE+/AxnsB2n7CGCOB90O+smcPFGolP6dwiQTe5WTeoHye43yPb/Ho2adUhT0VOhuouMA/HGF/vcYNvlKmeiaT80Bl3paRnocalM6zOX5IBqHARzh8wcA83xqtlDjsq6D1GAnWRmXK4hfrKrhL7ZsP2GrOadJztGVZpeSjZ+EIe1sAHp91GoOvLMLM1mkGOJztjTr/smel0+DJWxBUK4b9nG+sWz2qNKjk4is01XSb1RpcjsalrLDWBgFAA8U8mZgW1c7QWM3ok835ypXl3+QW+ULjUtb1NpIel1tQwQm5bfJ3KdA1PgDYpWe90NC9SoAAAAASUVORK5CYII=">
				</div>

				<!-- 로그인시 -->
				<div id="loginStatus">


					<%
					Integer userCodeInfo = (Integer) session.getAttribute("userCode");
					if (userCodeInfo != null) {
					%>
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

	<!-- 카카오맵 모달 -->
	<div class="kakao-map-modal">
		<div class="kakao-map-modal-content">
			<a class="close-btn" href=""><img
				src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAyklEQVR4nO2WQQ6DMAwE+QSofUgkr+T8/xBO5dDnUFE4tBEE27iKRFkpJ7JM7JAlTXPpLwWgA9Avo7P6iSiJ/czcAngAGKdBRM8Y410KNfsxV/k2fZgHycqnOcvc3J9MYAl8CyoGc9aq7AWrbdvzhBBuu2At3A2qgbtDhfs2lJ5ZjuGXSlW5V2qFu0Kl8J9ApWBNwrm32g3Oho/rMBw1jhMLwsESr0VpEskNzoYYdIGj1m8RtS4CvHJ10STSIT/mlSfVZc3Rf+kcegEOjsATVQE+UwAAAABJRU5ErkJggg=="></a>
			<div class="kakao-map-wrap">
				<div class="hAddr">
					<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
				</div>
			</div>
			<button class="set-address-btn">
				<strong>이 위치로 주소 설정</strong>
			</button>
		</div>
	</div>

	<div id="content">
		<!--슬라이더박스-->
		<div class="slider-all-wrap">
			<div class="slider-wrap">
				<div class="pager">
					<a href="#slide2">2</a> <a
						href="#slide3">3</a> <a href="#slide4">4</a> <a href="#slide5">5</a>
					<a href="#slide7">7</a>
				</div>


				<ul class="slider-box">
					<li class="slider-img" id="slide2"><img
						src="${path}/resources/images/slider3.png"></li>
					<li class="slider-img" id="slide3"><img
						src="${path}/resources/images/slider2.jpg"></li>
					<li class="slider-img" id="slide4"><img
						src="${path}/resources/images/slider4.jpg"></li>
					<li class="slider-img" id="slide5"><img
						src="${path}/resources/images/slider5.jpg"></li>
					<li class="slider-img" id="slide7"><img
						src="${path}/resources/images/slider7.png"></li>
				</ul>
			</div>
			<div class="category-title">
				<h2>MENU</h2>
				<form class="search-wrap" action="${path }/search" method="get"
			onsubmit="return validateForm()">
			<input type="text" name="searchTerm">
			<button class="search-btn" type="submit">
				<img
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAADBElEQVR4nO1YzWsTQRQfFb1Z1Ioaj+rJq1Q9W8281NpaMOhB6sG/olUQeq34PwiibW+1Z7+gaJJ5m30vhsZPBKFFb3qsVSJvE7Q7u5UknU0b2R8MISTz2/dm3sfvrVIpUqRI0bMYXCr258iMA5tZIIPAZlmTWZXP5vdZ+T1bfXlAbSdkq94JzWYGGNeAsd7CWtOMj+A1Ht9Sw/PV6h5NeA8Yf7RoeGg1bgfvnkLcvSXhAoxPOzE84gjj4gWiQ10zfhjxIJB5H2sQoacJJ6BcGtCIGTld+cz65rRmnNSM5XhHzDvh7VLYmBcxhr8B8i61wqG5NKIZ38Y48izxcGrGvG38/EhtcW87PPJ/YLMQDScznWi1iSQs4fyden1nJ3yyz3ZCk1m9WCkdc299cPVBqQyFTbsnbwMKhT6Jf4v3oUqo6oTqfJZw2AW3ZjNq94nBpWK/colGhw1XG5f8kerke9dd8qtAHoRiFScc89+yknnGJb9qaJl1J1QuDbjkHyI8Y91wzSW/AsaV9Q84V3l12CX/ec87anXn7y75VVO3/HmANDSX/MIHViIrxzG6HDohxEySNwCEXxLNAdE2ieYAYzXZKsQ46ZJfs7ltdeQHvdMH6vUdQIbC/OamcgkZA+1OLKrSBTf4OGbroaFq8YhKWgsFkrhQ6NsM56jv79OEHyze+yoJyAxrl1PN5nGnajQ/N7dL9tunD+XySZUUZIaNmaYW2r2J4OQt46GxplSSCEZEwudxI2GugpdbSlgfxzThx7jRMkdmXHVlJrY1/N/49UWYSV2X5hSMoIgZYDwbCDa72kT3/wQqXUvcCdHrms2TfxnT6dLihGs5vWE4sZm2E7tlQxv7poDxRmA0h7VQV25CIDOsjIGtvpkTw6VUrq82YixE93fPiYYjlf1y9UG/IKwB4zdN5hew+SraRuSBdNiNmhRsByc2C6hgPtrxu5QTrgD/hRNsrvS+ExSfE/IaRvUKcuRdjThB+Fn1EnJRJ1ZUr0EHb+/MJzl9V3NIihQpUijn+A1qcPW2rNhwowAAAABJRU5ErkJggg==">
			</button>
		</form>
			</div>
		</div>

		<!--섹션-->

		<section>

			<table>
				<c:forEach var="category" items="${categories}" varStatus="status">
					<c:if test="${status.index % 4 == 0}">
						<tr>
					</c:if>

					<td>
						<div class="category">
							<a class="category-wrap-a"
								href="${path}/storeList?storeCategory=${category}"> <img
								src="${path}/resources/icons/${category}.png">
								<p>
									<strong>${category}</strong>
								</p>
							</a>
						</div>
					</td>

					<c:if test="${status.index % 4 == 3 or status.last}">
						</tr>
					</c:if>
				</c:forEach>
			</table>

		</section>
	</div>

	<%@ include file="../base/footer.jsp"%>

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



	<!-- 카카오맵-->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac76afb73e017bb01fa395c302f99e21&libraries=services"></script>
	<script type="text/javascript">
		var locPosition;

		// 카카오맵 모달 띄우기
		$(".map-icon").click(function() {
			$(".kakao-map-modal").fadeIn();
			map.relayout();
			map.setCenter(locPosition);
		});

		// x버튼 누르면 모달 닫기
		$(".close-btn").click(function() {
			$(".kakao-map-modal").fadeOut();
		});

		// '이 위치로 주소 설정' 버튼 누르면 모달 닫기
		$(".set-address-btn").click(function() {
			$(".kakao-map-modal").fadeOut();

			// 지도에서 선택한 주소로 헤더에 보여주기
			$("#address").html(getAddress);
		});

		var container = document.querySelector('.kakao-map-wrap'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 1
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

		/////////////////geolocation API/////////////////
		//map.html

		// 위도 경도 가져오기
		var lat;
		var lon;

		function currentLocation() {
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
			if (navigator.geolocation) {

				// GeoLocation을 이용해서 접속 위치를 얻어옵니다
				navigator.geolocation
						.getCurrentPosition(function(position) {

							lat = position.coords.latitude, // 위도
							lon = position.coords.longitude; // 경도

							// alert("위도: "+lat+" ,경도: "+lon);

							locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
							var message = '<div style="padding:5px; position:relative; bottom:5px;">현위치</div>'; // 인포윈도우에 표시될 내용입니다

							// 마커와 인포윈도우를 표시합니다
							displayMarker(locPosition, message);
						});
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

				locPosition = new kakao.maps.LatLng(37.4812845080678,
						126.952713197762),
						message = '현재 위치를 알 수 없어 기본 위치로 이동합니다.'

				currentLatLon['lat'] = 33.450701
				currentLatLon['lon'] = 126.570667

				displayMarker(locPosition, message);
			}
			return true
		}

		currentLocation();

		////////////////////////// 현위치에 마커와 인포윈도우 표시하기////////////////////////////
		//map.html
		function displayMarker(locPosition, message) {

			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
			var imageSize = new kakao.maps.Size(24, 35);

			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition,
				image : markerImage,
			});

			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시합니다
			infowindow.open(map, marker);

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);

		}

		////////////////////////// 좌표 주소값 가져오기 ////////////////////////////

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다

		let getAddress;
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result,
					status) {
				if (status === kakao.maps.services.Status.OK) {
					getAddress = result[0].road_address.address_name;
					var detailAddr = !!result[0].road_address ? '<div>'
							+ getAddress + '</div>' : '';

					var content = '<div class="bAddr">'
							+ '<span class="title">도로명 주소정보</span>'
							+ detailAddr + '</div>';

					// 마커를 클릭한 위치에 표시합니다 
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);

					// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					infowindow.setContent(content);
					infowindow.open(map, marker);
				}
			});
		});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}
			}
		}

		/////////////////////// 슬라이더 //////////////////////////////
	
		let slideWrapper = $('.slider-wrap'), slides = slideWrapper.find('li'), currentIdx = 0,
        timer = undefined,
        pager = slideWrapper
				.find('.pager a');

		// 슬라이드 배치
		slides.each(function(idx) {
		  let leftValue = idx === 0 ? '0%' : '-100%';
		  $(this).css({
		    left: leftValue
		  });
		});
		

		// 페이저 슬라이드 작동시키기
		pager.click(function(e) {
			e.preventDefault();
			let idx = $(this).index();
			moveSlide(idx);
		});

		function moveSlide(i) {
			if (currentIdx === i)
				return;

			let currentSlide = slides.eq(currentIdx);
			let nextSlide = slides.eq(i);
			// 다음슬라이드 순간 left 100%, animate 0
			// 현재슬라이드 순간  animate -100%
			nextSlide.css({
				left : '100%'
			}).animate({
				left : '0%'
			});
			currentSlide.animate({left : '-100%'});

            currentIdx = i;

            // 모든페이저에서 active제거 현재 번호에 맞는 요소에 active추가
            pager.removeClass('active');
            pager.eq(currentIdx).addClass('active');
		}

        function autoSlide(){
            if(timer == undefined){
                timer = setInterval(() => {
                let ni = currentIdx +1;
                if(ni=== slides.length){
                    ni = 0;
                }
                moveSlide(ni);
            }, 3000);
            }       
        }
        autoSlide();
        slideWrapper.mouseenter(function(){
            clearInterval(timer);
            timer = undefined;
        })
        .mouseleave(function(){
            autoSlide();
        })


	</script>

</body>
</html>