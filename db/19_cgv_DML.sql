# 관람 등급을 추가 
insert into movie_ratings values
("전체 관람가"),
("12세 이상 관람가"),
("15세 이상 관람가"),
("청소년 관람 불가"),
("제한 상영가");
# 장르를 추가
insert into genre values
("액션"),
("애니메이션"),
("코미디"),
("드라마"),
("공포"),
("로맨스"),
("sf"),
("판타지"),
("스릴러"),
("범죄"),
("전쟁"),
("어드벤처");
# 국가 추가 
insert into country values
("미국"),
("영국"),
("한국"),
("오스트레일리아"),
("일본");

# 지역 추가 
insert into region values
("서울"),
("경기"),
("인천"),
("대전/충청"),
("대구"),
("부산/울산"),
("경상"),
("광주/전라/제주");

# 요금, 성인 : 15000, 청소년 : 12000, 조조 : 11000
insert into fee(fe_type, fe_price, fe_date) values
("성인", 15000, "2025-03-01"),
("청소년", 12000, "2025-03-01"),
("조조", 11000, "2025-03-01");

# cgv 사이트를 참고하여 미키 17영화를 등록할 때 필요한 쿼리들을 작성하세요.
# 미키 영화 정보를 추가 : 제목, 상영시간, 개봉일, 내용, 상태, 관람 등급 
insert into movie(mv_title, mv_time, mv_date, mv_content, mv_state, mv_mr_age)
values("미키 17", 137, "2025-02-28", "당신은 몇 번째 미키입니까?", "상영중", "15세 이상 관람가");

# 인물을 추가 : 봉준호, 로버트 패틴슨, 나오미 애키, 스티븐 연, 토니 콜렛, 마크 러팔로 
insert into person(pr_name, pr_birth, pr_detail, pr_ct_name) values
("봉준호", "1969-09-14", "", "한국"),
("로버트 패틴슨", "1986-05-13", "국내에서는 ...", "영국"),
("나오미 애키", "1992-11-02", "", null),
("스티븐 연", "1983-12-21", "한국계 미국인 ...", "미국"),
("토니 콜렛", "1972-11-01", "", "오스트레일리아"),
("마크 러팔로", "1967-11-22", "1968년 위스콘신 출생.", "미국");

# 영화인 등록
insert into actor(at_position, at_pr_num) values
("감독", 1),
("배우", 2),
("배우", 3),
("배우", 4),
("배우", 5),
("배우", 6);

# 영화 참여 등록
insert into movie_actor(ma_role, ma_mv_num, ma_at_num) values
("감독", 1, 1),
("미키 반스", 1, 2),
("나샤 배릿지", 1, 3),
("티모", 1, 4),
("일파 마샬", 1, 5),
("케네스 마샬", 1, 6);

# 영화 장르 등록
insert into movie_genre(mg_mv_num, mg_gr_name) values
(1, "어드벤처"), (1, "sf"), (1, "드라마");

# 제작 국가 등록
insert into movie_country(mc_ct_name, mc_mv_num) values("미국", 1);

# 트레일러와 스틸컷 등록
insert into file(fi_name, fi_type, fi_mv_num) values
("미키17_1.jpg", "s", 1),
("미키17_2.jpg", "s", 1),
("미키17_3.jpg", "s", 1),
("미키17_1.mp4", "t", 1),
("미키17_2.mp4", "t", 1),
("미키17_3.mp4", "t", 1);

# 미키17 강남 3/11 상영시간을 등록할 때 필요한 쿼리들을 작성
# 4관 13:50, 19:10
# 1관 16:20
# 3관 09:00, 11:50
# 5관 10:00

# 극장 등록
insert into THEATER(TT_NAME, TT_ADDR, TT_COUNT, TT_RG_NAME) VALUES
("CGV강남", "서울특별시 강남구 강남대로 438 (역삼동)", 5, "서울");

# 상영관 등록 : CGV강남 1관 ~ 5관
insert into SCREEN(SC_NAME, SC_SEAT, SC_TT_NUM) VALUES
("1관", 12, 1),
("2관", 10, 1),
("3관", 15, 1),
("4관", 16, 1),
("5관", 20, 1);

