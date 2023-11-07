use baemin_db;

-- 01 회원 user_tbl
create table user_tbl(
    userCode int auto_increment primary key,
    userId varchar(20) not null,
    userPw varchar(30) not null,
    userName varchar(20) not null,
    userNickname  varchar(20) not null,
    userPhone varchar(50) not null,
    userAddress varchar(150) not null,
    userEmail varchar(50) not null,
    userBirth varchar(20) not null,
    userGender tinyint(1) not null, -- 0:남자, 1:여자
    userStatus tinyint(1) not null -- 0:회원탈퇴, 1:정상회원
) auto_increment=10001;

INSERT INTO user_tbl (userId, userPw, userName, userNickname, userPhone, userAddress, userEmail, userBirth, userGender, userStatus) VALUES
('user123', 'password123', 'John Doe', 'johndoe', '555-123-4567', '123 Main St, City, Country', 'john.doe@email.com', '1990-05-15', 0, 1),
('jane456', 'secret456', 'Jane Smith', 'janesmith', '555-987-6543', '456 Elm St, Town, Country', 'jane.smith@email.com', '1985-08-20', 1, 1),
('bob789', 'bobspw789', 'Bob Johnson', 'bobjohnson', '555-555-1234', '789 Oak St, Village, Country', 'bob.johnson@email.com', '1995-02-10', 0, 1),
('alice555', 'secure555', 'Alice Brown', 'alicebrown', '555-222-3333', '555 Pine St, County, Country', 'alice.brown@email.com', '1988-11-30', 1, 1),
('sam777', 'mypassword', 'Sam Wilson', 'samwilson', '555-777-8888', '777 Cedar St, Town, Country', 'sam.wilson@email.com', '1992-04-05', 0, 1);







-- 02 사장 seller_tbl
create table seller_tbl(
	sellerCode int auto_increment primary key,
    sellerRegCode varchar(30) unique not null,
    sellerId varchar(20) not null,
    sellerPw varchar(30) not null,
    sellerName varchar(20) not null,
    sellerPhone varchar(50) not null,
    sellerEmail varchar(50) not null,
    sellerBirth varchar(20) not null,
	sellerGender tinyint(1) not null, -- 0:남자, 1:여자
    sellerStatus  tinyint(1) not null -- 0:회원탈퇴, 1:정상회원
)auto_increment=20001;

INSERT INTO seller_tbl (sellerRegCode, sellerId, sellerPw, sellerName, sellerPhone, sellerEmail, sellerBirth, sellerGender, sellerStatus) VALUES
('S001', 'seller1', 'password1', 'Seller One', '555-111-2222', 'seller1@example.com', '1980-07-10', 0, 1),
('S002', 'seller2', 'password2', 'Seller Two', '555-222-3333', 'seller2@example.com', '1975-05-20', 1, 1),
('S003', 'seller3', 'password3', 'Seller Three', '555-333-4444', 'seller3@example.com', '1990-12-05', 0, 1),
('S004', 'seller4', 'password4', 'Seller Four', '555-444-5555', 'seller4@example.com', '1988-03-15', 1, 1),
('S005', 'seller5', 'password5', 'Seller Five', '555-555-6666', 'seller5@example.com', '1995-01-25', 0, 1);



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

