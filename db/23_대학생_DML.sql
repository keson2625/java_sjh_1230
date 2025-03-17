# 컴퓨터공학과를 등록. 학과코드 com, 학과 코드 번호 160, 사무실 kh 1관 401호를 등록하는 쿼리 
insert into department value("com", "컴퓨터공학과", "사무실 kh 1관 401호", 160, null);
# 디자인공학과를 등록. 학과코드 deg, 학과 코드 번호 123, 사무실 kh 3관 101호를 등록하는 쿼리 
insert into department value("deg", "디자인공학과", "사무실 kh 3관 101호", 123, null);
# 기계공학과를 등록. 학과코드 mec, 학과 코드 번호 456, 사무실 kh 4관 201호를 등록하는 쿼리 
insert into department value("mec", "기계공학과", "사무실 kh 4관 201호", 456, null);

#교수를 등록. 이름 홍교수, 연락처 012-1234-5678, 주민번호 601111-1, 취임연도 2000. 컴퓨터공학과
insert into professor 
select 
	concat("p", 2000, de_name_num, lpad(count(pr_num) + 1, 3, "0")), 
	"홍교수", "012-1234-5678", "601111-1", 2000, de_num
from 
	(select * from professor where pr_year = 2000) p
right join 
	department on de_num = pr_de_num
where 
	de_name = "컴퓨터공학과";
#교수를 등록. 이름 김교수, 연락처 012-1111-5555, 주민번호 630101-2, 취임연도 2000. 컴퓨터공학과
insert into professor 
select 
	concat("p", 2000, 160, lpad(count(pr_num) + 1, 3, "0")), 
	"김교수", "012-1111-5555", "630101-2", 2000, "com"
from 
	professor
where 
	pr_year = 2000;
#교수를 등록. 이름 박교수, 연락처 012-7788-4455, 주민번호 670331-1, 취임연도 2005. 디자인공학과 
insert into professor 
select 
	concat("p", 2005, de_name_num, lpad(count(pr_num) + 1, 3, "0")), 
	"박교수", "012-7788-4455", "670331-1", 2005, de_num
from 
	(select * from professor where pr_year = 2005) p
right join 
	department on de_num = pr_de_num
where 
	de_name = "디자인공학과";
#교수를 등록. 이름 이교수, 연락처 012-7781-4451, 주민번호 701231-2, 취임연도 2010. 디자인공학과 
insert into professor 
select 
	concat("p", 2010, de_name_num, lpad(count(pr_num) + 1, 3, "0")), 
	"이교수", "012-7781-4451", "701231-2", 2010, de_num
from 
	(select * from professor where pr_year = 2010) p
right join 
	department on de_num = pr_de_num
where 
	de_name = "디자인공학과";
#교수를 등록. 이름 최교수, 연락처 012-3333-4444, 주민번호 650101-1, 취임연도 2005. 기계공학과 
insert into professor 
select 
	concat("p", 2005, de_name_num, lpad(count(pr_num) + 1, 3, "0")), 
	"최교수", "012-3333-4444", "650101-1", 2005, de_num
from 
	(select * from professor where pr_year = 2005) p
right join 
	department on de_num = pr_de_num
where 
	de_name = "기계공학과";
#교수를 등록. 이름 최교수, 연락처 012-4567-4444, 주민번호 750101-1, 취임연도 2020. 기계공학과 
insert into professor 
select 
	concat("p", 2020, de_name_num, lpad(count(pr_num) + 1, 3, "0")), 
	"최교수", "012-4567-4444", "750101-1", 2020, de_num
from 
	(select * from professor where pr_year = 2020) p
right join 
	department on de_num = pr_de_num
where 
	de_name = "기계공학과";
    
