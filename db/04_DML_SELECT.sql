
# select * from 테이블명;
# 테이블에 있는 모든 속성들의 데이터를 조회하는 쿼리 

select * from student;

# select 속성1, ..., 속성n from 테이블명;
# 테이블에 있는 속성1, ..., 속성n의 데이터를 조회하는 쿼리 
# 학생들의 학년, 반, 번호, 이름을 조회하는 쿼리 
# 속성명 옆에 as 새속성명을 입력하면 결과창에 속성 이름을 변경할 수 있음 
#   - as 생략 가능 
select st_grade as 학년, st_class as "반", st_num 번호, st_name "이름" from student;

# select [distinct] 속성1, ..., 속성n from 테이블명 [where 조건식]
# 조건식을 만족하는 속성들을 조회하는 쿼리. 
# 중복된 행은 제거 => 기본키 속성을 포함하지 않은 경우 중복이 가능 
# 논리 연산자
#   - and, or, not
#   - and의 우선순위가 or보다 높다 
# 비교 연산자
#   - =, !=, <>, <, <=, >= 
#   - 속성 between a and b : a이상 b이하 => 속성 >= a and 속성 <= b
#   - 속성 not between a and b : a미만 또는 b 초과 => 속성 < a or 속성 > b 
#   - 속성 in(값1, ..., 값n) : 속성의 값이 값1, ..., 값n 중에 있을 때 참 => 속성 = 값1 or ... or 속성 = 값n
#   - 속성 not in(값1, ..., 갑n) : 속성의 값이 값1, ..., 값n 중에 없을 때 참 => 속성 != 값1 and ... and 속성 != 값n
#   - like "패턴" : 패턴과 일치하는 값을 조회할 때 사용
#     - _ : 한 글자 
#     - % : 0글자 이상 
#     - ___ : 3글자 
#     - 홍% : 홍으로 시작하는 문자열 
#   - null 확인
#     - is null : null이면 참
#     - is not null : null이 아니면 참

# 등록된 학생들의 학년을 조회하는 쿼리 
select distinct st_grade 학년 from student;

# 1학년 학생들을 조회하는 쿼리
select * from student where st_grade = 1;

# 1학년 1반의 번호가 1 ~ 3인 학생들을 조회하는 쿼리 
select * from student where st_grade =1 and st_num =1 and st_num between 1 and 3;
select * from student where st_grade =1 and st_num =1 and st_num in(1,2,3);

# 성이 홍씨인 학생들을 조회하는 쿼리 
select * from student where st_name like "홍%";
select * from student where st_name like concat("홍", "%");
# 이름에 길이 들어가는 학생들을 조회하는 쿼리 
select * from student where st_name like "%길%";
# 성이 홍씨이고 이름이 3글자인 학생들을 조회하는 쿼리 
select * from student where st_name like "홍__";
# 성이 홍씨가 아닌 학생들을 조회하는 쿼리 
select * from student where st_name not like "홍%";

/*
select[distinct]
	속성1, ..., 속성n
from
	테이블명 
[where
	조건] 
[order by 속성a [asc | desc] [,속성b [asc | desc]]]

asc  : 오름차순, 생략하면 기본 asc
desc : 내림차순
*/

# 3학년, 2학년, 1학년 순으로 조회하고 학년이 같은 경우 1반, 2반 순으로 조회하고,
# 반이 같은 경우 1번, 2번 순으로 조회
select * from student order by st_grade desc, st_class, st_num; #asc 생략

# 3학년 학생들의 이름을 사전순으로 정렬하고, 이름이 같으면 반, 번호순으로 오름차순으로 정렬하는 쿼리
select * from student where st_grade =3 order by st_name, st_class, st_num; 

# 3학년 학생 중 번호가 2에 가까운 학생 순으로 정렬 
select *, abs(st_num - 2)as num from student where st_grade = 3 order by num, st_num;

/*
결과에서 원하는 개수를 가져오는 쿼리
select[distinct]
	속성1, ..., 속성n
from
	테이블명 
[where
	조건] 
[order by 속성a [asc | desc] [,속성b [asc | desc]]]
[limit 번지, 개수] 
- 검색 결과에서 번지부터 개수만큼 가져옴
- 번지는 0번지부터.
- 번지를 생략할 수 있고, 생략하면 0번지
- limit은 보통 마지막에 붙임
*/
select * from student limit 3; 
select * from student limit 0, 3; 
select * from student limit 8, 3; # 8번지부터 3개

