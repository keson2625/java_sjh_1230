
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
select * from student where st_num between 1 and 3 and st_grade =1;
select * from student where st_num in(1,2,3) and st_grade = 1;

# 성이 홍씨인 학생들을 조회하는 쿼리 
select * from student where st_name like "홍%";
select * from student where st_name like concat("홍", "%");
# 이름에 길이 들어가는 학생들을 조회하는 쿼리 
select * from student where st_name like "%길%";
# 성이 홍씨이고 이름이 3글자인 학생들을 조회하는 쿼리 
select * from student where st_name like "홍__";
# 성이 홍씨가 아닌 학생들을 조회하는 쿼리 
select * from student where st_name not like "홍%";