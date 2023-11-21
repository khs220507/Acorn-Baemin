use baemin_db;

-- 01 회원 user_tbl
CREATE TABLE user_tbl (
    userCode INT AUTO_INCREMENT PRIMARY KEY,
    userId VARCHAR(20) NOT NULL UNIQUE,
    userPw VARCHAR(30) NOT NULL,
    userName VARCHAR(20) NOT NULL,
    userNickname VARCHAR(20) NOT NULL,
    userPhone VARCHAR(50) NOT NULL UNIQUE,
    userEmail VARCHAR(50) NOT NULL UNIQUE,
    userBirth VARCHAR(20) NOT NULL,
    userGender TINYINT(1) NOT NULL, -- 0:남자, 1:여자
    userPostCode VARCHAR(50) NOT NULL,
    userAddress VARCHAR(150) NOT NULL,
    userAddressDetail VARCHAR(150) NOT NULL,
    userStatus TINYINT(1) NOT NULL DEFAULT 1 -- 0:회원탈퇴, 1:정상회원
) AUTO_INCREMENT = 10001;

INSERT INTO user_tbl (userId, userPw, userName, userNickname, userPhone, userEmail, userBirth, userGender, userPostCode, userAddress, userAddressDetail, userStatus)
VALUES
('user001', 'password1', '홍길동', '길동이', '010-1234-5678', 'user1@example.com', '1990-01-01', 0, '12345', '서울시 강남구', '아파트 101호', 1),
('user002', 'password2', '김철수', '철수씨', '010-2345-6789', 'user2@example.com', '1985-05-15', 1, '54321', '서울시 강서구', '오피스텔 202호', 1),
('user003', 'password3', '이영희', '영희언니', '010-3456-7890', 'user3@example.com', '1992-11-30', 1, '67890', '서울시 송파구', '단독주택', 1),
('user004', 'password4', '박민수', '민수씨', '010-4567-8901', 'user4@example.com', '1988-03-25', 0, '45678', '서울시 서초구', '맨션 303호', 1),
('user005', 'password5', '정수영', '영이니', '010-5678-9012', 'user5@example.com', '1996-09-10', 1, '78901', '서울시 강북구', '단독주택', 1);

select * from user_tbl;


-- 02 사장 seller_tbl
CREATE TABLE seller_tbl (
    sellerCode INT AUTO_INCREMENT PRIMARY KEY,
    sellerRegCode VARCHAR(30) UNIQUE NOT NULL,
    sellerId VARCHAR(20) NOT NULL UNIQUE,
    sellerPw VARCHAR(30) NOT NULL,
    sellerName VARCHAR(20) NOT NULL,
    sellerPhone VARCHAR(50) NOT NULL UNIQUE,
    sellerEmail VARCHAR(50) NOT NULL UNIQUE,
    sellerBirth VARCHAR(20) NOT NULL,
    sellerGender TINYINT(1) NOT NULL, -- 0:남자, 1:여자
    sellerStatus TINYINT(1) NOT NULL DEFAULT 1 -- 0:회원탈퇴, 1:정상회원
) AUTO_INCREMENT = 20001;

INSERT INTO seller_tbl (sellerRegCode, sellerId, sellerPw, sellerName, sellerPhone, sellerEmail, sellerBirth, sellerGender, sellerStatus)
VALUES
('reg001', 'seller001', 'password1', '김사장', '010-1234-5678', 'seller1@example.com', '1978-07-20', 0, 1),
('reg002', 'seller002', 'password2', '이사장', '010-2345-6789', 'seller2@example.com', '1982-04-15', 0, 1),
('reg003', 'seller003', 'password3', '박사장', '010-3456-7890', 'seller3@example.com', '1975-11-30', 0, 1),
('reg004', 'seller004', 'password4', '최사장', '010-4567-8901', 'seller4@example.com', '1989-02-25', 0, 1),
('reg005', 'seller005', 'password5', '정사장', '010-5678-9012', 'seller5@example.com', '1983-06-10', 0, 1);

