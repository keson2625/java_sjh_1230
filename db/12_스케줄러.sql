# 이벤트 스케쥴러 
# - 특정 작업이 정기적으로 실행되도록 예약하는 기능 

# 이벤트 스케쥴러 상태 확인 쿼리 
# on : 스케쥴러 사용. off : 스케쥴러 사용 안함 
# show variables like 'event%';

# 이벤트 스케쥴러 상태 수정
# set global event_scheduler = 값; 
# 값 : on | off

# 이벤트 스케쥴러 확인 
# select * from information_schema.events;

# 이벤트 스케쥴러 등록
/*
create event 이벤트명 
on schedule every 숫자 단위 
[starts 시간]
[on completion preserve | on completion not preserve]
[comment '설명']
do
	실행할 쿼리; # 복잡한 쿼리가 필요하면 프로시저를 생성하여 호출 

- 단위
  - year | quarter | month | day | hour | minute | week | second 
  - year_month | day_hour | day_minute | day_second | hour_minute | hour_second | minute_second
- starts
  - 스케쥴러가 실행될 기준 시간. 생략하면 스케쥴러 등록 시간이 기준 시간이 됨 
- on completion preserve 
  - 이벤트가 성공한 후 이벤트를 보존(이벤트가 유지) 
- on completion not preserve
  - 이벤트가 성공한 후 이벤트를 삭제(한번만) 
  - 기본 값. 
*/
# 이벤트 삭제 
# drop event if exists 이벤트명;
drop event if exists increase_view;

create event increase_view
on schedule every 1 minute 
on completion preserve
do
	update board set bo_view = bo_view + 1 where bo_num = 1;
select * from board;

drop event if exists increase_view_once; 

/*
# 이벤트 스케줄러 등록(not preserve)
create event 이벤트명 
on schedule
at 시간
on completion not preserve
[comment '설명']
do
	실행할 쿼리; 
*/
drop event if exists increase_view_once;
create event increase_view_once
on schedule
at addtime(now(), "00:00:30")
on completion not preserve
do
	update board set bo_view = bo_view + 1 where bo_num = 2;
select * from board;