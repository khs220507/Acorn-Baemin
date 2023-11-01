
-- 01 회원

-- 02 사장

-- 03 매장
drop table store_tbl;

CREATE TABLE store_tbl (
  storeCode VARCHAR2(50) PRIMARY KEY, -- 매장코드
  storeName VARCHAR2(50) NOT NULL,  -- 매장이름
  storeCategory VARCHAR2(50) NOT NULL,  -- 음식 카테고리
  storeImage VARCHAR2(200) NOT NULL,    -- 매장사진
  storeAddress VARCHAR2(200) NOT NULL,  -- 매장주소
  storePhone VARCHAR2(12) NOT NULL, -- 매장전화번호
  zzimCount NUMBER(6) NOT NULL, -- 찜개수
  reviewCount NUMBER(3, 0) NOT NULL,    -- 리뷰수
  storeRating number(1, 1)  NOT NULL,   -- 매장평점
  storeDescription VARCHAR2(2000) NOT NULL, -- 매장소개글
  minOrderAmount NUMBER(4) NOT NULL,    -- 최소주문금액
  deliveryFee NUMBER(4) NOT NULL,   -- 배달비
  operatingTime VARCHAR2(50) NOT NULL,  -- 운영시간
  deliveryArea VARCHAR2(50) NOT NULL,   -- 배달지역
  storeStatus NUMBER(1) NOT NULL -- 0:close, 1:open
);

-- 시퀀스 생성 및 초기값 설정
DROP SEQUENCE storeCodeSeq;
CREATE SEQUENCE storeCodeSeq START WITH 1000;

-- 데이터 삽입
INSERT INTO store_tbl
VALUES ('store'||storeCodeSeq.nextval, '비콘', '학원', 'acorn.jpg', '01093811510', '마포구 서교동 457-27', 1, 2, '홍대 최고의 IT 전문 아카데미', 9000, 0, '9:00-18:00', '마포구', 1);

select * from store_tbl;
-- 04 메뉴
drop table menu_tbl;

create table menu_tbl(
menuCode varchar2(50) primary key,  -- 메뉴코드
menuName varchar2(50) not null, -- 메뉴이름
menuPrice number(5),    -- 메뉴가격
menuImage varchar2(50) not null,    -- 메뉴사진
menuContent varchar2(2000) not null,   -- 메뉴설명
menuClassification varchar2(50) not null,   -- 메뉴분류
menuStatus number(1) not null   -- 메뉴상태
);

-- 시퀀스 생성 및 초기값 설정;
DROP SEQUENCE menuCodeSeq;
create sequence menuCodeSeq start with 1000;

-- 데이터 삽입
INSERT INTO menu_tbl
VALUES ('menu'||menuCodeSeq.nextval, '2강의실', 50000, 'classroom.jpg', '3층에 있어서 다리가 덜 아파요', 'classRoom', 0);

select * from menu_tbl;

-- 05 옵션

-- 06 장바구니

-- 07 주문
CREATE SEQUENCE orderNumber_seq START WITH 10000;
create table order_tbl(
orderNumber varchar2(20) PRIMARY KEY,
userCode varchar2(20),
storeCode varchar2(20),
orderDate date,
payType NUMBER(1, 0),
orderType NUMBER(1, 0), 
reqToSeller varchar(300),
reqToRider varchar(300),
orderStatus varchar(20),
CONSTRAINT fk_userCode FOREIGN KEY (userCode) REFERENCES user_tbl(userCode),
CONSTRAINT fk_storeCode FOREIGN KEY (storeCode) REFERENCES store_tbl(storeCode)
);

-- 08 찜
CREATE TABLE zzim_tbl (
    userCode VARCHAR2(20),
    storeCode VARCHAR2(20),
    CONSTRAINT fk_userCode FOREIGN KEY (userCode) REFERENCES user_tbl(userCode),
    CONSTRAINT fk_storeCode FOREIGN KEY (storeCode) REFERENCES store_tbl(storeCode)
);
-- 09 리뷰
create table review_tbl(
reviewCode  varchar2(5) primary key ,--리뷰코드 
menuCode  varchar2(20)   ,--메뉴코드 
userCode  varchar2(10) ,--회원코드 
storeCode  varchar2(13) ,--매장코드 
reviewDate date not null ,--리뷰날짜 
reviewRating number(2) not null ,--리뷰평점 
reviewContent varchar2(300) not null,--리뷰내용 
 CONSTRAINT fk_menuCode FOREIGN KEY (menuCode) REFERENCES menu_tbl(menuCode),
  CONSTRAINT fk_userCode FOREIGN KEY (userCode) REFERENCES user_tbl(userCode),
  CONSTRAINT fk_storeCode FOREIGN KEY (storeCode) REFERENCES store_tbl(storeCode)
);
create sequence reviewCode_seq start with 10000;
-- 10 리뷰답글
create table answer_tbl(
  answerCode  varchar2(20) not null primary key, --답변코드
  reviewCode   varchar2(20) , --리뷰코드
  answerDate  date not null , --답변날짜
  answerContent varchar2(300) not null, --답변내용
   CONSTRAINT fk_reviewCode FOREIGN KEY (reviewCode) REFERENCES review_tbl(reviewCode)
);
create sequence answerCode_seq start with 10000;

-- 11 주소
create table address_tbl(
    addressCode varchar2(20) primary key,
    userCode varchar2(20),
    deliveryAddress varchar2(200) not null,
    constraint fk_userCode foreign key (userCode) references user_tbl(userCode)
    );