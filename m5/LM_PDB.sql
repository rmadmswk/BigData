select * from TB;
select count(*) from TB;
select * from MEMBER;
select * from channel;
select count(*) from MEMBER;

select 멤버십명
from member
where 멤버십명 = '하이마트';


select * from MEMBER;
select count(*) from MEMBER;
select count(*) from member where 멤버십명 = '하이마트';
select count(*) from member where 멤버십명 = '다둥이';
select count(*) from member where 멤버십명 = '롭스';
select count(*) from member where 멤버십명 = '더영';
-- 14년도 가입자 수
select count(*) from member where 가입년월 = 201401; -- 188
select count(*) from member where 가입년월 = 201402; -- 205
select count(*) from member where 가입년월 = 201403; -- 468
select count(*) from member where 가입년월 = 201404; -- 201
select count(*) from member where 가입년월 = 201405; -- 205
select count(*) from member where 가입년월 = 201406; -- 263
select count(*) from member where 가입년월 = 201407; -- 252
select count(*) from member where 가입년월 = 201408; -- 147
select count(*) from member where 가입년월 = 201409; -- 210
select count(*) from member where 가입년월 = 201410; -- 160
select count(*) from member where 가입년월 = 201411; -- 179
select count(*) from member where 가입년월 = 201412; -- 250
-- 13년도 가입자 수
select count(*) from member where 가입년월 = 201301; -- 3
select count(*) from member where 가입년월 = 201302; -- 23
select count(*) from member where 가입년월 = 201303; -- 547
select count(*) from member where 가입년월 = 201304; -- 127
select count(*) from member where 가입년월 = 201305; -- 98
select count(*) from member where 가입년월 = 201306; -- 208
select count(*) from member where 가입년월 = 201307; -- 264
select count(*) from member where 가입년월 = 201308; -- 140
select count(*) from member where 가입년월 = 201309; -- 131
select count(*) from member where 가입년월 = 201310; -- 149
select count(*) from member where 가입년월 = 201311; -- 238
select count(*) from member where 가입년월 = 201312; -- 239
-- 15년도 가입자 수
select count(*) from member where 가입년월 = 201501; -- 150 
select count(*) from member where 가입년월 = 201502; -- 216
select count(*) from member where 가입년월 = 201503; -- 262
select count(*) from member where 가입년월 = 201504; -- 192
select count(*) from member where 가입년월 = 201505; -- 207
select count(*) from member where 가입년월 = 201506; -- 256
select count(*) from member where 가입년월 = 201507; -- 260
select count(*) from member where 가입년월 = 201508; -- 227
select count(*) from member where 가입년월 = 201509; -- 190
select count(*) from member where 가입년월 = 201510; -- 181
select count(*) from member where 가입년월 = 201511; -- 201
select count(*) from member where 가입년월 = 201512; -- 213
-- 12년도 가입자 수
select count(*) from member where 가입년월 = 201212; -- 1
select count(*) from member where 가입년월 = 201211; -- 1
select count(*) from member where 가입년월 = 201210; -- 4
select count(*) from member where 가입년월 = 201209; -- 0
select count(*) from member where 가입년월 = 201208; -- 0
select count(*) from member where 가입년월 = 201207; -- 0

select count(*) from member where 가입년월 = 201401 and 멤버십명 = '하이마트' or 가입년월 = 201402 and 멤버십명 = '하이마트';

-- 멤버십명이 하이마트이고 가입년월이 201401인 가입자 수를 구하세요
-- 멤버십명이 하이마트이고 가입년이 2014년도인 각월의 가입자 수를 구하세요

-- 13,14,15년도 하이마트에 가입한 가입자 수
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 like '%2013%'; -- 1007
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 like '%2014%'; -- 1599
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 like '%2015%'; -- 1812

-- 13,14,15년도 다둥이 가입한 가입자 수
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 like '%2013%'; -- 1083
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 like '%2014%'; -- 616
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 like '%2015%'; -- 310

-- 13,14,15년도 롭스 가입한 가입자 수
select count(*) from member where 멤버십명 = '롭스' and 가입년월 like '%2013%'; -- 52
select count(*) from member where 멤버십명 = '롭스' and 가입년월 like '%2014%'; -- 184
select count(*) from member where 멤버십명 = '롭스' and 가입년월 like '%2015%'; -- 151