INSERT INTO store_tbl (sellerCode, storeName, storeCategory, storeImage, storeAddress, storePhone, zzimCount, reviewCount, storeRating, storeDescription, minOrderPrice, deliveryFee, operatingTime, deliveryArea, storeStatus) VALUES
(20001, 'Delicious Pizza', 'Pizza', 'https://example.com/pizza.jpg', '123 Main St, City, Country', '555-111-2222', 50, 25, 4.5, 'Welcome to Delicious Pizza! We serve the best pizzas in town.', 15, 2, '10:00 AM - 10:00 PM', 'City Area', 1),
(20002, 'Sushi Palace', 'Sushi', 'https://example.com/sushi.jpg', '456 Elm St, Town, Country', '555-222-3333', 40, 18, 4.2, 'Experience the finest sushi at Sushi Palace.', 20, 3, '11:30 AM - 9:30 PM', 'Town Area', 1),
(20003, 'Burger Haven', 'Burgers', 'https://example.com/burgers.jpg', '789 Oak St, Village, Country', '555-333-4444', 35, 15, 4.0, 'Home of the juiciest burgers in the village!', 12, 2, '11:00 AM - 10:00 PM', 'Village Area', 1),
(20004, 'Tasty Tacos', 'Mexican', 'https://example.com/tacos.jpg', '555 Pine St, County, Country', '555-444-5555', 28, 12, 4.1, 'Savor the flavors of Mexico with our delicious tacos.', 18, 2, '12:00 PM - 9:00 PM', 'County Area', 1),
(20005, 'Asian Delights', 'Asian', 'https://example.com/asian.jpg', '777 Cedar St, Town, Country', '555-555-6666', 42, 20, 4.3, 'Explore the diverse flavors of Asia at our restaurant.', 25, 3, '10:30 AM - 10:00 PM', 'Town Area', 1);

INSERT INTO store_tbl
		(sellerCode, storeName, storeCategory, storeImage, storeAddress, storePhone, minOrderPrice, deliveryFee, deliveryArea)
		VALUES
		(20001,'test','test','test','test','test',2000,2000,'test');
ALTER TABLE store_tbl
MODIFY operatingTime VARCHAR(50),
MODIFY storeStatus TINYINT default 0;





-- 04 태민 menu_tbl;

CREATE TABLE menu_tbl (
  menuCode INT AUTO_INCREMENT PRIMARY KEY,     	-- 메뉴코드
  menuName VARCHAR(50) NOT NULL,        	-- 메뉴이름
  menuPrice INT default 0,                     	-- 메뉴가격
  menuImage VARCHAR(50),      			-- 메뉴사진
  menuContent TEXT NOT NULL,           		-- 메뉴설명
  menuClassification VARCHAR(50) NOT NULL, 	-- 메뉴분류
  menuStatus TINYINT NOT NULL           	-- 메뉴상태(0:open, 1:sold out)
) auto_increment = 40001;

INSERT INTO menu_tbl (menuName, menuPrice, menuImage, menuContent, menuClassification, menuStatus) VALUES
('Margherita Pizza', 10, 'pizza_margherita.jpg', 'Classic pizza with tomato, mozzarella, and basil.', 'Pizza', 0),
('Sushi Combo', 20, 'sushi_combo.jpg', 'A combination of fresh sushi rolls and sashimi.', 'Sushi', 0),
('Bacon Cheeseburger', 8, 'bacon_cheeseburger.jpg', 'Juicy burger with bacon and melted cheese.', 'Burgers', 0),
('Taco Platter', 12, 'taco_platter.jpg', 'A platter of assorted tacos with your choice of fillings.', 'Mexican', 0),
('Pad Thai', 15, 'pad_thai.jpg', 'A classic Thai dish with stir-fried noodles, shrimp, and vegetables.', 'Asian', 0);





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

INSERT INTO option_tbl (menuCode, optionCategory, optionSelectType, optionName, optionPrice, optionStatus) VALUES
(40001, 'Size', 1, 'Small', 1000, 0),
(40001, 'Size', 1, 'Medium', 2000, 0),
(40001, 'Size', 1, 'Large', 3000, 0),
(40002, 'Sushi Type', 1, 'Nigiri', 1000, 0),
(40002, 'Sushi Type', 1, 'Sashimi', 2000, 0);



-- 06. 장바구니 cart_tbl 테이블 생성
create table cart_tbl (
    cartCode int auto_increment primary key,
    userCode int,
    storeCode int,
    menuCode int,
    optionCode int,
    menuCount int,
    cartPrice int,
    optionStatus tinyint,
    foreign key (userCode) references user_tbl(userCode),
    foreign key  (storeCode) references store_tbl(storeCode),
    foreign key  (menuCode) references menu_tbl(menuCode),
    foreign key  (optionCode) references option_tbl(optionCode)
)auto_increment = 60001;

