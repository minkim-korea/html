--create  테이블생성
--select, update ,delete ,insert : DML언어 

--명령어 
--tab 현재 가지고 있는 테이블을 출력
select *from tab;

select * from member;
select * from employees;

select *from member;

--테이블 구조 확인
desc member;

--오라클 타입 (number , char, varchar2, nchar, nvarchar2, clob,blob,long)
create table mem1(
memNo number,  --최대길이까지 용량을 많이 차지 단점.
memNo2 number(3),--0부터999까지입력가능 
memNo3 number(4,2) --4자리사용하는데 소수점2자리 소수점1개의 자리수를 차지 
);
------------
---number : 숫자데이터 , 소수점 표현가능  . int,float
--number(4,2) : 총자리수 4자리 소수점자리수 2자리 ->0.0~99.99 



--명령어는 대소문자 구별 안함 
INSERT INTO mem1(memNo,memNo2,memno3) values(
1000000000,999,1.23
);

insert into mem1 values(
2,0,9.9);
insert into mem1(memno2) values(
100
);
--4,2
insert into mem1( memno3) values (
99.99
);
--자리수 4자리 , 소수점 2자리 배분 (4,2) -> (6,2) 9999.99
insert into mem1( memno3) values (
99.90
);
--자리수 4자리 , 소수점 2자리 배분 (4,2) -> (6,2) 9999.99
insert into mem1( memno3) values (
-99.99
);
SELECT * from mem1;
commit;
desc mem1;

select *from mem1;
--수정 컬럼 where 조건 ->
update mem1 set memno=222222222 where memno3=99.99;
update mem1 set memno=3333333 where memno3 =99.9;
update mem1 set memno=20000 where memno3=9.9;

commit;
--천단위 표시 
select memno,memno2 from mem1; 
select to_char(memno,'999,999,999') from mem1;----9자리수는 빈공백을 빈공백으로 표시
select to_char(memno,'000,000,000') from mem1;---0자리수는 빈공백을 0으로 채워줌.

commit;

---------------------------------
----date 세기,년,월,일,시,분,초 데이터 입력가능 , default:년 -월-일만 출력 
-- timestamp 세기,년,월,일,시,분,초,밀리초

create table date1 (
sdate date 
);
insert into date1 values(
sysdate --현재시간을 저장 
);
insert into date1 values(
'2025-04-01');
select * from date1;
--25/04/29
--날짜 포맷 변경 방법 date 타입 -> char타입으로 변경해서 날짜형태를 바꿀수 있음.
 select to_char(sdate,'yyyy-mm-dd hh:mi:ss') from date1;
 
 
 --char 타입:고정형 문자형타입 varchar2타입: 가변형 문자형타입 
 create table mem2 (
 juminNo char(14), -- 880101-1111111
 id varchar2(30),
 kor number(5,2),
 eng number(5,2)
 );
 --14자리 ->10자리만 입력해도 14자리 자리를 차지 
 --속도가빠르다
 insert into mem2 values (
 '880101-1111111','aaa1111',99,90
 );
 
 insert into mem2 values(
 '991231-2222222','bbb1234',80,81
 );
 
 commit;
 
 select *from mem2;
 
 select kor,eng from mem2;

 select kor,eng,kor+eng from mem2;
  --round ,ceil, floor 
 select kor,eng,kor+eng,(kor+eng)/2 from mem2;
 
 --nchar 국제언어 고정형문자열 타입 , nvarchar2타입 국제언어 가변형문자열 타입
 create table mem3(
 gender1 char(1),    --영문 1byte, 국문3byte 
 gender2 char(2),--byte
 gender3 char(3),
 gender4 nchar(1)--글자수 --모든 국제언어 1개 단어를 저장형태 타입 2byte사용
 );
 
 insert into mem3 values(
 'M','m','m','m'
 );
 
 insert into mem3(gender3) values('남');
 insert into mem3(gender4) values('남');
 select *from mem3;
 commit;
 
 --select
 --distinct 중복제거 
 select distinct job_id from employees;
 select * from employees; --department_id 중복제거후 출력
 --정렬 order by 컬럼명  asc, desc 
 select distinct department_id from employees order by department_id asc; 
 
 select * from employees; --salary 순차정렬 
 
 select * from employees order by salary asc;
 );
 -- as 닉네임  닉네임으로 사용  as 생략도가능 
 -- 숫자형타입만 사칙연산 가능 
 select salary,salary*1438*12,to_char(salary*1438*12,'999,999,999')  ysalary from employees order by ysalary desc;
 
 select *from member;
 --문자열타입은 사칙연산이 적용안됨 . 
-- select id+pw from member;
 
 