insert into seat(se_name, se_sc_num) values
("a1", 1),("a2", 1),("a3", 1),("a4", 1),
("b1", 1),("b2", 1),("b3", 1),("b4", 1),
("c1", 1),("c2", 1),("c3", 1),("c4", 1),

("a1", 2),("a2", 2),("a3", 2),("a4", 2),("a5", 2),
("b1", 2),("b2", 2),("b3", 2),("b4", 2),("b5", 2),

("a1", 3),("a2", 3),("a3", 3),
("b1", 3),("b2", 3),("b3", 3),
("c1", 3),("c2", 3),("c3", 3),
("d1", 3),("d2", 3),("d3", 3),
("e1", 3),("e2", 3),("e3", 3),

("a1", 4),("a2", 4),("a3", 4),("a4", 4),
("b1", 4),("b2", 4),("b3", 4),("b4", 4),
("c1", 4),("c2", 4),("c3", 4),("c4", 4),
("c1", 4),("c2", 4),("c3", 4),("c4", 4),

("a1", 5),("a2", 5),("a3", 5),("a4", 5),("a5", 5),
("b1", 5),("b2", 5),("b3", 5),("b4", 5),("b5", 5),
("c1", 5),("c2", 5),("c3", 5),("c4", 5),("c5", 5),
("d1", 5),("d2", 5),("d3", 5),("d4", 5),("d5", 5);

# 상영 시간 등록.
# 4관 13:50, 19:10,
# 1관 16:20
# 3관 09:00, 11:50
# 5관 10:00
insert into schedule(sd_date, sd_time, sd_pos_seat, sd_early, sd_mv_num, sd_sc_num) values
("2025-03-11", "13:50", 16, "n", 1, 4),
("2025-03-11", "19:10", 16, "n", 1, 4),
("2025-03-11", "16:20", 12, "n", 1, 1),
("2025-03-11", "09:00", 15, "y", 1, 3),
("2025-03-11", "11:50", 15, "n", 1, 3),
("2025-03-11", "10:00", 20, "y", 1, 5);

# 회원가입하는 쿼리. 아이디 : abc123, 비번 : abc123, 사용자
insert into member(me_id, me_pw, me_authority) values
("abc123", "abc123", "user");

# abc123 회원이 3번 스케줄(미키 17, 1관 3월 11일 16:20)의 예약 가능한 좌석 a1, a2를 예매했을 때 필요한 쿼리
# 성인 1, 청소년1
# 예매 테이블에 추가하는 쿼리
insert into ticket(ti_adult, ti_teen, ti_price, ti_me_num, ti_sd_num) values
(1,1, 27000, 1, 3);
# 예매 리스트 테이블에 추가하는 쿼리
insert into ticket_list(tl_ti_num, tl_se_num) values (1, 1), (1, 2);

# abc123 회원이 1번 스케줄(미키 17, 4관 3월 11일 13:50)의 예약 가능한 좌석 a1, a2를 예매했을 때 필요한 쿼리
insert into ticket(ti_adult, ti_teen, ti_price, ti_me_num, ti_sd_num) values
(1, 1, 27000, 1, 1);
insert into ticket_list(tl_ti_num, tl_se_num) values (2, 38), (2, 39);

# abc123 회원이 2번 스케줄(미키 17, 4관 3월 11일 19:20)의 예약 가능한 좌석 a1, a2를 예매했을 때 필요한 쿼리
insert into ticket(ti_adult, ti_teen, ti_price, ti_me_num, ti_sd_num) values
(1, 1, 27000, 1, 2);
insert into ticket_list(tl_ti_num, tl_se_num) values (3, 38), (3, 39);

# abc123 회원이 2번 스케줄(미키 17, 4관 3월 11일 19:20)의 예약 가능한 좌석 a3, a4를 예매했을 때 필요한 쿼리
insert into ticket(ti_adult, ti_teen, ti_price, ti_me_num, ti_sd_num) values
(1, 1, 27000, 1, 2);
insert into ticket_list(tl_ti_num, tl_se_num) values (4, 40), (4, 41);

# abc123회원이 2번 스케줄에 예약했던 좌선 a3, a4를 취소했을 때 필요한 쿼리 
update ticket set ti_state = "취소" where ti_num =4;