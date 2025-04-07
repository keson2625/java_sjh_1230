drop database if exists `community`;

create database `community`;

use `community`;

drop table if exists `member`;

create table `member` (
	`me_id`	varchar(15) primary key	not null,
	`me_pw`	varchar(255) not	null,
	`me_email`	varchar(255) not	null,
	`me_authority`	varchar(5) default "user" not	null,
    `me_cookie`	varchar(255) ,
    `me_limit` datetime
);

drop table if exists `board`;

create table `board` (
	`bo_num`	int  primary key auto_increment	not null,
	`bo_name`	varchar(20) unique not	null
);

drop table if exists `post`;

create table `post` (
	`po_num`	int  primary key auto_increment	not null,
	`po_title`	varchar(255) not	null,
	`po_content`	longtext not	null,
	`po_date`	datetime default current_timestamp not	null,
	`po_view`	int default 0 not	null,
	`po_up`	int default 0 not	null,
	`po_down`	int default 0 not	null,
	`po_del`	char(1) default 'n' not	null,
	`po_me_id`	varchar(15)	null,
	`po_bo_num`	int	not null
);

drop table if exists `like`;

create table `like` (
	`li_num`	int primary key auto_increment	not null,
	`li_state`	int not	null,
	`li_me_id`	varchar(15)	not null,
	`li_po_num`	int	not null
);

drop table if exists `file`;

create table `file` (
	`fi_num`	int  primary key auto_increment	not null,
	`fi_ori_name`	varchar(255) not	null,
	`fi_name`	varchar(255) not	null,
	`fi_po_num`	int	not null
);

drop table if exists `comment`;

create table `comment` (
	`co_num`	int  primary key	not null,
	`co_content`	varchar(200)	not null,
	`co_date`	datetime default current_timestamp not	null,
	`co_ori_num`	int not	null,
	`co_del`	char(1)default 'N' not	null,
	`co_me_id`	varchar(15)	not null,
	`co_po_num`	int	not null
);

alter table `post` add constraint `fk_member_to_post_1` foreign key (
	`po_me_id`
)
references `member` (
	`me_id`
);

alter table `post` add constraint `fk_board_to_post_1` foreign key (
	`po_bo_num`
)
references `board` (
	`bo_num`
);

alter table `like` add constraint `fk_member_to_like_1` foreign key (
	`li_me_id`
)
references `member` (
	`me_id`
);

alter table `like` add constraint `fk_post_to_like_1` foreign key (
	`li_po_num`
)
references `post` (
	`po_num`
);

alter table `file` add constraint `fk_post_to_file_1` foreign key (
	`fi_po_num`
)
references `post` (
	`po_num`
);

alter table `comment` add constraint `fk_member_to_comment_1` foreign key (
	`co_me_id`
)
references `member` (
	`me_id`
);

alter table `comment` add constraint `fk_post_to_comment_1` foreign key (
	`co_po_num`
)
references `post` (
	`po_num`
);