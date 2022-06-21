--ESCAPE
SELECT * FROM employees WHERE job_id like '%\_A%' escape '\';
SELECT * FROM employees WHERE job_id like '%#_A%' escape '#';

--IN : OR ��� ���
SELECT * FROM employees WHERE manager_id=101 or manager_id=102 or manager_id=103;
SELECT * FROM employees WHERE manager_id in(101,102,103);

--BETWEEN AND : ����
SELECT * FROM employees WHERE manager_id BETWEEN 101 AND 103;

--IS NULL / IS NOT NULL
SELECT * FROM employees WHERE commission_pct IS NULL;
SELECT * FROM employees WHERE commission_pct IS NOT NULL;

--[�ֿ� �Լ�]
--MOD
SELECT * FROM employees WHERE MOD(employee_id,2)=1;
SELECT MOD(10,3) FROM dual;

--ROUND()
SELECT ROUND(355.95555) FROM dual;
SELECT ROUND(355.95555,0) FROM dual;
SELECT ROUND(355.95555,2) FROM dual;
SELECT ROUND(355.95555,-1) FROM dual;

--TRUNC()
SELECT TRUNC(45.5555,1)FROM dual;
SELECT last_name, TRUNC(salary/12,2) FROM employees;

--��¥ ���� �Լ�
SELECT SYSDATE FROM dual;
SELECT SYSDATE + 1 FROM dual;
SELECT last_name, TRUNC((SYSDATE - hire_date)/365) �ټӿ��� FROM employees;
SELECT last_name, hire_date, ADD_MONTHS(hire_date, 6) FROM employees;
SELECT LAST_DAY(sysdate) - sysdate FROM dual;
SELECT hire_date, NEXT_DAY(hire_date,'��') FROM employees;
SELECT sysdate, NEXT_DAY(sysdate, '��') FROM dual;

--MONTHS_BETWEEN()
SELECT last_name,sysdate,hire_date, TRUNC(MONTHS_BETWEEN(sysdate, hire_date)) FROM employees;

--����ȯ �Լ�
--number character date
--to_date() ���ڿ��� ��¥��
--to_number, to_char
SELECT last_name, months_between('2012/12/31',hire_date) FROM employees;
SELECT trunc(sysdate - to_date('2014/01/01')) FROM dual;

--Q. employees ���̺� �ִ� ������(���, �̸� ��������)�� ���Ͽ� ����������� �ټӿ����� ���ϼ���
SELECT employee_id,last_name, TRUNC((sysdate - hire_date)/365)�ټӿ��� FROM employees;

SELECT TO_DATE('20210101'),
TO_CHAR(TO_DATE('20210101'),'MonthDD YYYY','NLS_DATE_LANGUAGE=ENGLISH') format1 FROM dual;

SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS') FROM dual;
SELECT TO_CHAR(SYSDATE, 'yy/mm/dd') FROM dual;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM dual;
SELECT TO_CHAR(SYSDATE, 'hh24:mi:ss') FROM dual;
SELECT TO_CHAR(SYSDATE, 'DAY') FROM dual;

--TO_CHAR
--9 ���ڸ��� ����ǥ��
--0 �պκ��� 0���� ǥ��
--$ �޷� ��ȣ�� �տ� ǥ��
--. �Ҽ����� ǥ��
--, Ư�� ��ġ�� ǥ��
--MI �����ʿ� ? ��ȣ ǥ��
--PR �������� <>���� ǥ��
--EEEE ������ ǥ��
--B ������ 0���� ǥ��
--L ������ȭ
SELECT salary, TO_CHAR(salary,'0099999') FROM employees;
SELECT TO_CHAR(-salary, '999999PR') FROM employees;
SELECT TO_CHAR(1111, '99.99EEEE') FROM dual;
SELECT TO_CHAR(1111, 'B9999.99') FROM dual;
SELECT TO_CHAR(1111,'L99999') FROM dual; 

--WIDTH_BUCKET() ������, �ּҰ�, �ִ밪, BUCKET ����
SELECT WIDTH_BUCKET(92,0,100,10) FROM dual;
SELECT WIDTH_BUCKET(100,0,100,10) FROM dual;
SELECT department_id, last_name, salary, WIDTH_BUCKET(salary,0,20000,5) FROM employees WHERE department_id=50;

