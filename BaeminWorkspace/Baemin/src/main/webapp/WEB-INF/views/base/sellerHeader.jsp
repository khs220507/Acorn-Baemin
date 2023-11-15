<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="path" value="<%=request.getContextPath()%>"></c:set>
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
	justify-content: center;
	align-items: center;
	width: 100vw;
	height: 120px;
	background-color: #48D1CC;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 1000;
}
section{
width: 1280px;
padding-top: 140px;
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
#loginStatus {
	flex: 2.5;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: flex-end;
}/* 로그인 안했을 때 */
.login-btn {
	color: white;
	font-size: 30px;
}

/* 로그인 했을때 */
.hello-msg {
	color: white;
}

.menu-wrap-ul {
	position: relative;
}

.menu-icon {
	width: 40px;
	height: 40px;
}

.hidden-menu {
	width: 180px;
	height: 80px;
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
	text-align: center;
	position: relative;
}

.menu-items {
	color: white;
}

.hidden-menu img {
	width: 30px;
	height: 30px;
	position: absolute;
	left: 0px;
	top: -3px;
}


	</style>
    <header>
		<div class="header-wrap">
			<div class="logo">
				<a href="/baemin/sellerHome?sellerCode=<%=session.getAttribute("user")%>">배달의민족<br><span style="font-size: 35px;">사장님</span></a>
			</div>

			<div id="loginStatus">

				<%
				if (session.getAttribute("user") != null) {
				%>
				<p class="hello-msg">
					안녕하세요,
					<%=session.getAttribute("user")%>
					님
				</p>

				<!-- 로그인 했을 때 -->
				<ul class="menu-wrap-ul">
					<li class="menu-wrap"><img class="menu-icon"
						src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAAsTAAALEwEAmpwYAAABMklEQVR4nO3aPU4DMRCGYUuhgZJU/JSEkiwtERULXCDcASQirsE1wm0ioeQWQEcq6HjRaFPR0PBJY/Z7pOnH47VXHrsUMzMzMzMzs18B18ATsACek8Rik9NlUQIegC/yitxmqsEPgU/yixx3FQVoqUerKEBDPU4UBdgCluQXm+LgzwsQgFHyIsTgj4oSMADGwBS4SRLTTU6amTczM+sAh8Ad8JgsIqeDogRcAWvyWsuOxMAO8EZ+L8C2ogDn1GOiKMCEepyplsArfV0CITYY4J28IreLogTsA7cJfns/I3Lakw7ezMz6jq493iRsijbypihwDKzIK1r2I+XMr8hvKfkSgFPqMVYUoKXnl6PDSq7HPyTX4yEeH1TwQOK+KNEdiecJn8jM5UdhMzMzMzMzK//DN5h1UDYzOEebAAAAAElFTkSuQmCC">
						<ul class="hidden-menu">
							<li><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAtElEQVR4nO2SMQrCQBBFF1LkCgpa5xzeySvoXRICQdJppwfQyhukU9FYpHxhYQpZyYhm7PbBwMLu/gcz41zEAmAOlEArVQGZZfiVd27+zkJQMkxhIWgVwePfgruFoFIEuYUgk4GGXIDZaMHLJhW+51K5WXhkECABFsAa2AFn4Cnlz1tgJW+Sb4JTYAk0ynqGNPIn/RQ+BU78zhGYaIKa8Ww0QWcg6DSBCU4RHAzy9+qgIy6gBwTxryZ9UBmqAAAAAElFTkSuQmCC">
								<a class="menu-items" href="${path }/">내정보수정</a></li>
							<li><img
								src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAABhElEQVR4nO2ZTUrDQBiGQw+gpoqrKCj4d4lurD+n0I2eQd278AaKiB5EULQFEdSlV7D1Bi7MI8FJGQYsGr/50inzwCyyeb/3nSQzky9JEolEIsECzAMtoF1xtAqNOoyvAPfIcQcsa876O/L0gUwjwJVV9APoANcVR8dolFxoBChmqqQtoLdp6fVkXA4vmFsFGwJ6DUsvl3E5vOCAUdb8kRhgTO/ADLADvElp1jJbwIK0ptcAQGr2lTNgQsahboAjS+4BmJRxqRdgy9lXHoEpGadK7wCwD3xass9AU0JbcxXac0K8ANNS+pUCmPP+wR/Gk61trtNaAgBrzoxW5byuAKtBBygA1oFj4OSX43VkHiGhl7gppe81ACEvo8B20BsZcBj6USI1h7nTIA9zLsBi4htPq9AssKvVlfARQFxTtRgeNMc6QB56Y6tvFdwQ+iorUelKXA7KfTdmu/9o7nbraO7OOXdBip5Ke92EWAJuBc3fFJoq5p0gmcAvpkzdeCQSiSRSfAEe/GNDlGJX4gAAAABJRU5ErkJggg==">
								<a class="menu-items" href="${path }/logout">로그아웃</a></li>
						</ul></li>
				</ul>

			</div>
			<%
			} else {
			%>
			<!-- 로그인 안했을 때 -->
			<a class="login-btn" href="${path }/login">로그인</a>
			<%
			}
			%>
		</div>
	</header>

</body>
</html>