# 최종 합격 명단
# 이름 홍길동, 연락처 013-1234-5678, 입학연도 2025, 주민번호 060303-3, 컴퓨터공학과
# 이름 고길동, 연락처 013-1111-1111, 입학연도 2025, 주민번호 060401-3, 컴퓨터공학과
# 이름 김길동, 연락처 013-1111-2222, 입학연도 2025, 주민번호 060505-3, 컴퓨터공학과
# 이름 하니, 연락처 013-1111-3333, 입학연도 2025, 주민번호 060606-4, 컴퓨터공학과
insert into final_pass(fp_name, fp_phone, fp_year, fp_res_num, fp_de_num) values
("홍길동","013-1234-5678", 2025, "060303-3", "com"),
("고길동","013-1111-1111", 2025, "060401-3", "com"),
("김길동","013-1111-2222", 2025, "060505-3", "com"),
("하니","013-1111-3333", 2025, "060606-4", "com"),
# 이름 나애리, 연락처 013-1111-4444, 입학연도 2025, 주민번호 060625-4, 디자인공학과
# 이름 오영심, 연락처 013-1111-5555, 입학연도 2025, 주민번호 060717-4, 디자인공학과
# 이름 오두리, 연락처 013-1111-6666, 입학연도 2025, 주민번호 060815-4, 디자인공학과
# 이름 전지현, 연락처 013-1111-7777, 입학연도 2025, 주민번호 051003-4, 디자인공학과
("나애리","013-1111-4444", 2025, "060625-4", "deg"),
("오영심","013-1111-5555", 2025, "060717-4", "deg"),
("오두리","013-1111-6666", 2025, "060815-4", "deg"),
("전지현","013-1111-7777", 2025, "051003-4", "deg"),
# 이름 김둘리, 연락처 013-1111-8888, 입학연도 2025, 주민번호 061224-3, 기계공학과
# 이름 김군, 연락처 013-1111-9999, 입학연도 2025, 주민번호 070101-3, 기계공학과
# 이름 박명수, 연락처 013-1111-0000, 입학연도 2025, 주민번호 060405-3, 기계공학과
# 이름 유재석, 연락처 013-1111-1234, 입학연도 2025, 주민번호 061009-3, 기계공학과
("김둘리","013-1111-8888", 2025, "061224-3", "mec"),
("김군","013-1111-9999", 2025, "070101-3", "mec"),
("박명수","013-1111-0000", 2025, "060405-3", "mec"),
("유재석","013-1111-1234", 2025, "061009-3", "mec");

# 최종 합격한 컴퓨터공학과 학생들을 학생으로 등록하는 쿼리 
insert into student
select 
	concat(fp_year, de_name_num, lpad(rank() over(order by fp_name, fp_res_num) , 3, "0")) as st_num,
	fp_name, 
    fp_res_num, 
    fp_phone, 
    fp_year ,
    de_num,
    null
from 
	final_pass 
join
	department on fp_de_num = de_num
where 
	fp_de_num = "com" and fp_year = year(now());
# 최종 합격한 디자인공학과 학생들을 학생으로 등록하는 쿼리 
insert into student
select 
	concat(fp_year, de_name_num, lpad(rank() over(order by fp_name, fp_res_num) , 3, "0")) as st_num,
	fp_name, 
    fp_res_num, 
    fp_phone, 
    fp_year ,
    de_num,
    null
from 
	final_pass 
join
	department on fp_de_num = de_num
where 
	de_name = "디자인공학과" and fp_year = year(now());
# 최종 합격한 기계공학과 학생들을 학생으로 등록하는 쿼리 
insert into student
select 
	concat(fp_year, de_name_num, lpad(rank() over(order by fp_name, fp_res_num) , 3, "0")) as st_num,
	fp_name, 
    fp_res_num, 
    fp_phone, 
    fp_year ,
    de_num,
    null
from 
	final_pass 
join
	department on fp_de_num = de_num
where 
	de_name = "기계공학과" and fp_year = year(now());

# 과목 분류를 등록하는 쿼리 
# 학과코드 등록
insert into subject_category select de_num from department;
# 교직(tea), 교양(cul), 기본(msc) 등록
insert into subject_category values("tea"), ("cul"), ("msc");

