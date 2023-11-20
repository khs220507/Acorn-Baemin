package com.acorn.baemin.seller.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.acorn.baemin.domain.InfoDTO;
import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.seller.service.SellerService;

@Controller
public class SellerController {

	@Autowired
	private SellerService sc;

	String fileDir = "c:\\test\\upload\\";
	// 이미지 조회
	@ResponseBody
	@GetMapping("/images/{menuImage:.*}")
	public Resource menuImage(@PathVariable String menuImageFile) throws MalformedURLException {
		return new UrlResource("file:c:\\test\\upload\\" + menuImageFile);
	}
	
	// 사장님의 메뉴 탭 화면
	@GetMapping("/sellerMenu")
	public String readMenu(Integer storeCode, Model model, HttpSession session) {
		
		System.out.println("storeCode @service: " + storeCode);
		session.setAttribute("storeCode", storeCode);
		if(storeCode != null) {
			StoreDTO readStore = sc.selectStore(storeCode);
			SellerDTO readSeller = sc.selectSeller(readStore.getSellerCode());
			List<MenuDTO> readMenuInfo = sc.selectAllMenuInfo(storeCode);
			List<MenuDTO> CList = sc.selectMenuClassification(storeCode);
			System.out.println(readMenuInfo);
			int reviewCount = sc.reviewCount(storeCode);
			
			model.addAttribute("readStore", readStore);
			model.addAttribute("readSeller", readSeller);
			model.addAttribute("readMenuInfo", readMenuInfo);
			model.addAttribute("CList", CList);
			model.addAttribute("reviewCount", reviewCount);

			return "seller/store_manage";
			} else {
				return "redirect:/home";
			}
	}
	
	// 메뉴 등록
	@PostMapping("/sellerMenu")
	public String createtMenu(Integer storeCode, Integer menuCode, String menuName, Integer menuPrice, MultipartFile menuImageFile,
			String menuContent, String menuClassification, Integer menuStatus, HttpSession session)
					throws IllegalStateException, IOException {
		
		System.out.println("menuName" + menuName);
		System.out.println("menuPrice" + menuPrice);
		System.out.println("menuContent" + menuContent);
		System.out.println("menuClassification" + menuClassification);
		System.out.println("menuStatus" + menuStatus);
		System.out.println("storeCode" + storeCode);
		
		try {
			if (!menuImageFile.isEmpty()) {
				// 이미지 업로드
				String fileName = menuImageFile.getOriginalFilename();
				String menuRealImage = fileDir + menuName + fileName; // c:\\test\\upload\\고양이.jpg
				menuImageFile.transferTo(new File(menuRealImage));
				
				// db에 넣기
				String menuImage = menuName + fileName;
				
				System.out.println(menuImage);
				
<<<<<<< Updated upstream
				MenuDTO menu = new MenuDTO(menuCode, storeCode, menuName, menuPrice, menuImage, menuContent, menuClassification,
						menuStatus);
				
=======
				System.out.println("storeCode" + storeCode);
				System.out.println("menuName" + menuName);
				System.out.println("menuPrice" + menuPrice);
				System.out.println("menuContent" + menuContent);
				System.out.println("menuClassification" + menuClassification);
				System.out.println("menuStatus" + menuStatus);

				MenuDTO menu = new MenuDTO(storeCode, menuName, menuPrice, menuImage, menuContent, menuClassification, menuStatus);

>>>>>>> Stashed changes
				System.out.println(menu);
				sc.insertMenu(menu);
				session.setAttribute("menuCode", menuCode);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error @insertMenu");
		}
		return "seller/store_manage";
	}
	// 메뉴 수정
	@ResponseBody
	@PutMapping("/updateSellerMenu")
	public void updateMenuInfo(@RequestBody MenuDTO menu) {
		sc.modifingMenu(menu);
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
	public void updateStoreInfo(@RequestBody StoreDTO store) {
		System.out.println(store);
		
		sc.modifingStoreDTA(store);
	}
	
	
	// 사장님의 리뷰 탭 화면
	// 리뷰 조회
  @GetMapping("/registerAnswer")
	public HashMap<String, Object> readRnA(@RequestParam Integer storeCode) {
	    HashMap<String, Object> raMap = new HashMap<>();
	    ReviewDTO reviewcode = new ReviewDTO();
	    int reviewCode = reviewcode.getReviewCode();
	    System.out.println("storeCode @service: " + storeCode);
	    List<ReviewDTO> readReview = sc.selectAllReview(storeCode);
	    List<AnswerDTO> readAnswer = sc.selectAllAnswer(reviewCode);
	    
	    raMap.put("readReview", readReview);
	    raMap.put("readAnswer", readAnswer);
	    System.out.println("infoMap : " + raMap);
	    return raMap;
	}
	
	*/
	
	//@GetMapping("/registerAnswer")
	public String readReview(Integer storeCode, Model model, HttpSession session) {
		
		int userCode = (int) session.getAttribute("userCode");
	    ReviewDTO reviewcode = new ReviewDTO();
	    int reviewCode = reviewcode.getReviewCode();
		System.out.println("storeCode @service: " + storeCode);
		List<ReviewDTO> review = sc.selectAllReview(storeCode);
		List<AnswerDTO> answer = sc.selectAllAnswer(reviewCode);
		
		model.addAttribute("review", review);
		model.addAttribute("answer", answer);

		return "seller/store_manage";
	}
	
	
	// 리뷰 수정
	
	
	// 리뷰 삭제
	*/
	
	// 손님이 볼 가게 화면
	@GetMapping("/store")
	public String storeMain(@RequestParam("storeCode") int storeCode,
			Model model) {
		// 메뉴 탭
		// 메뉴정보
		List<MenuDTO> readMenuInfo = sc.selectAllMenuInfo(storeCode);
		// 메뉴분류 정보
		List<MenuDTO> CList = sc.selectMenuClassification(storeCode);
		System.out.println(readMenuInfo);
		System.out.println("storeCode @service: " + storeCode);
		
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

		return "store/store";
	}
	
}
