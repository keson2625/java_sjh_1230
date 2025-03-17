# 컴공 학생들의 전공 수업 강의를 조회하는 쿼리 
select 
	sj_title 강의명, 
    le_class_room 강의실,
    sj_point 학점,
    sj_time 시수,
    le_max 정원,
    le_class 분반
from 
	lecture 
join 
	subject on le_sj_num = sj_num
where 
	sj_sc_code = (select de_num from department where de_name = "컴퓨터공학과");

# 홍교수(p2000160001)님이 강의하는 강의들을 조회하는 쿼리 
select 
	sj_title, lecture.*
from 
	lecture 
join 
	subject on le_sj_num = sj_num
where 
	le_pr_num = "p2000160001";

# 고길동(2025160001) 학생이 수강 신청한 목록 
select 
	subject.*, lecture.*
from
    course
join
	lecture on co_le_num = le_num
join
	subject on le_sj_num = sj_num
where
    co_st_num = '2025160001';

# 각 강의별 현재 수강 신청한 인원수를 조회하는 쿼리 
select 
    subject.*, lecture.*, count(co_num) 신청수
from
    lecture
        left join
    course on le_num = co_le_num
        left join
    subject on le_sj_num = sj_num
where 
	le_year = 2025 and le_semester = 1
group by le_num ;

# 고길동(2025160001) 학생이 이수한 강의 목록을 조회하는 쿼리 
select 
    subject.*, co_total 성적
from
    course
join 
	lecture on le_num = co_le_num
join 
	subject on le_sj_num = sj_num
where
    co_st_num = 2025160001
        and co_total is not null;
# 고길동(2025160001) 학생이 취득한 학점을 조회하는 쿼리 
select 
    co_st_num, sum(sj_point) 취득학점
from
    course
join 
	lecture on le_num = co_le_num
join 
	subject on le_sj_num = sj_num
where
    co_st_num = 2025160001
        and co_total is not null;
        
# 고길동(2025160001) 학생의 2025년 1학기 성적을 조회하는 쿼리 
# => 4.5점 만점 기준. a+ : 4.5, a : 4, b+ : 3.5, b : 3, c+ : 2.5, c : 2, d+ : 1.5, d : 1
select 
    sum(if(co_total = "a+", 4.5, 
		if(co_total = "a", 4, 
			if(co_total = "b+", 3.5, 
				if(co_total = "b", 3.5, 
					if(co_total = "c+", 2.5, 
						if(co_total = "c", 2.5, 
							if(co_total = "d+", 1.5, 
								if(co_total = "d", 1, 0)))))))) * sj_point) / sum(sj_point) as 평균평점
from
    course
join 
	lecture on le_num = co_le_num
join 
	subject on le_sj_num = sj_num
where
    co_st_num = 2025160001
        and co_total is not null
        and le_year = 2025 and le_semester = "1"
group by co_st_num;