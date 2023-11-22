package com.acorn.baemin.seller.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.acorn.baemin.domain.AnswerDTO;
import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.home.repository.ZzimRepositoryImp;
import com.acorn.baemin.domain.ZzimDTO;
import com.acorn.baemin.seller.service.SellerService;

@Controller
public class SellerController {

	@Autowired
	private SellerService sc;
	
	@Autowired
	ZzimRepositoryImp zr;

	String fileDir = "c:\\test\\upload\\";
	
	// 이미지 주소 리턴
	@ResponseBody
	@GetMapping("/images/{menuImageFile:.*}")
	public Resource menuImage(@PathVariable String menuImageFile) throws MalformedURLException {
		return new UrlResource("file:" + fileDir + menuImageFile);
	}
	
	// 사장님의 메뉴 탭 화면
	@GetMapping("/sellerMenu")
	public String readMenu(Integer storeCode, Model model, HttpSession session) {
		
		System.out.println("storeCode @controller: " + storeCode);
		session.setAttribute("storeCode", storeCode);
		if(storeCode != null) {
			StoreDTO readStore = sc.selectStore(storeCode);
			SellerDTO readSeller = sc.selectSeller(readStore.getSellerCode());
			List<MenuDTO> readMenuInfo = sc.selectAllMenuInfo(storeCode);
			List<MenuDTO> CList = sc.selectMenuClassification(storeCode);
			System.out.println(readMenuInfo);
			double storeAvgRating = sc.storeAvgRating(storeCode);
			int reviewCount = sc.reviewCount(storeCode);
			
			model.addAttribute("readStore", readStore);
			model.addAttribute("readSeller", readSeller);
			model.addAttribute("readMenuInfo", readMenuInfo);
			model.addAttribute("CList", CList);
			model.addAttribute("avgRating", storeAvgRating);
			model.addAttribute("RCount", reviewCount);

			return "seller/store_manage";
			} else {
				return "redirect:/home";
			}
	}
	
