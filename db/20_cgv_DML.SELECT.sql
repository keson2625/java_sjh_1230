# 상영중인 영화를 조회하는 쿼리 : 영화 제목, 개봉일 
select mv_title 영화, mv_date 개봉일 from movie where mv_state = "상영중";

# cgv강남(1)을 선택하고, 미키 17(1)를 선택했을 때 상영 가능한 날짜를 조회하는 쿼리 
select distinct sd_date from schedule 
join screen on sc_num = sd_sc_num
where sd_mv_num = 1 and sc_tt_num = 1;

select distinct sd_date from schedule 
join screen on sc_num = sd_sc_num
join theater on tt_num = sc_tt_num
join movie on mv_num = sd_mv_num
where mv_title = "미키 17" and tt_name = "cgv강남";

# cgv강남 1관의 등록된 모든 좌석을 조회하는 쿼리 
select se_name from seat 
join screen on sc_num = se_sc_num
join theater on tt_num = sc_tt_num
where sc_name = "1관" and tt_name = "cgv강남" and se_pos = "y";

select se_name from seat 
where se_sc_num = 1 and se_pos = "y";

# cgv강남 1관(1)의 3월 11일 16:20에 상영하는 미키 17(3)의 좌석을 조회하는 쿼리 
select se_name from seat 
join schedule on sd_sc_num = se_sc_num
where se_pos = "y" and sd_num = 3;

# 2번 스케쥴에서 예약된 좌석들
select seat.* from seat 
	join schedule on sd_sc_num = se_sc_num
	left join ticket on ti_sd_num = sd_num
	left join ticket_list on ti_num = tl_ti_num
	where se_pos = "y" and sd_num = 2 and tl_se_num = se_num and ti_state = "결제";

# cgv강남 4관의 3월 11일 19:10에 상영하는 미키 17의 예약 가능한 좌석을 조회하는 쿼리 
# 예매 리스트와 join해서 예매가 안된 좌석을 조회 
select se_name from seat 
where se_sc_num = 4 and se_num not in(
	select se_num from seat 
	join schedule on sd_sc_num = se_sc_num
	left join ticket on ti_sd_num = sd_num
	left join ticket_list on ti_num = tl_ti_num
	where se_pos = "y" and sd_num = 2 and tl_se_num = se_num and ti_state = "결제");
 
 # 장르별 등록된 영화수를 조회하는 쿼리    
 select gr_name, count(mg_gr_name) 영화수 from genre 
 left join movie_genre on gr_name = mg_gr_name
 group by gr_name;

# 현재 시간을 기준으로 한달 사이에 개봉한 영화를 조회하는 쿼리
select * from movie 
where mv_date between date_sub(now(), interval 1 month) and now();

# 각 영화별 예매수를 조회하는 쿼리
# 예매수는 상영시간이 지나지 않은 예매만 해당
select movie.*, sum(ti_teen + ti_adult) 예매수 from movie
left join schedule on sd_mv_num = mv_num
left join ticket on ti_sd_num = sd_num
where ti_state = "결제" and concat(sd_date, " ", sd_time) >= now()
group by mv_num;

# 각 영화별 예매수를 조회하여 예매가 높은 순으로 조회하는 쿼리
select movie.*, sum(ti_teen + ti_adult) 예매수 from movie
left join schedule on sd_mv_num = mv_num
left join ticket on ti_sd_num = sd_num
where ti_state = "결제" and concat(sd_date, " ", sd_time) >= now()
group by mv_num
order by 예매수 desc;

# 각 영화별 예매수를 조회하여 예매율을 조회하는 쿼리 
# 예매율 = 영화 예매수 / 전체 영화 예매수 * 100
select movie.*, (sum(ti_teen + ti_adult)) 예매수,
sum(ti_teen + ti_adult) * 100 / sum(sum(ti_teen + ti_adult)) over() as 예매율
from movie
left join schedule on sd_mv_num = mv_num
left join ticket on ti_sd_num = sd_num
where ti_state = "결제" and concat(sd_date, " ", sd_time) >= now()
group by mv_num
order by 예매수 desc;

# 각 예매율 순으로 순위를 조회하는 쿼리
select rank() over(order by 예매율 desc) as 순위, m2.* from(
	select movie.*, (sum(ti_teen + ti_adult)) 예매수,
	sum(ti_teen + ti_adult) * 100 / sum(sum(ti_teen + ti_adult)) over() as 예매율
	from movie
	left join schedule on sd_mv_num = mv_num
	left join ticket on ti_sd_num = sd_num
	where ti_state = "결제" and concat(sd_date, " ", sd_time) >= now()
	group by mv_num) m2;
    
# 영화를 등록순으로 10개 조회하는 쿼리
select * from movie limit 10;

# 봉준호 감독이 참여한 영화를 조회하는 쿼리
select mv_title from movie
join movie_actor on mv_num = ma_mv_num
join actor on ma_at_num = at_num
join person on pr_num = at_pr_num
where pr_name = "봉준호";

# 청소년들이 가장 많이 예매한 영화를 조회하는 쿼리
select movie.*, sum(ti_teen) as 예매수 from ticket
right join schedule on sd_num = ti_sd_num
right join movie on sd_mv_num = mv_num
where ti_state = "결제"
group by mv_num
order by 예매수 desc
limit 0,1;

