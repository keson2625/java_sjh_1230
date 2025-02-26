# insert : 데이터 추가
# select : 데이터 조회
# update : 데이터 수정
# delete : 데이터 삭제

# 데이터 추가
# insert into 테이블명 value(값1, ..., 값n) 
#   - 값들 순서는 속성 순서에 맞게 넣어 주어야 함.  
#   - 테이블명 대신 db명.테이블명으로 해도 됨
#   - db명.테이블명으로 쓰면 선택된 db와 상관없이 실행.
#   - 테이블명만 쓰면 선택된 db에 따라 동작되지 않을 수 있음. 
use student;
insert into student value(1, 1, 1, 1, "홍길동");

# insert into 테이블명(속성1, ..., 속성n) value(값1, ..., 값n)
#   - 일부 속성 값을 생략할 때 사용
#   - 생략할 수 있는 속성들
#     1. null 허용인 속성들 
#     2. not null이지만 default를 이용하여 기본값을 지정한 속성들 
insert into student(st_grade, st_class, st_num, st_name) value(1, 1, 2, "임꺽정");
insert into student(st_num, st_name) value(3, "고길동");

# insert into 테이블명(속성1, ..., 속성n) values(값1, ..., 값n), (값1, ..., 값n), ...; 
insert into student(st_num, st_name) values(4, "둘리"), (5, "하니");

# insert into 테이블명(속성1, ..., 속성n) select 값1, 값2, ..., 속성a from 테이블명 where 조건
#   - 테이블에서 검색된 값을 이용하여 추가할 때 사용 
#   - 여기서 값1, 값2.. 들은 지정된 값이고, 속성a는 검색 결과 값 


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
delete from student 
where
    st_grade = 1 and st_class = 1 and st_num = 2;

# 학생들 샘플 데이터 추가 
insert into student(st_grade, st_class, st_num, st_name) values
(2, 1, 1, "김길동"), (2, 1, 2, "가길동"),(2, 1, 3, "나길동"),
(2, 2, 1, "이길동"), (2, 2, 2, "박길동"),(2, 2, 3, "하길동"),
(2, 3, 1, "하니"), (2, 3, 2, "가니"),(2, 3, 3, "김둘리"),

(3, 1, 1, "김길동"), (3, 1, 2, "가길동"),(3, 1, 3, "나길동"),
(3, 2, 1, "이길동"), (3, 2, 2, "박길동"),(3, 2, 3, "하길동"),
(3, 3, 1, "하니"), (3, 3, 2, "가니"),(3, 3, 3, "김둘리");

# 과목 샘플 데이터를 추가 
insert into student.subject(sj_grade, sj_semester, sj_name) values
(1, 1, "국어"), (1, 1, "영어"), (1, 1, "수학"), 
(1, 2, "국어"), (1, 2, "영어"), (1, 2, "수학"), 
(2, 1, "국어"), (2, 1, "영어"), (2, 1, "수학"), 
(2, 2, "국어"), (2, 2, "영어"), (2, 2, "수학"), 
(3, 1, "국어"), (3, 1, "영어"), (3, 1, "수학"), 
(3, 2, "국어"), (3, 2, "영어"), (3, 2, "수학");

# 성적 샘플 데이터를 추가 
insert into student.score(sc_st_key, sc_sj_num, sc_score) values
(1, 1, 100), (1, 2, 100), (1, 3, 100), # 1학년 1반 1번 학생 1학년 1학기 국영수 성적
(3, 1, 90), (3, 2, 80), (3, 3, 70), # 1학년 1반 3번 학생 1학년 1학기 국영수 성적
(4, 1, 90), (4, 2, 10), (4, 3, 100), # 1학년 1반 4번 학생 1학년 1학기 국영수 성적
(5, 1, 90), (5, 2, 100), (5, 3, 10), # 1학년 1반 5번 학생 1학년 1학기 국영수 성적
(6, 4, 100), (6, 5, 0), (6, 6, 100), # 2학년 1반 1번 학생 1학년 2학기 국영수 성적;
(7, 4, 50), (7, 5, 30), (7, 6, 80), # 2학년 1반 2번 학생 1학년 2학기 국영수 성적;
(8, 4, 40), (8, 5, 55), (8, 6, 99), # 2학년 1반 3번 학생 1학년 2학기 국영수 성적;
(9, 4, 10), (9, 5, 84), (9, 6, 55), # 2학년 2반 1번 학생 1학년 2학기 국영수 성적;
(10, 4, 75), (10, 5, 66), (10, 6, 74), # 2학년 2반 2번 학생 1학년 2학기 국영수 성적;
(11, 4, 32), (11, 5, 44), (11, 6, 65), # 2학년 2반 3번 학생 1학년 2학기 국영수 성적;
(12, 4, 77), (12, 5, 88), (12, 6, 55), # 2학년 3반 1번 학생 1학년 2학기 국영수 성적;
(13, 4, 88), (13, 5, 12), (13, 6, 12), # 2학년 3반 2번 학생 1학년 2학기 국영수 성적;
(14, 4, 0), (14, 5, 0), (14, 6, 0), # 2학년 3반 3번 학생 2학년 1학기 국영수 성적;
(15, 7, 100), (15, 8, 100), (15, 9, 100); # 3학년 1반 1번 학생 2학년 1학기 국영수 성적;


# 1학년 1반 1번의 1학년 2학기 국어 성적을 100으로 추가할 때 쿼리 
select st_key from student where st_grade = 1 and st_class = 1 and st_num = 1;
select sj_num from subject where sj_grade = 1 and sj_semester = 2 and sj_name = "국어";
select st_key,sj_num
from student 
join subject
where 
	st_grade = 1 and st_class = 1 and st_num = 1
    and sj_grade = 1 and sj_semester = 2 and sj_name = "국어";

select st_key,sj_num
from (select st_key from student where st_grade = 1 and st_class = 1 and st_num = 1) as t1
join (select sj_num from subject where sj_grade = 1 and sj_semester = 2 and sj_name = "국어") as t2;
# 1학년 1반 1번의 1학년 2학기 국어 성적을 100으로 추가할 때 쿼리
insert into score(sc_st_key, sc_sj_num, sc_score)
select st_key,sj_num, 100
	from (select st_key from student where st_grade = 1 and st_class = 1 and st_num = 1) as t1
	join (select sj_num from subject where sj_grade = 1 and sj_semester = 2 and sj_name = "국어") as t2;