--[����] employees ���̺��� employee_id, last_name, salary, hire_date �� �Ի��� �������� �ټӳ���� ����ؼ� �Ʒ������� �߰��� �� 
--����ϼ���. 2001�� 1�� 1�� â���Ͽ� ����(2020�� 12�� 31��)���� 20�Ⱓ ��Ǿ�� ȸ��� ������ �ټӿ����� ���� 30������� ������ ��޿�
--���� 1000���� bonus�� ����(bonus ���� �������� ����)
SELECT employee_id, last_name, salary, hire_date,
TRUNC(((to_date('20201231') - hire_date)/365))�ټӿ���,
(WIDTH_BUCKET(TRUNC(((to_date('20.12.31') - hire_date)/365)),0,20,30)) ���ʽ����,
(WIDTH_BUCKET(TRUNC(((to_date('20.12.31') - hire_date)/365)),0,20,30))*1000 bonus
FROM employees
ORDER BY bonus DESC;

--�����Լ�
SELECT UPPER('Hello World') FROM dual;
SELECT LOWER('Hello World') FROM dual;
SELECT last_name, salary FROM employees WHERE LOWER(last_name)='seo';
SELECT INITCAP(job_id) FROM employees;
SELECT job_id, LENGTH(job_id) FROM employees;
SELECT INSTR('Hello World','o',3,2) From dual;
SELECT SUBSTR('Hello World',3,3) FROM dual;
SELECT SUBSTR('Hello World',-3,3) FROM dual;
SELECT LPAD('Hello World',20,'#') FROM dual;
SELECT RPAD('Hello World',20,'#') FROM dual;
SELECT LTRIM('aaaHello Worldaaa','a') FROM dual;
SELECT RTRIM('aaaHello Worldaaa','a') FROM dual;
SELECT LTRIM('   Hello World   ') FROM dual;
SELECT RTRIM('   Hello World   ') FROM dual;
SELECT TRIM('   Hello World   ') FROM dual;

--��Ÿ�Լ�
SELECT salary, commission_pct, salary*12*NVL(commission_pct,0) FROM employees;

SELECT last_name, department_id,
CASE WHEN department_id=90 THEN '�濵������'
WHEN department_id = 60 THEN '���α׷���'
WHEN department_id=100 THEN '�λ��'
END AS �Ҽ�
FROM employees;

--�м��Լ� : ���� ���� ������ ������ ���� ����� return �� �� ������ ó�� ����� �Ǵ� ���� ������ window��� ��Ī
--FIRST_VALUE() OVER() �׷��� ù��° ���� ���Ѵ�.
SELECT first_name �̸�, salary ����,
FIRST_VALUE(salary) OVER(ORDER BY salary DESC) �ְ���
FROM employees;
--3�� ���� ������ �� ù��° ��
SELECT first_name �̸�, salary ����,
FIRST_VALUE(salary) OVER(ORDER BY salary DESC ROWS 3 PRECEDING) �ְ���
FROM employees;

--Q. 3�� ���� �������� ��������
select first_name �̸�, salary ����,
first_value(salary) over(order by salary asc rows 3 preceding) ��������
from employees;

select first_name �̸�, salary ����,
last_value(salary) over(order by salary desc rows 3 preceding) ��������
from employees;

select first_name �̸�, salary ����,
last_value(salary) over(order by salary desc rows 3 preceding) ��������
from employees;

--Q. ���Ʒ� ���� 2�� ���� �� ��������
SELECT first_name �̸�, salary ����,
LAST_VALUE(salary) OVER(ORDER BY salary DESC ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) ��������
FROM employees;

--[����] employees ���̺��� department_id=50�� ������ ������ �������� �����Ͽ� ���� ī��带 ����ϼ���.
SELECT department_id, last_name, salary, COUNT(*) over(order by salary desc) 
FROM employees
WHERE department_id=50;

--[����] employees ���̺��� department_id�� �������� �������� �����ϰ� department_id �׷� ������ ���� ���� �հ踦 ����ϼ���.
SELECT department_id, last_name, salary, SUM(salary) OVER(PARTITION BY department_id 
ORDER BY department_id asc) FROM employees;

SELECT department_id, last_name, salary, SUM(salary) OVER( 
ORDER BY department_id asc) FROM employees;

