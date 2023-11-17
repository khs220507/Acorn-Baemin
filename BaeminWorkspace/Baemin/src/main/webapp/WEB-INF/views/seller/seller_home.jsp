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
/* 태그 파트 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
input, option, select{
font-family: '';
}
a {
	text-decoration: none;
}

header {
	background-color: #48D1CC;
	height: 100px;
}

section{

}

footer {
	height: 100px;
	background-color: gray;
}

button {
	outline: none;
	cursor: pointer; /* 손가락모양 */
}

/* 세션 */
.section-line {
	width: 100%;
	height: 50px;
	margin: 0 auto;
	border-bottom: 2px solid gainsboro;
}
.section-line div{
width: 1280px;
margin: 0 auto;
font-size: 25px;
font-weight: bolder;
}

.section-wrap {
	margin: 0 auto;
	width: 75%;
}

.store-list {
	padding: 20px;
	display: flex;
	border-bottom: 1px solid gray;
}


.store-img-wrap {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;

}

.store-img {
	width: 100px;
	height: 100px;
}
.store-img img{
width: 100px;
}

.store-info-wrap {
	flex: 4;
	display: flex;
	align-items: center;
}

.store-info, .store-info2 {
	padding: 10px;
	flex: 1;
	font-weight: bolder;
}

.store-but-wrap {
	display: flex;
	justify-content: center;
	align-items: center;
	flex: 1;
}

.store-but {
	display: flex;
	width: 110px;
	justify-content: space-between;
}

.store-but div {
	padding: 5px;
	text-align: center;
	background-color: gainsboro;
	width: 50px;
	border-radius: 5px;
	cursor: pointer;
}

.store-plus {
	padding: 20px 20px 20px 20px;
	border-bottom: 1px solid gray;
	display: none;
}

.store-updata {
	padding-right: 20px;
	width: 100%;
}

.store-updata h2 {
	text-align: center;
	padding: 30px;
}

.store-plus-out {
	text-align: right;
	font-size: 30px;
	cursor: pointer;
}

.store-plus-info {
	width: 420px;
	margin: 0 auto;
	text-align: right;
	padding: 5px;
}

.store-plus-info span, .store-updata span {
	font-size: 20px;
	font-weight: bolder;
}

.store-plus div input, .store-updata div input, .store-plus div select, .store-updata div select {
	height: 35px;
	margin-left: 15px;
	width: 250px;
}

.store-plus-but, .store-plus-but {
	margin: 20px auto 20px auto;
	padding: 5px;
	
	width: 100px;
	border-radius: 10px;
	background-color: gainsboro;
	justify-content: center;
	
}
.store-plus-but-wrap, .store-plus-but-wrap{
	width: 100%;
	display: flex;
}
.plus-but {
	height: 150px;
	border-bottom: 1px solid gray;
	display: flex;
	justify-content: center;
	align-items: center;
}
.plus-but img {
width: 100px;
}



#updateForm{
display: flex;
margin: 0 auto;
}