# 과목을 등록하는 쿼리. 
# 과목명 : 컴퓨터 개론, 학점 : 2, 시간 : 2, 분류 : com, 과목코드 : com001
# 과목명 : 프로그래밍 언어, 학점 : 3, 시간 : 3, 분류 : com, 과목코드 : com002
# 과목명 : 알고리즘, 학점 : 3, 시간 : 3, 분류 : com, 과목코드 : com003
insert into subject(sj_title, sj_point, sj_time, sj_code, sj_sc_code)
select "컴퓨터 개론", 2, 2, concat("com", lpad(count(*) + 1, 3, "0")), "com"  from subject where sj_sc_code = "com";
insert into subject(sj_title, sj_point, sj_time, sj_code, sj_sc_code)
select "프로그래밍 언어", 3, 3, concat("com", lpad(count(*) + 1, 3, "0")), "com"  from subject where sj_sc_code = "com";
insert into subject(sj_title, sj_point, sj_time, sj_code, sj_sc_code)
select "알고리즘", 3, 3, concat("com", lpad(count(*) + 1, 3, "0")), "com"  from subject where sj_sc_code = "com";

# 과목명 : 확률과 통계, 학점 : 3, 시간 : 3, 분류 : msc, 과목코드 : msc001
# 과목명 : 미분과 적분, 학점 : 4, 시간 : 4, 분류 : msc, 과목코드 : msc002
insert into subject(sj_title, sj_point, sj_time, sj_code, sj_sc_code)
select "확률과 통계", 3, 3, concat("msc", lpad(count(*) + 1, 3, "0")), "msc"  from subject where sj_sc_code = "msc";
insert into subject(sj_title, sj_point, sj_time, sj_code, sj_sc_code)
select "미분과 적분", 4, 4, concat("msc", lpad(count(*) + 1, 3, "0")), "msc"  from subject where sj_sc_code = "msc";


# 과목명 : 영어1, 학점 : 3, 시간 : 3, 분류 : cul, 과목코드 : cul001
# 과목명 : 음악과 감상, 학점 : 2, 시간 : 2, 분류 : cul, 과목코드 : cul002
insert into subject(sj_title, sj_point, sj_time, sj_code, sj_sc_code)
select "영어1", 3, 3, concat("cul", lpad(count(*) + 1, 3, "0")), "cul"  from subject where sj_sc_code = "cul";
insert into subject(sj_title, sj_point, sj_time, sj_code, sj_sc_code)
select "음악과 감상", 2, 2, concat("cul", lpad(count(*) + 1, 3, "0")), "cul"  from subject where sj_sc_code = "cul";

# 과목명 : 교육학 개론, 학점 : 2, 시간 : 3, 분류 : tea, 과목코드 : tea001
# 과목명 : 교육 방법론, 학점 : 3, 시간 : 3, 분류 : tea, 과목코드 : tea002
insert into subject(sj_title, sj_point, sj_time, sj_code, sj_sc_code)
select "교육학 개론", 2, 3, concat("tea", lpad(count(*) + 1, 3, "0")), "tea"  from subject where sj_sc_code = "tea";
insert into subject(sj_title, sj_point, sj_time, sj_code, sj_sc_code)
select "교육 방법론", 3, 3, concat("tea", lpad(count(*) + 1, 3, "0")), "tea"  from subject where sj_sc_code = "tea";

# 과목명 : 디자인의 이해, 학점 : 2, 시간 : 2, 분류 : deg, 과목코드 : deg001
# 과목명 : 시각 디자인, 학점 : 3, 시간 : 3, 분류 : deg, 과목코드 : deg002
# 과목명 : 제품 디자인, 학점 : 3, 시간 : 3, 분류 : deg, 과목코드 : deg003
insert into subject(sj_title, sj_point, sj_time, sj_code, sj_sc_code)
select "디자인의 이해", 2, 2, concat("deg", lpad(count(*) + 1, 3, "0")), "deg"  from subject where sj_sc_code = "deg";
insert into subject(sj_title, sj_point, sj_time, sj_code, sj_sc_code)
select "시각 디자인", 3, 3, concat("deg", lpad(count(*) + 1, 3, "0")), "deg"  from subject where sj_sc_code = "deg";
insert into subject(sj_title, sj_point, sj_time, sj_code, sj_sc_code)
select "제품 디자인", 3, 3, concat("deg", lpad(count(*) + 1, 3, "0")), "deg"  from subject where sj_sc_code = "deg";

