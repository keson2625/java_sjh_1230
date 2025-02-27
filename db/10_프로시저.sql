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