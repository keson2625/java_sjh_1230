# 사용자 추가 
# create user '아이디'@'호스트명' identified by '비밀번호';
# '아이디' : 사용자 계정명
# '호스트명' : 접근 권한
# 	-localhost : 내부에서만 가능 => 다른 pc에서 해당 db접근불가
# 	-% : 외부
create user 'keson'@'%' identified by 'admin';

# 사용자 조회
select user, host from mysql.user;

# 사용자 비번 변경
# set password for '아이디'@'호스트명' = '새비밀번호'; 
set password for 'keson'@'%' = 'admin123';

# 사용자 삭제
# drop user '아이디'@'호스트명';
drop user 'keson'@'%';

create user 'keson'@'%' identified by 'admin';

# 권한 부여
#	- 사용자에 특정 db에 대한 권한을 부여. 테이블 추가/수정/삭제, 데이터 추가/수정/삭제 등
#	- select/insert/update/delete/create/alter/references/all privileges(모든 권한)
# grant 권한 on db명. 테이블명 to '아이디'@'호스트명';
grant all privileges on community.* to 'keson'@'%';

# 권한 삭제
# revoke 권한 on db명. 테이블명 from '아이디'@'호스트명';
revoke insert on community.* from 'keson'@'%';