select * from seller_tbl;

-- 03. 태민 store_tbl

CREATE TABLE store_tbl (
  storeCode INT AUTO_INCREMENT PRIMARY KEY, 	-- 매장코드
  sellerCode int,							-- 사장코드
  storeName VARCHAR(50) NOT NULL,    		-- 매장이름
  storeCategory VARCHAR(50) NOT NULL,  		-- 음식 카테고리
  storeImage VARCHAR(200),   			-- 매장사진
  storeAddress VARCHAR(200) default '',  	-- 매장주소
  storePhone VARCHAR(12) NOT NULL,    		-- 매장전화번호
  zzimCount INT default 0,             		-- 찜개수
  reviewCount INT default 0,           		-- 리뷰수
  storeRating DECIMAL(3, 1) default 0,  	-- 매장평점
  storeDescription VARCHAR(1000),     		-- 매장소개글
  minOrderPrice INT NOT NULL,        		-- 최소주문금액
  deliveryFee INT NOT NULL,           		-- 배달비
  operatingTime VARCHAR(50) , 				-- 운영시간
  deliveryArea VARCHAR(50) NOT NULL,  		-- 배달지역
  storeStatus INT default 0 ,   -- 가게 상태(0:open, 1:close)
  foreign key (sellerCode) references seller_tbl(sellerCode)
) auto_increment = 30001;


INSERT INTO store_tbl (sellerCode, storeName, storeCategory, storeImage, storeAddress, storePhone, zzimCount, reviewCount, storeRating, storeDescription, minOrderPrice, deliveryFee, operatingTime, deliveryArea, storeStatus)
VALUES
(20001, '맛있는 음식점1', '한식', 'store1.jpg', '서울시 강남구 강남대로 123', '02-1234-5678', 100, 50, 4.5, '맛있는 음식점입니다.', 15000, 3000, '10:00 - 22:00', '강남구', 0),
(20002, 'Pizza Heaven', '피자', 'store2.jpg', '서울시 강서구 강서로 456', '02-2345-6789', 120, 70, 4.2, '신선한 재료로 만든 피자!', 20000, 2500, '11:00 - 21:00', '강서구', 1),
(20003, 'Sushi Master', '일식', 'store3.jpg', '서울시 송파구 올림픽로 789', '02-3456-7890', 90, 60, 4.3, '마스터의 손맛을 느껴보세요.', 18000, 3500, '12:00 - 20:00', '송파구', 1),
(20004, 'BBQ Grill', '양식', 'store4.jpg', '서울시 서초구 강남대로 1010', '02-4567-8901', 80, 40, 4.1, '고기의 맛을 느끼세요!', 25000, 2000, '11:30 - 22:30', '서초구', 1),
(20005, 'Noodle House', '중식', 'store5.jpg', '서울시 강북구 북촌로 111', '02-5678-9012', 70, 30, 4.4, '뜨끈한 국수 맛집입니다.', 12000, 2800, '11:00 - 21:00', '강북구', 1);

select * from store_tbl;
SELECT AVG(storeRating) AS storeAvgRating
        FROM store_tbl
        WHERE storeCode = 30001;
UPDATE store_tbl SET storeStatus = 0 where storeCode = 30006;

-- 04. 태민 menu_tbl 

CREATE TABLE menu_tbl (
  menuCode INT AUTO_INCREMENT PRIMARY KEY,     	-- 메뉴코드
  storeCode INT, 								-- 매장코드
  menuName VARCHAR(50) NOT NULL,        	-- 메뉴이름
  menuPrice INT default 0,                     	-- 메뉴가격
  menuImage VARCHAR(50),      			-- 메뉴사진
  menuContent TEXT NOT NULL,           		-- 메뉴설명
  menuClassification VARCHAR(50) default '없음', 	-- 메뉴분류
  menuStatus TINYINT NOT NULL,           	-- 메뉴상태(0:open, 1:sold out)
  foreign key (storeCode) references store_tbl(storeCode)
) auto_increment = 40001;

