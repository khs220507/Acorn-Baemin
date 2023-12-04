<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set  var="path" value="<%=request.getContextPath() %>"></c:set>

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


/* 세션 */
body {
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100vh;
}


/* 인풋 */
section input {
  border: 2px solid #d9d9d9;
  /* border-radius: 10px; */
  outline: none;
  padding-left: 10px;
}
.insert-optoin-wrap input{
height: 30px;
}


#optionCategory, .upOptionCategoryName{
font-size:25px;
width: 160px;
height: 40px;
}
#optionCategory{
margin-bottom: 10px; 
}
.upOptionName, .upOptionPrice, #OptionName, #OptionPrice{
height: 30px;
}
.upOptionName{
width: 160px;
}
.upOptionPrice, .insertOptoinPrice{
width: 100px;
}
.option-list select{
  border: 2px solid #d9d9d9;
  border-radius: 10px;
  outline: none;
  padding-left: 10px;
  height: 30px;
  margin-right: 40%;
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
	border-top: 1px solid gray;
}

.option-list-wrap {
	width: 75%;
	margin: 0 auto;
	padding: 20px 40px 20px 40px;
}

.option-category {
	font-size: 25px;
}

.option-list {
	padding: 10px 20px;
}
.option-plus-v1{
margin: 10px 38px;
}

.option-wrap {
	border-bottom: 2px solid gray;
	padding-bottom: 20px; 	
	margin-bottom: 20px;
}
.option-category-plus{
width: 50px;
height: 50px;
 background-image: url('src/main/resources/icons /pulsicon.png');
  
}

.option-category-plus-v1{
width: 60px;
margin: 20px auto;
}
.option-category-plus-v2{
padding: 10px 0px;
position: relative;
display: none;
}

.option-category-xbut, .option-xbut{
position: absolute;
right: 30px;
width: 20px;
top: 0px;
height: 20px;
}
.insert-optoin-wrap{
margin: 0 auto;
position: relative;
display: none;
padding: 10px 38px;
}

.option-category-wrap{
padding-bottom: 20px; 
display: flex;
align-items: center;
}
.option-category-wrap button{
margin-left: 10px;
width: 60px;
height: 30px;
}

/* 버 튼 */
section button{
 	border: none;
 	background-color: #d9d9d9;
 	padding: 5px 10px;
 	
}
.option-category-wrap button{
font-size: 20px;
border-radius: 10px;

}
.option-list button{
font-size: 15px;
border-radius: 5px;
}
.insert-optoin-wrap button{
font-size: 15px;
border-radius: 5px;
}
.option-plus-v1 button {
font-size: 20px;
background-color: white;
border: 2px solid #d9d9d9;
box-sizing: border-box;
width: 160px;
}
.insertOptoin{
background-color: #d9d9d9!important;
border: none!important;
}
.option-category-plus-v2 button {
	position: absolute;
    right: 50px;
    bottom: 15px;
    width: 100px;
    height: 30px;
    font-size: 15px;
    border-radius: 10px;
}
/* 반응형 */

