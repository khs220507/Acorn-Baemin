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
        hr{
          background-color: #d9d9d9;
          height: 3px;
          border: 0px;
        }
        /* 섹션  ////////////////////////////////////////////////////*/
        section{
          flex: 7.8;
          width: 1280px;
          padding-top: 20px;
          
          overflow-y: auto; /*섹션의 내용이 넘치는 경우 스크롤이 가능*/
          -ms-overflow-style: none;	/* 스크롤바 없애기 */
        }
        section::-webkit-scrollbar{	/* 스크롤바 없애기 */
  			display:none;
		}
        
        .orderList-title{
          margin-bottom: 10px;
        }
        .orderList-wrap{
          position: relative;
          padding-top: 10px;
          padding-bottom: 10px;
          padding-left: 30px;
          padding-right: 30px;
        }
        .delete-icon{
          width: 20px;
          height: 20px;
          position: absolute;
          right: 60px;
          cursor: pointer;
        }
        .date-wrap{
          display: flex;
        }
        .dot{
          margin-left: 5px;
          margin-right: 5px;
        }
        .order-num{
        	display:none;
        }
        /**/
        .wrap-center{
          display: flex;
          align-items: center;
          margin: 10px;
        }
        .store-img{
          width: 110px;
          height: 85px;
          flex: 1;
        }
        .store-menu-wrap{
          flex:8;
          margin-left: 20px;
        }
        .store-name{
          cursor: pointer;
        }
        .menu-info{
          display: flex;
        }
        .menu-text{
          margin-right: 10px;
        }

        .btn-wrap{
          flex: 1;
        }
        .gray-radius-btn{
          width: 100px;
          background-color: white;
          border: 1px solid #d9d9d9;
          border-radius: 30px;
          padding: 5px;
          margin: 5px;
        }
        .add-menu-btn{
          width: 100%;
          height: 50px;
          background-color: white;
          color: #48D1CC;
          border: 2px solid #48D1CC;
          border-radius: 5px;
          margin-bottom: 20px;
        }

      </style>
</head>
<body>

	<jsp:include page="../base/header.jsp"/>

      <section>
      
     <h3 class="orderList-title">주문내역</h3>
     <hr>
     
    <!-- 주문내역 -->
    <c:forEach items="${orderList }" var="orderList">
      
      <div class="orderList-wrap">

      <img class="delete-icon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAyklEQVR4nO2WQQ6DMAwE+QSofUgkr+T8/xBO5dDnUFE4tBEE27iKRFkpJ7JM7JAlTXPpLwWgA9Avo7P6iSiJ/czcAngAGKdBRM8Y410KNfsxV/k2fZgHycqnOcvc3J9MYAl8CyoGc9aq7AWrbdvzhBBuu2At3A2qgbtDhfs2lJ5ZjuGXSlW5V2qFu0Kl8J9ApWBNwrm32g3Oho/rMBw1jhMLwsESr0VpEskNzoYYdIGj1m8RtS4CvHJ10STSIT/mlSfVZc3Rf+kcegEOjsATVQE+UwAAAABJRU5ErkJggg==">
      <div class="date-wrap">
        <p>${orderList.orderDate }</p>
        <p class="dot">·</p>
        <p>${orderList.orderStatus}</p>
        <span class="order-num">${orderList.orderNumber }</span>
      </div>

  
      <div class="wrap-center">
        <a href=""><img class="store-img" src="${orderList.orderStoreImage }"></a>
        <div class="store-menu-wrap">
          <p class="store-name"><strong>${orderList.orderStoreName }</strong></p>
          <div class="menu-info">
            <p class="menu-text">${orderList.orderMenuName}</p>
            <p>${orderList.orderMenuNumber }</p>
            <p>${orderList.orderMenuPrice}원</p>
          </div>
        </div>
        <div class="btn-wrap">
          <button class="gray-radius-btn">주문상세</button>
          <br>
          <button class="gray-radius-btn">리뷰쓰기</button>
        </div>
      </div>
      <button class="add-menu-btn"><strong>같은 메뉴 담기</strong></button>
       <hr>
    </div>
      
    </c:forEach>

      
      </section>

 	<jsp:include page="../base/footer.jsp"/>

	<script>
	
	// 주문내역 삭제
	$(document).on('click', '.delete-icon', function() {
		$(this).closest('.orderList-wrap').remove();
		let orderNumber = $(this).closest('.orderList-wrap').find('.order-num').text().trim();
	
		deleteList(orderNumber);
	});

	function deleteList(orderNumber) {
		
		$.ajax({
			type : "get",
			url : "${path}/orderListDelete",
			data : "orderNumber=" + orderNumber,
			dataType : "text",
			success : function(data) {
				window.location.reload();
			},
			error : function(err) {
				alert("삭제 요청에 실패했습니다.");
				alert(orderNumber);
			}
		});
	}
	
	</script>

</body>
</html>