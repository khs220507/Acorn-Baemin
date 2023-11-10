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
  storeStatus TINYINT default 0 ,   -- 가게 상태(0:close, 1:open)
  foreign key (sellerCode) references seller_tbl(sellerCode)
) auto_increment = 30001;


-- 04. 태민 menu_tbl

CREATE TABLE menu_tbl (
  menuCode INT AUTO_INCREMENT PRIMARY KEY,     	-- 메뉴코드
  storeCode INT, 								-- 매장코드
  menuName VARCHAR(50) NOT NULL,        	-- 메뉴이름
  menuPrice INT default 0,                     	-- 메뉴가격
  menuImage VARCHAR(50),      			-- 메뉴사진
  menuContent TEXT NOT NULL,           		-- 메뉴설명
  menuClassification VARCHAR(50) NOT NULL, 	-- 메뉴분류
  menuStatus TINYINT NOT NULL,           	-- 메뉴상태(0:open, 1:sold out)
  foreign key (storeCode) references store_tbl(storeCode)
) auto_increment = 40001;


-- 05. 옵션 option_tbl
create table option_tbl (
    optionCode int auto_increment primary key,
    menuCode int,
    optionCategory varchar(255),
    optionSelectType tinyint,
    optionName varchar(255),
    optionPrice int, 
    optionStatus tinyint
)auto_increment = 50001;

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
    payType TINYINT(1) UNSIGNED,
    orderType TINYINT(1) UNSIGNED,
    reqToSeller VARCHAR(300),
    reqToRider VARCHAR(300),
    orderStatus VARCHAR(20),
    -- 추가
    optionCategory varchar(255),
    optionName varchar(255),
    deliveryFee INT,
	deliveryAddress VARCHAR(200),
    userPhone varchar(50),
    FOREIGN KEY (userCode) REFERENCES user_tbl(userCode),
    FOREIGN KEY (storeCode) REFERENCES store_tbl(storeCode)
) AUTO_INCREMENT = 70001;

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
    menuCode int,
    userCode int,
    storeCode int,
    reviewImage VARCHAR(300),
    reviewDate DATE,
    reviewRating INT,
    reviewContent VARCHAR(300),
   FOREIGN KEY (menuCode) REFERENCES menu_tbl(menuCode),
   FOREIGN KEY (userCode) REFERENCES user_tbl(userCode),
   FOREIGN KEY (storeCode) REFERENCES store_tbl(storeCode)
) AUTO_INCREMENT=90001;


-- 10
CREATE TABLE answer_tbl (
    answerCode int AUTO_INCREMENT PRIMARY KEY,
    sellerCode int,
    reviewCode int,
    answerDate DATE NOT NULL,
    answerContent VARCHAR(300) NOT NULL,
    FOREIGN KEY (reviewCode) REFERENCES review_tbl(reviewCode),
    FOREIGN KEY (sellerCode) REFERENCES seller_tbl(sellerCode)
) AUTO_INCREMENT=100001;

-- 11 태민 address_tbl;

CREATE TABLE address_tbl (
  addressCode INT AUTO_INCREMENT PRIMARY KEY,			-- 주소코드
  userCode INT,						-- 회원코드
  deliveryAddress VARCHAR(200) NOT NULL,				-- 배달주소
  FOREIGN KEY (userCode) REFERENCES user_tbl(userCode)	-- 회원코드 참조하는 곳
) auto_increment = 110001;

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




