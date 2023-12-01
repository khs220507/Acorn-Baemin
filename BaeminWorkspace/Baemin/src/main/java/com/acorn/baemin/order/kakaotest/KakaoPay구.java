package com.acorn.baemin.order.kakaotest;
/*
 * package com.acorn.baemin.order.controller;
 * 
 * import java.net.URI; import java.net.URISyntaxException;
 * 
 * import org.springframework.http.HttpEntity; import
 * org.springframework.http.HttpHeaders; import
 * org.springframework.http.MediaType; import
 * org.springframework.stereotype.Service; import
 * org.springframework.util.LinkedMultiValueMap; import
 * org.springframework.util.MultiValueMap; import
 * org.springframework.web.client.RestClientException; import
 * org.springframework.web.client.RestTemplate;
 * 
 * import com.acorn.baemin.domain.OrderDTO; import
 * com.acorn.baemin.order.domain.KakaoPayApprovalVO; import
 * com.acorn.baemin.order.domain.KakaoPayReadyVO;
 * 
 * import lombok.extern.java.Log;
 * 
 * @Service
 * 
 * @Log public class KakaoPay구 {
 * 
 * private static final String HOST = "https://kapi.kakao.com"; private
 * KakaoPayReadyVO kakaoPayReadyVO; private KakaoPayApprovalVO
 * kakaoPayApprovalVO;
 * 
 * public String kakaoPayReady( OrderDTO orderDTO) {
 * 
 * RestTemplate restTemplate = new RestTemplate();
 * 
 * 
 * 
 * // 서버로 요청할 Header HttpHeaders headers = new HttpHeaders();
 * 
 * headers.add("Authorization", "KakaoAK " +
 * "8b44519adc0723877cc1352fbf89cf6f"); headers.add("Accept",
 * MediaType.APPLICATION_JSON_UTF8_VALUE); headers.add("Content-Type",
 * MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 * 
 * String quantity = String.valueOf(orderDTO.getOrderMenuNumber()); String
 * total_amount = String.valueOf(orderDTO.getOrderMenuPrice());
 * 
 * // 서버로 요청할 Body MultiValueMap<String, String> params = new
 * LinkedMultiValueMap<String, String>(); params.add("cid", "TC0ONETIME");
 * params.add("partner_order_id", "test"); params.add("partner_user_id",
 * "test"); params.add("item_name", orderDTO.getOrderMenuName());
 * params.add("quantity", quantity); params.add("total_amount", total_amount);
 * params.add("tax_free_amount", "0"); params.add("approval_url",
 * "http://localhost:8080/kakaoPaySuccess");
 * 
 * 
 * //헤더,바디 합치는 방법 . HttpEntity<MultiValueMap<String, String>> body = new
 * HttpEntity<MultiValueMap<String, String>>(params, headers);
 * 
 * try { // RestTemplate= 카카오페이 데이터 보낼때 사용 , kakaoPayReadyVO =
 * restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
 * KakaoPayReadyVO.class);
 * 
 * log.info("" + kakaoPayReadyVO);
 * 
 * return kakaoPayReadyVO.getNext_redirect_pc_url();
 * 
 * } catch (RestClientException e) { // TODO Auto-generated catch block
 * e.printStackTrace(); } catch (URISyntaxException e) { // TODO Auto-generated
 * catch block e.printStackTrace(); }
 * 
 * return "/pay";
 * 
 * }
 * 
 * public KakaoPayApprovalVO kakaoPayInfo(String pg_token , OrderDTO orderDTO) {
 * 
 * log.info("KakaoPayInfoVO............................................");
 * log.info("-----------------------------");
 * 
 * RestTemplate restTemplate = new RestTemplate();
 * 
 * String total_amount = String.valueOf(orderDTO.getOrderMenuPrice());
 * 
 * // 서버로 요청할 Header HttpHeaders headers = new HttpHeaders();
 * 
 * headers.add("Authorization", "KakaoAK " +
 * "8b44519adc0723877cc1352fbf89cf6f"); headers.add("Accept",
 * MediaType.APPLICATION_JSON_UTF8_VALUE); headers.add("Content-Type",
 * MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 * 
 * // 서버로 요청할 Body MultiValueMap<String, String> params = new
 * LinkedMultiValueMap<String, String>(); params.add("cid", "TC0ONETIME");
 * params.add("tid", kakaoPayReadyVO.getTid()); params.add("partner_order_id",
 * "test"); params.add("partner_user_id", "test"); params.add("pg_token",
 * pg_token); params.add("total_amount", total_amount);
 * 
 * HttpEntity<MultiValueMap<String, String>> body = new
 * HttpEntity<MultiValueMap<String, String>>(params, headers);
 * 
 * try { kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST +
 * "/v1/payment/approve"), body, KakaoPayApprovalVO.class); log.info("" +
 * kakaoPayApprovalVO);
 * 
 * return kakaoPayApprovalVO;
 * 
 * } catch (RestClientException e) { // TODO Auto-generated catch block
 * e.printStackTrace(); } catch (URISyntaxException e) { // TODO Auto-generated
 * catch block e.printStackTrace(); }
 * 
 * return null; }
 * 
 * }
 * 
 */