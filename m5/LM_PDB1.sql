select * from channel;
select * from membership order by ����ȣ ;
select * from prodcla;
select * from custdemo;
select * from purbyyear;
select * from purprod;
select * from compet;


select �ߺз���,count(�ߺз���) from prodcla where ���޻� = 'B' 
group by �ߺз���
having count(�ߺз���)>=1;

select ��з��ڵ�,count(��з��ڵ�) from prodcla where ���޻� = 'B'
group by ��з��ڵ�
having count(��з��ڵ�)>=1;


-- ��
select ��з��ڵ� from prodcla_view 
where ���޻� = 'B' and ��з��ڵ� between 1 and 7
or ���޻� = 'B' and ��з��ڵ� between 9 and 16
or ���޻� = 'B' and ��з��ڵ� between 46 and 48
or ���޻� = 'B' and ��з��ڵ� between 37 and 38
or ���޻� = 'B' and ��з��ڵ� between 52 and 65
or ���޻� = 'B' and ��з��ڵ� = 67
or ���޻� = 'B' and ��з��ڵ� between 72 and 83
or ���޻� = 'B' and ��з��ڵ� = 89
or ���޻� = 'B' and ��з��ڵ� between 91 and 92;

-- ��з� �ڵ��� ������ Ÿ���� number���� �۵��� ����
update prodcla_view set ��з��ڵ� = '��'
where ���޻� = 'B' and ��з��ڵ� between 1 and 7;

-- �׷��� �׳� number 2 = ��
update prodcla_view set ��з��ڵ� = 94 --��
where ���޻� = 'B' and ��з��ڵ� between 1 and 7
or ���޻� = 'B' and ��з��ڵ� between 9 and 16
or ���޻� = 'B' and ��з��ڵ� between 46 and 48
or ���޻� = 'B' and ��з��ڵ� between 37 and 38
or ���޻� = 'B' and ��з��ڵ� between 52 and 65
or ���޻� = 'B' and ��з��ڵ� = 67
or ���޻� = 'B' and ��з��ڵ� between 72 and 83
or ���޻� = 'B' and ��з��ڵ� = 89
or ���޻� = 'B' and ��з��ڵ� between 91 and 92; -- 1310��

-- �׷��� �׳� number 1 = ��
update prodcla_view set ��з��ڵ� = 93 --��
where ���޻� = 'B' and ��з��ڵ� between 29 and 36
or ���޻� = 'B' and ��з��ڵ� between 44 and 45
or ���޻� = 'B' and ��з��ڵ� between 49 and 51
or ���޻� = 'B' and ��з��ڵ� = 66
or ���޻� = 'B' and ��з��ڵ� between 68 and 71
or ���޻� = 'B' and ��з��ڵ� = 90; -- 521��

-- number 3�� ��
update prodcla_view set ��з��ڵ� = 95 -- ��
where ���޻� = 'B' and ��з��ڵ� = 8
or ���޻� = 'B' and ��з��ڵ� between 17 and 28
or ���޻� = 'B' and ��з��ڵ� between 39 and 42
or ���޻� = 'B' and ��з��ڵ� between 84 and 88; -- 750��


-- ���� ��� �غ�
update prodcla_view set ��з��ڵ� = 100
where ��з��ڵ� = 1;
-- ���� ��� �غ�
update prodcla_view set ��з��ڵ� = 1
where ��з��ڵ� = 100;

-- ���̺� ��ü���� Ÿ���� �ٲٷ� �ߴµ� ���ο� ������ ������ �ȹٲ�
alter table prodcla drop column ��з��ڵ�2;
alter table prodcla add(��з��ڵ�2 varchar2(50));
alter table prodcla modify(��з��ڵ� varchar2(50));

-- view ����
drop view prodcla_view;

-- view ����
create view prodcla_view
as select * from prodcla;

-- view Ȯ��
select * from prodcla_view where ���޻� = 'B';
select * from prodcla where ���޻� = 'B';
select count(*) from prodcla_view where ���޻� = 'B'; -- 2624
select count(*) from prodcla where ���޻� = 'B'; -- 2624
desc prodcla_view;
-- 
alter table prodcla drop column ��з��ڵ�2;
