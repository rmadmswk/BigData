--Q. ���� ������ �����ϼ���.

--���̺� 2�� ����(���� ���� ����)

--������ ���� 5���� ����

--�Ӽ� Ÿ�� ����, ������ �� ����, �Ӽ� �̸� ����, �������� �߰�, savepoint 2�� ����

--savepoint 1������ rollback�� �����۾� ����

--savepoint 2������ rollback�� �����۾� ����

--�۾������� Ȯ��

--2�� ���̺� Join (inner join, left outer join, right outer join, full outer join)�� ����

--2�� ���̺� ���Ͽ� �� ���Ǻ��� ������� ��ȸ�ϰ� �� ������� ���Ͽ� ������(�ߺ����� �� ������), ������, �������� ����ϼ���. 


--[����] HR EMPLOYEES ���̺��� escape �ɼ��� ����Ͽ� �Ʒ��� ���� ��µǴ� SQL���� �ۼ��ϼ���. 
--job_id Į������  _�� ���ϵ�ī�尡 �ƴ� ���ڷ� ����Ͽ� '_A'�� �����ϴ�  ��� ���� ���
select job_id from employees
where job_id like '%#_A%' escape '#';

--[����] employees ���̺��� �̸��� FIRST_NAME�� LAST_NAME�� �ٿ��� 'NAME' �÷������� ����ϼ���.
--��) Steven King 
SELECT CONCAT(CONCAT(first_name,' '),last_name) name FROM employees;
SELECT first_name||' '||last_name name FROM employees;

--[����] Seo��� ����� �μ����� ����ϼ���.
select last_name, department_name from employees e
join departments d on d.department_id=e.department_id
where last_name = 'Seo';
SELECT department_name FROM departments
WHERE department_id=(SELECT department_id FROM employees WHERE last_name='Seo');

--[����] HR ���̺���� �м��ؼ� ��ü ��Ȳ�� ������ �� �ִ� ��� ���̺� 3���� �ۼ��ϼ���.
--��)�μ��� salary ����

