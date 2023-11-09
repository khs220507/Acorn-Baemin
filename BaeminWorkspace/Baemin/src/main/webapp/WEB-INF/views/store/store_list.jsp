<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		section {
			width: 1280px;
			flex: 8;
		}
		hr {
			margin: 0 auto;
			width: 100%;
			border-width: 2px;
		}
		.nav-var {
			padding: 10px 0px 10px 0px;
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
        }
        .store-img img{
		width: 100px;
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
       
        
       	
       	</style>
       	<script type="text/javascript">
       	function choiceStore() {
       		window.opener.location.href = "http://localhost:8080/baemin/sellerHome";
		}
       	</script>
</head>
<body>
<jsp:include page="../base/header.jsp" />
<nav class="nav-var">
<c:set var="href" value="http://localhost:8080/baemin/storeList"/>
<a href="${href}">치킨</a><a href="${href}">피자</a><a href="${href}">햄버거</a><a href="${href}">족발,보쌈</a><a href="${href}">한식</a>
<a href="${href}">중식</a><a href="${href}">일식</a><a href="${href}">양식</a><a href="${href}">분식</a><a href="${href}">디저트</a><a href="${href}">야식</a>
</nav>
<hr>
<section>
		
        <div class="section-wrap">
        <c:forEach items="${list }" var="item">
            <div class="store-list" id="store-list">
                <div class="store-img-wrap">
                    <div class="store-img"><img alt="" src="/baemin/images/${item.storeImage }"></div>
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
                	<button class="store-but" onclick="choiceStore(${item.storeCode})">매장선택</button>
                </div>
            </div>
        </c:forEach>
        </div>

        

</section>
<jsp:include page="../base/footer.jsp" />
</body>
</html>