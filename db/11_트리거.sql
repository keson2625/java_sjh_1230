# 트리거
# - 테이블에 발생한 이벤트에 반응해 자동으로 실행되는 작업 
# - 데이터 무결성을 지킬 수 있음
#   - 제고량 + 판매량 == 입고량 
# - 이벤트 : insert, update, delete 
# - 트리거 발생된 테이블과 수정하려는 테이블이 같으면 에러 발생. 

# 트리거 확인하는 쿼리
# use student;
# show triggers;

# 트리거 삭제 
# drop trigger if exists 트리거명;

# 트리거 등록 
/*
delimiter 기호
create trigger 트리거명 trigger_time trigger_event on 테이블명 
for each row
begin 
	실행문;
end 기호
delimiter ;

 - trigger_time : 트리거가 동작되는 시점. before | after 
 - trigger_event: 트리거가 실행되는 이벤트. insert | update | delete
 - 트리거 안에서 사용되는 키워드 
   - old : delete, update 하기전 데이터. old.속성을 통해 활용 가능 
   - new : insert, update 한 후 데이터. new.속성을 통해 활용 가능
*/
# 학생 성적이 추가되면 학생 평균을 수정하는 트리거 
drop trigger if exists insert_score;

delimiter //
create trigger insert_score after insert 
on score
for each row
begin
	declare _av_grade int;
    declare _av_semester int;

	set _av_grade = (select sj_grade from subject where sj_num = new.sc_sj_num);
	set _av_semester = (select sj_semester from subject where sj_num = new.sc_sj_num);
    
	update average 
    set 
		av_sum = av_sum + new.sc_score,
		av_count = av_count + 1
	where
		av_grade = _av_grade and av_semester = _av_semester and av_st_key = new.sc_st_key;
end //
delimiter ;

# insert into score(sc_st_key, sc_sj_num, sc_score) values(16, 13, 100);