-- 12,13,14,15년도 더영 가입한 가입자 수
select count(*) from member where 멤버십명 = '더영' and 가입년월 like '%2012%'; -- 6
select count(*) from member where 멤버십명 = '더영' and 가입년월 like '%2013%'; -- 25
select count(*) from member where 멤버십명 = '더영' and 가입년월 like '%2014%'; -- 329
select count(*) from member where 멤버십명 = '더영' and 가입년월 like '%2015%'; -- 282



-- 하이마트의 13~15년도 각년도의 각월에 따른 가입자수
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201301; -- 0
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201302; -- 0
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201303; -- 0
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201304; -- 0
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201305; -- 0
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201306; -- 140
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201307; -- 197
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201308; -- 101
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201309; -- 92
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201310; -- 102
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201311; -- 203
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201312; -- 172

select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201401; -- 149
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201402; -- 139
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201403; -- 163
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201404; -- 141
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201405; -- 165
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201406; -- 129
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201407; -- 149
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201408; -- 100
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201409; -- 110
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201410; -- 108
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201411; -- 131
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201412; -- 115

select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201501; -- 110
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201502; -- 132
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201503; -- 132
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201504; -- 105
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201505; -- 138
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201506; -- 178
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201507; -- 204
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201508; -- 169
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201509; -- 142
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201510; -- 149
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201511; -- 167
select count(*) from member where 멤버십명 = '하이마트' and 가입년월 = 201512; -- 186


-- 다둥이 13~15년도 각년도의 각월에 따른 가입자수
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201301; -- 0
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201302; -- 22
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201303; -- 546
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201304; -- 124
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201305; -- 92
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201306; -- 61
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201307; -- 54
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201308; -- 31
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201309; -- 33
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201310; -- 41
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201311; -- 30
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201312; -- 49

select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201401; -- 28
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201402; -- 57
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201403; -- 293
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201404; -- 19
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201405; -- 23
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201406; -- 23
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201407; -- 46
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201408; -- 17
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201409; -- 27
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201410; -- 26
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201411; -- 28
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201412; -- 29

select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201501; -- 20
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201502; -- 66
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201503; -- 89
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201504; -- 31
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201505; -- 21
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201506; -- 15
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201507; -- 14
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201508; -- 18
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201509; -- 5
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201510; -- 7
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201511; -- 15
select count(*) from member where 멤버십명 = '다둥이' and 가입년월 = 201512; -- 9


-- 롭스 13~15년도 각년도의 각월에 따른 가입자수
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201301; -- 0
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201302; -- 0
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201303; -- 0
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201304; -- 0
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201305; -- 4
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201306; -- 6
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201307; -- 8
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201308; -- 6
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201309; -- 6
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201310; -- 4
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201311; -- 2
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201312; -- 16

select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201401; -- 10
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201402; -- 9
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201403; -- 11
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201404; -- 14
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201405; -- 15
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201406; -- 24
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201407; -- 11
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201408; -- 10
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201409; -- 21
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201410; -- 13
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201411; -- 17
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201412; -- 29

select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201501; -- 13
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201502; -- 9
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201503; -- 15
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201504; -- 11
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201505; -- 13
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201506; -- 28
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201507; -- 17
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201508; -- 18
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201509; -- 8
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201510; -- 7
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201511; -- 5
select count(*) from member where 멤버십명 = '롭스' and 가입년월 = 201512; -- 7


-- 더영 13~15년도 각년도의 각월에 따른 가입자수
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201301; -- 3
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201302; -- 1
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201303; -- 1
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201304; -- 3
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201305; -- 2
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201306; -- 1
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201307; -- 5
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201308; -- 2
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201309; -- 0
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201310; -- 2
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201311; -- 3
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201312; -- 2

select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201401; -- 1
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201402; -- 0
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201403; -- 1
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201404; -- 27
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201405; -- 2
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201406; -- 87
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201407; -- 46
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201408; -- 20
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201409; -- 52
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201410; -- 13
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201411; -- 3
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201412; -- 77

select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201501; -- 7
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201502; -- 9
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201503; -- 26
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201504; -- 45
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201505; -- 35
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201506; -- 35
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201507; -- 25
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201508; -- 22
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201509; -- 35
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201510; -- 18
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201511; -- 14
select count(*) from member where 멤버십명 = '더영' and 가입년월 = 201512; -- 11