--[����] employees ���̺��� department_id(�μ�)�� ���� ���������� ����ϼ���.
SELECT first_name, department_id �μ�, salary ����,
RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) �μ���������
FROM employees;

SELECT first_name, department_id �μ�, salary ����,
RANK() OVER(ORDER BY salary DESC) ��������
FROM employees;

--dml
DESC BOOK;
SELECT * FROM BOOK;
SELECT BOOKNAME,PRICE FROM BOOK;
SELECT PUBLISHER FROM BOOK;
SELECT DISTINCT PUBLISHER FROM BOOK;
SELECT * 
FROM BOOK
WHERE PRICE < 10000;
--Q. ������ 10000�� �̻� 20000�� ������ ������ �˻��ϼ���.
SELECT * FROM BOOK WHERE 10000 <= PRICE AND PRICE <= 20000;
--Q. ���ǻ簡 �½�����, Ȥ�� ���ѹ̵���� ������ �˻��ϼ���.
SELECT * FROM BOOK WHERE PUBLISHER = '�½�����' OR PUBLISHER = '���ѹ̵��';
SELECT * FROM BOOK WHERE PUBLISHER IN ('�½�����','���ѹ̵��');
--Q. ���ǻ簡 �½�����, Ȥ�� ���ѹ̵� �ƴ� ������ �˻��ϼ���.
SELECT * FROM BOOK WHERE PUBLISHER NOT IN ('�½�����','���ѹ̵��');
--Q. �����̸��� �౸�� ���Ե� ���ǻ縦 �˻��ϼ���.
select PUBLISHER from BOOK where BOOKNAME like '%�౸%';
select * from BOOK where BOOKNAME like '%�౸%';
--[����] �����̸��� ���� �� ��° ��ġ�� ����� ���ڿ��� ���� ������ �˻��ϼ���.
-- _�� Ư�� ��ġ�� �Ѱ��� ���ڿ� ��ġ
-- %�� 0�� �̻��� ���ڿ� ��ġ
SELECT BOOKNAME,PUBLISHER
FROM BOOK
WHERE BOOKNAME LIKE'_��%';
--[����] �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��ϼ���.
SELECT * 
FROM BOOK
WHERE BOOKNAME LIKE '%�౸%' AND PRICE >= 20000;

SELECT * 
FROM BOOK
ORDER BY BOOKNAME;

SELECT * 
FROM BOOK
ORDER BY BOOKNAME DESC;

--Q. ������ ���ݼ����� �˻��ϰ� ������ ������ �̸������� �˻��ϼ���.
SELECT * FROM BOOK ORDER BY PRICE,BOOKNAME;
--Q. ������ ������ ������������ �˻��ϰ� ���� ������ ���ٸ� ���ǻ��� ������������ ����ϼ���.
select * from book
order by price Desc,publisher;

SELECT * FROM ORDERS;
SELECT SUM(SALEPRICE)
FROM ORDERS;

SELECT SUM(SALEPRICE) AS "�Ѹ���"
FROM ORDERS;

--Q.CUSTID �� 2���� ���� �ֹ��� ������ ���Ǹž��� ���ϼ���.
select sum(SALEPRICE) AS "�� �Ǹž�" from ORDERS where CUSTID=2;
SELECT SUM(SALEPRICE) AS TOTAL,
AVG(SALEPRICE) AS AVERAGE,
MIN(SALEPRICE) AS MINIMUM,
MAX(SALEPRICE) AS MAXIMUM
FROM ORDERS;

SELECT COUNT(*) FROM ORDERS;

--Q. CUSTID�� ���������� ���Ǹž��� ����ϼ���.
SELECT CUSTID, COUNT(*) AS ��������, SUM(SALEPRICE) AS "�� �Ǹž�"
FROM ORDERS
GROUP BY CUSTID;

--Q. ������ 8000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���ϼ���. �� �α� �̻� ������ ���� ������
SELECT CUSTID, COUNT(*) AS ��������
FROM ORDERS
WHERE SALEPRICE >= 8000
GROUP BY CUSTID
HAVING COUNT(*) >= 2;

SELECT * FROM CUSTOMER;

SELECT * 
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
ORDER BY CUSTOMER.CUSTID;

--Q. ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ� ���̸����� �����ϼ���.
SELECT NAME, SUM(SALEPRICE)
FROM CUSTOMER,ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
GROUP BY CUSTOMER.NAME
ORDER BY CUSTOMER.NAME;