/* 중간화면 */
@media (max-width:1280px) {
	.option-list-wrap{
		width: 75vw;
	}
	

	
}
/* 작은 */
@media (max-width:767px) {
	.option-list-wrap{
	width: 100vw;
	}
	.option-list select {
	margin-right: 20%;
	}
}
</style>
<script>

	/* 옵션 추가*/
	    function insertOptoin(Category, SelectType , element) {
    		let menuCode = ${menuCode};
    		let optionSelectType=SelectType;
    		let optionCategory= Category;
				let optionName = $(element).closest('.insert-optoin-wrap').find('.insertOptoinName').val();
       	let optionPrice = $(element).closest('.insert-optoin-wrap').find('.insertOptoinPrice').val();
       	let info = {menuCode : menuCode,
       			optionSelectType : optionSelectType,
       			optionCategory : optionCategory,
       			optionName : optionName,
       			optionPrice : optionPrice};
       	let infos = JSON.stringify(info);
       	
   		$.ajax({
   			type : "POST",
   			url : "${path}/sellerOptionSolo",
   			data : infos,
   			contentType : "application/json", // 필수
   			success : function(data) {
   				alert("옵션이 추가되었습니다.");
   				window.location.reload();

   			},
   			error : function() {
   				alert("error");
   			}
   		})
    };
    /* 옵션 카테고리 추가*/
	function insertOptionCategory() {
		let menuCode = ${menuCode};
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
   			url : "${path}/sellerOption",
   			data : infos,
   			contentType : "application/json", // 필수
   			success : function(data) {
   				alert("옵션이 추가되었습니다.");
   				window.location.reload();

   			},
   			error : function() {
   				alert("error");
   			}
   		})
	}
	
	/* 옵션 수정*/
	function updateSellerOption(Code, element) {
		let optionCode = Code;
		let optionName = $(element).closest('.option-list').find('.upOptionName').val();
	    let optionPrice = $(element).closest('.option-list').find('.upOptionPrice').val();
	    let optionStatus = $("#" + Code).val();
   	let info = {optionCode:optionCode,
   			optionName:optionName,
   			optionPrice:optionPrice,
   			optionStatus:optionStatus}
   	let infos = JSON.stringify(info);
       	
   		$.ajax({
   			type : "PUT",
   			url : "${path}/sellerOptionSolo",
   			data : infos,
   			contentType : "application/json", // 필수
   			success : function(data) {
   				alert("옵션이 수정되었습니다.");
   				window.location.reload();

   			},
   			error : function() {
   				alert("error");
   			}
   		})
	}
	/* 옵션 카테고리 수정*/
	function optionupdatecategory(Category, element) {
		let menuCode= ${menuCode};
		let optionCategory = Category;
		let optionName = $(element).closest('.option-category-wrap').find('.upOptionCategoryName').val();
	    
   	let info = {menuCode:menuCode,
   			optionCategory:optionCategory,
   			optionName:optionName}
   	let infos = JSON.stringify(info);
       	
   		$.ajax({
   			type : "PUT",
   			url : "${path}/sellerOption",
   			data : infos,
   			contentType : "application/json", // 필수
   			success : function(data) {
   				alert("옵션이 수정되었습니다.");
   				window.location.reload();

   			},
   			error : function() {
   				alert("error");
   			}
   		})
	}
	/* 옵션 삭제*/
    function optiondelete(optionCode) {
    	if(confirm("정말 옵션을 삭제 하시겠습니까?")){
	    $.ajax({
			type: "put",
			url: "${path}/sellerOptionDSolo/"+optionCode, //path Variable  ,
			
			success : function (data){
				alert("옵션이 삭제되었습니다.");
				window.location.reload();
			},
			error: function() {
				alert( "error");
			}
		});
	}}
    /* 옵션 카테고리 삭제*/
    function optiondeletecategory(category) {
    	if(confirm("정말 옵션을 삭제 하시겠습니까?")){
	    $.ajax({
			type: "PUT",
			url: "${path}/sellerOptionD/" + ${menuCode} + "/" + category, 
			
			success : function (data){
				alert("옵션이 삭제되었습니다.");
				window.location.reload();
			},
			error: function() {
				alert( "error");
			}
		});
	}}

    
    $(document).ready(function() {
   	 //	let originalData;
   	 	$(".option-category-plus-v1").click(function() {
   			$(".option-category-plus-v1").css("display","none");
           	$(".option-category-plus-v2").css("display","block");
			})
			
        $(".option-category-xbut").click(function(){
        	$(".option-category-plus-v1").css("display","block");
        	$(".option-category-plus-v2").css("display","none");
        });	
        $(".option-xbut").click(function(){
        	$("#"+${Category}-v1).css("display","flex");
        	$("#"+${Category}-v2).css("display","none");
        });

          
           
       });
    function optionPlus(key){
    	$("#"+key+"-v1").css("display","none");
       	$("#"+key+"-v2").css("display","block");
    }
    function optionPlusX(key){
    	$("#"+key+"-v1").css("display","flex");
    	$("#"+key+"-v2").css("display","none");
    }
 
    
	function funoptionStatus(Status) {
		if (Status == 0){
			 document.write("공개");
		}else if (Status == 1) {
			 document.write("비공개");
	}
	}
	
	function refunoptionStatus(Status) {
		if (Status == 0){
			document.write("비공개");
		}else if (Status == 1) {
			document.write("공개");
	}
	}
	
	function renofunoptionStatus(Status) {
		if (Status == 0){
			document.write(1);
		}else if (Status == 1) {
			document.write(0);
	}
	}
	
	
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../base/sellerHeader.jsp"/>
	
	<section id="content">
		
			<div>
				<div class="menu-img"><img alt="메뉴 사진" src="${path}/images/${MenuInfo.menuImage}"></div>
				<div class="menu-name">${MenuInfo.menuName}</div>
			</div>
			<div class="option-list-wrap">
				<c:forEach items="${get}" var="item">
					<div class="option-wrap">
						<div class="option-category-wrap">
							<input value="${item.optionCategory}" class="upOptionCategoryName">
							<button onclick="optionupdatecategory('${item.optionCategory}',this)">수정</button>
							<button onclick="optiondeletecategory('${item.optionCategory}')">삭제</button>
						</div>
						<c:forEach items="${list}" var="items">
							<c:if test="${item.optionCategory eq items.optionCategory}">
								<c:choose>
									<c:when test="${items.optionSelectType eq 1 }">
										<div class="option-list">
											<input type="radio" name="${item}"> 
											<input value="${items.optionName}" class="upOptionName">
											<input value="${items.optionPrice}" class="upOptionPrice">
											<select name="upoptionStatus" id="${items.optionCode }">
												<option value="1" ${items.optionStatus eq '1' ? 'selected' : ''}>비공개</option>
                        						<option value="0" ${items.optionStatus eq '0' ? 'selected' : ''}>공개</option>
											</select>
											<button onclick="updateSellerOption(${items.optionCode},this)">수정</button>
											<button onclick="optiondelete(${items.optionCode})">삭제</button>
											
											
										</div>
									</c:when>
									<c:otherwise>
										<div class="option-list">
											<input type="checkbox" name="${item}"> 
											<input value="${items.optionName}" class="upOptionName">
											<input value="${items.optionPrice}" class="upOptionPrice">
											<select name="upoptionStatus" id="${items.optionCode }" >
												<option value="1" ${items.optionStatus eq '1' ? 'selected' : ''}>비공개</option>
                        						<option value="0" ${items.optionStatus eq '0' ? 'selected' : ''}>공개</option>
											</select>
											<button onclick="updateSellerOption(${items.optionCode},this)">수정</button>
											<button onclick="optiondelete(${items.optionCode})">삭제</button>

											
										</div>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forEach>
							<div class="option-plus-v1" id="${item.optionCategory}-v1">
								<button onclick="optionPlus('${item.optionCategory}')">옵션추가하기</button>
							</div>
							<div class="insert-optoin-wrap" id="${item.optionCategory}-v2">
								
								<input placeholder="옵션명" class="insertOptoinName"> <input placeholder="가격" class="insertOptoinPrice">
								<button class="insertOptoin" onclick="insertOptoin( '${item.optionCategory}' , ${item.optionSelectType}, this)">추가하기</button>
								<button onclick="optionPlusX('${item.optionCategory}')">취소</button>
							</div>
						
					</div>

				</c:forEach>
				
					<div class="option-category-plus-v1"><img src="${path}/resources/icons/addoption.png"/></div>
				
				<div class="option-category-plus-v2">
					<img class="option-category-xbut" src="${path}/resources/icons/optionxbut.png">
					<input  type="text" placeholder="옵션분류" id="optionCategory">
					<label><input type="radio" name="optionSelectType" value="1">단일선택</label> 
					<label><input type="radio" name="optionSelectType" value="0">복수선택</label> <br> 
					<input type="text" placeholder="옵션명" id="optionName"> 
					<input type="text" placeholder="가격" id="optionPrice"><br>
					<button onclick="insertOptionCategory()">추가하기</button>
				</div>
			</div>
	

	</section>
<jsp:include page="../base/footer.jsp"/>
</body>
</html>

