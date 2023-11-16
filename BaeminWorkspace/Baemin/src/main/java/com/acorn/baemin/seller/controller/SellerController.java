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
import org.springframework.http.ResponseEntity;
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

import com.acorn.baemin.domain.AnswerDTO;
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
	
	// 사장님의 메뉴 탭 화면
	@GetMapping("/sellerMenu")
	public String readMenu(Integer storeCode, Model model) {

		System.out.println("storeCode @service: " + storeCode);
		StoreDTO readStore = sc.selectStore(storeCode);
		StoreDTO readSeller = sc.selectStore(readStore.getSellerCode());
		List<MenuDTO> readMenuInfo = sc.selectAllMenuInfo(storeCode);
		List<MenuDTO> CList = sc.selectMenuClassification(storeCode);
		System.out.println(readMenuInfo);
		
		model.addAttribute("readStore", readStore);
		model.addAttribute("readSeller", readSeller);
		model.addAttribute("readMenuInfo", readMenuInfo);
		model.addAttribute("CList", CList);

		return "seller/store_manage";
	}
	// 이미지 업로드와 관련
	@ResponseBody
	@GetMapping("/images/{menuImage:.*}")
	public Resource menuImage(@PathVariable String menuImageFile) throws MalformedURLException {
		return new UrlResource("file:c:\\test\\upload\\" + menuImageFile);
	}
	// 메뉴 등록
	@PostMapping("/sellerMenu")
	public String createtMenu(Integer storeCode, Integer menuCode, String menuName, Integer menuPrice, MultipartFile menuImageFile,
			String menuContent, String menuClassification, Integer menuStatus)
					throws IllegalStateException, IOException {
		
		System.out.println("menuName" + menuName);
		System.out.println("menuPrice" + menuPrice);
		System.out.println("menuContent" + menuContent);
		System.out.println("menuClassification" + menuClassification);
		System.out.println("menuStatus" + menuStatus);
		System.out.println("storeCode" + storeCode);
		
		try {
			if (!menuImageFile.isEmpty()) {
				// 이미지 업로드 파트
				String fileName = menuImageFile.getOriginalFilename();
				String menuRealImage = fileDir + menuName + fileName; // c:\\test\\upload\\고양이.jpg
				menuImageFile.transferTo(new File(menuRealImage));
				
				// db에 넣기
				String menuImage = menuName + fileName;
				
				System.out.println(menuImage);
				
				MenuDTO menu = new MenuDTO(menuCode, storeCode, menuName, menuPrice, menuImage, menuContent, menuClassification,
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
	@PutMapping("/sellerMenu")
	public void updateMenuInfo(@RequestBody MenuDTO menu) {
		sc.modifingMenu(menu);
	}
	// 메뉴 삭제
	@ResponseBody
	@PutMapping("/sellerMenu/{menuCode}")
	public void deleteMenu(@PathVariable Integer menuCode) {
		System.out.println(menuCode);
		sc.deleteMenu(menuCode);
	}
	
	
	// 사장님 정보 탭 화면
	// 정보 조회
	@GetMapping("/infoManage")
	@ResponseBody
	public HashMap<String, Object> readInfo(@RequestParam Integer storeCode) {
	    HashMap<String, Object> infoMap = new HashMap<>();
	    
	    System.out.println("storeCode @service: " + storeCode);
	    StoreDTO readStore = sc.selectStore(storeCode);
	    SellerDTO readSeller = sc.selectSeller(readStore.getSellerCode());
	    System.out.println("sellerCode @service : " + readSeller);

	    infoMap.put("readStore", readStore);
	    infoMap.put("readSeller", readSeller);
	    
	    System.out.println("infoMap : " + infoMap);
	    return infoMap;
	}
	// 가게정보 수정
		@ResponseBody
		@PutMapping("/infoManage")
		public void updateStoreInfo(@RequestBody StoreDTO store, @RequestBody SellerDTO seller) {
			sc.modifingStoreDTA(store);
			sc.modifingSellerNmRn(seller);
		}
		
	// 손님이 볼 가게 화면
	@GetMapping("/store")
	public String storeMain(@RequestParam("storeCode") int storeCode,
			Model model) {

		System.out.println("storeCode @service: " + storeCode);
		StoreDTO readStore = sc.selectStore(storeCode);
		SellerDTO readSeller = sc.selectSeller(readStore.getSellerCode());
		System.out.println("sellerCode @service : " + readStore.getSellerCode());
		List<MenuDTO> readMenuInfo = sc.selectAllMenuInfo(storeCode);
		List<MenuDTO> CList = sc.selectMenuClassification(storeCode);
		System.out.println(readMenuInfo);
		List<ReviewDTO> reviewList = sc.selectAllReview(storeCode);
		List<AnswerDTO> answerList = sc.selectAllAnswer(storeCode);
		
		model.addAttribute("readStore", readStore);
		model.addAttribute("readSeller", readSeller);
		model.addAttribute("readMenuInfo", readMenuInfo);
		model.addAttribute("CList", CList);
		model.addAttribute("RList", reviewList);
		model.addAttribute("AList", answerList);
		//model.addAttribute("reviewList", reviewList);

		return "store/store";
	}
	
}
