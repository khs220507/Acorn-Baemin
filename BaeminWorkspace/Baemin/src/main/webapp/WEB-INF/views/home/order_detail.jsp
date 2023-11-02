<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       <c:set  var="path" value="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script> 
<meta name="viewport" content="width=device-width,initial-scale=1">
<style>
 /* reset css */
        a{
            text-decoration: none;
        }
            
        button{
            outline: none;	
            cursor: pointer;	/* 손가락모양 */
        }
        *{
          margin: 0;
          margin: 0;
          padding: 0;
          box-sizing: border-box;
        }
        body{
          display: flex;
          flex-direction: column;
          align-items: center;
          height: 100vh;
        }
        .thin-line{
          background-color: #d9d9d9;
          height: 3px;
          border: 0px;
          margin-top: 10px;
          margin-bottom: 10px;
        }
        .bold-line{
          height: 20px;
          background-color: #d9d9d9;
          border: 0px;
          margin-top: 10px;
          margin-bottom: 10px;
        }
  
        /* 섹션 //////////////////////////////////////////////////// */
        
      section{
          flex: 7.8;
          width: 1280px;
          padding-top: 20px;
      }

        /* 배달이 완료되었어요 div*/
        .store-menu-wrap{
          padding-left: 30px;
          padding-right: 30px;
        }
        .finish-message{
          color: #48D1CC;
          font-size: 20px;
          margin-bottom: 7px;
        }
        .store-name{
          font-size: 23px;
          margin-bottom: 3px;
        }
        .menu-name{
          font-size: 20px;
          margin-bottom: 20px;
        }
 
 
</style>
</head>
<body>

<jsp:include page="../base/header.jsp"/>

<section>

	<!-- 
	<c:forEach items="${orderDetail}" var="detail">
	
	${detail }
	
	</c:forEach> -->
	
	<h3 class="detailList-title">주문내역</h3>
  <hr class="thin-line">
  
  <!--배달이 완료되었어요 div-->
  <div class="store-menu-wrap">
    <p class="finish-message"><strong>배달이 완료되었어요</strong></p>
    <p class="store-name"><strong>BBQ 홍대점</strong></p>
    <p class="menu-name">황올 반+양념 반</p>

    <p>주문일시: 2023년 10월 19일</p>
    <p>주문번호: B123456779</p>
  </div>
  <hr class="bold-line">
	

</section>


<jsp:include page="../base/footer.jsp"/>

</body>
</html>