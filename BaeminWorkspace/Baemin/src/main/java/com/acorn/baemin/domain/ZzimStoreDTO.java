package com.acorn.baemin.domain;

import lombok.Data;

@Data
public class ZzimStoreDTO {

	int userCode;
	int storeCode;
	
	String storeImage;
	String storeName;
	String storeRating;
	int reviewCount;
	int minOrderPrice;
	String storeDescription;
	int storeStatus;
}
