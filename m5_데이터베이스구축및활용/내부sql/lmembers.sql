--2014 ~ 2015�� ������ 4�� ȸ�� ���� ������
SELECT COUNT(*) FROM PURPROD;
--�� �Ӽ����� : 19383��(����)
SELECT * FROM CUSTDEMO;
SELECT COUNT(*) FROM custdemo;
SELECT * FROM COMPET;
SELECT * FROM CHANNEL;
SELECT * FROM MEMBERSHIP;
SELECT * FROM PRODCL;
SELECT * FROM PURPROD;

--# ���� �м�(���� �м�)
SELECT YEAR, ROUND(SUM(���űݾ�)/1000000) �ѱ��ž�, ROUND(AVG(���űݾ�)) ��ձ��ž�
FROM PURPROD
GROUP BY YEAR;

--# �� �Ӽ�
--����, ���ɺ�, ��������,�پ��� ���պ� ���� ��ȭ 
--����� �̿�, ����� �̿�, �¶��� ä�ο� ���� ���� Ư�̼�

--# �� �����ൿ ������ ��ȭ
--�پ��� �� ������ ���� ����, ��ǰ ���� ����, ���� ����(�ð�, ��� ��)

--# ���� ȯ�濡 ���� ����(������)

ALTER TABLE PURPROD ADD YEAR NUMBER;
UPDATE PURPROD SET YEAR=substr(��������,1,4);
COMMIT;

SELECT * FROM PURPROD;
COMMIT;
CREATE TABLE PURBYYEAR AS
SELECT ����ȣ, YEAR, SUM(���űݾ�) ���ž�
FROM PURPROD
GROUP BY ����ȣ, YEAR
ORDER BY ����ȣ;

SELECT * FROM PURBYYEAR;




CREATE TABLE pur_amt AS
SELECT ����ȣ cusno, sum(���űݾ�) puramt
FROM PURPROD
GROUP BY ����ȣ 
ORDER BY ����ȣ;