INSERT INTO cart_tbl (userCode, storeCode, menuCode, optionCode, menuCount, cartPrice, optionStatus) VALUES
(10001, 30001, 40001, 50001, 2, 20, 0),
(10002, 30002, 40002, 50002, 1, 12, 0),
(10003, 30003, 40003, 50003, 3, 30, 0),
(10004, 30004, 40004, 50004, 2, 16, 0),
(10005, 30005, 40005, 50005, 1, 15, 0);







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

INSERT INTO order_tbl (userCode, storeCode, orderMenuName, orderMenuNumber, orderMenuPrice, orderStoreName, orderStoreImage, orderDate, payType, orderType, reqToSeller, reqToRider, orderStatus, optionCategory, optionName, deliveryFee, deliveryAddress, userPhone)
VALUES
(10001, 30001, '된장찌개', 2, 15000, '한식당', '한식당이미지.jpg', '2023-11-01', 1, 1, '맛있게 해주세요', '빨리 배달 부탁드려요', '주문완료', '사이드메뉴', '깍두기', 2000, '서울시 강남구', '010-1234-5678'),
(10002, 30002, '짜장면', 1, 8000, '중국집', '중국집이미지.jpg', '2023-11-01', 2, 1, '매운맛으로', '빨리 부탁드려요', '배송중', '사이드메뉴', '군만두', 2500, '서울시 강북구', '010-5678-1234'),
(10003, 30003, '피자', 3, 25000, '피자가게', '피자가게이미지.jpg', '2023-11-02', 1, 2, '초코소스로', '빨리 부탁드려요', '주문완료', '추가', '피클', 3000, '서울시 강서구', '010-9876-5432'),
(10004, 30004, '스파게티', 2, 18000, '이탈리아식당', '이탈리아식당이미지.jpg', '2023-11-02', 2, 2, '마늘소스로', '빨리 부탁드려요', '배송중', '추가', '피클', 3500, '서울시 강동구', '010-2345-6789'),
(10005, 30005, '초밥세트', 1, 22000, '일식당', '일식당이미지.jpg', '2023-11-03', 1, 3, '간장소스로', '빨리 부탁드려요', '주문완료', '추가', '와사비', 4000, '서울시 강남구', '010-3456-7890');


select * from order_tbl;

INSERT INTO order_tbl (userCode, storeCode, orderMenuName, orderMenuNumber, orderMenuPrice, orderStoreName, orderStoreImage, orderDate, payType, orderType, reqToSeller, reqToRider, orderStatus, optionCategory, optionName, deliveryFee, deliveryAddress, userPhone)
VALUES
(10001, 30001, '된장찌개', 2, 15000, '한식당', '한식당이미지.jpg', '2023-11-01', 1, 1, '맛있게 해주세요', '빨리 배달 부탁드려요', '주문완료', '사이드메뉴', '깍두기', 2000, '서울시 강남구', '010-1234-5678'),
(10001, 30002, '짜장면', 1, 8000, '중국집', '중국집이미지.jpg', '2023-11-01', 2, 1, '매운맛으로', '빨리 부탁드려요', '배송중', '사이드메뉴', '군만두', 2500, '서울시 강북구', '010-5678-1234'),
(10001, 30003, '피자', 3, 25000, '피자가게', '피자가게이미지.jpg', '2023-11-02', 1, 2, '초코소스로', '빨리 부탁드려요', '주문완료', '추가', '피클', 3000, '서울시 강서구', '010-9876-5432'),
(10001, 30004, '스파게티', 2, 18000, '이탈리아식당', '이탈리아식당이미지.jpg', '2023-11-02', 2, 2, '마늘소스로', '빨리 부탁드려요', '배송중', '추가', '피클', 3500, '서울시 강동구', '010-2345-6789'),
(10001, 30005, '초밥세트', 1, 22000, '일식당', '일식당이미지.jpg', '2023-11-03', 1, 3, '간장소스로', '빨리 부탁드려요', '주문완료', '추가', '와사비', 4000, '서울시 강남구', '010-3456-7890');



