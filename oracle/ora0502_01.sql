select sysdate from dual; 

--현재일에서 이달의 최초일, 이달의 마지막일을 출력하시오 . 
select trunc(sysdate,'month'),sysdate,last_day(sysdate)from member;


select * from stuscore;
select * from stuscore 
where avg>=80 
and rownum<=5
order by avg desc
;

--rownum: 검색된 것에 일려번호를 다시 붙이는 것을 말함. 
select rownum,stuscore.* from stuscore where kor>=80;

select rownum,stuscore.* from stuscore where name like '%s%';

--국어점수와 영어점수 차이가 가장 큰 10명의 학생을 rownum을 붙여서  출력하시오.
select rownum,a.* 
from( select kor,eng,kor-eng,abs(kor-eng) ke from stuscore order by ke desc)
a where rownum<=10;

--이런식으로쓰면order by 와 rownum 충돌때문에 이상하게뜸
--select rownum, kor,eng,kor-eng,abs(kor-eng) ke from stuscore order by ke desc;

--년 ,월, 일, 시 ,분 ,초 ,요일
select sysdate from dual;

select to_char(sysdate,'yyyy"년"mm"월"dd"일" hh"시":mi"분":ss"초" day') from dual; 

--다음화요일
select next_day(sysdate,'화요일') from dual;

--그룹함수 
--min 가장낮은 사원 검색 
--max 가장높은 사원 검색
select min(salary),max(salary),avg(salary),count(salary),sum(salary) from employees;

--현재날짜에서 3일전의 날짜, 3달 전의 날짜를 출력하시오. 
select sysdate-3,sysdate,add_months(sysdate,-3) from dual;
--abc좋은나라DEF 좋은나라만 출력하시오 substr 사용
select substr('abc좋은나라DEF',4,4) from dual;


select mdate from member;
--월만 분리해서 출력하고 , 05,06,07 인 회원만 출력하시오
select mdate, substr(mdate,4,2) from member where substr(mdate,4,2) in('05','06','07')
order by substr(mdate,4,2) ;

--number(w,d)w는 자리수 d는소수점자리 
--lob (long은안씀) clob 대용량 텍스트 데이터 저장가능 varchar 4k 약1300글자  
--timestamp(n)

desc stuscore;

create table stuscore5 (
sno number(4),
name varchar2(100),
KOR NUMBER(3)  , 
ENG  NUMBER(3) ,  
MATH NUMBER(3)  
    
);

select * from stuscore3;

--1.테이블과 함께 데이터를 모두복사 
create table stuscore4 as select *from stuscore;

select * from stuscore4;

--2.기존테이블이 존재시 데이터 모두 복사 
insert into stuscore3 select * from stuscore;

select * from stuscore3;
--3.컬럼이 다른경우 데이터 모두 복사 (컬럼이 다른 경우에는 컬럼을 부여한후 데이터 복사 )
insert into stuscore5(sno,name,kor,eng,math) select sno,name,kor,eng,math from stuscore;

select * from stuscore5;
desc stuscore5;
-------------

--컬럼  추가  (add)
alter table stuscore5 add total number(3);
--컬럼 삭제   (drop)
--alter table  stuscore5 drop column total;
-------------------------------------------
alter table stuscore5 add total number(2);
--컬럼변경 -타입변경 (modify)
alter table stuscore5 modify total number(3);
--기존에 들어가 있는 데이터 3자리가 있는데, 2자리 변경을 하려고 하면 변경되지않음. 
--기존에 문자가 들어가 있는데 ,숫자형으로 변경하려면 변경되지않음 

--컬럼변경 -이름변경 (rename)
alter table stuscore5 rename column total to tot;

--테이블명 변경 
alter table stuscore2 rename to stu2;
alter table stu2 rename to stuscore2;


desc stuscore5;


--컬럼순서 변경 
alter table stuscore5 modify name  invisible;
alter table stuscore5 modify kor invisible;
alter table stuscore5 modify eng invisible;
alter table stuscore5 modify math invisible;

alter table stuscore5 modify name visible;
alter table stuscore5 modify kor visible;
alter table stuscore5 modify eng visible;
alter table stuscore5 modify math visible;


select *from stuscore5;

commit;