# 한 페이지에 학생 3명의 정보를 조회하는 페이지가 있고, 학생 등록순으로 조회를 한다.
# 이 때 3페이지에서 조회 가능한 학생들을 선택하는 쿼리 
select * from student limit 6, 3; # 6은=> 3명*(3페이지-1)

/*
그룹화
select[distinct]
	속성1, ..., 속성n
from
	테이블명 
[where
	조건] 
[group by 속성1 [, 속성2, ...]]
[having 조건]
[order by 속성a [asc | desc] [,속성b [asc | desc]]]
[limit 번지, 개수] 
- 결과들을 그룹으로 묶어서 처리할 때 사용
	- 1학년 1반 학생수는?
	- 각학년별 각반의 학생은?
    - 각학년의 학생수는? 
-보통 집게함수와 함께 사용
- group by 묶는 기준 
	-학년, 반을 기준으로 묶음 
    -학년, 반을 기준으로 묵음
    -학년을 기준으로 묶음
- having절은 집게함수에 조건을 걸때 사용

집게함수
- count(속성) : 결과의 개수를 샘 => 결과가 몆행인지를 반환
- sum(속성) : 속성의 합
- avg(속성) : 속성의 평균
- min(속성) : 속성의 최소값
- max(속성) : 속성의 최대값
*/

# 1학년 반의 학생수를 조회 
select count(*)as "1학년 1반 학생 수" from student.student where st_grade=1 and st_class=1;

# 각학년 각반의 학생수를 조회
select st_grade, st_class, count(st_key) as "학생수" from student.student group by st_grade, st_class;

# 각학년별 학생수를 조회
select st_grade, count(*) as "학생수" from student.student group by st_grade;

# 학생수가 5명 이상인 학년을 조회
select st_grade, count(*) as `학생 수` from student.student group by st_grade having `학생 수` >= 5;

# group by가 있는 쿼리에서 조건이 필요하면 무조건 having절에 써야 한다 : x 
# 조건에 집계함수가 없으면 where절, 있으면 having절

/*
join
- 여러 테이블을 묶어서 하나의 결과 테이블을 만들 때 사용 
inner join 
- 두 테이블의 교집함 
- 성적이 등록된 학생들의 과목 성적을 조회 
	=> 성적이 등록되지 않은 학생들은 조회 x
    => 성적이 등록되지 않은 과목들은 조회 x 
outer join  
- 두 테이블의 합집합
- 모든 과목의 성적들을 조회
	=> 성적이 등록되지 않은 과목들은 조회 o
    => 성적이 등록되지 않은 학생들은 조회 x 
- 모든 학생들의 성적들을 조회
	=> 성적이 등록되지 않은 과목들은 조회 x
    => 성적이 등록되지 않은 학생들은 조회 o 
self join
- 하나의 테이블로 join
*/

/*
- 테이블a과 테이블b에 참조되고 있으면 테이블b에는 외래키, 테이블a에는 기본키로 연결되어 있음
	=> 학생테이블이 성적테이블에 참조되고 있으면 성적테이블의 외래키로 sc_st_key, 학생 테이블 st_key로 연결이 되어 있음
inner join

select 테이블a.속성1, 테이블a.속성2..., 테이블b.속성1, 테이블b.속성2
from
	테이블a 
join
	테이블b on 케이블a.기본기 = 테이블b.외래키
    -속성명이 겹치지 않으면 테이블명을 쓰지 않아도 됨
*/
# 등록된 모든 학생들의 성적을 조회하는 쿼리 
select 
	st_grade 학년, st_class 반, st_num 번호, st_name 이름,
	sj_grade 학년, sj_semester 학기, sj_name 과목명, sc_score 성적 
from score 
join student on st_key = sc_st_key
join subject on sc_sj_num = sj_num;

