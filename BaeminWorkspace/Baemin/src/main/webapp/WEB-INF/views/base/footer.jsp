<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
/* 푸터  ////////////////////////////////////////////////////*/
footer {
	width: 97vw;
	height: 80px;
	border-top: 1px solid #d9d9d9;
	margin-top: 20px;
	padding-top: 20px;
	padding-left: 10px;
	padding-bottom: 5px;
	position: fixed;
	bottom: 0;
}

p {
	font-size: 13px;
	color: #4B4B4B;
}
.copyright{
	width:10px;
	height: 10px;
}
</style>

<footer id=footer>
	<div class="footer-info-wrap">
		<p><img class="copyright" src="https://cdn-icons-png.flaticon.com/512/74/74717.png">
		2023. Icons8 LLC all rights reserved.</p>
		<p><img class="copyright" src="https://cdn-icons-png.flaticon.com/512/74/74717.png">
		2010-2023 Freepik Company S.L. all rights reserved.</p>
		<p>곽단야, 김민지, 김현수, 박태민, 표준태</p>
	</div>

</footer>

<script>
	// 문서의 높이를 조절하는 함수
	function adjustDocumentHeight() {
		var contentHeight = document.getElementById('content').offsetHeight;
		var windowHeight = window.innerHeight;
		var footerHeight = document.getElementById('footer').offsetHeight;

		if (contentHeight + footerHeight < windowHeight) {
			// 내용이 적을 때
			document.getElementById('footer').style.position = 'fixed';
		} else {
			// 내용이 많을 때
			document.getElementById('footer').style.position = 'static';
		}
	}

	// 페이지 로드 시와 창 크기 변경 시에도 호출
	window.onload = adjustDocumentHeight;
	window.onresize = adjustDocumentHeight;
</script> --%>