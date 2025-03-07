drop database if exists `cgv`;

create database `cgv`;

use `cgv`;

drop table if exists `movie`;

create table `movie` (
	`mv_num`	int primary key auto_increment	not null,
	`mv_title`	varchar(200) not	null,
	`mv_time`	int not	null,
	`mv_date`	date	null,
	`mv_content`	longtext not	null,
	`mv_state`	enum("상영중", "상영예정","상영종료") not	null,
	`mv_mr_age`	varchar(10)	not null
);

drop table if exists `genre`;

create table `genre` (
	`gr_name`	varchar(10) primary key	not null
);

drop table if exists `movie_genre`;

create table `movie_genre` (
	`mg_num`	int primary key auto_increment	not null,
	`mg_mv_num`	int	not null,
	`mg_gr_name`	varchar(10)	not null
);

drop table if exists `actor`;

create table `actor` (
	`at_num`	int primary key auto_increment	not null,
	`at_position`	enum("배우","감독") not	null,
	`at_pr_num`	int	not null
);

drop table if exists `movie_actor`;

create table `movie_actor` (
	`ma_num`	int primary key auto_increment	not null,
	`ma_role`	varchar(50) not	null,
	`ma_mv_num`	int	not null,
	`ma_at_num`	int	not null
);

drop table if exists `country`;

create table `country` (
	`ct_name`	varchar(50) primary key	not null
);

drop table if exists `movie_country`;

create table `movie_country` (
	`mc_num`	int primary key auto_increment	not null,
	`mc_ct_name`	varchar(50)	not null,
	`mc_mv_num`	int	not null
);

drop table if exists `file`;

create table `file` (
	`fi_num`	int primary key auto_increment	not null,
	`fi_name`	varchar(255) not	null,
	`fi_type`	enum("s","t") not	null,
	`fi_mv_num`	int	not null
);

drop table if exists `person`;

create table `person` (
	`pr_num`	int primary key auto_increment	not null,
	`pr_name`	varchar(50) not	null,
	`pr_birth`	date	null,
	`pr_detail`	longtext not	null,
	`pr_ct_name`	varchar(50)	not null
);

drop table if exists `movie_ratings`;

create table `movie_ratings` (
	`mr_age`	varchar(10) primary key	not null,
	`fIELD`	varchar(255)	null
);

drop table if exists `schedule`;

create table `schedule` (
	`sd_num`	int primary key auto_increment	not null,
	`sd_date`	date not	null,
	`sd_time`	time not	null,
	`sd_pos_seat`	int not	null,
	`sd_early`	enum("y","n") default "n" not 	null,
	`sd_mv_num`	int	not null,
	`sd_sc_num`	int	not null
);

drop table if exists `screen`;

create table `screen` (
	`sc_num`	int primary key auto_increment	not null,
	`sc_name`	varchar(20) not	null,
	`sc_seat`	int not	null,
	`sc_pos`	enum("y","n") default "y" not	null,
	`sc_tt_num`	int	not null
);

drop table if exists `theater`;

create table `theater` (
	`tt_num`	int primary key auto_increment	not null,
	`tt_name`	varchar(30) not	null,
	`tt_addr`	varchar(255) not	null,
	`tt_count`	int not	null,
	`tt_rg_name`	varchar(15)	not null
);

drop table if exists `region`;

create table `region` (
	`rg_name`	varchar(15) primary key	not null
);

drop table if exists `seat`;

create table `seat` (
	`se_num`	int primary key auto_increment	not null,
	`se_name`	varchar(3) not	null,
	`se_pos`	enum("y","n") default "y" not	null,
	`sc_sc_num`	int	not null
);

drop table if exists `member`;

create table `member` (
	`me_num`	int primary key auto_increment	not null,
	`me_id`	varchar(13) unique not	null,
	`me_pw`	varchar(15) not	null,
	`me_authority`	enum("admin","user") default "user" not	null
);

drop table if exists `ticket`;

