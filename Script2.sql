create table customer (
	customer int auto_increment primary key comment '회원번호',
	name varchar(20) not null comment '이름',
	address varchar(100) comment '주소'
);

insert into customer (name, address) values('둘리', '서울');
insert into customer values(2, '또치', '인천');

