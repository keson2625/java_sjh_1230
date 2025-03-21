# 프로시저 : 일련의 쿼리를 하나의 함수처럼 실행하기 위한 쿼리의 집합 
# 프로시저 목록 확인
show procedure status;
# 프로시저 스크립트 확인 
# sakila db에 있는 film_in_stock 프로시저 확인 
use sakila;
# cREATE pROCEDURE에 있는 내용이 프로시저 스크립트 
show create procedure film_in_stock;

/*
프로시저 삭제 
drop procedure if exists 프로시저명; 

프로시저 정의 
delimiter 기호 
create procedure 프로시저명(
	[in|out|inout 변수명1 타입,]
	[...]
)
begin
	프로시저 구현;
end 기호
delimiter ;

- 설명
delimiter 
  - 문장의 끝을 나타내는 기호를 정할 때 사용 
  - 사용하는 이유 : 프로시저 안에 사용되는 ;이 프로시저를 정의하는 동안 실행되면 안되기 때문에,
    프로시저를 정의하는 동안에 ;이 문장의 끝을 나타내는 기호가 아닌것처럼 사용하기 위해서 
in : 매개변수처럼 값을 프로시저 안에서 사용. 
out : 프로시저 안에서 나온 결과를 넘길 때 사용 
inout : 매개변수처럼 값을 가져와서 프로시저에서 사용하고 결과를 받아서 밖에서 활용 

프로시저 호출 
call 프로시저명(매개변수 또는 값들);
*/
# 학생 성적을 추가할 때 성적 0미만, 100초과면 추가하지 않는 프로시저 
use student;
drop procedure if exists insert_score;

delimiter //
create procedure insert_score(
	in _st_key int,
    in _sj_num int,
    in _score int
)
begin
	if _score between 0 and 100 then
		insert into score(sc_st_key, sc_sj_num, sc_score) values(_st_key, _sj_num, _score);
    end if;
end //
delimiter ;

call insert_score(16, 7, 90);
call insert_score(16, 8, 150);

# 프로시저 예제
drop procedure if exists p_test1;

delimiter //
create procedure p_test1(
	in _num int,
    out _res int
)
begin
	set _res = _num * 2;
end //
delimiter ;

# 세션 변수 value 선언 
set @value = 3;
call p_test1(10, @value);
select @value;

drop procedure if exists p_test2;

delimiter //
create procedure p_test1(
	inout _num int
)
begin
	set _num = _num * 2;
end //
delimiter ;

/*
프로시저에서 사용하는 문법 
1. 변수 선언
	-변수는 프로시저 시작 위치에 모아 놓어야 함, 중간에 불가 
declre 변수명 자료형 [default 초기화];
2. 검색 결과를 변수에 저장 
set 변수 = (select 속성명 from 테이블명 [where ...]);
3. 조건문 - if
if 조건식 then
	실행문;
elseif 조건식 then
	실행문;
else 
	실행문;
end if;
4. 조건문 - case
case 변수
	when 값 then
		실행문;
	when 값 then
		실행문;
	else	
		실행문;
end case;
5. 반복문 - while
while 조건식 do
	실행문;
end while;
6. 반복문 - repeat
rapeat
	실행문;
until 초기식
end repeat;
7. 반복문 - cursor
	- 검색 결과를 반복문으로 활용할 때
declare 변수명a boolean default false;
declare 커서명 cursor for select 속성1,... from 테이블명;
declare coutinue handler for not found set 변수명a = true;
open 커서명;
루프명 : loop
fetch 커서명 into 변수명1, ...;
if 변수명a then
	leave 루프명;
end if;
반복문 실행문;
end loop;
close 커서명;
*/

# average 테이블에 등록된 학생만큼 1학년 1학기~3학년 ㅈ학기 평균 초기 데이터를 추가하는 프로시저

drop procedure if exists init_average;

delimiter //
create procedure init_average()
begin
	declare _count int;
    declare _done boolean default false;
    declare _st_key int;
    declare _grade int default 1;
    declare _semester int default 1;
    
    declare _cursor cursor for select st_key from student;
    declare continue handler for not found set _done = true;
    
    
    
    set _count = (select count(*) from average);
	
    if _count = 0 then
		open _cursor;
		cursor_loop : loop 
			
			fetch _cursor into _st_key;
			set _grade = 1;
            if _done then
				leave cursor_loop;
			end if;
            
            while _grade <= 3 do
				repeat
					insert average(av_st_key, av_grade, av_semester, av_sum, av_count)
                    values(_st_key, _grade, _semester, 0, 0);
                    set _semester = _semester + 1;
                until _semester > 2
                end repeat;
                set _semester = 1;
                set _grade = _grade + 1;
            end while;
        end loop;
        close _cursor;
    end if;
    
end //
delimiter ;
call init_average();

# average 테이블에 sum과 count를 모두 0으로 초기화 
drop procedure if exists zero_sum_count;

delimiter //
create procedure zero_sum_count()
begin
	update average set av_sum = 0, av_count = 0;
end //
delimiter ;
call zero_sum_count();

# score 테이블에 있는 학생 성적들을 이용하여 average 테이블에 sum과 count를 계산하는 프로시저 
drop procedure if exists calc_average;

delimiter //
create procedure calc_average()
begin

    declare _done boolean default false;
    declare _sc_st_key int;
    declare _sc_score int;
    declare _sc_grade int;
    declare _sc_semester int;
    
    declare _cursor cursor for 
		select sc_st_key, sc_score, sj_semester as sc_semester, sj_grade as sc_grade 
        from score 
        join subject on sc_sj_num = sj_num;
    declare continue handler for not found set _done = true;
    
    call zero_sum_count();
    
	open _cursor;
	cursor_loop : loop 
		
		fetch _cursor into _sc_st_key, _sc_score, _sc_semester, _sc_grade;

		if _done then
			leave cursor_loop;
		end if;
        
        update average 
		set 
			av_sum = av_sum + _sc_score, 
            av_count = av_count + 1
		where
			av_grade = _sc_grade and av_semester = _sc_semester and av_st_key = _sc_st_key;
		
	end loop;
	close _cursor;

    
end //
delimiter ;
call calc_average();