-- 12~15년도까지 멤버십에 가입한 가입자 수
select * from member;
SELECT 멤버십명, count(*) AS 가입년월
from member
group by 멤버십명;

-- 13년도에 각 멤버십에 가입한 가입자 수
SELECT 멤버십명, count(*) AS 가입년월
from member
where 가입년월 like '%2013%'
group by 멤버십명;

-- 13년도에 각 멤버십에 가입한 가입자 수
SELECT 멤버십명, count(*) AS 가입년월
from member
where 가입년월 like '%2014%'
group by 멤버십명;

-- 13년도에 각 멤버십에 가입한 가입자 수
SELECT 멤버십명, count(*) AS 가입년월
from member
where 가입년월 like '%2015%'
group by 멤버십명;

-- 12년도에는 더영만 가입자가 있음
select count(*) from member where 멤버십명 = '더영' and 가입년월 like '%2012%'; -- 6

select * from member ;

-- 고객번호 확인
-- 2013년~2015년도에 에 하이마트에 가입한 고객번호의 개수
SELECT 고객번호, count(*) as 개수
from member
where 멤버십명 like '하이마트' and 가입년월 like '%2013%'
group by 고객번호;

SELECT 고객번호, count(*) as 개수
from member
where 멤버십명 like '하이마트' and 가입년월 like '%2014%'
group by 고객번호;

SELECT 고객번호, count(*) as 개수
from member
where 멤버십명 like '하이마트' and 가입년월 like '%2015%'
group by 고객번호;
-- 사실 의미는 없음 이미 위에서 구했기 떄문에


-- 그래서 확인해본게 타사에 같은 고객번호를 쓰는 사람이 있는지 확인
-- 2013년도에 4개 회사에 같은 고객번호를 쓰는 사람은 없음
SELECT 고객번호, count(*) as 숫자
from member
where 멤버십명 like '하이마트' and 멤버십명 like '다둥이' and 멤버십명 like '더영' and 멤버십명 like '롭스' and 가입년월 like '%2013%' 
group by 고객번호;


SELECT 고객번호, count(*) as 숫자
from member
where 멤버십명 like '하이마트' and 멤버십명 like '다둥이' and 멤버십명 like '더영' and 멤버십명 like '롭스' and 가입년월 like '%2014%' 
group by 고객번호;


SELECT 고객번호, count(*) as 숫자
from member
where 멤버십명 like '하이마트' and 멤버십명 like '다둥이' and 멤버십명 like '더영' and 멤버십명 like '롭스' and 가입년월 like '%2015%' 
group by 고객번호;
-- 모두 확인한 결과, 각 회사에 고객번호가 같은 경우는 년도가 다른경우임.
-- 결론 = 고객번호는 년도와 회사에 따라 보통은 다르게 사용한다. 같은 2개 이상의 회사가 같은 고객번호인 경우는 가입년월에서 년도가 다른경우이다.

select * from channel;
select count(*) from channel; -- 8824

-- 어떤 제휴사 사용했나
SELECT 제휴사, count(*) AS 숫자
from channel
group by 제휴사;

-- 고객번호,제휴사,이용회숫

-- A모바일앱을 이용한 고객들의 고객번호와 이용횟수를 출력
-- A모바일 앱 이용회수
select * from channel where 제휴사 = 'A_MOBILE/APP';
-- B모바일 앱을 10번 미만 사용한 사람 수
select count(*) from channel where 제휴사 = 'A_MOBILE/APP' and 이용횟수 < 10; -- 1063 , 가끔 한번씩 사용
-- B모바일 앱을 10번 이상 30번 미만으로 사용한 사람 수
select count(*) from channel where 제휴사 = 'A_MOBILE/APP' and 이용횟수 >= 10 and 이용횟수 < 30; -- 270, 중간
-- B모바일 앱을 30번 이상 50번 미만으로 사용한 사람 수
select count(*) from channel where 제휴사 = 'A_MOBILE/APP' and 이용횟수 >= 30 and 이용횟수 < 50; -- 61 준 흑우
-- B모바일 앱을 50번 이상 사용한 사람 수
select count(*) from channel where 제휴사 = 'A_MOBILE/APP' and 이용횟수 >= 50; -- 41 vip, 흑우

