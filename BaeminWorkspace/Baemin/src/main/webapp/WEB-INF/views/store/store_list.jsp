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
       	
       	</style>
</head>
<body>
<jsp:include page="../base/header.jsp" />
<nav class="nav-var">
<a href="">치킨</a><a>피자</a><a>햄버거</a><a>족발,보쌈</a><a>한식</a><a>중식</a><a>일식</a><a>양식</a><a>분식</a><a>디저트</a><a>야식</a>
</nav>
<hr>
<section>
		
        <div class="section-wrap">
        <c:forEach items="${list }" var="item">
            <div class="store-list">
                <div class="store-img-wrap">
                    <div class="store-img"></div>
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
            </div>
        </c:forEach>
        </div>

        

</section>
<jsp:include page="../base/footer.jsp" />
</body>
</html>