--Q. ���� �̸��� ���� �ֹ��� ������ �̸��� ���ϼ���.
SELECT CUSTOMER.NAME, BOOK.BOOKNAME
FROM CUSTOMER,ORDERS,BOOK
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID AND ORDERS.BOOKID= BOOK.BOOKID;

SELECT C.NAME, B.BOOKNAME
FROM CUSTOMER C,ORDERS O,BOOK B
WHERE C.CUSTID = O.CUSTID AND O.BOOKID= B.BOOKID;

--[����] ������ 20,000�� ������ �ֹ��� ���� �̸��� ������ �̸��� ���ϼ���.
SELECT C.NAME, B.BOOKNAME, O.SALEPRICE
FROM BOOK B, CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID AND O.BOOKID=B.BOOKID AND B.PRICE=20000;

--[����] ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���ϼ���.
--outer join ���������� �������� ���ϴ��� �ش� ���� ��Ÿ��
SELECT C.NAME, O.SALEPRICE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID(+);
--[����] ���� ��� ������ �̸��� ����ϼ���.
SELECT BOOKNAME
FROM BOOK
WHERE PRICE=(SELECT MAX(PRICE) FROM BOOK);
SELECT * FROM BOOK;

--[����] ������ ������ ���� �ִ� ���� �̸��� �˻��ϼ���.
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS);
--[����] ���ѹ̵��� ������ ������ ������ ���� �̸��� ����ϼ���.
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID FROM ORDERS
WHERE BOOKID IN (SELECT BOOKID FROM BOOK
WHERE PUBLISHER = '���ѹ̵��'));

--Q. ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�.
SELECT * FROM BOOK;
SELECT b1.bookname
FROM book b1
WHERE b1.price > (SELECT avg(b2.price)
FROM book b2 WHERE b2.publisher=b1.publisher);

--Q. ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�.
SELECT * FROM customer;
SELECT * FROM orders;
SELECT name
FROM customer
MINUS
SELECT name
FROM customer
WHERE custid IN(SELECT custid FROM orders);

--Q. �ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�.
SELECT name, address
FROM customer
WHERE custid IN(SELECT custid FROM orders);

--Q.Customer ���̺��� ����ȣ�� 5�� ���� �ּҸ� �����ѹα� �λꡯ���� �����Ͻÿ�.
UPDATE customer
SET address = '���ѹα� �λ�'
WHERE custid=5;

SELECT * FROM customer;
--Q.Customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�.
UPDATE customer
SET address = (SELECT address FROM customer
WHERE name = '�迬��')
WHERE name = '�ڼ���';
SELECT * FROM customer;
--Q.Customer ���̺��� ����ȣ�� 5�� ���� ������ �� ����� Ȯ���Ͻÿ�.
DELETE customer
WHERE custid=5;

SELECT ABS(-78), ABS(+78) FROM DUAL;
SELECT ROUND(4.875,1) FROM DUAL;
SELECT * FROM orders;
--Q.���� ��� �ֹ� �ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�.
select custid ����ȣ,round(avg(saleprice),-2) "��� �ֹ� �ݾ�"
from orders
group by custid;

--Q.���� ���� ���߱����� ���Ե� ������ ���󱸡��� ������ �� ���� ���, ������ ���̽ÿ�.
SELECT * FROM book;
SELECT bookid, REPLACE(bookname, '�߱�','��') bookname, price
FROM book;

--Q.���½����������� ������ ������ ����� ������ ���� ��, ����Ʈ ���� ���̽ÿ�.
SELECT bookname ����, LENGTH(bookname) ���ڼ�, LENGTHB(bookname) ����Ʈ��
FROM book
WHERE publisher = '�½�����';

SELECT * FROM customer;
INSERT INTO customer VALUES(6,'�ڼ���','���ѹα� ����','000-9000-0001');
INSERT INTO customer VALUES(5,'�ڼ���','���ѹα� ����',null);
DELETE customer
WHERE custid = 6;

--Q.���缭���� �� �߿��� ���� ��(��)�� ���� ����� �� ���̳� �Ǵ��� ���� �ο����� ���Ͻÿ�.
SELECT SUBSTR(name,1,1)��,COUNT(*)�ο���
FROM customer
GROUP BY SUBSTR(name,1,1);

