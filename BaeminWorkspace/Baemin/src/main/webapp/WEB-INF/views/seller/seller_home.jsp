<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
       <style>
       /* 태그 파트 */
       *{
			margin: 0;
			padding: 0;
            box-sizing: border-box;
		}
       a{
			text-decoration: none;
		}
        header{
            background-color: #48D1CC;
            height: 100px;
        }
        section{

        }
        footer{
			 height: 100px;
			 background-color: gray;
        }
		button{
			outline: none;	
			cursor: pointer;	/* 손가락모양 */
		} 

        /* 해더 */
        .header-wrap{
            width: 1280px;
            border: 1px solid black;
            height: 100px;
            margin: 0 auto;
        }
        /* 세션 */
        .section-line{
            width: 100%;
            height: 50px;
            margin: 0 auto;
            border-bottom: 2px solid gainsboro;
        }
        .section-wrap{
            margin: 0 auto;
            width: 60%;
        }
        .store-list{
        	padding: 20px;
            display: flex;
            border-bottom: 1px solid gray;
        }
        .store-img-wrap{
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .store-img{
            width: 100px;
            height: 100px;
            background-color: yellowgreen;
        }
        .store-info-wrap{
            flex: 4;
            display: flex;
            align-items: center;
        }
        .store-info,.store-info2{
           padding: 10px;
           flex: 1;
           font-weight: bolder;
        }
        .store-but-wrap{
            display: flex;
            justify-content: center;
            align-items: center;
            flex: 1;
            
        }
        .store-but{
            display: flex;
            width: 110px;
            justify-content: space-between;
        }
        .store-but div{
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
        .store-updata{
        	padding-right:20px;
        	width: 100%;
        }
        .store-updata h2{
        text-align: center;
        padding: 30px;
        }
         .store-plus-out{
         	
        	text-align: right;
        	font-size: 30px;
            cursor: pointer;       	
        	
        }
        .store-plus-info{
            width: 420px;
            margin: 0 auto;
            text-align: right;
            padding: 5px;
        }
        .store-plus-info span , .store-updata span{
            font-size: 20px;
            font-weight: bolder;
        }
        .store-plus div input , .store-updata div input {
            height: 35px;
            margin-left:15px;
            width: 250px;
        }
        .store-plus-but{
            margin: 20px auto 20px auto;
            padding: 5px;
            width: 100px;
            border-radius: 10px;
            background-color: gainsboro;
            text-align: center;
            cursor: pointer;  
        }
        .plus-but{
            height:  150px;
            border-bottom: 1px solid gray;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .plus-but div{
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: gray;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            
            
        }
        .plus-but span{
            
            font-size: 100px;
            color: white;
            margin-bottom:20px ;
        }
       	#sstoreCode{
       	display: none;
       	}
        
        .section-wrap, .store-img-wrap, .store-img,  .store-info-wrap  ,.store-info,.store-info2,.store-but-wrap,.store-but,.store-plus,.store-plus-img{


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
            $("#plus-click2").click(function(){
            	$("#store-plus").css("display","none");
            	$("#plus-but").css("display","flex");
            	let sellerCode = 20001;
            	let storeName = $("#storeName").val();
            	let storeCategory = $("#storeCategory").val();
            	let storeImage = $("#storeImage").val();
            	let storeAddress = $("#storeAddress").val();
            	let storePhone = $("#storePhone").val();
            	let minOrderPrice = $("#minOrderPrice").val();
            	let deliveryFee = $("#deliveryFee").val();
            	let deliveryArea = $("#deliveryArea").val();
            	let info = {sellerCode : sellerCode,
            		storeName : storeName,
           			storeCategory : storeCategory,
           			storeImage : storeImage,
           			storeAddress : storeAddress,
           			storePhone : storePhone,
           			minOrderPrice : minOrderPrice,
           			deliveryFee : deliveryFee,
           			deliveryArea : deliveryArea};
            	let infos = JSON.stringify(info);
            	
        		$.ajax({
        			type : "post",
        			url : "/baemin/sellerHome",
        			data : infos,
        			contentType : "application/json", // 필수
        			success : function(data) {
        				window.location.reload();

        			},
        			error : function() {
        				alert("error");
        			}
        		})
            });
            
        });
	    function storedelete(storeCode) {
		    $.ajax({
				type: "DELETE",
				url: "/baemin/sellerHome/"+storeCode, //path Variable  ,
				
				success : function (data){
					window.location.reload();
				},
				error: function() {
					alert( "error");
				}
			});
		}
		   $(document).on('click', '#store-update-out', function() {
		       window.location.reload();
		   });
		   
		   $(document).on('click', '#updateStore',function(){
			   
	        let storeCode = $("#sstoreCode").val();
	       	let storeName = $("#upstoreName").val();
	       	let storeCategory = $("#upstoreCategory").val();
	       	let storeImage = $("#upstoreImage").val();
	       	let storeAddress = $("#upstoreAddress").val();
	       	let storePhone = $("#upstorePhone").val();
	       	let minOrderPrice = $("#upminOrderPrice").val();
	       	let deliveryFee = $("#updeliveryFee").val();
	       	let deliveryArea = $("#updeliveryArea").val();
	       	let info = {storeCode : storeCode,
	       			storeName : storeName,
	      			storeCategory : storeCategory,
	      			storeImage : storeImage,
	      			storeAddress : storeAddress,
	      			storePhone : storePhone,
	      			minOrderPrice : minOrderPrice,
	      			deliveryFee : deliveryFee,
	      			deliveryArea : deliveryArea};
	       	let infos = JSON.stringify(info);
	       	
	   		$.ajax({
	   			type : "PUT",
	   			url : "/baemin/sellerHome",
	   			data : infos,
	   			contentType : "application/json", // 필수
	   			success : function(data) {
	   				window.location.reload();
	
	   			},
	   			error : function() {
	   				alert("error");
	   			}
	   		})
	       });
	    
       
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
	 
		function updataStoreHTML(d , s){
			
				let result = '<div class="store-updata" id="store-updata"> <div class="store-plus-out" id="store-update-out">x</div><h2 id="upstoreCode">매장정보관리</h2>';
				result +='<div class="store-plus-info"><span>매장이름</span><input id="upstoreName" type="text" value="'+d.storeName+'"></div>';
				result +='<div class="store-plus-info"><span>음식카테고리</span><input id="upstoreCategory" type="text" value="'+d.storeCategory+'"></div>';
				result +='<div class="store-plus-info"><span>매장사진</span><input id="upstoreImage" type="text" value="'+d.storeImage+'"></div>';
				result +='<div class="store-plus-info"><span>매장주소</span><input id="upstoreAddress" type="text" value="'+d.storeAddress+'"></div>';
				result +='<div class="store-plus-info"><span>매장전화번호</span><input id="upstorePhone" type="text" value="'+d.storePhone+'"></div>';
				result +='<div class="store-plus-info"><span>최소주문금액</span><input id="upminOrderPrice" type="text" value="'+d.minOrderPrice+'"></div>';
				result +='<div class="store-plus-info"><span>배달비</span><input id="updeliveryFee" type="text" value="'+d.deliveryFee+'"></div>';
				result +='<div class="store-plus-info"><span>배달지역</span><input id="updeliveryArea" type="text" value="'+d.deliveryArea+'"></div>';
				result +='<div class="store-plus-but" id="updateStore" >수정하기</div></div><input id="sstoreCode" type="text" value="'+s+'">';
				
			 return result;
		 }  
		
    </script>
<title>Insert title here</title>
</head>
<body>
 <header>
        <div class="header-wrap">해더</div>
    </header>
   <section>
        <div class="section-line"></div>
        <div class="section-wrap">
        <c:forEach items="${list }" var="item">
            <div class="store-list">
                <div class="store-img-wrap">
                    <div class="store-img">

                    </div>
                </div>
                <div class="store-info-wrap">
                    <div class="store-info">
                        <div>${item.storeName }</div>
                        <div>⭐ ${item.storeRating}(${item.reviewCount})</div>
                        <div>최소주문: ${item.minOrderPrice }</div>
                    </div>
                    <div class="store-info2">
                        <div>
                            ${item.storeDescription}
                        </div>
                    </div>
                </div>
                <div class="store-but-wrap">
                    <div class="store-but">
                        <div id="updateSellerStore" onclick="updateSellerStore(${item.storeCode}, this)">수정</div>
                        <div id="storedelete" onclick="storedelete(${item.storeCode})">삭제</div>
                    </div>
                </div>
            </div>
           </c:forEach>
           
            <div class="store-plus" id="store-plus"> 
            <form id="myForm">
            	<div class="store-plus-out" id="store-plus-out">x</div>
                <div class="store-plus-info">
                    <span>매장이름</span>
                    <input id="storeName" type="text" required>
                </div>
                <div class="store-plus-info">
                    <span>음식카테고리</span>
                    <input id="storeCategory" type="text" required>
                </div>
                <div class="store-plus-info">
                    <span>매장사진</span>
                    <input id="storeImage" type="text" required>
                </div>
                <div class="store-plus-info">
                    <span>매장주소</span>
                    <input id="storeAddress" type="text" required>
                </div>
                <div class="store-plus-info">
                    <span>매장전화번호</span>
                    <input id="storePhone" type="text" required>
                </div>
                <div class="store-plus-info">
                    <span>최소주문금액</span>
                    <input id="minOrderPrice" type="text" required>
                </div>
                <div class="store-plus-info">
                    <span>배달비</span>
                    <input id="deliveryFee" type="text" required> 
                </div>
                <div class="store-plus-info">
                    <span>배달지역</span>
                    <input id="deliveryArea" type="text" required>
                </div>
                <div class="store-plus-but" id="plus-click2">
                    저장하기
                </div>
                </form>
            </div>

            <div class="plus-but" id="plus-but" >
                
                <div id="plus-click" ><span>+</span></div>    
               
            </div>
        </div>

        

    </section>
    <footer>

    </footer>
</body>
</html>