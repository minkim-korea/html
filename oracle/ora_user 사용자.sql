---테이블생성  create 
create table member(
id varchar2(100) primary key, 
pw varchar2(100),
name varchar2(100),
phone varchar2(20)
);
--입력명령어insert : 임시저장 
insert into member (id,pw,name,phone) values(
'aaa','1111','홍길동','010-1111-1111'
);
insert into member values(
'bbb','1111','유관순','010-2222-2222'
);

insert into member(id,pw,name) values(
'ccc','1111','이순신'
);

---ddd,강감찬 3333
---eee, 김구 ,4444
---fff, 김유신 , 5555
insert into member(id,name,pw,phone) values(
'ddd','강감찬','3333','010-3333-3333'
);
insert into member(id,name,pw,phone) values(
'eee','김구','4444','010-4444-4444'
);

insert into member(id,name,pw,phone) values(
'fff','김유신','5555','010-5555-5555'
);

select * from member;

--update 수정 
update member set phone='010-1234-1234' where id='ddd';

select *from member;
commit;
rollback;

drop table member;



---검색 
select id,pw,name,phone from member;

select * from member;

select id,name from member;

commit;--저장완료가 됨.

create table stuscore(
sno number(4) primary key,
name varchar2(100),
kor number(3),  
eng number(3),
math number(3),
total number(3),
avg number(4), 
rank number(3)
 );
 
 
 --create member 5명 저장 
 --입력  
 
 
 create table member(
 id varchar2(100) primary key,
 pw varchar2(100),
 name varchar2(100),
 phone varchar2(20) 
 );
 
 insert into member(id,pw,name,phone)values(
 'aaa','1111','홍길동','010-1111-1111'
 );
  insert into member(id,pw,name,phone)values(
 'bbb','2222','유관순','010-2222-2222'
 );
  insert into member(id,pw,name,phone)values(
 'ccc','3333','이순신','010-3333-3333'
 );
  insert into member(id,pw,name,phone)values(
 'ddd','4444','강감찬','010-4444-4444'
 );
   insert into member(id,pw,name,phone)values(
 'ddd','5555','김구','010-5555-5555'
 );
 
 
 commit;
  select id,pw,name,phone from member;
  
  
  
  
  
  
  --delete 삭제
  
  delete member;
  delete member where id ='aaa';
  delete member where name='유관순';
  delete member where name like '%김%';
  
  commit;
  rollback;
  select * from member;


 