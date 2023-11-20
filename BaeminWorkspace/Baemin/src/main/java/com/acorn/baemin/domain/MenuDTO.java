package com.acorn.baemin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuDTO {

	public MenuDTO(Integer storeCode, String menuName, Integer menuPrice, String menuImage,
			String menuContent, String menuClassification, Integer menuStatus) {
		
		this.storeCode= storeCode;	
		this.menuName= menuName;	
		this.menuPrice= menuPrice;	
		this.menuImage= menuImage;	
		this.menuContent= menuContent;	
		this.menuClassification= menuClassification;
		this.menuStatus= menuStatus;
		
	}
	
	Integer menuCode;
	Integer storeCode;
	String menuName;
	Integer menuPrice;
	String menuImage;
	String menuContent;
	String menuClassification;
	String newMenuClassification;
	Integer menuStatus;
}