INSERT INTO menu_tbl (storeCode, menuName, menuPrice, menuImage, menuContent, menuClassification, menuStatus)
VALUES
(30001, '김치찌개', 9000, 'menu1.jpg', '맛있는 김치찌개', '찌개', 0),
(30001, '된장찌개', 8500, 'menu2.jpg', '향긋한 된장찌개', '찌개', 0),
(30001, '불고기', 12000, 'menu3.jpg', '매콤한 불고기', '고기요리', 0),
(30002, '페퍼로니 피자', 18000, 'menu4.jpg', '고소한 페퍼로니와 치즈', '피자', 0),
(30002, '마르게리따 피자', 16000, 'menu5.jpg', '신선한 토마토와 바질', '피자', 0),
(30003, '연어 초밥', 20000, 'menu6.jpg', '신선한 연어와 식재료', '초밥', 0),
(30003, '새우 초밥', 18000, 'menu7.jpg', '신선한 새우와 식재료', '초밥', 0),
(30004, '스테이크', 25000, 'menu8.jpg', '부드러운 스테이크', '고기요리', 0),
(30004, '리브 아이 스테이크', 28000, 'menu9.jpg', '초이스 등급의 스테이크', '고기요리', 0),
(30005, '짜장면', 8000, 'menu10.jpg', '간짜장의 맛', '면요리', 0),
(30005, '짬뽕', 10000, 'menu11.jpg', '매운 맛이 일품', '면요리', 0);

select * from menu_tbl;
select DISTINCT menuClassification from menu_tbl;
        
        
-- 05. 옵션 option_tbl
create table option_tbl (
    optionCode int auto_increment primary key,
    menuCode int,
    optionCategory varchar(255),
    optionSelectType tinyint,
    optionName varchar(255),
    optionPrice int, 
    optionStatus INT default 0 
)auto_increment = 50001;

UPDATE option_tbl SET optionStatus = 0 where optionCode = 50001 ;


INSERT INTO option_tbl (menuCode, optionCategory, optionSelectType, optionName, optionPrice, optionStatus)
VALUES
(40001, '소스', 0, '간장 소스', 1000, 0),
(40001, '소스', 0, '마요네즈 소스', 1000, 0),
(40001, '소스', 0, '고추장 소스', 1000, 0),
(40002, '치즈', 1, '모짜렐라 치즈', 2000, 1),
(40002, '치즈', 1, '체다 치즈', 2000, 1),
(40003, '맛 추가', 2, '매운맛 추가', 500, 1),
(40003, '맛 추가', 2, '양념맛 추가', 500, 1),
(40004, '토핑', 3, '계란 토핑', 1500, 1),
(40004, '토핑', 3, '베이컨 토핑', 2000, 1),
(40005, '스프', 4, '미소 스프', 1000, 1),
(40005, '스프', 4, '토마토 스프', 1000, 1);

select * from option_tbl;

-- 06. 장바구니 cart_tbl 테이블 생성
create table cart_tbl (
    cartCode int auto_increment primary key,
    userId varchar(30),
    storeCode int,
    menuCode int,
    optionCode int,
    menuCount int,
    cartPrice int,
    optionStatus tinyint,
    foreign key  (storeCode) references store_tbl(storeCode),
    foreign key  (menuCode) references menu_tbl(menuCode),
    foreign key  (optionCode) references option_tbl(optionCode)
)auto_increment = 60001;



SELECT DISTINCT userId, optionCode,menuCount from cart_tbl where userId = 'user001';
select * from cart_tbl;

