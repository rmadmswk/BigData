select * from channel;
select * from membership order by 고객번호 ;
select * from prodcla;
select * from custdemo;
select * from purbyyear;
select * from purprod;
select * from compet;


select 중분류명,count(중분류명) from prodcla where 제휴사 = 'B' 
group by 중분류명
having count(중분류명)>=1;

select 대분류코드,count(대분류코드) from prodcla where 제휴사 = 'B'
group by 대분류코드
having count(대분류코드)>=1;


-- 식
select 대분류코드 from prodcla_view 
where 제휴사 = 'B' and 대분류코드 between 1 and 7
or 제휴사 = 'B' and 대분류코드 between 9 and 16
or 제휴사 = 'B' and 대분류코드 between 46 and 48
or 제휴사 = 'B' and 대분류코드 between 37 and 38
or 제휴사 = 'B' and 대분류코드 between 52 and 65
or 제휴사 = 'B' and 대분류코드 = 67
or 제휴사 = 'B' and 대분류코드 between 72 and 83
or 제휴사 = 'B' and 대분류코드 = 89
or 제휴사 = 'B' and 대분류코드 between 91 and 92;

-- 대분류 코드의 데이터 타입이 number여서 작동을 안함
update prodcla_view set 대분류코드 = '식'
where 제휴사 = 'B' and 대분류코드 between 1 and 7;

-- 그래서 그냥 number 2 = 식
update prodcla_view set 대분류코드 = 94 --식
where 제휴사 = 'B' and 대분류코드 between 1 and 7
or 제휴사 = 'B' and 대분류코드 between 9 and 16
or 제휴사 = 'B' and 대분류코드 between 46 and 48
or 제휴사 = 'B' and 대분류코드 between 37 and 38
or 제휴사 = 'B' and 대분류코드 between 52 and 65
or 제휴사 = 'B' and 대분류코드 = 67
or 제휴사 = 'B' and 대분류코드 between 72 and 83
or 제휴사 = 'B' and 대분류코드 = 89
or 제휴사 = 'B' and 대분류코드 between 91 and 92; -- 1310개

-- 그래서 그냥 number 1 = 의
update prodcla_view set 대분류코드 = 93 --의
where 제휴사 = 'B' and 대분류코드 between 29 and 36
or 제휴사 = 'B' and 대분류코드 between 44 and 45
or 제휴사 = 'B' and 대분류코드 between 49 and 51
or 제휴사 = 'B' and 대분류코드 = 66
or 제휴사 = 'B' and 대분류코드 between 68 and 71
or 제휴사 = 'B' and 대분류코드 = 90; -- 521개

-- number 3는 주
update prodcla_view set 대분류코드 = 95 -- 주
where 제휴사 = 'B' and 대분류코드 = 8
or 제휴사 = 'B' and 대분류코드 between 17 and 28
or 제휴사 = 'B' and 대분류코드 between 39 and 42
or 제휴사 = 'B' and 대분류코드 between 84 and 88; -- 750개


-- 시험 삼아 해봄
update prodcla_view set 대분류코드 = 100
where 대분류코드 = 1;
-- 시험 삼아 해봄
update prodcla_view set 대분류코드 = 1
where 대분류코드 = 100;

-- 테이블 자체에서 타입을 바꾸려 했는데 내부에 내용이 있으면 안바뀜
alter table prodcla drop column 대분류코드2;
alter table prodcla add(대분류코드2 varchar2(50));
alter table prodcla modify(대분류코드 varchar2(50));

-- view 삭제
drop view prodcla_view;

-- view 생성
create view prodcla_view
as select * from prodcla;

-- view 확인
select * from prodcla_view where 제휴사 = 'B';
select * from prodcla where 제휴사 = 'B';
select count(*) from prodcla_view where 제휴사 = 'B'; -- 2624
select count(*) from prodcla where 제휴사 = 'B'; -- 2624
desc prodcla_view;
-- 
alter table prodcla drop column 대분류코드2;