-- 08
CREATE TABLE zzim_tbl (
    userCode int,
    storeCode int,
    FOREIGN KEY (userCode) REFERENCES user_tbl(userCode),
    FOREIGN KEY (storeCode) REFERENCES store_tbl(storeCode)
);

INSERT INTO zzim_tbl (userCode, storeCode) VALUES
(10001, 30001),
(10002, 30001),
(10003, 30002),
(10004, 30003),
(10005, 30004);

select * from zzim_tbl;
INSERT INTO zzim_tbl (userCode, storeCode) VALUES
(10001, 30001),
(10001, 30002),
(10001, 30003),
(10001, 30004);

-- 09
CREATE TABLE review_tbl (
    reviewCode INT AUTO_INCREMENT PRIMARY KEY,
    menuCode int,
    userCode int,
    storeCode int,
    reviewImage VARCHAR(20) NOT NULL,
    reviewDate DATE NOT NULL,
    reviewRating INT NOT NULL,
    reviewContent VARCHAR(300) NOT NULL,
   FOREIGN KEY (menuCode) REFERENCES menu_tbl(menuCode),
   FOREIGN KEY (userCode) REFERENCES user_tbl(userCode),
   FOREIGN KEY (storeCode) REFERENCES store_tbl(storeCode)
) AUTO_INCREMENT=90001;

INSERT INTO review_tbl (menuCode, userCode, storeCode, reviewImage, reviewDate, reviewRating, reviewContent) VALUES
(40001, 10001, 30001, 'review_image1.jpg', '2023-10-10', 4, 'Delicious pizza, great service!'),
(40002, 10002, 30002, 'review_image2.jpg', '2023-10-11', 5, 'Fantastic sushi, fresh and tasty!'),
(40003, 10003, 30003, 'review_image3.jpg', '2023-10-12', 4, 'Burger was amazing, loved the fries!'),
(40004, 10004, 30004, 'review_image4.jpg', '2023-10-13', 4, 'Tacos were delicious, I will be back!'),
(40005, 10005, 30005, 'review_image5.jpg', '2023-10-14', 5, 'Pad Thai was outstanding, great flavors!');



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

INSERT INTO answer_tbl (sellerCode, reviewCode, answerDate, answerContent) VALUES
(20001, 90001, '2023-10-10', 'Thank you for your positive feedback! We are glad you enjoyed our pizza.'),
(20002, 90002, '2023-10-11', 'We are delighted to hear that you had a fantastic sushi experience. Thanks for your review!'),
(20003, 90003, '2023-10-12', 'We appreciate your kind words about our burgers. We hope to serve you again soon!'),
(20004, 90004, '2023-10-13', 'Thank you for your review. We are pleased to know you enjoyed our tacos!'),
(20005, 90005, '2023-10-14', 'We are thrilled to hear you loved our Pad Thai. Thanks for your kind words!');



-- 11 태민 address_tbl;

CREATE TABLE address_tbl (
  addressCode INT AUTO_INCREMENT PRIMARY KEY,			-- 주소코드
  userCode INT,						-- 회원코드
  deliveryAddress VARCHAR(200) NOT NULL,				-- 배달주소
  FOREIGN KEY (userCode) REFERENCES user_tbl(userCode)	-- 회원코드 참조하는 곳
) auto_increment = 110001;


INSERT INTO address_tbl (userCode, deliveryAddress) VALUES
(10001, '123 Main St, City, Country'),
(10002, '456 Elm St, Town, Country'),
(10003, '789 Oak St, Village, Country'),
(10004, '555 Pine St, County, Country'),
(10005, '777 Cedar St, Town, Country');


commit;


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