# 과목명 : 프로그래밍 언어, 학점 : 3, 시간 : 3, 분류 : mec, 과목코드 : mec001
# 과목명 : 동역학, 학점 : 3, 시간 : 3, 분류 : mec, 과목코드 : mec002
# 과목명 : 기계의 이해, 학점 : 2, 시간 : 2, 분류 : mec, 과목코드 : mec003
insert into subject(sj_title, sj_point, sj_time, sj_code, sj_sc_code)
select "프로그래밍 언어", 3, 3, concat("mec", lpad(count(*) + 1, 3, "0")), "mec"  from subject where sj_sc_code = "mec";
insert into subject(sj_title, sj_point, sj_time, sj_code, sj_sc_code)
select "동역학", 3, 3, concat("mec", lpad(count(*) + 1, 3, "0")), "mec"  from subject where sj_sc_code = "mec";
insert into subject(sj_title, sj_point, sj_time, sj_code, sj_sc_code)
select "기계의 이해", 2, 2, concat("mec", lpad(count(*) + 1, 3, "0")), "mec"  from subject where sj_sc_code = "mec";

# 강의명 : 컴퓨터 개론(1), 2025,학기 : 1,강의실 : kh 1관 501호, 분반 : 1, 정원 : 30,강의계획서 : 없음,교수 : 홍교수(p2000160001)
# 시간 : 월1a, 월1b, 월2a, 월2b
insert into lecture(le_year, le_semester, le_class_room, le_class, le_max, le_plan, le_sj_num, le_pr_num) values
(2025, 1, "kh 1관 501호", 1, 30, "없음", 1, "p2000160001");
insert into lecture_schedule(lc_day, lc_time, lc_minute, lc_le_num) values
("월", 1, "a", 1), ("월", 1, "b", 1), ("월", 2, "a", 1), ("월", 2, "b", 1);

# 강의명 : 프로그래밍 언어(2), 2025,학기 : 1,강의실 : kh 1관 501호, 분반 : 1, 정원 : 30,강의계획서 : 없음,교수 : 홍교수(p2000160001)
# 시간 : 월4a, 월4b, 월5a, 수4a, 수4b, 수5a
insert into lecture(le_year, le_semester, le_class_room, le_class, le_max, le_plan, le_sj_num, le_pr_num) values
(2025, 1, "kh 1관 501호", 1, 30, "없음", 2, "p2000160001");
insert into lecture_schedule(lc_day, lc_time, lc_minute, lc_le_num) values
("월", 4, "a", 2), ("월", 4, "b", 2), ("월", 5, "a", 2), 
("수", 4, "a", 2), ("수", 4, "b", 2), ("수", 5, "a", 2);

# 강의명 : 프로그래밍 언어(2), 2025,학기 : 1,강의실 : kh 1관 502호, 분반 : 2, 정원 : 30,강의계획서 : 없음,교수 : 김교수(p2000160002)
# 시간 : 월4a, 월4b, 월5a, 수4a, 수4b, 수5a
insert into lecture(le_year, le_semester, le_class_room, le_class, le_max, le_plan, le_sj_num, le_pr_num) values
(2025, 1, "kh 1관 502호", 1, 30, "없음", 2, "p2000160002");
insert into lecture_schedule(lc_day, lc_time, lc_minute, lc_le_num) values
("월", 4, "a", 3), ("월", 4, "b", 3), ("월", 5, "a", 3), 
("수", 4, "a", 3), ("수", 4, "b", 3), ("수", 5, "a", 3);

