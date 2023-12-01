package com.acorn.baemin.order.kakaotest;
/*
 * package com.acorn.baemin.order.controller;
 * 
 * 
 * import javax.servlet.http.HttpSession;
 * 
 * import org.springframework.beans.factory.annotation.Autowired;
 * 
 * import org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.servlet.mvc.support.RedirectAttributes;
 * 
 * import com.acorn.baemin.domain.OrderDTO; import
 * com.acorn.baemin.order.domain.KakaoPayApprovalVO; import
 * com.acorn.baemin.order.service.UserOrderServiceImp;
 * 
 * import lombok.Setter; import lombok.extern.java.Log;
 * 
 * @Log
 * 
 * @Controller public class SampleController구 {
 * 
 * @Setter(onMethod_ = @Autowired) private KakaoPay kakaopay;
 * 
 * 
 * @Autowired UserOrderServiceImp userOrderService;
 * 
 * 
 * 
 * 
 * // @GetMapping("/kakaoPay") public void kakaoPayGet() {
 * 
 * }
 * 
 * @PostMapping("/kakaoPay") public String kakaoPay(HttpSession
 * session, @RequestParam String deliveryAddress, @RequestParam int deliveryFee,
 * 
 * @RequestParam int payType,
 * 
 * @RequestParam int orderType,
 * 
 * @RequestParam String reqToSeller,
 * 
 * @RequestParam String reqToRider,
 * 
 * @RequestParam String userPhone) {
 * log.info("kakaoPay post............................................");
 * 
 * OrderDTO orderDTO = (OrderDTO) session.getAttribute("orderDTO");
 * orderDTO.setDeliveryAddress(deliveryAddress);
 * orderDTO.setDeliveryFee(deliveryFee); orderDTO.setReqToRider(reqToRider);
 * orderDTO.setReqToSeller(reqToSeller); orderDTO.setOrderStatus("주문접수");
 * orderDTO.setUserPhone(userPhone); orderDTO.setPayType(payType);
 * orderDTO.setOrderType(orderType); orderDTO.setOrderDate("오늘");
 * userOrderService.insertOrder(orderDTO); OrderDTO lastOrderDTO =
 * userOrderService.getLastOrder(); System.out.println("주문번호 : ");
 * System.out.println(lastOrderDTO.getOrderNumber());
 * orderDTO.setOrderNumber(lastOrderDTO.getOrderNumber());
 * System.out.println(orderDTO); return "redirect:" 
 * kakaopay.kakaoPayReady(orderDTO);
 * 
 * }
 * 
 * @GetMapping("/kakaoPaySuccess") public String
 * kakaoPaySuccess(RedirectAttributes
 * redirectAttributes, @RequestParam("pg_token") String pg_token, Model model,
 * HttpSession session) {
 * log.info("kakaoPaySuccess get............................................");
 * log.info("kakaoPaySuccess pg_token : " + pg_token);
 * System.out.println("카카오페이 테스트1"); OrderDTO orderDTO = (OrderDTO)
 * session.getAttribute("orderDTO"); System.out.println("카카오페이 테스트2");
 * System.out.println(orderDTO); model.addAttribute("info",
 * kakaopay.kakaoPayInfo(pg_token, orderDTO));
 * 
 * OrderDTO lastOrderDTO = userOrderService.getLastOrder();
 * System.out.println(lastOrderDTO.getOrderNumber());
 * redirectAttributes.addAttribute("orderNumber",
 * lastOrderDTO.getOrderNumber()); return "redirect:orderDetail"; }
 * 
 * }
 */