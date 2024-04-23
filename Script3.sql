create table customer (
	customer int auto_increment primary key comment '회원번호',
	name varchar(20) not null comment '이름',
	address varchar(100) comment '주소'
);

insert into customer (name, address) values('둘리', '서울');
insert into customer values(2, '또치', '인천');

insert into customer (name, address) 
values
('고길동', '부산'),
('마이콜', '부산');

-- 불완전한 회원정보
insert into customer (name, address) values('도우너', null);

-- NOT NULL 제약사항을 어겨서 에러함.
insert into customer values(6, null, null);

create table BOOK (
	BOOK_NO int auto_increment primary key not null comment '도서번호',
	TITLE varchar(30) not null comment '제목',
	PUBLISHER varchar(100) comment '출판사',
	PUB_DATE date comment '출간일',
	PRICE int comment '가격'
);

insert into book (TITLE, PUBLISHER, PUB_DATE, PRICE)
values
('역사1', '상상마당', '2021-01-01', '10000'),
('역사2', '상상마당', '2021-01-02', '20000'),
('스프링웹프로젝트', '한빛미디어', '2021-02-01', '40000'),
('자바프로그래밍', null, null, null);

create table CONTACTS (
	LAST_NAME varchar(255) not null comment '성',
	FIRST_NAME varchar(255) not null comment '이름',
	EMAIL varchar(255) not null comment '이메일',
	PHONE varchar(20) comment '연락처'
);


insert into contacts (LAST_NAME, FIRST_NAME, EMAIL, PHONE)
values
('이','서연','stone@naver.com','010-2341-0000'),
('이','시우','lavera@naver.com', null),
('김','지호','shyla@gmail.com','010-3171-4126'),
('김','윤서','jeni@gmail.com','010-8121-2341'),
('최','수아','fern@gmail.com', null);

create table GIFT(
	NAME varchar(20) comment '상품명',
	TYPES varchar(20) comment '품목',
	PRICE int comment '가격'
);

insert into GIFT (NAME, TYPES, PRICE)
values
('참치세트', '식품', '10000'),
('햄세트', '식품', '20000'),
('샴푸세트', '생활용품', '30000'),
('세차세트', '생활용품', '40000'),
('주방용품', '생활용품', '50000'),
('노트북', '가전제품', '60000'),
('벽걸이TV', '가전제품', '70000');

create table class (
	CLASS_NO int not null auto_increment primary key comment '수업번호',
	CLASS_NAME varchar(30) comment '과목명',
	CLASS_TIME time comment '수업시간'
);

-- auto_increment 자동으로 추가 명령어이다.
insert into class (CLASS_NAME, `CLASS_TIME`)
values 
('수학',090000),
('국어','10:00:00'),
('영어','11:00:00');

create table RESERVATION (
	MOVIE_NAME varchar(20) not null comment '영화명',
	USER_NAME varchar(20) not null comment '예약자명',
	SEAT_NO varchar(5) comment '자리번호',
	DATE date comment '예약일'
);

insert into reservation (MOVIE_NAME, USER_NAME, SEAT_NO, `DATE`)  
values
('아바타', '둘리', 'A1', '2024-04-20'),
('아바타', '또치', 'A2', '2024-04-20'),
('아바타', '도우너', 'B1', '2024-04-21'),
('슬램덩크', '짱구', 'A2', '2024-04-20'),
('영웅', '고길동', 'B3', 20240421);

create table PRODUCT (
	PRODUCT_NO int not null primary key comment '제품번호',
	PRODUCT_NAME varchar(20) comment '제품명',
	PRICE int comment '가격',
	CATEGORY varchar(10) comment '카테고리(과자,음류,주류)');
	
insert into product (PRODUCT_NO, PRODUCT_NAME, PRICE, CATEGORY)
values
('1', '허니버터칩', '2300', '과자'),
('2', '새우깡', '1100', '과자'),
('3', '코카콜라', '1000', '음료'),
('4', '아침에주스', '4900', '음료'),
('5', '처음처럼', '3000', '주료'),
('6', '참이슬', '2500', '주료');

-- 회원테이블에서 회원번호와 이름 가져오기
-- select PRODUCT_NO, PRICE from PRODUCT;

-- 회원테이블에서 모든 데이터 가져오기
-- select * from PRODUCT;

-- 비교 연산자
select * from product;
select * from product where PRODUCT_NO=1; 
select * from product where PRODUCT_NO!=1; 
select * from product where PRODUCT_NO<3; 
select * from product where PRODUCT_NO<=3;

-- 논리 연산자
select * from product
where CATEGORY = '과자' and  PRICE > 2000;

select * from product
where PRODUCT_NAME or PRICE > 2000 and PRICE < 4000;