# 강의명 : 알고리즘(3), 2025,학기 : 1,강의실 : kh 1관 502호, 분반 : 1, 정원 : 30,강의계획서 : 없음,교수 : 김교수(p2000160002)
# 시간 : 목1a, 목1b, 목2a, 목2b, 목3a, 목3b
insert into lecture(le_year, le_semester, le_class_room, le_class, le_max, le_plan, le_sj_num, le_pr_num) values
(2025, 1, "kh 1관 502호", 1, 30, "없음", 3, "p2000160002");
insert into lecture_schedule(lc_day, lc_time, lc_minute, lc_le_num) values
("목", 1, "a", 4), ("목", 1, "b", 4), ("목", 2, "a", 4), ("목", 2, "b", 4), ("목", 3, "a", 4), ("목", 3, "b", 4);

# 강의명 : 확률과 통계(4), 2025,학기 : 1,강의실 : kh 3관 501호, 분반 : 1, 정원 : 30,강의계획서 : 없음,교수 : 김교수(p2000160002)
# 시간 : 화1a, 화1b, 화2a, 금1a,금1b,금2a
insert into lecture(le_year, le_semester, le_class_room, le_class, le_max, le_plan, le_sj_num, le_pr_num) values
(2025, 1, "kh 3관 501호", 1, 30, "없음", 4, "p2000160002");
insert into lecture_schedule(lc_day, lc_time, lc_minute, lc_le_num) values
("화", 1, "a", 5), ("화", 1, "b", 5), ("화", 2, "a", 5), 
("금", 1, "a", 5), ("금", 1, "b", 5), ("금", 2, "a", 5);

# 강의명 : 미분과 적분(5), 2025,학기 : 1,강의실 : kh 3관 502호, 분반 : 1, 정원 : 30,강의계획서 : 없음,교수 : 홍교수(p2000160001)
# 시간 : 화1a, 화1b, 화2a, 금1a,금1b,금2a
insert into lecture(le_year, le_semester, le_class_room, le_class, le_max, le_plan, le_sj_num, le_pr_num) values
(2025, 1, "kh 3관 502호", 1, 30, "없음", 5, "p2000160001");
insert into lecture_schedule(lc_day, lc_time, lc_minute, lc_le_num) values
("화", 1, "a", 6), ("화", 1, "b", 6), ("화", 2, "a", 6), 
("금", 1, "a", 6), ("금", 1, "b", 6), ("금", 2, "a", 6);

# 강의명 : 영어1(6), 2025,학기 : 1,강의실 : kh 2관 501호, 분반 : 1, 정원 : 30,강의계획서 : 없음,교수 : 이교수(p2010123001)
# 시간 : 화1a, 화1b, 화2a, 금1a,금1b,금2a
insert into lecture(le_year, le_semester, le_class_room, le_class, le_max, le_plan, le_sj_num, le_pr_num) values
(2025, 1, "kh 2관 501호", 1, 30, "없음", 6, "p2010123001");
insert into lecture_schedule(lc_day, lc_time, lc_minute, lc_le_num) values
("화", 1, "a", 7), ("화", 1, "b", 7), ("화", 2, "a", 7), 
("금", 1, "a", 7), ("금", 1, "b", 7), ("금", 2, "a", 7);

# 강의명 : 음악감상(7), 2025,학기 : 1,강의실 : kh 2관 502호, 분반 : 1, 정원 : 30,강의계획서 : 없음,교수 : 최교수(p2020456001)
# 시간 : 월6a,월6b,월7a,월7b,월8a,월8b
insert into lecture(le_year, le_semester, le_class_room, le_class, le_max, le_plan, le_sj_num, le_pr_num) values
(2025, 1, "kh 2관 502호", 1, 30, "없음", 7, "p2020456001");
insert into lecture_schedule(lc_day, lc_time, lc_minute, lc_le_num) values
("월", 6, "a", 8), ("월", 6, "b", 8), ("월", 7, "a", 8), ("월", 7, "b", 8),  ("월", 8, "a", 8), ("월", 8, "b", 8);

# 강의명 : 교육학 개론(8), 2025,학기 : 1,강의실 : kh 4관 501호, 분반 : 1, 정원 : 30,강의계획서 : 없음,교수 : 최교수(p2005456001)
# 시간 : 화1a,화1b,화2a,화2b,화3a,화3b
insert into lecture(le_year, le_semester, le_class_room, le_class, le_max, le_plan, le_sj_num, le_pr_num) values
(2025, 1, "kh 4관 501호", 1, 30, "없음", 8, "p2005456001");
insert into lecture_schedule(lc_day, lc_time, lc_minute, lc_le_num) values
("화", 1, "a", 9), ("화", 1, "b", 9), ("화", 2, "a", 9), ("화", 2, "b", 9),  ("화", 3, "a", 9), ("화", 3, "b", 9);

