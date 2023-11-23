package com.acorn.baemin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDTO {
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
}
