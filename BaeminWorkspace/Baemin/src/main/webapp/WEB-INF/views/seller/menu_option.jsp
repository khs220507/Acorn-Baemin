<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
/* 해더 */
header {
	background-color: #48D1CC;
	height: 100px;
}

.header-wrap {
	width: 1280px;
	border: 1px solid black;
	height: 100px;
	margin: 0 auto;
}
/* 세션 */
body {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100vh;
}

section {
	width: 1280px;
	flex: 8;
	overflow-y: auto; /*섹션의 내용이 넘치는 경우 스크롤이 가능*/
	-ms-overflow-style: none; /* 스크롤바 없애기 */
}

section::-webkit-scrollbar { /* 스크롤바 없애기 */
	display: none;
}

.menu-img {
	width: 200px;
	height: 200px;
	background-color: purple;
	margin: 20px auto;
	padding: 10px;
}

.menu-name {
	text-align: center;
	margin: 10px auto;
	font-size: 35px;
	margin: 0 auto;
	padding: 20px;
	width: 70%;
	border-top: 1px solid gray;
}

.option-list-wrap {
	width: 70%;
	border: 1px solid black;
	margin: 0 auto;
	padding: 20px 40px 20px 40px;
}

.option-category {
	font-size: 25px;
}

.option-list {
	padding-bottom: 20px;
}

.option-wrap {
	border-bottom: 1px solid gray;
}
.option-category-plus{
width: 50px;
height: 50px;
 background-image: url('src/main/resources/icons /pulsicon.png');
  
}

/* 풋터 */
footer {
	height: 100px;
	background-color: gray;
}
</style>
<script>

	/* */
	    function insertOptoin(Category, SelectType , element) {
    		let menuCode = 40001;
    		let optionSelectType=SelectType;
    		let optionCategory= Category;
				let optionName = $(element).closest('.insert-optoin-wrap').find('.insertOptoinName').val();
				alert(optionName);
       	let optionPrice = $(element).closest('.insert-optoin-wrap').find('.insertOptoinPrice').val();
       	let info = {menuCode : menuCode,
       			optionSelectType : optionSelectType,
       			optionCategory : optionCategory,
       			optionName : optionName,
       			optionPrice : optionPrice};
       	let infos = JSON.stringify(info);
       	
   		$.ajax({
   			type : "POST",
   			url : "/baemin/sellerOptionSolo",
   			data : infos,
   			contentType : "application/json", // 필수
   			success : function(data) {
   				window.location.reload();

   			},
   			error : function() {
   				alert("error");
   			}
   		})
    };
    
	function insertOptionCategory() {
		let menuCode = 40001;
		let optionCategory = $("#optionCategory").val();
       	let optionName = $("#optionName").val();
       	let optionPrice = $("#optionPrice").val();
       	let optionSelectType = $('input[name=optionSelectType]:checked').val();
       	let info = {menuCode : menuCode,
       			optionCategory : optionCategory,
       			optionName : optionName,
       			optionPrice : optionPrice,
       			optionSelectType : optionSelectType};
       	let infos = JSON.stringify(info);
       	
   		$.ajax({
   			type : "POST",
   			url : "/baemin/sellerOption",
   			data : infos,
   			contentType : "application/json", // 필수
   			success : function(data) {
   				window.location.reload();

   			},
   			error : function() {
   				alert("error");
   			}
   		})
	}
	
	function updateSellerOption(Code, element) {
		let optionCode = Code;
		let optionName = $(element).closest('.option-list').find('.upOptionName').val();
	    let optionPrice = $(element).closest('.option-list').find('.upOptionPrice').val();
   	let info = {optionCode : optionCode,
   			optionName : optionName,
   			optionPrice : optionPrice}
   	let infos = JSON.stringify(info);
       	
   		$.ajax({
   			type : "PUT",
   			url : "/baemin/sellerOptionSolo",
   			data : infos,
   			contentType : "application/json", // 필수
   			success : function(data) {
   				window.location.reload();

   			},
   			error : function() {
   				alert("error");
   			}
   		})
	}
	
	function optionupdatecategory(Category, element) {
		let menuCode= 40001;
		let optionCategory = Category;
		let optionName = $(element).closest('.option-category-wrap').find('.upOptionCategoryName').val();
	    
   	let info = {menuCode : menuCode,
   			optionCategory : optionCategory,
   			optionName : optionName}
   	let infos = JSON.stringify(info);
       	
   		$.ajax({
   			type : "PUT",
   			url : "/baemin/sellerOption",
   			data : infos,
   			contentType : "application/json", // 필수
   			success : function(data) {
   				window.location.reload();

   			},
   			error : function() {
   				alert("error");
   			}
   		})
	}
    function optiondelete(optionCode) {
	    $.ajax({
			type: "DELETE",
			url: "/baemin/sellerOptionSolo/"+optionCode, //path Variable  ,
			
			success : function (data){
				window.location.reload();
			},
			error: function() {
				alert( "error");
			}
		});
	}
    function optiondeletecategory(category) {
	    $.ajax({
			type: "DELETE",
			url: "/baemin/sellerOption/"+category, //path Variable  ,
			
			success : function (data){
				window.location.reload();
			},
			error: function() {
				alert( "error");
			}
		});
	}