--Q. ���缭���� �ֹ��Ϸ� ���� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���ϼ���.
SELECT orderdate �ֹ�����, orderdate+10 Ȯ������
FROM orders;

--Q.DBMS ������ ������ ���� ��¥�� �ð�, ������ Ȯ���Ͻÿ�. 
SELECT SYSDATE FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'yyyy/mm/dd dy hh24:mi:ss')SYSDATE1
FROM dual;

--Q.���缭���� 2020�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ���̽ÿ�.
SELECT * FROM orders;
SELECT orderid �ֹ���ȣ,TO_CHAR(orderdate,'YYYY-mm-dd day') �ֹ���,custid ����ȣ, bookid ������ȣ
FROM orders
WHERE orderdate = '20/07/07';
 
--Q.����Ͽ��� ����ȣ, �̸�, ��ȭ��ȣ�� ���� �� �� ���̽ÿ�.
SELECT * FROM customer;
SELECT ROWNUM ����, custid ����ȣ, name �̸�, phone ��ȭ��ȣ
FROM customer
WHERE ROWNUM<=2;

--Q.��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.
SELECT orderid,saleprice FROM orders
WHERE saleprice <= (SELECT AVG(saleprice) FROM orders);

--Q.��ü ��� �ֹ��ݾ׺��� ū �ݾ��� �� �ֹ� ������ ���ؼ� �ֹ���ȣ, ����ȣ, �ݾ��� ���̽ÿ�.
SELECT * FROM orders;
SELECT	orderid, custid, saleprice
from Orders b1
where b1.saleprice > (select avg(b2.saleprice)
from Orders b2 where b2.custid = b1.custid);

--Q.�����ѹα����� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�.
SELECT * FROM customer;
SELECT SUM(saleprice) ���Ǹž�
FROM orders
WHERE custid IN (SELECT custid FROM customer WHERE address LIKE '%���ѹα�%');

--Q.3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.
select orderid, saleprice from orders 
where saleprice > (select max(saleprice) from orders where custid='3');

--[����]EXISTS �����ڸ� ����Ͽ� �����ѹα����� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�.
SELECT SUM(saleprice)total
FROM orders o
WHERE EXISTS(SELECT * FROM customer c 
WHERE address LIKE'%���ѹα�%' AND o.custid=c.custid);

--[����]���缭���� ���� �Ǹž��� ���̽ÿ�(���̸��� ���� �Ǹž� ���)
SELECT (SELECT name FROM customer c WHERE c.custid=o.custid)name,
SUM(saleprice) total FROM orders o
GROUP BY o.custid;

--[����] ����ȣ�� 2 ������ ���� �Ǹž��� ���̽ÿ�(���̸��� ���� �Ǹž� ���)
SELECT * FROM customer;
SELECT c.name, SUM(o.saleprice) total
FROM(SELECT custid, name
FROM customer
WHERE custid<=2) c,
orders o
WHERE c.custid = o.custid
GROUP BY c.name;




--Q.�ּҿ� �����ѹα����� �����ϴ� ����� ������ �並 ����� ��ȸ�Ͻÿ�. ���� �̸��� vw_Customer�� �����Ͻÿ�.
CREATE VIEW vw_Customer
AS SELECT *
FROM customer
WHERE address LIKE'%���ѹα�%';

SELECT * FROM vw_Customer;
SELECT * FROM customer;
--[����]Orders ���̺��� ���̸��� �����̸��� �ٷ� Ȯ���� �� �ִ� �並 ������ ��, 
--���迬�ơ� ���� ������ ������ �ֹ���ȣ, �����̸�, �ֹ����� ���̽ÿ�.
CREATE VIEW vw_orders(orderid,custid,name,bookid,bookname,saleprice,orderdate)
AS SELECT o.orderid, o.custid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate
FROM orders o, customer c, book b
WHERE o.custid = c.custid AND o.bookid=b.bookid;
SELECT * FROM vw_orders;
SELECT orderid, bookname, saleprice
FROM vw_orders
WHERE name='�迬��';
--[����]vw_Customer�� �̱��� �ּҷ� ���� ������ �����ϼ���.
SELECT * FROM vw_Customer;
CREATE OR REPLACE VIEW vw_Customer
AS SELECT *
FROM customer
WHERE address LIKE'%�̱�%';

--[����]�ռ� ������ �� vw_Customer�� �����Ͻÿ�.
DROP VIEW vw_Customer;

