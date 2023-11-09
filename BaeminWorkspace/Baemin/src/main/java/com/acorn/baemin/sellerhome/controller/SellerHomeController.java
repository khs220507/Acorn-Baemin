package com.acorn.baemin.sellerhome.controller;


import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.domain.StoreInsertDTO;
import com.acorn.baemin.sellerhome.repository.SellerHomeRepository;
@Controller
public class SellerHomeController {
	@Autowired
	SellerHomeRepository rep;
	
	String fileDir ="c:\\test\\upload\\"  ;
	
	@GetMapping("/sellerHome")
	public String sellerStore( Model model) {
		List<StoreDTO> result  = rep.sellerStore("20001");
		model.addAttribute("list", result);
		return "seller/seller_home";
		}
	
	 @ResponseBody
	 @RequestMapping(value="/images/{storeImage:.*}" ,method = RequestMethod.GET)
	 public Resource sellerStoreImg(@PathVariable String storeImage) throws MalformedURLException {
		 return new UrlResource("file:c:\\test\\upload\\"+storeImage);
	 }
	
	
	@ResponseBody
	@RequestMapping( value="/sellerHome" , method=RequestMethod.POST)
	public String insertStore(String storeName, String storeCategory, MultipartFile storeImage, String storeAddress, String storePhone, int minOrderPrice, int deliveryFee, String deliveryArea) throws IllegalStateException, IOException {
		if( !storeImage.isEmpty()) {
			//이미지 업로드 파트
			String fileName  = storeImage.getOriginalFilename();
			String storeRealImage = fileDir +storeName+fileName ; // c:\\test\\upload\\고양이.jpg
			storeImage.transferTo(new File(storeRealImage)); 
			
			//db에 넣기
			String storeImageName = storeName+fileName;
			StoreDTO store = new StoreDTO(0, 20001, storeName, storeCategory, storeImageName, storeAddress, storePhone, 0, 0, 0, null, minOrderPrice, deliveryFee, null, deliveryArea, 0);
			rep.insertStore(store);
		}
		
		
		return  "upload-ok";
	}
	

	@ResponseBody
	@RequestMapping( value="/sellerHome/{storecode}" , method=RequestMethod.DELETE)
	public void deleteStore(@PathVariable String storecode) {
		rep.deleteStore(storecode);
	}
	
	@ResponseBody
	@RequestMapping( value="/sellerHome/{storecode}" , method=RequestMethod.GET)
	public StoreDTO updateSellerStore(@PathVariable String storecode , Model model){	
		StoreDTO store = rep.updateSellerStore(storecode);
		return store;
	}

	@ResponseBody
	@RequestMapping( value="/upsellerHome" , method=RequestMethod.POST)
	public void updateStore(String upstoreName, String upstoreCategory, MultipartFile upstoreImage, String upstoreAddress, String upstorePhone, int upminOrderPrice, int updeliveryFee, String updeliveryArea, int sstoreCode ,String backupStoreImage) throws IllegalStateException, IOException {
	
		String fileName  = upstoreImage.getOriginalFilename();
		String storeRealImage = fileDir +upstoreName+fileName ; // c:\\test\\upload\\고양이.jpg
		String storeImageName = upstoreName+fileName;
		if(!upstoreImage.isEmpty()) {
			
				upstoreImage.transferTo(new File(storeRealImage));
			
		}else {
			storeImageName = backupStoreImage;
		}
		
		StoreDTO Store = new StoreDTO(sstoreCode, 20001, upstoreName, upstoreCategory, storeImageName, upstoreAddress, upstorePhone, 0, 0, 0, null, upminOrderPrice, updeliveryFee, null, updeliveryArea, 0);
		
		
		rep.updateStore(Store);
	}
	

}