-- 07
CREATE TABLE order_tbl (
    orderNumber INT AUTO_INCREMENT PRIMARY KEY,
    userCode int,
    storeCode int,
    orderMenuName varchar(100),
	orderMenuNumber int,
	orderMenuPrice int,
	orderStoreName varchar(100),
	orderStoreImage varchar(100),
    orderDate DATE,
    payType TINYINT(1) UNSIGNED, -- 0 : 카카오결제 1 : 현장결제
    orderType TINYINT(1) UNSIGNED, -- 0 : 배달 1 : 포장
    reqToSeller VARCHAR(300),
    reqToRider VARCHAR(300),
    orderStatus VARCHAR(200), -- 주문접수, 배달중, 배달완료
    -- 추가
    optionsInfo varchar(300),
    deliveryFee INT,
	deliveryAddress VARCHAR(200),
    userPhone varchar(50),
    FOREIGN KEY (userCode) REFERENCES user_tbl(userCode),
    FOREIGN KEY (storeCode) REFERENCES store_tbl(storeCode)
) AUTO_INCREMENT = 70001;


select * from order_tbl;

-- 08
CREATE TABLE zzim_tbl (
    userCode int,
    storeCode int,
    FOREIGN KEY (userCode) REFERENCES user_tbl(userCode),
    FOREIGN KEY (storeCode) REFERENCES store_tbl(storeCode)
);

INSERT INTO zzim_tbl (userCode, storeCode)
VALUES
(10001, 30001),
(10002, 30002),
(10003, 30003),
(10004, 30004),
(10005, 30005);

select * from zzim_tbl;

-- 09
CREATE TABLE review_tbl (
    reviewCode INT AUTO_INCREMENT PRIMARY KEY,
    orderMenuName VARCHAR(100),
    userCode int,
    storeCode int,
    reviewImage VARCHAR(300),
    reviewDate DATE,
    reviewRating INT,
    reviewContent VARCHAR(300),
    reviewImageName VARCHAR(300),
   FOREIGN KEY (userCode) REFERENCES user_tbl(userCode),
   FOREIGN KEY (storeCode) REFERENCES store_tbl(storeCode)
) AUTO_INCREMENT=90001;


select * from review_tbl;

-- 10
CREATE TABLE answer_tbl (
    answerCode int AUTO_INCREMENT PRIMARY KEY,
    storeCode int,
    sellerCode int,
    reviewCode int,
    answerDate DATE NOT NULL,
    answerContent VARCHAR(300) NOT NULL,
    FOREIGN KEY (reviewCode) REFERENCES review_tbl(reviewCode),
    FOREIGN KEY (sellerCode) REFERENCES seller_tbl(sellerCode)
) AUTO_INCREMENT=100001;


select * from answer_tbl;

-- 11 태민 address_tbl;

CREATE TABLE address_tbl (
  addressCode INT AUTO_INCREMENT PRIMARY KEY,			-- 주소코드
  userCode INT,						-- 회원코드
  deliveryAddress VARCHAR(200) NOT NULL,				-- 배달주소
  FOREIGN KEY (userCode) REFERENCES user_tbl(userCode)	-- 회원코드 참조하는 곳
) auto_increment = 110001;

INSERT INTO address_tbl (userCode, deliveryAddress)
VALUES
(10001, '서울시 강남구 강남대로 123 아파트 101호'),
(10002, '서울시 강서구 강서로 456 오피스텔 202호'),
(10003, '서울시 송파구 올림픽로 789 단독주택'),
(10004, '서울시 서초구 강남대로 1010 맨션 303호'),
(10005, '서울시 강북구 북촌로 111 단독주택');

select * from address_tbl;

commit;

show tables;




-- Drop all tables
DROP TABLE cart_tbl;
DROP TABLE order_tbl;
DROP TABLE answer_tbl;
DROP TABLE zzim_tbl;
DROP TABLE review_tbl;
DROP TABLE address_tbl;
DROP TABLE option_tbl;
DROP TABLE menu_tbl;
DROP TABLE store_tbl;
DROP TABLE seller_tbl;
DROP TABLE user_tbl;
DROP TABLE IF EXISTS cart_tbl, order_tbl, answer_tbl, zzim_tbl, review_tbl, address_tbl, option_tbl, menu_tbl, store_tbl, seller_tbl, user_tbl;