</script>
<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="header-wrap">해더</div>
	</header>
	<section>
		<div>
			<div>
				<div class="menu-img"></div>
				<div class="menu-name">메뉴선택에서 불러와야함</div>
			</div>
			<div class="option-list-wrap">
				<c:forEach items="${get}" var="item">
					<div class="option-wrap">
						<div class="option-category-wrap">
							<span class="option-category">${item.optionCategory}</span>
							<div>
								<input value="${item.optionCategory}"
									class="upOptionCategoryName">
								<button
									onclick="optionupdatecategory('${item.optionCategory}',this)">저장하기</button>
							</div>
							<button>수정</button>
							<button onclick="optiondeletecategory('${item.optionCategory}')">삭제</button>
						</div>
						<c:forEach items="${list}" var="items">
							<c:if test="${item.optionCategory eq items.optionCategory}">
								<c:choose>
									<c:when test="${items.optionSelectType eq 1 }">
										<div class="option-list">
											<input type="radio" name="${item}"> <span>${items.optionName}</span>
											<span>${items.optionPrice}</span>
											<button>수정</button>
											<button onclick="optiondelete(${items.optionCode})">삭제</button>
											<div class="updatae-but-wrap">
												<input value="${items.optionName}" class="upOptionName">
												<input value="${items.optionPrice}" class="upOptionPrice">
												<button
													onclick="updateSellerOption(${items.optionCode},this)">저장하기</button>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="option-list">
											<input type="checkbox" name="${item}"> <span>${items.optionName}</span>
											<span>${items.optionPrice}</span>
											<button>수정</button>
											<button onclick="optiondelete(${items.optionCode})">삭제</button>
											<div class="updatae-but-wrap">
												<input value="${items.optionName}" class="upOptionName">
												<input value="${items.optionPrice}" class="upOptionPrice">
												<button
													onclick="updateSellerOption(${items.optionCode},this)">저장하기</button>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
						<div>
							<button>추가</button>
						</div>
						<div class="insert-optoin-wrap">
							<input class="insertOptoinName"> <input
								class="insertOptoinPrice">
							<button
								onclick="insertOptoin( '${item.optionCategory}' , ${item.optionSelectType}, this)">추가하기</button>


						</div>
					</div>

				</c:forEach>
				
					<div class="option-category-plus"></div>
				
				<div>
					<input type="text" placeholder="옵션분류" id="optionCategory">
					<label><input type="radio" name="optionSelectType"
						value="1">단일선택</label> <label><input type="radio"
						name="optionSelectType" value="0">복수선택</label> <br> <input
						type="text" placeholder="옵션명" id="optionName"> <input
						type="text" placeholder="가격" id="optionPrice"> <br>
					<button onclick="insertOptionCategory()">추가하기</button>
				</div>
			</div>
		</div>

	</section>
	<footer> </footer>
</body>
</html>