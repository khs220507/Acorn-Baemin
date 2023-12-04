package com.acorn.baemin.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.acorn.baemin.domain.OrderDTO;
import com.acorn.baemin.domain.ReviewDTO;
import com.acorn.baemin.domain.StoreDTO;
import com.acorn.baemin.home.repository.OrderDetailRepositoryImp;
import com.acorn.baemin.review.service.ReviewService;
import com.acorn.baemin.selectstrore.repository.SelectStoreRepository;
import com.acorn.baemin.seller.service.SellerService;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
public class ReviewController {
	//로컬
	//private String fileDir = "c:\\test\\upload\\";
	
	//배포
	private String fileDir ="/usr/local/tomcat/upload/";  

	@Autowired
	ReviewService reviewService;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	SelectStoreRepository StoreREP;

	@Autowired
	OrderDetailRepositoryImp rep;

	@GetMapping("/writeReview")
	public String showReviewForm(Integer orderNumber, HttpSession session, Model model) {
		System.out.println("테스트 리뷰쓰기 : " + orderNumber);
		session.setAttribute("orderNumber", orderNumber);
		List<OrderDTO> orderDTO = rep.orderDetailSelect(orderNumber);
		String orderDate = orderDTO.get(0).getOrderDate();
		String orderMenuName = orderDTO.get(0).getOrderMenuName();
		int orderMenuNumber = orderDTO.get(0).getOrderMenuNumber();
		int orderMenuPrice = orderDTO.get(0).getOrderMenuPrice();
		String orderStatus = orderDTO.get(0).getOrderStatus();
		String orderStoreName = orderDTO.get(0).getOrderStoreName();
		String orderStoreImage = orderDTO.get(0).getOrderStoreImage();
		model.addAttribute("orderDate", orderDate);
		model.addAttribute("orderMenuName", orderMenuName);
		model.addAttribute("orderMenuNumber", orderMenuNumber);
		model.addAttribute("orderMenuPrice", orderMenuPrice);
		model.addAttribute("orderStatus", orderStatus);
		model.addAttribute("orderStoreName", orderStoreName);
		model.addAttribute("orderStoreImage", orderStoreImage);
		
		return "/review/review_register";
	}

	@PostMapping("/submitReview")
	public String saveReview(HttpSession session, @RequestParam String reviewContent,
			@RequestParam MultipartFile reviewImage,  @RequestParam int reviewRating, @RequestParam String reviewDate,
			Model model) throws IOException {
		if (!reviewImage.isEmpty()) {
			String fullPath = fileDir + reviewImage.getOriginalFilename();
			reviewImage.transferTo(new File(fullPath));
			model.addAttribute("fileName", reviewImage.getOriginalFilename());
		}

		ReviewDTO reviewDTO = new ReviewDTO();
		int orderNumber = (int) session.getAttribute("orderNumber");
		List<OrderDTO> orderDTO = rep.orderDetailSelect(orderNumber);
		orderDTO.get(0).setReviewStatus(1);

		
		reviewDTO.setReviewContent(reviewContent);
		reviewDTO.setReviewRating(reviewRating);
		reviewDTO.setReviewImageName(reviewImage.getOriginalFilename());
		reviewDTO.setUserCode(orderDTO.get(0).getUserCode());
		reviewDTO.setOrderMenuName(orderDTO.get(0).getOrderMenuName());
		reviewDTO.setStoreCode(orderDTO.get(0).getStoreCode());
		reviewDTO.setOrderNumber(orderNumber);
		reviewDTO.setReviewDate(reviewDate);
		
		
		// Set other properties as needed

		// Save the review to the database using the ReviewService
		reviewService.insertReview(reviewDTO);
		reviewService.updateReviewStatus(orderDTO.get(0));
		
		//count
		int storeCode = orderDTO.get(0).getStoreCode();
		int cont = reviewService.reviewCount(storeCode);
		System.out.println(cont);
		
		//avg
		double avg = reviewService.storeAvgRating(storeCode);
		System.out.println(avg);
		StoreDTO store = new StoreDTO(storeCode, 0, null, null, null, null, null, null, 0, cont, avg, null, 0, 0, null, null, 0);
		System.out.println(store);
		StoreREP.upReviewCountAndStoreRating(store);
		return "review/review_submit";
	}
	
	

}
