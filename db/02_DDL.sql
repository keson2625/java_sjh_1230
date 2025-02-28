# create   : 생성
# alter    : 수정
# drop     : 삭제
# truncate : 테이블을 초기화
# []는 생략 가능

# 데이터베이스 생성
# create database [if not exists] db명 
# create schema [if not exists] db명 
# if not exists가 없으면 있는 db를 생성하려는 경우 쿼리에 에러가 발생
# => 이후 쿼리를 실행할 수 없음
drop database if exists student;
create database if not exists student;

# 데이터베이스 삭제
# drop database [if exists] db명
# drop schema [if exists] db명
# drop database if exists student;

# 데이터베이스 문자 집합을 설정
# alter schema db명 default character set 새characterset default collate 새collate;

# 테이블 생성 
/*
create table [if not exists] 테이블명(
	컬럼명 타입 [zerofill] [unique] [not null] [default 값] [primary key] [auto_increment],
    ...,
	[ constraint 제약조건명 primary key(컬럼명),]
    [ primary key(컬럼명),]
    [ constraint 제약조건명 foreign key(컬럼명) references 참조테이블명(기본키명),]
    [ foreign key(컬럼명) references 참조테이블명(기본키명),]
    [ constraint 제약조건명 check(논리식),]
    [ check(논리식)]
);

zerofill
  - 앞에 0으로 채울 때 사용
  - 5자리 숫자로 정하고, 1을 저장했을 때 앞에 4자리를 0으로 채움
unique
  - 컬럼들의 값들이 중복되면 안되는 경우 지정.(보통 대체키에) 
not null
  - 컬럼이 null값을 가지면 안될 때 사용 
primary key
  - 기본키 
  - 제약 조건으로 설정할 수도 있지만 컬럼명 옆에 지정할 수 있다 
  - not null + unique 
auto_increment
  - 기본키에만 가능, 정수형 속성에 지정 가능 
  - 데이터를 추가할 때 기본키에 값을 지정하지 않으면 자동으로 1 증가되어서 추가 됨 
*/
use student;
drop table if exists student.student;
create table if not exists student.student(
	st_key int primary key auto_increment, 
    st_grade int not null default 1,
    st_class int not null default 1,
    st_num int not null default 1,
    st_name varchar(20) not null,
    check(st_grade >= 1), 
    check(st_class >= 1),
    check(st_num >= 1)
);

# 테이블 삭제 
# drop table [if exists] 테이블명;
# drop table student;

# 테이블 수정 - 컬럼 추가
# alter table 테이블명 add 컬럼명 타입 [...];
alter table student add st_test datetime default current_timestamp;

# 테이블 수정 - 컬럼 수정 
# alter table 테이블명 change 기존컬럼명 새컬럼명 타입 [...];
alter table student change st_test test char(3) not null;

# 테이블 수정 - 컬럼 삭제 
# alter table 테이블명 drop 컬럼명;
alter table student drop test;

# 등록된 모든 check 제약 조건 확인
select * from information_schema.check_constraints;

# 테이블 수정 - 제약 조건 추가 
# alter table 테이블명 add constraint 제약조건명 제약조건 
alter table student add constraint student_chk4 check(st_name != '');

# 테이블 수정 - 제약 조건 삭제
# alter table 테이블명 drop constraint 제약조건명;
alter table student drop constraint student_chk4;

# 테이블 초기화 : auto_increment 값을 1로 초기화 및 데이터 제거 
# truncate table 테이블명;
/*
insert into student.student(st_grade, st_class, st_num, st_name)
values(1,1,1, "홍길동"), (1,1,2,"임꺽정"); 

select * from student.student;

insert into student.student(st_grade, st_class, st_num, st_name)
values(1,1,3, "홍길동"), (1,1,4,"임꺽정"); 

select * from student.student;

truncate table student.student;
# delete from student.student;
*/

drop table if exists studnet.subject;

create table student.subject(
	sj_num int primary key auto_increment,
    sj_grade int not null default 1,
    sj_semester enum("1", "2") not null default "1",
    sj_name varchar(10) not null,
    check(sj_grade in (1,2,3))
);

drop table if exists student.score;

create table student.score(
	sc_num int primary key auto_increment,
    sc_st_key int not null,
    sc_sj_num int not null,
    sc_score int not null default 0,
    check(sc_score between 0 and 100),
    foreign key(sc_st_key) references student.student(st_key),
    foreign key(sc_sj_num) references student.subject(sj_num)
);

drop table if exists student.average;

create table student.average(
	av_num int primary key auto_increment, 
    av_st_key int not null,
    av_grade int not null,
    av_semester int not null,
    av_sum int not null,
    av_count int not null,
    foreign key(av_st_key) references student.student(st_key)
);