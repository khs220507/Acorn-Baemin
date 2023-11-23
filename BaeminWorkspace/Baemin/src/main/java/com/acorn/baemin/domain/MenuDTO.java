package com.acorn.baemin.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuDTO {

	// 이미지 파일 포함된 수정용
	public MenuDTO(Integer menuCode, String menuName, Integer menuPrice, String menuImage, String menuContent, Integer menuStatus) {
		
		this.menuCode= menuCode;
		this.menuName= menuName;	
		this.menuPrice= menuPrice;	
		this.menuImage= menuImage;	
		this.menuContent= menuContent;
		this.menuStatus= menuStatus;

	}
	
	// 이미지 파일 없는 수정용
	public MenuDTO(Integer menuCode, String menuName, Integer menuPrice, String menuContent, Integer menuStatus) {
		
		this.menuCode= menuCode;
		this.menuName= menuName;	
		this.menuPrice= menuPrice;
		this.menuContent= menuContent;
		this.menuStatus= menuStatus;

	}
	
	// 메뉴 등록용
	public MenuDTO(Integer storeCode, String menuName, Integer menuPrice, String menuImage, String menuContent,
			String menuClassification, Integer menuStatus) {

		this.storeCode = storeCode;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.menuImage = menuImage;
		this.menuContent = menuContent;
		this.menuClassification = menuClassification;
		this.menuStatus = menuStatus;
		
	}

	Integer menuCode;
	Integer storeCode;
	String menuName;
	Integer menuPrice;
	String menuImage;
	String oldMenuImage;
	String menuContent;
	String menuClassification;
	String newMenuClassification;
	Integer menuStatus;
}