--drop table stuscore3;
--drop table stuscore4;
--drop table stuscore5;

create table mem (
 id varchar2(30) primary key,-- 중복x null x
 name varchar2(100) not null, --중복ㅇ null x 
 phone varchar2(20) unique, -- 중복 x null값허용
 gender nchar(2) check(gender in ('남성','여성')),
 kor number(3) check(kor between 0 and 100)
);

insert into mem values(
'aaa','홍길동','010-1111','남성',100
);

insert into mem values(
'bbb','유관순',null,'여성',99
);


insert into mem values(
'ccc','유관순',null,'여성',99
);


insert into mem values(
'ddd','이순신',null,'남성',100
);

insert into mem values(
'eee','이순신',010-2222,'남성',100
);

commit;

select * from mem;

desc member;



--테이블 mem 테이블 primary key id 
-- constraint 별칭 (fk_score_id) foreign key(현재테이블의컬럼) references  pk테이블(컬럼)
--ex) constraint fk_score_id foreign key(id) references mem(id)
--###기본키 설정
--sno number(4) primary key

--기본키 삭제 
alter table score drop constraint SYS_C008362;

--기본키 설정 
alter table score add constraint pk_score_sno primary key(sno);



--##### 외래키 설정

create table score(
sno number(4) primary key,
id  varchar2(30),
kor number(3),
constraint fk_score_id foreign key(id) references mem(id)
);

--기본키 :중복x null값허용 x 
--외래키 : 기본키없는 데이터를 입력하면 입력이 되지 않게함 .


--외래키 조건 등록 
alter table score add constraint fk_score_id foreign key(id) references mem(id);


--외래키 조건 삭제 
--alter table score drop constraint fk_score_id;


select *from mem;
insert into score values(1,'aaa',100);
insert into score values(2,'bbb',90);
--insert into score values(3,'bb2',90);

select *from score;

--delete score where sno=3;
commit;


select * from mem; 
--delete mem where id = 'bbb';




--조인
      
select * from employees;
select department_id from employees;

--cross join -테이블 2개 선택해서 출력 
--컬럼수(13+6)= 19개
--데이터수107*27 =2889개  
select * from employees,departments; --데이터수107
select * from departments;--데이터수27
desc employees; --컬럼13
desc departments;--컬럼 6

--equi join :같은 컬럼을 가지고 조인 
select emp_name,a.department_id,department_name,salary 
from employees a,departments b
where a.department_id = b.department_id
;

---------
select * from member;
select * from stuscore;

select id,gender,phone,a.name,sno,total,avg,rank
from member a,stuscore b 
where a.name =b.name
;
---------------------------------------------
select emp_name, salary,job_id from employees;
select min_salary,max_salary from jobs;
 
select emp_name, a.department_id ,department_name,salary ,a.job_id,min_salary,max_salary
from employees a, jobs b ,departments c 
where a.job_id=b.job_id and a.department_id = c.department_id
;
----------------------------------------------------

select min_salary,max_salary from jobs;
desc board;
select * from board;

alter table board add bfile3 varchar2(100);

alter table board modify bdate invisible;
alter table board modify bdate visible;
desc board;
select * from board;



create table bfile(
bno number(4),
bfile varchar2(100)
);
insert into bfile values(
1,'2.jpg'
);
insert into bfile values(
2,'b1.jpg'
);
insert into bfile values(
3,'c1jpg'
);
insert into bfile values(
4,'d1.jpg'
); 
commit;

select *from bfile;
select * from board a ,bfile b
where a.bno= b.bno
;

alter table board drop column bfile;
alter table board drop column bfile2;
alter table board drop column bfile3;

desc board;

select count(*)
select * from board a, bfile b where a.bno =b.bno and a.bno=1;
select * from board where bno= 1;
select * from bfile where bno=1;



select *from board;
--bno,btitle,bcontent,id,bgroup,bstep,bindent,bhit,bdate
bno: board_seq.nextval
bgroup: board_seq.currval
bdate : sysdate

insert into board values (
board_seq.nextval,'2번째 게시글','파이썬에서 글쓰기 테스트','aaa',board_seq.currval,
0,0,0,sysdate
);
commit;
  desc bfile;
  
select * from bfile;
select * from board;


