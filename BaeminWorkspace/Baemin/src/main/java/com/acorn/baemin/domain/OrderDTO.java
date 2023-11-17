package com.acorn.baemin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDTO {
	int orderNumber;
	int userCode;
	int storeCode;
	String orderMenuName;
	int orderMenuNumber;
	int totalPrice;
	String orderStoreName;
	String orderStoreImage;
	String orderDate;
	int paymentType;
	int orderType;
	String requestToSeller;
	String requestToRider;
	String orderStatus;
	int deliveryFee;
	String deliveryAddress;
	String userPhone;
	String optionsInfo;
}
