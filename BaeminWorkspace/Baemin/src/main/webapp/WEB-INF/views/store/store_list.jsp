<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set  var="path" value="<%=request.getContextPath() %>"></c:set>
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

		hr {
			margin: 0 auto;
			width: 100%;
			border-width: 2px;
		}
		section{
		padding-top:0px!important; 
		}
		.nav-var {
			padding: 150px 0px 10px 0px;
			font-size: 20px;
			font-weight: bolder;
			display: flex;
			width: 1280px;
			margin: 0 auto;
			justify-content: space-between;
		}
        .section-line{
            width: 100%;
            height: 50px;
            margin: 0 auto;
            border-bottom: 2px solid gainsboro;
        }
        .section-wrap{
            margin: 0 auto;
            width: 70%;
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
        }
        .store-img img{
		width: 100px;
		height: 100px;
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
            padding: 10px;
            text-align: center;
            border: 3px solid #48D1CC;
			background-color: white;
			  font-weight: bolder;
            border-radius: 5px;
            width: 100px;
            font-size: 15px;
            
        }
        .categorys{
        color: gray;
        }
       
       /* 반응형 */

		/* 중간화면 */
		@media (max-width:1280px) {
			.option-list-wrap, .nav-var{
				width: 75vw;
			}
			
		}
		@media (max-width:767px) {
		.nav-var{
		padding: 210px 0px 10px 0px;
		}
		.store-list{
			display: block;
		}
		.store-img-wrap{
		display: block;
		height: 150px;
	    width: 150px;
	    margin: 0 auto;
		}
		.store-img-wrap img {
		height: 150px;
	    width: 150px;
	
		}
		.store-info {
		padding: 20px;
		}
		.store-info2{
		padding: 0 0 20px 0;
		}
		.store-info div, .store-info2 div{
		text-align: center;   
		}
		.store-info-wrap{
		display: block;
		}
		}
		
        
       	
       	</style>
       	<script type="text/javascript">
       	$(function() {
       	 	let urlParams = new URL(location.href).searchParams;
          	let name = urlParams.get('storeCategory');
          	$("#"+name).css("color","black");

       	});
       	function choiceStore(storeCode) {
       		window.opener.location.href = "${path}/store?=storeCode="+storeCode;
		}
       	

   		
       	
       	</script>
</head>
<body>
<jsp:include page="../base/header.jsp" />
		<nav class="nav-var">
<c:set var="href" value="${path}/storeList?storeCategory="/>
<a class="categorys" id="치킨" href="${href}치킨">치킨</a><a class="categorys" id="피자" href="${href}피자">피자</a>
<a class="categorys" id="햄버거" href="${href}햄버거">햄버거</a><a class="categorys" id="족발·보쌈" href="${href}족발·보쌈">족발·보쌈</a>
<a class="categorys" id="한식" href="${href}한식">한식</a><a class="categorys" id="중식" href="${href}중식">중식</a>
<a class="categorys" id="일식" href="${href}일식">일식</a><a class="categorys" id="양식" href="${href}양식">양식</a>
<a class="categorys" id="분식" href="${href}분식">분식</a><a class="categorys" id="디저트" href="${href}디저트">디저트</a>
<a class="categorys" id="야식" href="${href}야식">야식</a>
</nav>
<hr>

<section id="content">

        <div class="section-wrap">
        <c:forEach items="${list }" var="item">
            <div class="store-list" id="store-list">
                <div class="store-img-wrap">
                    <div class="store-img"><img alt="" src="${path}/images/${item.storeImage }"></div>
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
                	<a href="${path}/store?storeCode=${item.storeCode}"><button class="store-but">매장선택</button></a>
                </div>
            </div>
        </c:forEach>
        </div>

        

</section>
<jsp:include page="../base/footer.jsp" />
</body>
</html>