package com.acorn.baemin.order.domain;

import lombok.Data;


@Data
public class KakaoOrderDTO {
	
	 String  partner_order_id; 
     String  partner_user_id ;
     String  item_name; 
     String quantity ; 
     String total_amount;
     int orderNumber;
 	int menuCode;
 	int userCode;
 	int storeCode;
 	String orderMenuName;
 	int orderMenuNumber;
 	int orderMenuPrice;
 	String orderStoreName;
 	String orderStoreImage;
 	String orderDate;
 	int payType;
 	int orderType;
 	String reqToSeller;
 	String reqToRider;
 	String orderStatus;
 	int deliveryFee;
 	String deliveryAddress;
 	String userPhone;
 	String optionsInfo;
 	int reviewStatus;

}
