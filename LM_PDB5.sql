select * from s_pur_copy;
select * from ex2;
select * from ex;

select sum(���űݾ�) from s_pur_copy group by ����ȣ order by ����ȣ;

select sum(���űݾ�) from s_pur_copy where ���޻�='A' group by ����ȣ order by ����ȣ;


create table s_pur_copy_A as select * from s_pur_copy where ���޻�='A';
select * from s_pur_copy_A;

create table s_pur_copy_B as select * from s_pur_copy where ���޻�='B';

create table s_pur_copy_A1 as
select * from ex2;

select * from ex2 where ���޻� = 'B';

select * from s_pur_copy_A1;

create table s_pur_copy_A2 as select * from s_pur_copy_A1 where �������� like '%2014%';

-- �Һз��ڵ� 1�� 14�⵵�� ������ �Ѿ�
drop table s_pur_copy_A4;
create table s_pur_copy_A4 as 
select ����ȣ,sum(���űݾ�) �ѱ��ž�14 from s_pur_copy_A2 where �Һз��ڵ�=1 group by ����ȣ order by ����ȣ;
select * from s_pur_copy_A4;

-- �Һз��ڵ� 1�� 15�⵵�� ������ �Ѿ�
drop table s_pur_copy_A5;
create table s_pur_copy_A5 as 
select ����ȣ,sum(���űݾ�) �ѱ��ž�15 from s_pur_copy_A3 where �Һз��ڵ�=1 group by ����ȣ order by ����ȣ;
select * from s_pur_copy_A5;

drop table s_pur_copy_A6;
CREATE table s_pur_copy_A6 AS
SELECT T1.����ȣ ����ȣ1,T2.����ȣ ����ȣ2,T1.�ѱ��ž�14,T2.�ѱ��ž�15
FROM s_pur_copy_A4 T1 
FULL OUTER JOIN s_pur_copy_A5 T2 ON (T1.����ȣ=T2.����ȣ);
select * from s_pur_copy_A6;

ALTER TABLE s_pur_copy_A6 DROP COLUMN ����ȣ1;

-- ���ҵ� ��
select ����ȣ2 from s_pur_copy_A6
WHERE �ѱ��ž�15 < �ѱ��ž�14;

select count(*) from s_pur_copy_A6
WHERE �ѱ��ž�15 < �ѱ��ž�14; -- 6237

drop table s_pur_copy_A7;
create table s_pur_copy_A7 as select ����ȣ,sum(���űݾ�) ���ž�14_1 from s_pur_copy_A1 where �Һз��ڵ�=1 
and �������� between 20140101 and 20140630 group by ����ȣ order by ����ȣ ;
select * from s_pur_copy_A7;

drop table s_pur_copy_A8;
create table s_pur_copy_A8 as select ����ȣ,sum(���űݾ�) ���ž�14_2 from s_pur_copy_A1 where �Һз��ڵ�=1 
and �������� between 20140701 and 20141231 group by ����ȣ order by ����ȣ ;
select * from s_pur_copy_A8;

drop table s_pur_copy_A9;
create table s_pur_copy_A9 as select ����ȣ,sum(���űݾ�) ���ž�15_1 from s_pur_copy_A1 where �Һз��ڵ�=1 
and �������� between 20150101 and 20150630 group by ����ȣ order by ����ȣ ;
select * from s_pur_copy_A9;

drop table s_pur_copy_A10;
create table s_pur_copy_A10 as select ����ȣ,sum(���űݾ�) ���ž�15_2 from s_pur_copy_A1 where �Һз��ڵ�=1 
and �������� between 20150701 and 20151231 group by ����ȣ order by ����ȣ ;
select * from s_pur_copy_A10;

drop table s_pur_copy_A11;
CREATE table s_pur_copy_A11 AS
SELECT T1.����ȣ ����ȣ,T2.����ȣ ����ȣ1,T1.���ž�14_1,T2.���ž�14_2
FROM s_pur_copy_A7 T1 
FULL OUTER JOIN s_pur_copy_A8 T2 ON (T1.����ȣ=T2.����ȣ);
select * from s_pur_copy_A11;

CREATE table s_pur_copy_A12 AS
SELECT T1.����ȣ ����ȣ,T2.����ȣ ����ȣ1,T1.���ž�14_1,T1.���ž�14_2,T2.���ž�15_1
FROM s_pur_copy_A11 T1 
FULL OUTER JOIN s_pur_copy_A9 T2 ON (T1.����ȣ=T2.����ȣ);
select * from s_pur_copy_A12;

CREATE table s_pur_copy_A13 AS
SELECT T1.����ȣ ����ȣ,T2.����ȣ ����ȣ1,T1.���ž�14_1,T1.���ž�14_2,T2.���ž�15_1
FROM s_pur_copy_A12 T1 
FULL OUTER JOIN s_pur_copy_ T2 ON (T1.����ȣ=T2.����ȣ);
select * from s_pur_copy_A12;




DROP VIEW SUM_12;
CREATE VIEW SUM_12 AS
SELECT T1.����ȣ ����ȣ1,T1.���űݾ�15��_1,T1.����Ƚ��15��_1, T2.���űݾ�15��_2 ,T2.����Ƚ��15��_2
FROM T_151 T1 
FULL OUTER JOIN T_152 T2 ON (T1.����ȣ=T2.����ȣ);

select sum(���űݾ�) from s_pur_copy_A3 where �Һз��ڵ�=1 and �������� like '%2015%' group by ����ȣ order by ����ȣ;

create table s_pur_copy_A3 as select * from s_pur_copy_A1 where �������� like '%2015%';

update s_pur_copy_A1 set ���űݾ� = ���űݾ�/1.01620302175834
where �������� between 20140101 and 20140331; --3,217,669

update s_pur_copy_A1 set ���űݾ� = ���űݾ�/0.970792475064181
where �������� between 20140401 and 20140630; --3,491,713��

update s_pur_copy_A1 set ���űݾ� = ���űݾ�/0.885105845713564
where �������� between 20140701 and 20140930; --3,563,754

update s_pur_copy_A1 set ���űݾ� = ���űݾ�/1.12760405706831
where �������� between 20141001 and 20141231; -- 3,598,378

update s_pur_copy_A1 set ���űݾ� = ���űݾ�/0.988770710623332
where �������� between 20150101 and 20150331; --3,619,223

update s_pur_copy_A1 set ���űݾ� = ���űݾ�/0.932539514386203
where �������� between 20150401 and 20150630;  --3,854,875

update s_pur_copy_A1 set ���űݾ� = ���űݾ�/0.88791897961778
where �������� between 20150701 and 20150930;  --3,795,633

update s_pur_copy_A1 set ���űݾ� = ���űݾ�/1.2103055214204
where �������� between 20151001 and 20151231; --