.section-wrap, .store-img-wrap, .store-img, .store-info-wrap,
	.store-info, .store-info2, .store-but-wrap, .store-but, .store-plus,
	.store-plus-img {
	
}
/* 풋터 */
</style>
<script>

	
	
    $(document).ready(function() {
    	 //	let originalData;
    	 	$("#store-plus-out").click(function() {
    			$("#store-plus").css("display","none");
            	$("#plus-but").css("display","flex");
			})
            $("#plus-click").click(function(){
            	$("#store-plus").css("display","block");
            	$("#plus-but").css("display","none");
            });
           
            
        });
    	//post
    	function plusclick2() {
             	$("#store-plus").css("display","none");
             	$("#plus-but").css("display","flex");
             	let formData = new FormData(document.getElementById('myForm'));
             	
         		$.ajax({
         			type : "POST",
         			enctype : 'multipart/form-data',
         			processData : false,
        			contentType : false,
         			url : "/baemin/sellerHome",
         			data : formData,
         			success : function(data) {
         				alert("새로운 매장이 등록되었습니다.");
         				window.location.reload();
         			},
		   			error : function() {
		   				alert("저장에 실패하였습니다. 확인 후 다시 시도해주세요");
		   			}
         		})
             };
		
    
	    function storedelete(Code) {
	    	confirm("정말 매장을 삭제 하시겠습니까?");
			let storeCode = Code;
		    let storeStatus = 2;
	   	let info = {storeCode : storeCode,
	   			storeStatus : storeStatus}
	   	let infos = JSON.stringify(info);
	       	
	   		$.ajax({
	   			type : "PUT",
	   			url : "/baemin/sellerHome",
	   			data : infos,
	   			contentType : "application/json", // 필수
	   			success : function(data) {
	   				alert("매장이 삭제되었습니다.");
	   				window.location.reload();
	   			},
	   			error : function() {
	   				alert("매장정보 수정에 실패하였습니다.");
	   			}
	   		})
		}
	    

	    
		   $(document).on('click', '#store-update-out', function() {
		       window.location.reload();
		   });
		   
		   function updateStore(element) {
			   let formData = new FormData(element.closest('#updateForm'));
			   console.log(formData);
			   		$.ajax({
			   			type : "POST",
			   			enctype : 'multipart/form-data',
			   			processData : false,
		       			contentType : false,
			   			url : "/baemin/upsellerHome",
			   			data : formData,
			   			success : function(data) {
			   				alert("매장정보가 수정되었습니다.");
			   				window.location.reload();
			   			},
			   			error : function() {
			   				alert("매장정보 수정에 실패하였습니다.");
			   			}
			   		})
			   
		}
		   
	    <% String sellerCode = (String)session.getAttribute("seller"); %>
       
		function updateSellerStore(storeCode , but){
			
			//  originalData = $(but).closest(".store-list").html(); 
				 $.ajax(
				 	{
				 		type:"get" ,
				 		url: "/baemin/sellerHome/"+storeCode ,
				 		success : function( data ){
				 			console.log(data);
				 			let result  = updataStoreHTML(data, storeCode);
				 			$(but).closest(".store-list").html(result);
				 		},
				 		error: function(){
				 			alert( "error");
				 		}
				 	}		 
				 );	 
			 }
	 
		function updataStoreHTML(d, s) {
		    let result = '<form id="updateForm"><div class="store-updata" id="store-updata">';
		    result += '<div class="store-plus-out" id="store-update-out">x</div><h2 id="upstoreCode">매장정보관리</h2>';
		    result += '<div class="store-plus-info"><span>매장이름</span><input name="upstoreName" type="text" value="' + d.storeName + '"></div>';
		    result += '<div class="store-plus-info"><span>음식카테고리</span><select name="upstoreCategory">';
		    result += '<option value="' + d.storeCategory + '">' + d.storeCategory + '</option>';
		    result += '<option value="치킨">치킨</option><option value="피자">피자</option>';
		    result += '<option value="햄버거">햄버거</option><option value="족발,보쌈">족발,보쌈</option>';
		    result += '<option value="한식">한식</option><option value="중식">중식</option>';
		    result += '<option value="일식">일식</option><option value="양식">양식</option>';
		    result += '<option value="분식">분식</option><option value="디저트">디저트</option>';
		    result += '<option value="야식">야식</option></select></div>';
		    result += '<div class="store-plus-info"><span>매장사진</span><input name="upstoreImage" type="file" ></div>';
		    result += '<div class="store-plus-info"><span>매장주소</span><input name="upstoreAddress" type="text" value="' + d.storeAddress + '"></div>';
		    result += '<div class="store-plus-info"><span>매장전화번호</span><input name="upstorePhone" type="text" value="' + d.storePhone + '"></div>';
		    result += '<div class="store-plus-info"><span>최소주문금액</span><input name="upminOrderPrice" type="text" value="' + d.minOrderPrice + '"></div>';
		    result += '<div class="store-plus-info"><span>배달비</span><input name="updeliveryFee" type="text" value="' + d.deliveryFee + '"></div>';
		    result += '<div class="store-plus-info"><span>배달지역</span><input name="updeliveryArea" type="text" value="' + d.deliveryArea + '"></div>';
		    result += '<div class="store-plus-info"><span>매장 상태 관리</span><select name="upstoreStatus">';
		    result += '<option value="' + d.storeStatus + '">' + funstoreStatus(d.storeStatus) + '</option><option value="' + renofunstoreStatus(d.storeStatus) + '">' + refunstoreStatus(d.storeStatus) + '</option></select></div>';
		    result += '<div class="store-plus-but-wrap"><button class="store-plus-but" onclick="updateStore( this)">수정하기</button></div>';
		    result += '<input type="hidden" name="sellerCode" value="' + <%= sellerCode%> + '"><input type="hidden" name="sstoreCode" value="' + s + '"><input name="backupStoreImage" type="hidden" value="' + d.storeImage + '"></form>';
		    return result;
		}
		
		function storeStatus(Status) {
			
			if (Status == 1){
				document.write("(영업준비중...)");
			}
		}
		
		function funstoreStatus(Status) {
			if (Status == 1){
				return ("영업준비중");
			}else if (Status == 0) {
				return ("영업중");
		}
		}
		
		function refunstoreStatus(Status) {
			if (Status == 1){
				return ("영업중");
			}else if (Status == 0) {
				return ("영업준비중");
		}
		}
		
		function renofunstoreStatus(Status) {
			if (Status == 1){
				return (0);
			}else if (Status == 0) {
				return (1);
		}
		}
		
    </script>
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../base/sellerHeader.jsp" />
	<section id="content">
		<div class="section-line"><div>가게관리</div></div>
		<div class="section-wrap">
		
			<c:forEach items="${list }" var="item">
				
				<div class="store-list" >
				
					<div class="store-img-wrap">
						<div class="store-img"><img alt="" src="${path}/storeImages/${item.storeImage }"></div>
					</div>
					
					<div class="store-info-wrap">
						<div class="store-info">
							<div><a href="${path}/sellerMenu?storeCode=${item.storeCode}">${item.storeName }</a> <span><script >storeStatus(${item.storeStatus});</script></span></div>
							<div>⭐ ${item.storeRating}(${item.reviewCount})</div>
							<div>최소주문: ${item.minOrderPrice }</div>
						</div>
						<div class="store-info2">
							<div>${item.storeDescription}</div>
						</div>
					</div>
					<div class="store-but-wrap">
						<div class="store-but">
							<div id="updateSellerStore"
								onclick="updateSellerStore(${item.storeCode}, this)">수정</div>
							<div id="storedelete" onclick="storedelete(${item.storeCode})">삭제</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<form id="myForm">
			<div class="store-plus" id="store-plus">
					<!--post -->
					<div class="store-plus-out" id="store-plus-out">x</div>
					<div class="store-plus-info">
						<span>매장이름</span> <input name="storeName" type="text">
					</div>
					<div class="store-plus-info">
						<span>음식카테고리</span> 
						<select id="storeCategory" name="storeCategory">
							<option value="">--카테고리를 정해주세요--</option>
							<option value="치킨">치킨</option>
							<option value="피자">피자</option>
							<option value="햄버거">햄버거</option>
							<option value="족발,보쌈">족발,보쌈</option>
							<option value="한식">한식</option>
							<option value="중식">중식</option>
							<option value="일식">일식</option>
							<option value="양식">양식</option>
							<option value="분식">분식</option>
							<option value="디저트">디저트</option>
							<option value="야식">야식</option>
						</select>
					</div>
					<div class="store-plus-info">
						<span>매장사진</span> <input name="storeImage" type="file" >
					</div>
					<div class="store-plus-info">
						<span>매장주소</span> <input name="storeAddress" type="text" >
					</div>
					<div class="store-plus-info">
						<span>매장전화번호</span> <input name="storePhone" type="text" >
					</div>
					<div class="store-plus-info">
						<span>최소주문금액</span> <input name="minOrderPrice" type="text" >
					</div>
					<div class="store-plus-info">
						<span>배달비</span> <input name="deliveryFee" type="text" >
					</div>
					<div class="store-plus-info">
						<span>배달지역</span> <input name="deliveryArea" type="text" >
					</div>
					<div class="store-plus-but-wrap">
					<button class="store-plus-but" onclick="plusclick2()">저장하기</button>
					<input class="sstoreCode" type="hidden" name="sellerCode" value="<%= sellerCode%>">
					</div>
				
			</div>
			</form>
			<div class="plus-but" id="plus-but">

				<div id="plus-click">
					<img src="${path}/resources/icons/addoption.png">
				</div>

			</div>
		</div>



	</section>
	<footer> </footer>
</body>
</html>