drop database if exists `university`;

create database `university`;

use `university`;

drop table if exists `department`;

create table `department` (
	`de_num`	char(3) primary key	not null,
	`de_name`	varchar(50) not	null,
	`de_office`	varchar(255)	null,
    `de_name_num`	char(3) unique not	null,
	`de_pr_num`	char(11)	
);

drop table if exists `professor`;

create table `professor` (
	`pr_num`	char(11)  primary key	not null,
	`pr_name`	varchar(50) not	null,
	`pr_phone`	varchar(13) not	null,
	`pr_res_num`	char(14) unique not	null,
	`pr_year`	int not	null,
	`pr_de_num`	char(3)	not null
);

drop table if exists `student`;

create table `student` (
	`st_num`	char(10)  primary key	not null,
	`st_name`	varchar(50) not	null,
	`st_res_num`	char(14) unique not	null,
	`st_phone`	varchar(13) not	null,
	`st_year`	int not	null,
	`st_de_num`	char(3)	not null,
	`st_pr_num`	char(11)	null
);

drop table if exists `final_pass`;

create table `final_pass` (
	`fp_num`	int primary key auto_increment	not null,
	`fp_name`	varchar(50) not	null,
	`fp_phone`	varchar(13) not	null,
	`fp_year`	int not	null,
	`fp_res_num`	char(14) not	null,
	`fp_de_num`	char(3)	not null
);

drop table if exists `subject`;

create table `subject` (
	`sj_num`	int primary key auto_increment	not null,
	`sj_title`	varchar(50) not	null,
	`sj_point`	int  default 0 not	null,
	`sj_time`	int  default 0 not	null,
	`sj_code`	char(6) unique not	null,
	`sj_sc_code`	char(3)	not null
);

drop table if exists `subject_category`;

create table `subject_category` (
	`sc_code`	char(3)  primary key	not null,
	`fIELD`	varchar(255)	null
);

drop table if exists `lecture`;

create table `lecture` (
	`le_num`	int primary key auto_increment	not null,
	`le_year`	int not	null,
	`le_semester`	enum("1","2","여름","겨울") not	null,
	`le_class_room`	varchar(255)	null,
	`le_class`	int  default 1 not	null,
	`le_max`	int not	null,
	`le_plan`	longtext	null,
	`le_sj_num`	int	not null,
	`le_pr_num`	char(11)	not null
);

drop table if exists `lecture_schedule`;

create table `lecture_schedule` (
	`lc_num`	int primary key auto_increment	not null,
	`lc_day`	char(1) not	null,
	`lc_time`	varchar(2) not	null,
	`lc_minute`	char(1) not	null,
	`lc_le_num`	int	not null
);

drop table if exists `lecture_standard`;

create table `lecture_standard` (
	`ls_num`	int primary key auto_increment	not null,
	`ls_mid`	int  default 35 not	null,
	`ls_final`	int  default 45 not	null,
	`ls_home`	int  default 10 not	null,
	`ls_att`	int  default 10 not	null,
	`ls_le_num`	int	not null
);

drop table if exists `course`;

create table `course` (
	`co_num`	int primary key auto_increment	not null,
	`co_att`	int default 0 not	null,
	`co_home`	int default 0 not	null,
	`co_mid`	int  default 0 not	null,
	`co_final`	int  default 0 not	null,
	`co_total`	varchar(4)	null,
	`co_st_num`	char(10)	not null,
	`co_le_num`	int	not null
);


alter table `department` add constraint `fk_professor_to_department_1` foreign key (
	`de_pr_num`
)
references `professor` (
	`pr_num`
);

alter table `professor` add constraint `fk_department_to_professor_1` foreign key (
	`pr_de_num`
)
references `department` (
	`de_num`
);

alter table `student` add constraint `fk_department_to_student_1` foreign key (
	`st_de_num`
)
references `department` (
	`de_num`
);

alter table `student` add constraint `fk_professor_to_student_1` foreign key (
	`st_pr_num`
)
references `professor` (
	`pr_num`
);

alter table `final_pass` add constraint `fk_department_to_final_pass_1` foreign key (
	`fp_de_num`
)
references `department` (
	`de_num`
);

alter table `subject` add constraint `fk_subject_category_to_subject_1` foreign key (
	`sj_sc_code`
)
references `subject_category` (
	`sc_code`
);

alter table `lecture` add constraint `fk_subject_to_lecture_1` foreign key (
	`le_sj_num`
)
references `subject` (
	`sj_num`
);

alter table `lecture` add constraint `fk_professor_to_lecture_1` foreign key (
	`le_pr_num`
)
references `professor` (
	`pr_num`
);

alter table `lecture_schedule` add constraint `fk_lecture_to_lecture_schedule_1` foreign key (
	`lc_le_num`
)
references `lecture` (
	`le_num`
);

alter table `lecture_standard` add constraint `fk_lecture_to_lecture_standard_1` foreign key (
	`ls_le_num`
)
references `lecture` (
	`le_num`
);

alter table `course` add constraint `fk_student_to_course_1` foreign key (
	`co_st_num`
)
references `student` (
	`st_num`
);

alter table `course` add constraint `fk_lecture_to_course_1` foreign key (
	`co_le_num`
)
references `lecture` (
	`le_num`
);
