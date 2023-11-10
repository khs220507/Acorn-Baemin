package com.acorn.baemin.seller.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.seller.service.SellerService;

@Controller
public class SellerController {

	@Autowired
	private SellerService sc;

	String fileDir = "c:\\test\\upload\\";

//	@GetMapping("/menu_manage")
// public String readmNst(@RequestParam("storeCode") int storeCode, Model model) {
//	 	
//		System.out.println("storeCode @service : " + storeCode);
//		List<MenuDTO> readMenuInfo = sc.selectMenuInfo();
//		System.out.println(readMenuInfo);
//		StoreDTO readStoreNmRtRcMp = sc.selectStoreNmRtRcMp(storeCode);
//		
//		/*
//		Map<String , Object> map = new HashMap<>();
//		map.put("list", readtMenuInfo);
//		map.put("storeInfo", readStoreNmRtRcMp);
//		*/
//		model.addAttribute("readStoreNmRtRcMp", readStoreNmRtRcMp);
//		model.addAttribute("readMenuInfo", readMenuInfo);
//		
//		return "seller/store_manage";
//	}
//	

	// 사장님 메뉴/정보/리뷰 탭 메인화면
	@GetMapping("/store_manage")
	public String readstNs(@RequestParam("storeCode") int storeCode,
			Model model) {

		System.out.println("storeCode @service: " + storeCode);
		StoreDTO readStore = sc.selectStore(storeCode);
		SellerDTO readSeller = sc.selectSeller(readStore.getSellerCode());
		System.out.println("sellerCode @service : " + readStore.getSellerCode());
		List<MenuDTO> readMenuInfo = sc.selectAllMenuInfo(storeCode);
		List<MenuDTO> CList = sc.selectMenuClassification(storeCode);
		System.out.println(readMenuInfo);
		//List<ReviewDTO> reviewList = sc.selectAllReview();
		
		
		model.addAttribute("readStore", readStore);
		model.addAttribute("readSeller", readSeller);
		model.addAttribute("readMenuInfo", readMenuInfo);
		model.addAttribute("CList", CList);
		//model.addAttribute("reviewList", reviewList);

		return "seller/store_manage";
	}

	// 이미지 업로드와 관련
	@ResponseBody
	@GetMapping("/images/{menuImage:.*}")
	public Resource menuImage(@PathVariable String menuImageFile) throws MalformedURLException {
		return new UrlResource("file:c:\\test\\upload\\" + menuImageFile);
	}

	// 메뉴 등록
	@PostMapping("/store_manage")
	public String insertMenu(Integer menuCode, String menuName, Integer menuPrice, MultipartFile menuImageFile,
			String menuContent, String menuClassification, Integer menuStatus)
			throws IllegalStateException, IOException {

		System.out.println("menuName" + menuName);
		System.out.println("menuName" + menuPrice);
		System.out.println("menuName" + menuContent);
		System.out.println("menuName" + menuClassification);
		System.out.println("menuName" + menuStatus);

		try {
			if (!menuImageFile.isEmpty()) {
				// 이미지 업로드 파트
				String fileName = menuImageFile.getOriginalFilename();
				String menuRealImage = fileDir + menuName + fileName; // c:\\test\\upload\\고양이.jpg
				menuImageFile.transferTo(new File(menuRealImage));

				// db에 넣기
				String menuImage = menuName + fileName;

				System.out.println(menuImage);
				MenuDTO menu = new MenuDTO(menuCode, menuName, menuPrice, menuImage, menuContent, menuClassification,
						menuStatus);

				System.out.println(menu);
				sc.insertMenu(menu);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error @insertMenu");
		}
		return "seller/store_manage";
	}

	// 메뉴 수정
	@ResponseBody
	@PutMapping("/store_manage")
	public void updateInfo(@RequestBody MenuDTO menu) {
	    sc.modifingMenu(menu);
	}
	
	
	// 메뉴 삭제
	@ResponseBody
	@DeleteMapping("store_manage/{menuCode}")
	public void deleteMenu(@PathVariable Integer menuCode) {
		System.out.println(menuCode);
		sc.deleteMenu(menuCode);
	}
//	@ResponseBody
//	@RequestMapping(value="/menu_list" , method=RequestMethod.GET)
//	public List<MenuDTO> selectAllMenuList() {
//		List<MenuDTO> menu = sc.selectAllMenuInfo();
//		return menu;
//	}
	
	
	// 매장 정보 수정
	
}