# 뷰를 이용한 쿼리 재사용 
# 뷰는 미리 정의된 쿼리를 이용해서 마치 일반 테이블처럼 사용하는 가상의 테이블  
# 뷰의 장점 1.재사용, 2.가독성, 3.쿼리 단순화, 4.보안강화 => 특정 컬럼이나 데이터만 보여줄 수 있음
/*
create view 뷰명 as select 쿼리문
*/
drop view student_score;
create view student_score as
select 
	st_grade 학년, st_class 반, st_num 번호, st_name 이름,
	sj_grade 과목학년, sj_semester 학기, sj_name 과목명, sc_score 성적,
    st_key 학생번호
    
from score 
join student on st_key = sc_st_key
join subject on sc_sj_num = sj_num;

# 1학년 1학기 국어 성적을 조회하는 쿼리
select * from student_score 
where 학년= 1 and 과목학년= 1 and 학기= 1 and 과목명= "국어";

# 1학년 1학기 국어 성적의 평균을 조회하는 쿼리
select 학년, 과목학년, 학기, 과목명, avg(성적)평균 from student_score
where 학년= 1 and 과목학년= 1 and 학기= 1 and 과목명= "국어";

# 2학년의 과목학녀 1학년 2학기 때의 국어 성적의 평균을 각 반별로 조회하는 쿼리
select 학년, 반, 과목학년, 학기, 과목명, avg(성적)평균 from student_score
where 학년= 2 and 과목학년= 1 and 학기= 2 and 과목명= "국어"
group by 반;

# 각 학생별 평균(학년, 학기별)을 조회하는 쿼리
select 학년, 반, 번호, 이름, 과목학년, 학기, avg(성적)평균 from student_score
group by 학생번호, 과목학년, 학기;

# 각 학생의 학년별 평균을 조회하는 쿼리 
select 학년, 반, 번호, 이름, 과목학년, avg(성적)평균 from student_score
group by 학생번호, 과목학년;

# 각 학생의 1학년 평균이 가장 높은 학생을 조회하는 쿼리
select 학년, 반, 번호, 이름, 과목학년, avg(성적)평균 from student_score
where 과목학년 = 1 
group by 학생번호, 과목학년
order by 평균 desc
limit 1;

/*
select 속성, ...
from 테이블a 
left | right join 테이블b on 테이블a.속성1 = 테이블b.속성2
	-outer 조언은 순서가 중요 
    -왼쪽 테이블을 기준으로 연결 
*/
# 모든 과목의 평균을 조회하는 쿼리 
select subject.*, ifnull(avg(sc_score),0)평균  
from subject 
left join score on sj_num = sc_sj_num
group by sj_num;

# 모든 학생의 학생평균을 조회하는 쿼리. 성적이 없는 경우는 0이 나오도록.
select student.*, ifnull(avg(sc_score),0)평균 
from student
left join score on sc_st_key = st_key
group by st_key;

# 등록된 학생수를 조회하는 쿼리
select count(*)as "전체 학생 수" from student;

# 크로스 조인 : 모든경우의 수를 조합하여 합치는 조언
select * from student join subject;

# join using : 테이블 b의 외래키와 테이블 a의 외래키가 같은 경우(속성이름이)
/*
select * from 테이블a join 테이블b on 테이블b.속성1 = 테이블a.속성1;
select * from 테이블a join 테이블b using(속성1);
*/

# 서브 쿼리 : 쿼리안에 쿼리가 들어가 있는 형태
# 장점
# 1. 쿼리의 구조화
# 2. join보다 가독성이 좋음 
# 3. 속도를 향상시킬 수 있음 
#	=> ex)홍길동이라는 사람이 OO학원에 다니는 아들을 찾으러 왔음
# 	일반 join : 모든 강의장에 있는 학생들 중에 성이 홍씨인 남자를 찾고, 그중에 아들을 찾음 
#	서브쿼리 : 각 강의장에서 성이 홍씨고 남자인 학생을 찾고, 그중에서 아들을 찾음
# 서브쿼리 적용 위치
# 1. select문에서 속성 위치 
# 2. select문에서 from 다음에 나오는 테이블명 위치 
# 3. select문에서 where절에 특정 값 위치
# 4. select문에서 having절에서 특정 값 위치
# 5. insert select
# 6. update문에서 수정할 값 위치