create table `ticket` (
	`ti_num`	int primary key auto_increment	not null,
	`ti_adult`	int not	null,
	`ti_teen`	int not	null,
	`ti_price`	int not	null,
	`ti_state`	enum("결재","취소") default "결재" not	null,
	`ti_mv_num`	int	not null,
	`ti_me_num`	int	not null,
	`ti_sd_num`	int	not null
);

drop table if exists `ticket_list`;

create table `ticket_list` (
	`tl_num`	int primary key auto_increment	not null,
	`tl_ti_num`	int	not null,
	`tl_se_num`	int	not null
);

drop table if exists `fee`;

create table `fee` (
	`fe_num`	int primary key auto_increment	not null,
	`fe_type`	varchar(10) not	null,
	`fe_price`	int not	null,
	`fe_date`	date	null
);

alter table `movie` add constraint `fk_movie_ratings_to_movie_1` foreign key (
	`mv_mr_age`
)
references `movie_ratings` (
	`mr_age`
);

alter table `movie_genre` add constraint `fk_movie_to_movie_genre_1` foreign key (
	`mg_mv_num`
)
references `movie` (
	`mv_num`
);

alter table `movie_genre` add constraint `fk_genre_to_movie_genre_1` foreign key (
	`mg_gr_name`
)
references `genre` (
	`gr_name`
);

alter table `actor` add constraint `fk_person_to_actor_1` foreign key (
	`at_pr_num`
)
references `person` (
	`pr_num`
);

alter table `movie_actor` add constraint `fk_movie_to_movie_actor_1` foreign key (
	`ma_mv_num`
)
references `movie` (
	`mv_num`
);

alter table `movie_actor` add constraint `fk_actor_to_movie_actor_1` foreign key (
	`ma_at_num`
)
references `actor` (
	`at_num`
);

alter table `movie_country` add constraint `fk_country_to_movie_country_1` foreign key (
	`mc_ct_name`
)
references `country` (
	`ct_name`
);

alter table `movie_country` add constraint `fk_movie_to_movie_country_1` foreign key (
	`mc_mv_num`
)
references `movie` (
	`mv_num`
);

alter table `file` add constraint `fk_movie_to_file_1` foreign key (
	`fi_mv_num`
)
references `movie` (
	`mv_num`
);

alter table `person` add constraint `fk_country_to_person_1` foreign key (
	`pr_ct_name`
)
references `country` (
	`ct_name`
);

alter table `schedule` add constraint `fk_movie_to_schedule_1` foreign key (
	`sd_mv_num`
)
references `movie` (
	`mv_num`
);

alter table `schedule` add constraint `fk_screen_to_schedule_1` foreign key (
	`sd_sc_num`
)
references `screen` (
	`sc_num`
);

alter table `screen` add constraint `fk_theater_to_screen_1` foreign key (
	`sc_tt_num`
)
references `theater` (
	`tt_num`
);

alter table `theater` add constraint `fk_region_to_theater_1` foreign key (
	`tt_rg_name`
)
references `region` (
	`rg_name`
);

alter table `seat` add constraint `fk_screen_to_seat_1` foreign key (
	`sc_sc_num`
)
references `screen` (
	`sc_num`
);

alter table `ticket` add constraint `fk_movie_to_ticket_1` foreign key (
	`ti_mv_num`
)
references `movie` (
	`mv_num`
);

alter table `ticket` add constraint `fk_member_to_ticket_1` foreign key (
	`ti_me_num`
)
references `member` (
	`me_num`
);

alter table `ticket` add constraint `fk_schedule_to_ticket_1` foreign key (
	`ti_sd_num`
)
references `schedule` (
	`sd_num`
);

alter table `ticket_list` add constraint `fk_ticket_to_ticket_list_1` foreign key (
	`tl_ti_num`
)
references `ticket` (
	`ti_num`
);

alter table `ticket_list` add constraint `fk_seat_to_ticket_list_1` foreign key (
	`tl_se_num`
)
references `seat` (
	`se_num`
);