-- B모바일 앱 이용회수
select * from channel where 제휴사 = 'B_MOBILE/APP';
-- B모바일 앱을 10번 미만 사용한 사람 수
select count(*) from channel where 제휴사 = 'B_MOBILE/APP' and 이용횟수 < 10; -- 2164 , 가끔 한번씩 사용
-- B모바일 앱을 10번 이상 30번 미만으로 사용한 사람 수
select count(*) from channel where 제휴사 = 'B_MOBILE/APP' and 이용횟수 >= 10 and 이용횟수 < 30; -- 1889, 중간
-- B모바일 앱을 30번 이상 50번 미만으로 사용한 사람 수
select count(*) from channel where 제휴사 = 'B_MOBILE/APP' and 이용횟수 >= 30 and 이용횟수 < 50; -- 819 준 흑우
-- B모바일 앱을 50번 이상 사용한 사람 수
select count(*) from channel where 제휴사 = 'B_MOBILE/APP' and 이용횟수 >= 50; -- 298 vip, 흑우

-- C모바일 앱 이용회수
select * from channel where 제휴사 = 'C_MOBILE/APP';
-- B모바일 앱을 10번 미만 사용한 사람 수
select count(*) from channel where 제휴사 = 'C_MOBILE/APP' and 이용횟수 < 10; -- 46 가끔 한번씩 사용


-- D모바일 앱 이용회수
select * from channel where 제휴사 = 'D_MOBILE/APP';
-- B모바일 앱을 10번 미만 사용한 사람 수
select count(*) from channel where 제휴사 = 'D_MOBILE/APP' and 이용횟수 < 10; -- 222
-- B모바일 앱을 10번 이상 30번 미만으로 사용한 사람 수
select count(*) from channel where 제휴사 = 'D_MOBILE/APP' and 이용횟수 >= 10 and 이용횟수 < 30; -- 5


-- B온라인몰 이용회수
select * from channel where 제휴사 = 'B_ONLINEMALL';
-- B모바일 앱을 10번 미만 사용한 사람 수
select count(*) from channel where 제휴사 = 'B_ONLINEMALL' and 이용횟수 < 10; -- 1046 , 가끔 한번씩 사용
-- B모바일 앱을 10번 이상 30번 미만으로 사용한 사람 수
select count(*) from channel where 제휴사 = 'B_ONLINEMALL' and 이용횟수 >= 10 and 이용횟수 < 30; -- 246, 중간
-- B모바일 앱을 30번 이상 50번 미만으로 사용한 사람 수
select count(*) from channel where 제휴사 = 'B_ONLINEMALL' and 이용횟수 >= 30 and 이용횟수 < 50; -- 18 준 흑우
-- B모바일 앱을 50번 이상 사용한 사람 수
select count(*) from channel where 제휴사 = 'B_ONLINEMALL' and 이용횟수 >= 50; -- 18 vip, 흑우

-- C온라인몰 이용회수
select * from channel where 제휴사 = 'C_ONLINEMALL';
-- C온라인몰 을 10번 미만 사용한 사람 수
select count(*) from channel where 제휴사 = 'C_ONLINEMALL' and 이용횟수 < 10; -- 501 , 가끔 한번씩 사용
-- C온라인몰을 10번 이상 30번 미만으로 사용한 사람 수
select count(*) from channel where 제휴사 = 'C_ONLINEMALL' and 이용횟수 >= 10 and 이용횟수 < 30; -- 97, 중간
-- BC온라인몰을 30번 이상 50번 미만으로 사용한 사람 수
select count(*) from channel where 제휴사 = 'C_ONLINEMALL' and 이용횟수 >= 30 and 이용횟수 < 50; -- 15 준 흑우
-- C온라인몰을 50번 이상 사용한 사람 수
select count(*) from channel where 제휴사 = 'C_ONLINEMALL' and 이용횟수 >= 50; -- 5 vip, 흑우5

-- 혼자서 여러 제휴사를 사용한 사람들 횟수 
SELECT 고객번호,
count(고객번호)
from channel
group by 고객번호
having count(고객번호)>1; -- 1769


select * from channel;
-- 정렬해서 보기
select * from channel order by 고객번호;
-- A모바일 앱과 B모바일 앱을 둘다 사용한 고객의 수  