--[HR Tables]

SELECT * FROM employees;
--[����]EMPLOYEES ���̺��� commission_pct ��  Null�� ������  ����ϼ���.
SELECT COUNT(*)
FROM employees
WHERE commission_pct is null;
--[����]EMPLOYEES ���̺��� employee_id�� Ȧ���� �͸� ����ϼ���.
SELECT *
FROM employees
WHERE MOD(employee_id,2)=1;
--[����]job_id�� ���� ���̸� ���ϼ���.
SELECT job_id, LENGTH(job_id) FROM employees;
--[����]job_id ���� �����հ� ������� �ְ��� �������� ���
SELECT job_id, SUM(salary)�����հ�, AVG(salary)�������, MAX(salary)�ְ���,MIN(salary)��������
FROM employees
GROUP BY job_id;

--��¥ ���� �Լ�
SELECT SYSDATE FROM DUAL;
SELECT * FROM employees;
SELECT last_name, hire_date, TRUNC((SYSDATE - hire_date)/365,0)�ټӿ��� FROM employees;

--Ư�� ���� ���� ���� ��¥�� ���ϱ�
SELECT last_name, hire_date, ADD_MONTHS(hire_date,6) FROM employees;

--�ش� ��¥�� ���� ���� ������ ��ȯ�ϴ� �Լ�
SELECT LAST_DAY(SYSDATE) FROM dual;

--Q. ���� �� ����(hire_data ����)
select last_name, hire_date,last_DAY(ADD_MONTHS(hire_date,1)) "�Ի� ������ ����"
from employees;

--�ش� ��¥�� �������� ��õ� ���Ͽ� �ش��ϴ� ������ ��¥�� ��ȯ
SELECT hire_date,next_day(hire_date,'��') FROM employees;

--months_between() ��¥�� ��¥ ������ ���� ���� ���ϱ�
SELECT last_name, TRUNC(MONTHS_BETWEEN(sysdate,hire_date),0)�ټӿ���1, ROUND(MONTHS_BETWEEN(sysdate,hire_date),0)�ټӿ���2 FROM employees;

--Q.�Ի��� 6���� �� ù ��° �������� �����̸����� ����ϼ���.
SELECT last_name, hire_date, NEXT_DAY(ADD_MONTHS(hire_date,6),'��')d_day
FROM employees;

--Q.job_id ���� �����հ� ������� �ְ��� �������� ���, �� ��տ����� 5000 �̻��� ��츸 ����
select job_id , sum(salary)�����հ�,avg(salary)�������,max(salary)�ְ���,min(salary)��������
from employees
group by job_id
having avg(salary) >= 5000;

--Q.job_id ���� �����հ� ������� �ְ��� �������� ���, �� ��տ����� 5000 �̻��� ��츸 ������������ ����
select job_id , sum(salary)�����հ�,avg(salary)�������,max(salary)�ְ���,min(salary)��������
from employees
group by job_id
having avg(salary) >= 5000
order by avg(salary) desc;


--Q. last_name�� L�� ���Ե� ������ ������ ���϶�
SELECT LAST_NAME , SALARY
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%L%';

--Q. job_id�� PROG�� ���Ե� ������ �Ի��� ���϶�
SELECT JOB_ID,HIRE_DATE
FROM EMPLOYEES
WHERE JOB_ID LIKE '%PROG%';

--Q. ������ 10000$ �̻��� MANAGER_ID �� 100�� ������ ������ ���
SELECT * 
FROM EMPLOYEES
WHERE SALARY >=10000 AND MANAGER_ID =100;

--Q. DEPARTMENT_ID �� 100���� ���� ��� ������ ������ ���Ͽ���
SELECT DEPARTMENT_ID,SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID <100;

--Q. MANAGER_ID �� 101,103�� ������ JOB_ID�� ���Ͽ���
SELECT MANAGER_ID,JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID =101 OR MANAGER_ID =103;

--join

--Q. �����ȣ�� 110�� ����� �μ���
SELECT employee_id, department_name
FROM employees e,departments d
WHERE e.department_id=d.department_id and employee_id=110;

SELECT employee_id, department_name
FROM employees e
join departments d on e.department_id=d.department_id
WHERE employee_id=110;

