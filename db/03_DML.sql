# insert : 데이터 추가 
# select : 데이터 조회 
# update : 데이터 수정 
# delete : 데이터 삭제 

# 데이터 추가 
# insert into 테이블명 value(값1,...,갑n)
#	- 값들 순서는 속성 순서에 맞게 넣어 주어야 함.
#	- 테이블명 대신 db명, 테이블명으로 해도 됨 
#	- 테이블명만 쓰려면 use db를 선택한 후에 사용
#	- 테이블명만 쓰면 선택된 db에 따라 동작되지 않을 수 있음.
use student;
insert into student value(1, 1, 1, 1, "홍길동");

# insert into 테이블명(속성1, ..., 속성n) value(값1, ..., 값n)
#	- 일부 속성 값을 생략할 때 사용
# 	- 생략할 수 있는 속성들 
#		1. null 허용만 속성들 
#		2. not null이지만 default를 이용하여 기본값을 지정한 속성들
insert into student(st_grade, st_class, st_num, st_name) value(1, 1, 2, "임꺽정");
insert into student(st_num, st_name) value(3, "고길동");

#insert into 테이블명(속성1, ..., 속성n)values(값1, ..., 값n), (값1, ..., 값n), ...;
insert into student(st_num, st_name) values(4, "둘리"),(5, "하니");

# insert into 테이블명(속성1, ..., 속성n) select 값1, ..., 속성a from 테이블명 where 조건 
# 	- 테이블에서 검색된 값을 이용하여 추가할 때 사용
#	- 여기서 값1, 값2, ... 들은 지정된 값이고, 속성a는 검색 결과 값


# 데이터 수정
# update 테이블명 set 속성1 = 값1, ..., 속성n = 값n where 조건 
# 조건에서 같다는 =, 같지 않다는 != 또는 <> 
# null과 같다는 is null, null과 같지 않다는 is not null 
# 1학년 1반 1번 학생의 이름을 홍길동a로 수정하는 쿼리 
update student 
set 
    st_name = '홍길동a'
where
    st_grade = 1 and st_class = 1 and st_num = 1;
    
# 데이터 삭제
# delete from 테이블명 where 조건;
# 1학년 1반 2번 학생의 데이터를 삭제하는 쿼리
delete from student student
where
	st_grade = 1 and st_class = 1 and st_num = 2;