	// 메뉴 등록
	@PostMapping("/sellerMenu")
	public String createtMenu(Integer storeCode, String menuName, Integer menuPrice, MultipartFile menuImageFile,
			String menuContent, String menuClassification, Integer menuStatus)
					throws IllegalStateException, IOException {

		
		try {
			if (!menuImageFile.isEmpty()) {
				// 이미지 업로드
				String fileName = menuImageFile.getOriginalFilename();
				String menuRealImage = fileDir + menuName + fileName; // c:\\test\\upload\\고양이.jpg
				menuImageFile.transferTo(new File(menuRealImage));
				
				// db에 넣기
				String menuImage = menuName + fileName;
				
				System.out.println(menuImage);

				System.out.println("storeCode" + storeCode);
				System.out.println("menuName" + menuName);
				System.out.println("menuPrice" + menuPrice);
				System.out.println("menuContent" + menuContent);
				System.out.println("menuClassification" + menuClassification);
				System.out.println("menuStatus" + menuStatus);
				
				MenuDTO menu = new MenuDTO(storeCode, menuName, menuPrice, menuImage, menuContent, menuClassification, menuStatus);

				System.out.println(menu);
				sc.insertMenu(menu);

			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error @insertMenu");
		}
		return "seller/store_manage";
	}
	// 메뉴 분류 수정
	@ResponseBody
	@PutMapping("/updateSellerClassification")
	public void updateSellerClassification(@RequestBody MenuDTO menu) {
		sc.modifingMenuClassification(menu);
	}
	
	// 메뉴 수정
	@ResponseBody
	@PutMapping("/updateSellerMenu")
	public void updateMenuInfo(Integer menuCode, String menuName, Integer menuPrice, MultipartFile menuImageFile, String menuContent, String menuClassification, Integer menuStatus) {
		
		if(menuImageFile.isEmpty()) {
			
			MenuDTO menu = new MenuDTO(menuCode, menuName, menuPrice, menuContent, menuClassification, menuStatus);
			
			System.out.println(menu);
			
			sc.modifingMenu(menu);
		} else {
			// 이미지파일이 있을 때의 코드
		}
	}
	
	// 메뉴 삭제
	@ResponseBody
	@PutMapping("/sellerMenu")
	public void deleteMenu(HttpSession session) {
		Integer menuCode = (Integer) session.getAttribute("menuCode");
		System.out.println(menuCode);
		sc.deleteMenu(menuCode);
	}
	
	
	// 사장님 정보 탭 화면
	// 정보 조회
	@GetMapping("/infoManage")
	@ResponseBody
	public HashMap<String, Object> readInfo(HttpSession session) {
		
	    HashMap<String, Object> infoMap = new HashMap<>();
	    
	    int storeCode = (int) session.getAttribute("storeCode");
	    System.out.println("storeCode @service: " + storeCode);
	    
	    StoreDTO readStore = sc.selectStore(storeCode);
	    SellerDTO readSeller = sc.selectSeller(readStore.getSellerCode());
	    System.out.println("readStore @service : " + readStore);
	    System.out.println("readSeller @service : " + readSeller);

	    infoMap.put("readStore", readStore);
	    infoMap.put("readSeller", readSeller);
	    
	    System.out.println("infoMap : " + infoMap);
	    return infoMap;
	}
	// 가게정보 수정
	@ResponseBody
	@PutMapping("/infoManage")
	public void updateStoreInfo(@RequestBody StoreDTO store) {
		System.out.println(store);
		
		sc.modifingStoreDTA(store);
	}
	
	
	// 사장님의 리뷰 탭 화면
	// 리뷰, 답글 조회
	@ResponseBody
	@GetMapping("/reviewAnswer")
	public HashMap<String, Object> readRnA(HttpSession session) {
		
	    HashMap<String, Object> reviewAnswer = new HashMap<>();
	    
	    int storeCode = (int) session.getAttribute("storeCode");
	    int reviewCode = (int) session.getAttribute("reviewCode");
	    
	    System.out.println("storeCode @service: " + storeCode);
	    List<ReviewDTO> readReview = sc.selectAllReview(storeCode);
	    List<AnswerDTO> readAnswer = sc.selectAllAnswer(reviewCode);
	    
	    reviewAnswer.put("readReview", readReview);
	    reviewAnswer.put("readAnswer", readAnswer);
	    
	    System.out.println("reviewAnswer : " + reviewAnswer);
	    return reviewAnswer;
	}
	
	
	// 답글 수정
	@PutMapping("/reviewAnswer")
	public void updateAnswer(AnswerDTO answerContent) {
		
	}
	
	// 답글 삭제
	@PutMapping("/deleteAnswer")
	public void deleteAnswer(AnswerDTO answerCode) {
		
	}
	
	// 손님이 볼 가게 화면
	@GetMapping("/store")
	public String storeMain(@RequestParam("storeCode") int storeCode, Model model, HttpSession session) {

		// 고정 정보 내용
		
		// 리뷰 평점
		
		// 리뷰 갯수 카운트
		int reviewCount = sc.reviewCount(storeCode);
		
		// 찜
		Integer userCode = (Integer) session.getAttribute("userCode");
		System.out.println("userCode="+userCode);
		int zzimCheck = 0;	
		if(userCode != null) {
			System.out.println("zr1="+zzimCheck);
			zzimCheck = zr.zzimCheck(new ZzimDTO(userCode, storeCode));
			System.out.println("zr2="+zzimCheck);
			if(zzimCheck == 0) {
				session.setAttribute("ZCheck", 1);
			}else {
				session.setAttribute("ZCheck", 0);				
			}
		}else {
			session.setAttribute("ZCheck", 1);
		}

		// 메뉴 탭
		System.out.println("storeCode @service: " + storeCode);
		// 메뉴분류 정보
		List<MenuDTO> CList = sc.selectMenuClassification(storeCode);
		// 메뉴정보
		List<MenuDTO> readMenuInfo = sc.selectAllMenuInfo(storeCode);
		System.out.println(readMenuInfo);
		
		// 가게 정보 탭
		StoreDTO readStore = sc.selectStore(storeCode);
		SellerDTO readSeller = sc.selectSeller(readStore.getSellerCode());
		System.out.println("sellerCode @service : " + readStore.getSellerCode());
		
		// 리뷰 탭
		List<ReviewDTO> reviewList = sc.selectAllReview(storeCode);
		List<AnswerDTO> answerList = sc.selectAllAnswer(storeCode);
		
		// 모델 심기
		model.addAttribute("readStore", readStore);
		model.addAttribute("readSeller", readSeller);
		model.addAttribute("readMenuInfo", readMenuInfo);
		model.addAttribute("CList", CList);
		model.addAttribute("RList", reviewList);
		model.addAttribute("AList", answerList);
		model.addAttribute("RCount", reviewCount);

		
		return "store/store";
	}
	
}
