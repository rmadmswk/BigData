--[���̺� ���� ��Ģ]

--���̺���� ��ü�� �ǹ��� �� �ִ� ������ �̸��� ����Ѵ�. ������ �ܼ����� �ǰ��Ѵ�.--
--���̺���� �ٸ� ���̺��� �̸��� �ߺ����� �ʾƾ� �Ѵ�.--
--�� ���̺� �������� Į������ �ߺ��ǰ� ������ �� ����. --
--���̺� �̸��� �����ϰ� �� Į������ ��ȣ "( )" �� ���� �����Ѵ�.--
--�� Į������ �޸�" ", �� ���еǰ�, �׻� ���� �����ݷ� ";"���� ������.--
--Į���� ���ؼ��� �ٸ� ���̺���� ����Ͽ� �����ͺ��̽� �������� �ϰ��� �ְ� ����ϴ� ���� ����. (������ ǥ��ȭ ����)--
--Į�� �ڿ� ������ ������ �� �����Ǿ�� �Ѵ�.--
--���̺��� Į������ �ݵ�� ���ڷ� �����ؾ� �ϰ�, �������� ���̿� ���� �Ѱ谡 �ִ�.--
--�������� ������ ������ �����(Reserved word)�� �� �� ����.--
--A-Z, a-z, 0-9, _, $, # ���ڸ� ���ȴ�.

select * from tabs;
CREATE TABLE MEMBER
(
ID       VARCHAR2(50),
PWD      VARCHAR2(50),
NAME     VARCHAR2(50),
GENDER   VARCHAR2(50),
AGE      NUMBER,
BIRTHDAY VARCHAR2(50),
PHONE    VARCHAR2(50),
REGDATE  DATE
);

DROP TABLE MEMBER;

CREATE TABLE MEMBER
(
ID       VARCHAR2(20),
PWD      VARCHAR2(20),
NAME     VARCHAR2(20),
GENDER   NCHAR(2),
AGE      NUMBER(3),
BIRTHDAY VARCHAR2(10),
PHONE    VARCHAR2(13),
REGDATE  DATE
);
--�Ϻ� �Ӽ��� �Է�
INSERT INTO MEMBER(ID, PWD, NAME)VALUES('200901','111','KEVIN'); 
SELECT * FROM MEMBER;
--��ü ��� �Է�
INSERT INTO MEMBER VALUES('200902','112','JAMES','M',29,'01-JAN-99','010-1234-2345','1994/05/02');

SELECT * FROM MEMBER;

ALTER TABLE MEMBER ADD TEXT NCLOB;

INSERT INTO MEMBER(ID, PWD,TEXT) VALUES('200903','112','��ġ�� ������ ���� �����Ѵ�');

--���� ���̺��� �̿��Ͽ� ���ο� ���̺��� ����
CREATE TABLE MEMBER1 AS SELECT * FROM MEMBER;
SELECT * FROM MEMBER1;
DESC member1;
CREATE TABLE member2 AS SELECT * FROM member1 WHERE 1=0;
DESC member2;

--���̺��� ��� row ����
TRUNCATE TABLE member1;

--���̺� �Ӽ� �� Ÿ�� ��ȸ
DESC MEMBER;
--���̺� ����Ʈ ��ȸ
SELECT * FROM TABS;

--ALTER
DESC MEMBER1;
--����
ALTER TABLE MEMBER1 MODIFY(ID VARCHAR2(50), NAME NVARCHAR2(50));
--����
ALTER TABLE MEMBER1 RENAME COLUMN BIRTHDAY TO BD;
--����
ALTER TABLE MEMBER1 DROP COLUMN AGE;
--�߰�
ALTER TABLE MEMBER1 ADD AGE NUMBER;

ALTER TABLE MEMBER1 ADD CONSTRAINT MEMBER1_PK PRIMARY KEY (ID);

--[����] MEMBER2 ���̺��� ������ �� ����, ����, ����, �߰� �۾��� �����ϼ���.(�л� �̷� table, �Ӽ��� 5�� �̻�)

--Ʈ�����
--SAVEPOINT �̸� : ��������� Ʈ������� Ư�� �̸����� �����ϴ� ���
--ROLLBACK TO �̸� : ������� ���� �����͸� ��� ����ϰ� Ʈ������� ����
--COMMIT : ������� ���� ��� �����ͺ��̽��� �����ϰ� ������ Ʈ������� ����

SELECT * FROM member1;
TRUNCATE TABLE member1;
COMMIT;

INSERT INTO member1 (ID, PWD, NAME) VALUES('200901','111','KEVIN');
SAVEPOINT SV1;
INSERT INTO member1 (ID, PWD, NAME, AGE) VALUES('200902','112','JAMES',25);
UPDATE member1 SET PWD='121' WHERE NAME='KEVIN';
UPDATE member1 SET PWD='122', AGE='20' WHERE ID='200902';
SAVEPOINT SV2;
INSERT INTO member1 (ID, PWD, NAME, AGE) VALUES('200903','113','SUSAN',35);
--ROLLBACK TO SV1;
UPDATE member1 SET PWD='131' WHERE NAME='KEVIN';
ROLLBACK TO SV2;
DELETE member1 WHERE ID = '200901';
DELETE member1 WHERE ID = '200902';
COMMIT;


