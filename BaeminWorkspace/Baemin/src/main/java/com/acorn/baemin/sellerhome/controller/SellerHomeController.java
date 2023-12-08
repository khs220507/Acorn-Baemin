package com.acorn.baemin.sellerhome.controller;


import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.acorn.baemin.domain.OptionDTO;
import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.sellerhome.repository.SellerHomeRepository;
@Controller
public class SellerHomeController {
	@Autowired
	SellerHomeRepository rep;
	//이미지 경로
	//로컬
	//private String fileDir = "c:\\test\\upload\\";
	//배포
	private String fileDir ="/usr/local/tomcat/upload/";  
	//사장님 홈 화면
	@GetMapping("/sellerHome")
	public String sellerStore(@RequestParam String sellerCode, Model model, HttpSession session) {
		List<StoreDTO> result  = rep.sellerStore(sellerCode);
		session.setAttribute("seller", sellerCode);
		model.addAttribute("list", result);
		return "seller/seller_home";
		}
	//이미지 불러오기
	 @ResponseBody
	 @RequestMapping(value="/storeImages/{storeImage:.*}" ,method = RequestMethod.GET)
	 public Resource sellerStoreImg(@PathVariable String storeImage) throws MalformedURLException {
		 return new UrlResource("file:/usr/local/tomcat/upload/"+storeImage);
	 }
	//매장 등록
	@ResponseBody
	@RequestMapping( value="/sellerHome" , method=RequestMethod.POST)
	public String insertStore(int sellerCode, String storeName, String storeCategory, MultipartFile storeImage, String storeAddress, String storeAddressDetail,String storePhone, int minOrderPrice, int deliveryFee, String deliveryArea) throws IllegalStateException, IOException {
		if( !storeImage.isEmpty()) {
			//이미지 업로드 파트
			String fileName  = storeImage.getOriginalFilename();
			String storeRealImage = fileDir +sellerCode+fileName ; // c:\\test\\upload\\고양이.jpg
			storeImage.transferTo(new File(storeRealImage)); 
			//db에 넣기
			String storeImageName = sellerCode+fileName;
			StoreDTO store = new StoreDTO(0, sellerCode, storeName, storeCategory, storeImageName, storeAddress, storeAddressDetail, storePhone, 0, 0, 0, null, minOrderPrice, deliveryFee, null, deliveryArea, 0);
			rep.insertStore(store);
		}
		return  "upload-ok";
	}
	//매장 삭제
	@ResponseBody
	@RequestMapping( value="/sellerHome" , method=RequestMethod.PUT)
	public void updateOption(@RequestBody StoreDTO store) {
		rep.deleteStore(store);
	}
	//매장 수정 화면 불러오기
	@ResponseBody
	@RequestMapping( value="/sellerHome/{storecode}" , method=RequestMethod.GET)
	public StoreDTO updateSellerStore(@PathVariable String storecode , Model model){	
		StoreDTO store = rep.updateSellerStore(storecode);
		return store;
	}

	//매장 수정
	@ResponseBody
	@RequestMapping( value="/upsellerHome" , method=RequestMethod.POST)
	public String updateStore(int upstoreStatus ,int sellerCode, String upstoreName, String upstoreCategory, MultipartFile upstoreImage, String upstoreAddress, String upstoreAddressDetail, String upstorePhone, int upminOrderPrice, int updeliveryFee, String updeliveryArea, int sstoreCode ,String backupStoreImage) throws IllegalStateException, IOException {
		System.out.println("테스트1 : " + upstoreStatus);
		String fileName  = upstoreImage.getOriginalFilename();
		String storeRealImage = fileDir +sellerCode+fileName ;
		String storeImageName = sellerCode+fileName;
		if(!upstoreImage.isEmpty()) {
				upstoreImage.transferTo(new File(storeRealImage));
		}else {
			storeImageName = backupStoreImage;
		}
		StoreDTO Store = new StoreDTO(sstoreCode, sellerCode, upstoreName, upstoreCategory, storeImageName, upstoreAddress, upstoreAddressDetail,upstorePhone, 0, 0, 0, null, upminOrderPrice, updeliveryFee, null, updeliveryArea, upstoreStatus);
		System.out.println("테스트2 : " + Store);
		rep.updateStore(Store);
		return "sss";
	}
	

}
