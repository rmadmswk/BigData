select * from s_pur_copy;
select * from ex2;
select * from ex;

select sum(구매금액) from s_pur_copy group by 고객번호 order by 고객번호;

select sum(구매금액) from s_pur_copy where 제휴사='A' group by 고객번호 order by 고객번호;


create table s_pur_copy_A as select * from s_pur_copy where 제휴사='A';
select * from s_pur_copy_A;

create table s_pur_copy_B as select * from s_pur_copy where 제휴사='B';

create table s_pur_copy_A1 as
select * from ex2;

select * from ex2 where 제휴사 = 'B';

select * from s_pur_copy_A1;

create table s_pur_copy_A2 as select * from s_pur_copy_A1 where 구매일자 like '%2014%';

-- 소분류코드 1을 14년도에 구매한 총액
drop table s_pur_copy_A4;
create table s_pur_copy_A4 as 
select 고객번호,sum(구매금액) 총구매액14 from s_pur_copy_A2 where 소분류코드=1 group by 고객번호 order by 고객번호;
select * from s_pur_copy_A4;

-- 소분류코드 1을 15년도에 구매한 총액
drop table s_pur_copy_A5;
create table s_pur_copy_A5 as 
select 고객번호,sum(구매금액) 총구매액15 from s_pur_copy_A3 where 소분류코드=1 group by 고객번호 order by 고객번호;
select * from s_pur_copy_A5;

drop table s_pur_copy_A6;
CREATE table s_pur_copy_A6 AS
SELECT T1.고객번호 고객번호1,T2.고객번호 고객번호2,T1.총구매액14,T2.총구매액15
FROM s_pur_copy_A4 T1 
FULL OUTER JOIN s_pur_copy_A5 T2 ON (T1.고객번호=T2.고객번호);
select * from s_pur_copy_A6;

ALTER TABLE s_pur_copy_A6 DROP COLUMN 고객번호1;

-- 감소된 고객
select 고객번호2 from s_pur_copy_A6
WHERE 총구매액15 < 총구매액14;

select count(*) from s_pur_copy_A6
WHERE 총구매액15 < 총구매액14; -- 6237

drop table s_pur_copy_A7;
create table s_pur_copy_A7 as select 고객번호,sum(구매금액) 구매액14_1 from s_pur_copy_A1 where 소분류코드=1 
and 구매일자 between 20140101 and 20140630 group by 고객번호 order by 고객번호 ;
select * from s_pur_copy_A7;

drop table s_pur_copy_A8;
create table s_pur_copy_A8 as select 고객번호,sum(구매금액) 구매액14_2 from s_pur_copy_A1 where 소분류코드=1 
and 구매일자 between 20140701 and 20141231 group by 고객번호 order by 고객번호 ;
select * from s_pur_copy_A8;

drop table s_pur_copy_A9;
create table s_pur_copy_A9 as select 고객번호,sum(구매금액) 구매액15_1 from s_pur_copy_A1 where 소분류코드=1 
and 구매일자 between 20150101 and 20150630 group by 고객번호 order by 고객번호 ;
select * from s_pur_copy_A9;

drop table s_pur_copy_A10;
create table s_pur_copy_A10 as select 고객번호,sum(구매금액) 구매액15_2 from s_pur_copy_A1 where 소분류코드=1 
and 구매일자 between 20150701 and 20151231 group by 고객번호 order by 고객번호 ;
select * from s_pur_copy_A10;

drop table s_pur_copy_A11;
CREATE table s_pur_copy_A11 AS
SELECT T1.고객번호 고객번호,T2.고객번호 고객번호1,T1.구매액14_1,T2.구매액14_2
FROM s_pur_copy_A7 T1 
FULL OUTER JOIN s_pur_copy_A8 T2 ON (T1.고객번호=T2.고객번호);
select * from s_pur_copy_A11;

CREATE table s_pur_copy_A12 AS
SELECT T1.고객번호 고객번호,T2.고객번호 고객번호1,T1.구매액14_1,T1.구매액14_2,T2.구매액15_1
FROM s_pur_copy_A11 T1 
FULL OUTER JOIN s_pur_copy_A9 T2 ON (T1.고객번호=T2.고객번호);
select * from s_pur_copy_A12;

CREATE table s_pur_copy_A13 AS
SELECT T1.고객번호 고객번호,T2.고객번호 고객번호1,T1.구매액14_1,T1.구매액14_2,T2.구매액15_1
FROM s_pur_copy_A12 T1 
FULL OUTER JOIN s_pur_copy_ T2 ON (T1.고객번호=T2.고객번호);
select * from s_pur_copy_A12;




DROP VIEW SUM_12;
CREATE VIEW SUM_12 AS
SELECT T1.고객번호 고객번호1,T1.구매금액15년_1,T1.구매횟수15년_1, T2.구매금액15년_2 ,T2.구매횟수15년_2
FROM T_151 T1 
FULL OUTER JOIN T_152 T2 ON (T1.고객번호=T2.고객번호);

select sum(구매금액) from s_pur_copy_A3 where 소분류코드=1 and 구매일자 like '%2015%' group by 고객번호 order by 고객번호;

create table s_pur_copy_A3 as select * from s_pur_copy_A1 where 구매일자 like '%2015%';

update s_pur_copy_A1 set 구매금액 = 구매금액/1.01620302175834
where 구매일자 between 20140101 and 20140331; --3,217,669

update s_pur_copy_A1 set 구매금액 = 구매금액/0.970792475064181
where 구매일자 between 20140401 and 20140630; --3,491,713개

update s_pur_copy_A1 set 구매금액 = 구매금액/0.885105845713564
where 구매일자 between 20140701 and 20140930; --3,563,754

update s_pur_copy_A1 set 구매금액 = 구매금액/1.12760405706831
where 구매일자 between 20141001 and 20141231; -- 3,598,378

update s_pur_copy_A1 set 구매금액 = 구매금액/0.988770710623332
where 구매일자 between 20150101 and 20150331; --3,619,223

update s_pur_copy_A1 set 구매금액 = 구매금액/0.932539514386203
where 구매일자 between 20150401 and 20150630;  --3,854,875

update s_pur_copy_A1 set 구매금액 = 구매금액/0.88791897961778
where 구매일자 between 20150701 and 20150930;  --3,795,633

update s_pur_copy_A1 set 구매금액 = 구매금액/1.2103055214204
where 구매일자 between 20151001 and 20151231; --