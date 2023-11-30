package com.acorn.baemin.login.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.baemin.domain.AddressDTO;
import com.acorn.baemin.domain.SellerDTO;
import com.acorn.baemin.domain.UserDTO;
import com.acorn.baemin.login.repository.LoginRepository;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class LoginService {

	@Autowired
	private LoginRepository loginRepository;
	// 카카오 로그인 api 토큰 받아오기
	public String getAccessToken (String authorize_code) {

		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
            
			sb.append("&client_id=cb322579447f8ce7146c35d4ff678f85"); //본인이 발급받은 key

			sb.append("&redirect_uri=http://3.35.26.227:8080/baemin/kakaoLogin"); // 본인이 설정한 주소

			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();

			System.out.println("responseCode @getAccessToken : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			System.out.println("response body @getAccessToken : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
			System.out.println("access_token @getAccessToken : " + access_Token);
			System.out.println("refresh_token @getAccessToken : " + refresh_Token);
            
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	// 얻은 토큰으로 사용자 정보와 주소를 가져오고 db에 없으면 추가하기
	public UserDTO getUserInfoAndAddress(String access_Token) {

	    HashMap<String, Object> userInfo = new HashMap<String, Object>();

	    // Kakao 주소 정보 가져오기
	    String addressReqURL = "https://kapi.kakao.com/v1/user/shipping_address";
	    try {
			URL url = new URL(addressReqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode @getUserAddress : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body @getUserAddress : " + result);
			
			// JSON 파싱
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			 // "shipping_addresses" 키의 값을 JsonArray로 추출
		    JsonArray shippingAddressesArray = element.getAsJsonObject().getAsJsonArray("shipping_addresses");

	        // 주소 정보가 있는 경우, 해당 정보를 userInfo에 추가
	        if (shippingAddressesArray != null && shippingAddressesArray.size() > 0) {
	            JsonObject firstShippingAddress = shippingAddressesArray.get(0).getAsJsonObject();
	            String baseAddress = firstShippingAddress.get("base_address").getAsString();
	            String detailAddress = firstShippingAddress.get("detail_address").getAsString();

	            userInfo.put("baseAddress", baseAddress);
	            userInfo.put("detailAddress", detailAddress);

	            System.out.println("받아온 주소 정보: " + baseAddress + ", " + detailAddress);
	        } else {
	            System.out.println("No shipping addresses found.");
	        }

	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    // Kakao 사용자 정보 가져오기
	    String userInfoReqURL = "https://kapi.kakao.com/v2/user/me";
	    try {

			URL url = new URL(userInfoReqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode @getUserInfo : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body @getUserInfo : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

	        JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        String phoneNumber = kakaoAccount.getAsJsonObject().get("phone_number").getAsString();
	        String email = kakaoAccount.getAsJsonObject().get("email").getAsString();

	        System.out.println("받아온 사용자 정보: " + phoneNumber + ", " + email);
	        userInfo.put("phoneNumber", phoneNumber);
	        userInfo.put("email", email);

	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    // 정보가 저장되어 있는지 확인
	    
	    UserDTO result = loginRepository.findKakao(userInfo);

	    System.out.println("이미 저장된 정보: " + result);

	    // result가 null이면 정보가 저장되어 있지 않으므로 정보를 저장
	    if (result == null) {
	        // 정보를 저장하기 위해 Repository로 보냄
	        loginRepository.kakaoInsert(userInfo);
	        // 정보 저장 후 컨트롤러에 정보를 보냄
	        return loginRepository.findKakao(userInfo);
	        // result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용
	    } else {
	        return result;
	        // 정보가 이미 있기 때문에 result를 리턴함
	    }
	}
	
	// 카카오 로그인 api로 가져온 주소 정보를 address_tbl에 추가하기
	public AddressDTO findAndInsertAddrInfo(UserDTO userInfo) {
		
		AddressDTO addr = loginRepository.findAddrInfo(userInfo);
		
		if(addr == null) {
			loginRepository.addressInsert(userInfo);   //등록
			
			AddressDTO addrInfo = loginRepository.findAddrInfo(userInfo);
			System.out.println(addrInfo);
			return addrInfo;
		} else {
			System.out.println("@service : " + addr);
			return addr;
		}
	}
	
	// 손님 로그인
	public UserDTO loginCustomer(String userId, String userPw) {
		try {
			return loginRepository.login(userId, userPw);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 사장님 로그인
	public SellerDTO loginSeller(String sellerId, String sellerPw) {
		try {
			return loginRepository.loginseller(sellerId, sellerPw);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