# 내장함수 - 조건
# if(식, 식1, 식2) : 식이 참이면 식1을, 거짓을 식2로 반환
# ifnull(식1, 식2) : 식1이 null이면 식2를, 아니면 식1을 반환
# nullif(식1, 식2) : 식1과 식2가 같으면 null, 다르면 식1을 반환
# case 속성 when 값 then 결과 else 결과 end
# case 속성 
# 	when 값 hen 결과
# 	else 값
# end 
 
# 성적이 60점이상이면 통과, 미만이면 실패라고 출력하는 쿼리
select *, if(sc_score >=60, "O", "X")as 통과 from score;

# 성적이 60점이상이면 통과, 미만이면 실패라고 출력하는 쿼리
select *, case when sc_score >= 60 
then "O" else "X" end as통과 from score;

# 성적이 90점이상이면 A, 80점이상이면 B, 70점이상이면 C, 60점이상이면 D, 60점미만이면 F로출력
select *, 
	if(sc_score >=90, "A", 
	if(sc_score >=80, "B", 
	if(sc_score >=70, "c",
	if(sc_score >=60, "D", "f"))))as 학점 from score;

select *, 
case 
	when sc_score >= 90 then "A" 
    when sc_score >= 80 then "B" 
    when sc_score >= 70 then "C" 
    when sc_score >= 60 then "D"
    else "f"
	end as 학점
from score;

# 성적이 최고성적과 같으면 null, 다르면 성적을 출력하는 쿼리
select *, 
nullif(sc_score, (select max(sc_score) from score)) as 결과 from score;

# 내장함수 - 문자열 
# char_length(문자열) : 문자열 개수 
select char_length("안녕하세요") as char_length;
# length(문자열) : 바이트 수 
select length("안녕하세요") as length;
# concat(문자열1, ...) : 문자열을 이어 붙임 
select concat("안녕", "하", "세요?") as concat;
# field(찾을문자열, 문자열1, ....) : 찾을 문자열의 위치를 찾아 반환 . 위치는 1부터 시작
select field("안녕", "안녕하", "누구 안녕?", "안녕") as field;
# instr(기준문자열, 부분문자열) : 기준 문자열에서 부분 문자열의 위치를 찾아 반환. 위치는 1부터 시작
select instr("hello java", "java") as instr;
# locate(부분문자열, 기준문자열) : 기준 문자열에서 부분 문자열의 위치를 찾아 반환 . 위치는 1부터 시작
select locate("java", "hello java") as locate;
# format(숫자, 소수점자리) : 숫자를 소수점이하 자리까지 표현. 1000단위마다 ,를 추가 
select format(10000.123456, 0) as format;
# bin(숫자), oct(숫자), hex(숫자) : 2,8,16진수로 변환 
select bin(255) as bin,oct(255) as oct,hex(255) as hex ;
# insert(기준문자열, 위치, 길이, 삽입할문자열) : 기준문자열의 위치부터 길이만큼 지우고 삽입할 문자열을 끼워서 반환
select insert("hello java", 7, 4, "c++") as `insert`;
# left(문자열, 길이), right(문자열, 길이) : 왼쪽/오른족에서 문자열의 길이만큼 반환 
select left("test.txt", 4) as `left`, right("test.txt", 3) as `right`;
# lower(문자열), upper(문자열) : 소문자로/대문자로 
select lower("hello java") as `lower`, upper("HELLO JAVA") as `upper`;
# lpad(문자열, 길이, 채울문자열)/rpad(문자열,길이,채울문자열) : 문자열을 길이만큼 늘리고 빈곳을 채울문자열로 채움 
select lpad(1, 3, "0") as lpad, rpad(1, 3, "0") as rpad;
# repeat(문자열, 횟수) : 문자열을 횟수만큼 반복 
select repeat(1, 3) `repeat`;
# replace(문자열, 문자열a, 문자열b) : 문자열에서 문자열a를 문자열b로 바꿈 
select replace("hello java", "java", "c++") as `replace`;
# reverse(문자열) : 문자열 순서를 역순으로 반환 
select reverse("abcdef") as `reverse`;
# substring(문자열, 시작위치, 길이) 문자열에서 시작위치부터 길이만큼 부분문자열을 반환 
select substring("hello java", 7, 4) as substring;