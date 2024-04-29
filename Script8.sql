create table DEPT (
	DEPT_NO int primary key comment '부서번호',
	DEPT_NAME varchar(20) comment '부서명'
);

insert into DEPT 
values
(1, '인사부'),
(2, '연구부'),
(3, '홍보부');

create table EMP (
	EMP_NO int primary key comment '직원번호',
	EMP_NAME varchar(20) comment '직원명',
	DEPT_NO int comment '부서번호',
	foreign key(DEPT_NO) references dept(DEPT_NO)
);

insert into EMP
values
(1001, '정소화', 1),
(1002, '김용욱', 2),
(1003, '고명석', 3);

-- 외래키 삭제하기
alter table emp drop foreign key emp_ibfk_1;

-- 이미 테이클이 생성되었으면, 별도로 외래키 추가
alter table emp add foreign key (dept_no) references dept(dept_no);

-- 부모테이블에 없는 4번은 사용할 수 없음.
insert into emp values (1004, '김연아', 4);

-- 외래키 삭제하는 법

-- 1. 부서번호가 1번인 사원을 먼저 삭제해야함.
delete from emp where dept_no = 1;
-- 2. 인사부 삭제하기
delete from dept where dept_no = 1;

-- 부서 테이블 삭제하는 법 
-- 테이블을 삭제할 때는 자식을 먼저 삭제 후 부모를 삭제
-- 1.
drop table emp;
-- 2.
drop table dept;

-- 테이블 생성 및 데이터 추가는 부모를 먼저 생성 후 자식 생성

-- Q1
create table USER(
	ID varchar(20) not null primary key comment '아이디',
	PASSWORD varchar(200) comment '패스워드',
	NAME varchar(20) comment '이름'
);

insert into user values
('USER1', 1234, '둘리'),
('USER2', 1234, '도우너');

-- Q2
create table BOARD(
	NO int not null AUTO_INCREMENT primary key comment '글번호',
	TITLE varchar(50) comment '제목',
	CONTENT varchar(255) comment '내용',
	WRITER varchar(20) comment '작성자',
	REG_DATE datetime comment '등록일',
	UPDATE_DATE datetime comment '수정일',
	foreign key(WRITER) references USER(ID)
);

insert into BOARD values
(1, '안녕하세요~', '안녕하세요~', 'USER1', now(), now()),
(2, '안녕하세요~', '안녕하세요~', 'USER2', now(), now()),
(3, '출석체크합니다~', '출석체크합니다~', 'USER1', now(), now()),
(4, '출석체크합니다~', '출석체크합니다~', 'USER2', now(), now()),
(5, '등업해주세요~', '등업해주세요~', 'USER2', now(), now());

-- Q3
select BOARD.WRITER, user.NAME, BOARD.CONTENT  from USER
join BOARD
on user.ID = BOARD.WRITER 
order by BOARD.CONTENT desc;

--  Q4
select user.ID, user.NAME as 'NAME', count(board.WRITER) as '게시물건수'
from user 
join board
on user.ID = BOARD.WRITER
group by user.NAME
order by user.NAME desc;

-- Q5
create table CLASS (
	CLASS_NO int not null primary key comment '수업번호',
	CLASS_NAME varchar(20) comment '수업명'
);

insert into CLASS values
(1, '수학'),
(2, '국어'),
(3, '영어');

-- Q6
create table STUDENT(
	STUDENT_NO int not null primary key comment '학생번호',
	STUDENT_NAME varchar(20) comment '학생명'
);

insert into STUDENT values
(1001, '둘리'),
(1002, '또치'),
(1003, '도우너');

-- Q7
create table STUDENT_CLASS(
	ST_NO int comment '학생번호',
	CL_NO int comment '수강하는 수업의 번호',
	foreign key(CL_NO) references CLASS(CLASS_NO),
	foreign key(ST_NO) references STUDENT(STUDENT_NO)
);

-- drop table STUDENT_CLASS;
insert into STUDENT_CLASS values
(1001, 1),
(1001, 2),
(1002, 2),
(1002, 3),
(1003, 1),
(1003, 2),
(1003, 3);

-- Q8
select CLASS_NO as '수업번호', CLASS_NAME as '수업명', group_concat(STUDENT_NAME) as '수강생 목록'
from STUDENT_CLASS

join CLASS
on STUDENT_CLASS.CL_NO = CLASS.CLASS_NO

join student
on student_class.ST_NO = student.STUDENT_NO 

group by CLASS_NO;

-- Q9
select CLASS_NO as '수업번호', CLASS_NAME as '수업명', count(STUDENT_NAME) as '수강생 목록'
from STUDENT_CLASS

join CLASS
on STUDENT_CLASS.CL_NO = CLASS.CLASS_NO

join student
on student_class.ST_NO = student.STUDENT_NO 

group by CLASS_NO order by count(STUDENT_NAME) desc

limit 1;




-- 정규화되지 않는 테이블
-- 영화관과 상영 영화에 대한 정보를 한번에 저장
create table CINEMA_MOVIE(
	THEATER_NO int comment '상영관번호',
	LOCATION varchar(100) comment '위치',
	TEL varchar(50) comment '전화번호',
	MOVIE_NAME varchar(20) comment '영화명'
);

insert into CINEMA_MOVIE values
(1, '송도점', '032-111-1111', '슬램덩크'), -- 상영정보가 중복됨
(1, '송도점', '032-111-1111', '교섭'),
(2, '구월점', '032-222-2222', '슬램덩크'),
(2, '구월점', '032-222-2222', '아바타2'),
(2, '구월점', '032-222-2222', '영웅');

-- 테이블의 정규화
-- 중복된 데이터는 허용하지 않음으로써, DB 용량을 줄일 수 있음

create table CINEMA(
	THEATER_NO int comment '상영관번호',
	LOCATION varchar(100) comment '위치',
	TEL varchar(50) comment '전화번호'
);