--Q.����� 120���� ����� ���, �̸�, ����(job_id), ������(job_title)�� ���(�ΰ��� ���)
select employee_id,last_name,e.job_id,job_title 
from employees e 
join jobs j on e.job_id=j.job_id
where employee_id=120;

select employee_id,last_name,e.job_id,job_title from employees e,jobs j 
where employee_id=120 and e.job_id=j.job_id;

--���, �̸�, department_name, job_title(employees, departments, jobs)
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM jobs;

SELECT e.employee_id, e.first_name, e.last_name, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.job_id=j.job_id AND e.department_id=d.department_id;

SELECT e.employee_id ���, e.last_name �̸�, d.department_name ���, j.job_title ������
FROM employees e
join departments d
on e.department_id = d.department_id
join jobs j
on e.job_id = j.job_id;

--self join �ϳ��� ���̺��� �� ���� ���̺��� ��ó�� ����
SELECT e.employee_id ���, e.last_name �̸�, m.last_name, m.manager_id 
FROM employees e, employees m
WHERE e.employee_id = m.manager_id;

--outer join: ���� ���ǿ� �������� ���ϴ��� �ش� ���� ��Ÿ���� ���� �� ���
SELECT e.employee_id ���, e.last_name �̸�, m.last_name, m.manager_id
FROM employees e, employees m
WHERE e.employee_id=m.manager_id(+);

--UNION(�� ����� ��ġ�鼭 �ߺ� �� ����)
SELECT first_name �̸�, salary �޿� FROM employees
WHERE salary < 5000
UNION
SELECT first_name �̸�, salary �޿� FROM employees
WHERE hire_date < '99/01/01';

select * from employees;
--UNINON ALL(�� ����� ��ġ�鼭 �ߺ� ����)
SELECT first_name �̸�, salary �޿� FROM employees
WHERE salary < 5000
UNION ALL
SELECT first_name �̸�, salary �޿� FROM employees
WHERE hire_date < '99/01/01';

--INTERSECT(������)
SELECT first_name �̸�, salary �޿� FROM employees
WHERE salary < 5000
INTERSECT
SELECT first_name �̸�, salary �޿� FROM employees
WHERE hire_date < '07/01/01';

--MINUS(������)
SELECT first_name �̸�, salary �޿� FROM employees
WHERE salary < 5000
MINUS
SELECT first_name �̸�, salary �޿� FROM employees
WHERE hire_date < '07/01/01';

SELECT employee_id, last_name, manager_id 
FROM employees
WHERE last_name='Kumar';

--Q.100�� �μ��� ������ ����� �޿����� �� ���� �޿��� �޴� ����� ���
select e.last_name, e.salary from employees e
where e.salary > ALL(select (salary) from employees where department_id = 100);


--[����] 2005�� ���Ŀ� �Ի��� ������ ���, �̸�, �Ի���, �μ���(department_name), ������(job_title)�� ���
SELECT e.employee_id,e.last_name,hire_date,department_name,job_title
FROM employees e, departments d, jobs j
WHERE e.department_id=d.department_id AND e.job_id=j.job_id and hire_date >= '05/01/01'
ORDER BY hire_date;

--[����]job_title, department_name���� ��� ������ ���� �� ����ϼ���. 
SELECT job_title, department_name, ROUND(AVG(salary)) "��� ����"
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id AND e.job_id=j.job_id
GROUP BY job_title, department_name;

--[����]��պ��� ���� �޿��� �޴� ���� �˻� �� ����ϼ���.
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--[����]last_name�� King�� ������ last_name, hire_date, department_id�� ����ϼ���
SELECT last_name, hire_date, department_id
FROM employees
WHERE LOWER(last_name)='king';

--[����] ���, �̸�, ����, ����ϼ���. ��, ������ �Ʒ� ���ؿ� ����
--salary > 20000 then '��ǥ�̻�'
--salary > 15000 then '�̻�' 
--salary > 10000 then '����' 
--salary > 5000 then '����' 
--salary > 3000 then '�븮'
--������ '���'
SELECT employee_id ���, last_name �̸�,
CASE WHEN salary > 20000 then '��ǥ�̻�'
WHEN salary > 15000 then '�̻�' 
WHEN salary > 10000 then '����' 
WHEN salary > 5000 then '����' 
WHEN salary > 3000 then '�븮'
ELSE '���'
END AS ����
FROM employees;
