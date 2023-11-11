package com.acorn.baemin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuDTO {

	Integer menuCode;
	Integer storeCode;
	String menuName;
	Integer menuPrice;
	String menuImage;
	String menuContent;
	String menuClassification;
	Integer menuStatus;
}