# 강의명 : 교육 방법론(9), 2025,학기 : 1,강의실 : kh 4관 502호, 분반 : 1, 정원 : 30,강의계획서 : 없음,교수 : 박교수(p2005123001)
# 시간 : 화1a,화1b,화2a,화2b,화3a,화3b
insert into lecture(le_year, le_semester, le_class_room, le_class, le_max, le_plan, le_sj_num, le_pr_num) values
(2025, 1, "kh 4관 502호", 1, 30, "없음", 9, "p2005123001");
insert into lecture_schedule(lc_day, lc_time, lc_minute, lc_le_num) values
("화", 1, "a", 10), ("화", 1, "b", 10), ("화", 2, "a", 10), ("화", 2, "b", 10),  ("화", 3, "a", 10), ("화", 3, "b", 10);

# 고길동(2025160001) 학생이 컴퓨터개론(1), 프로그래밍언어(2), 확률과 통계(5), 음악과 감상(8)을 수강 신청 했을 때 쿼리 
insert into course(co_st_num, co_le_num) values
("2025160001", 1), ("2025160001", 2), ("2025160001", 5), ("2025160001", 8);

# 교수님이 성적 비율을 다음과 같이 수정했을 때 필요한 쿼리
# 모든 강의의 성적 비율을 기본으로 적용하는 쿼리 
insert into lecture_standard(ls_le_num) 
select le_num from lecture;

# 컴퓨터개론(1)의 성적 비율 - 중간 : 45, 기말 : 45, 출석 : 10, 과제 : 0
# 프로그래밍언어(2)의 성적 비율 - 중간 : 40, 기말 : 40, 출석 : 10, 과제 : 10
update lecture_standard 
set
	ls_mid = 45,
    ls_final = 45,
    ls_att = 10,
    ls_home = 0
where
	ls_le_num = 1;
update lecture_standard 
set
	ls_mid = 40,
    ls_final = 40,
    ls_att = 10,
    ls_home = 10
where
	ls_le_num = 2;    

# 고길동(2025160001) 학생의 컴퓨터개론(1) 성적이 중간 100, 기말 80, 과제 0, 출석 100일때 성적을 계산하는 프로시저를
# 작성해서 실행하세요. a+ : 95이상, a : 90이상 

drop procedure if exists insert_score;

delimiter //
create procedure insert_score(
	in _st_num char(10),
    in _le_num int,
    in _mid int,
    in _final int,
    in _att int,
    in _home int
)
begin
	declare _total int;
    declare _res varchar(4);
    set _total = (
		select 
			(_mid  * ls_mid + 
			_final * ls_final + 
            _att   * ls_att + 
            _home  * ls_home) / 100 
            from lecture_standard where ls_le_num = _le_num);
	if _total >= 95 then set _res = "a+";
    elseif _total >= 90 then set _res = "a";
    elseif _total >= 85 then set _res = "b+";
    elseif _total >= 80 then set _res = "b";
    elseif _total >= 75 then set _res = "c+";
    elseif _total >= 70 then set _res = "c";
    elseif _total >= 65 then set _res = "d+";
    elseif _total >= 60 then set _res = "d";
    else set _res = "f";
    end if;
    update course 
    set
		co_mid = _mid,
        co_final = _final,
        co_att = _att,
        co_home = _home,
        co_total = _res
	where
		co_st_num = _st_num and co_le_num = _le_num;
end //
delimiter ;
call insert_score("2025160001", 1, 100, 80, 100,  0);

# 고길동(2025160001) 학생의 프로그래밍언어(2) 성적이 중간 90, 기말 90, 과제 50, 출석 100일때 성적
call insert_score("2025160001", 2, 90, 90, 100,  50);