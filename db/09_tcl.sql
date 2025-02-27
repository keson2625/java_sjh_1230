# tcl 
# 트랜잭션 제어 언어
# 트랜잭션 : db 상태를 변화 시키기 위해 수행하는 작업 단위 
# start transaction/begin/begin work : 트랜잭션을 시작 
# savepoint 저장명 : 임시로 저장할 위치를 지정 
# rollback to 저장명 : 저장명전까지 상태로 되돌림 
# rollback : 트랜잭션 시작 전까지 상태로 되돌림 
# commit : 지금까지 했던 작업을 반영함 

start transaction;

update score set sc_score = 90 where sc_num = 1;

savepoint s1;

update score set sc_score = 90 where sc_num = 2;

savepoint s2;

# rollback to s1;
rollback to s2;
# rollback;

commit;
rollback;

