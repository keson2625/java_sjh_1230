/* 
다음을 만족하는 쿼리를 작성해서 데이터베이스와 테이블을 생성하세요. 
데이터베이스명 : community
테이블명 : board
 - 게시글을 제목, 내용, 작성자를 입력하여 등록한다.
 - 제목은 최대 50자, 내용은 긴 문자열, 작성자는 최대 15자 
 - 게시글은 게시글 목록에서 번호, 제목, 작성자, 작성일, 조회수를 확인할 수 있다 
 - 작성일은 년,월,일,시,분,초를 확인할 수 있다. 
*/
drop database if exists community;

create database community;

use community;

drop table if exists board;

create table board(
	bo_num int primary key auto_increment,
    bo_title varchar(50) not null,
    bo_content longtext not null,
    bo_writer varchar(15) not null,
    bo_date datetime not null default current_timestamp, 
    bo_view int not null default 0
);
# ABC123회원이 "인사"라는 제목으로 "안녕하세요"라는 내용을 작성했을 때 필요한 쿼리 
insert into community.board(bo_title, bo_content, bo_writer) values("인사", "안녕하세요.", "ABC123");
insert into community.board(bo_title, bo_content, bo_writer) values("공지", "공지입니다.", "admin");

# 1번 게시글을 클릭해서 게시글 내용을 조회할 때 필요한 쿼리 => 조회수 증가, 게시글 내용을 조회 
# 조회수 증가
update board
set
	bo_view = bo_view + 1
where
	bo_num = 1;
# 1번 게시글 내용을 조회 
select * from board where bo_num = 1;

# ABC123 회원이 1번 게시글을 삭제할 때 쿼리 
# delete from board where bo_num = 1;

# 2025년 2월 25일에 작성된 게시글을 조회하는 쿼리 
select * from board where bo_date between "2025-02-25" and "2025-02-25 23:59:59";

# 제목이나 내용에 "안녕"을 포함하는 게시글을 조회하는 쿼리 
select * from board where bo_title like "%안녕%" or bo_content like "%안녕%";

# 최신글을 조회하는 쿼리 => 등록된 날짜가 최근 => 날짜 순으로 정렬
select * from community.board order by bo_date desc;
select * from community.board order by bo_num desc;

# 인기글을 조회하는 쿼리 => 조회수가 높은 글이 인기글 => 조회순으로 정렬 
select * from community.board order by bo_view desc;