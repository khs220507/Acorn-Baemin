use baemin_db;
DROP TABLE IF EXISTS cart_tbl, order_tbl, answer_tbl, zzim_tbl, review_tbl, address_tbl, option_tbl, menu_tbl, store_tbl, seller_tbl, user_tbl;

-- 01 회원 user_tbl
CREATE TABLE user_tbl (
    userCode INT AUTO_INCREMENT PRIMARY KEY,
    userId VARCHAR(20) UNIQUE,
    userPw VARCHAR(30) ,
    userName VARCHAR(20) ,
    userNickname VARCHAR(20) ,
    userPhone VARCHAR(50) UNIQUE,
    userEmail VARCHAR(50) UNIQUE,
    userBirth VARCHAR(20) ,
    userGender TINYINT(1) , -- 0:남자, 1:여자
    userPostCode VARCHAR(50) ,
    userAddress VARCHAR(150) ,
    userAddressDetail VARCHAR(150) ,
    userStatus TINYINT(1) NOT NULL DEFAULT 1 -- 0:회원탈퇴, 1:정상회원
) AUTO_INCREMENT = 10001;

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

select * from seller_tbl;

-- 03. 태민 store_tbl

CREATE TABLE store_tbl (
  storeCode INT AUTO_INCREMENT PRIMARY KEY, 	-- 매장코드
  sellerCode int,							-- 사장코드
  storeName VARCHAR(50) NOT NULL,    		-- 매장이름
  storeCategory VARCHAR(50) NOT NULL,  		-- 음식 카테고리
  storeImage VARCHAR(200),   			-- 매장사진
  storeAddress VARCHAR(200) default '',  	-- 매장주소
  storeAddressDetail VARCHAR(200) default '', -- 상세주소
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

select * from store_tbl;

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

select * from menu_tbl;

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

select * from cart_tbl;

-- 07
CREATE TABLE order_tbl (
    orderNumber INT AUTO_INCREMENT PRIMARY KEY,
    menuCode int,
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
    reviewStatus TINYINT(1) UNSIGNED, -- 0 : 리뷰X, 1: 리뷰O
    FOREIGN KEY (menuCode) REFERENCES menu_tbl(menuCode),
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

-- 09
CREATE TABLE review_tbl (
    reviewCode INT AUTO_INCREMENT PRIMARY KEY,
    orderMenuName VARCHAR(100),
    userCode int,
    storeCode int,
    orderNumber int,
    reviewImage VARCHAR(300),
    reviewDate DATE,
    reviewRating INT,
    reviewContent VARCHAR(300),
    reviewImageName VARCHAR(300),
    userNickName VARCHAR(100),
    answerContent VARCHAR(300),
    answerDate DATE,
    foreign key (orderNumber) references order_tbl(orderNumber),
    FOREIGN KEY (userCode) REFERENCES user_tbl(userCode),
   FOREIGN KEY (storeCode) REFERENCES store_tbl(storeCode)
) AUTO_INCREMENT=90001;

select * from review_tbl;
        
-- 10 태민 address_tbl;

CREATE TABLE address_tbl (
  addressCode INT AUTO_INCREMENT PRIMARY KEY,			-- 주소코드
  userCode INT,						-- 회원코드
  deliveryAddress VARCHAR(200) NOT NULL,
  detailDeliveryAddress varchar(300) NOT NULL,-- 배달주소
  addressStatus int not null default 2, -- 가장최근:1 나머지:0 , 집:2
  FOREIGN KEY (userCode) REFERENCES user_tbl(userCode)	-- 회원코드 참조하는 곳
) auto_increment = 110001;

SELECT * FROM address_tbl;

commit;
show tables;