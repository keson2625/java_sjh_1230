drop database if exists shopingmall;

create database shoppingmall;

use shoppingmall;

DROP TABLE IF EXISTS `buy`;

CREATE TABLE `buy` (
	`bu_num`	int primary key auto_increment	NOT NULL,
	`bu_date`	datetime default current_timestamp not	NULL,
	`bu_state`	varchar(4) default"구매"not	NULL,
	`bu_total-price`	int not	NULL,
	`bu_final_date`	datetime	NULL,
	`me_id`	varchar(13)	NOT NULL
);

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
	`ca_num`	int primary key auto_increment	NOT NULL,
	`ca_name`	varchar(10) unique not	NULL,
	`ca_code`	char(3) unique not	NULL
);

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`me_id`	varchar(13) primary key	NOT NULL,
	`me_pw`	varchar(20) not	NULL,
	`me_email`	varchar(50) unique	NULL,
	`me_number`	varchar(13) unique not	NULL,
	`me_fail`	int default 0 not	NULL,
	`me_authority`	enum("admin","user")default "user"not	NULL,
	`me_del`	enum("y","n") default "n" not	NULL
);

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
	`pr_code`	char(6) primary key	NOT NULL,
	`pr_name`	varchar(100) not	NULL,
	`pr_content`	longtext not	NULL,
	`pr)prlce`	int not	NULL,
	`pr_thumb`	varchar(200)	NULL,
	`pr_del`	enum("y","n") default"n"not	NULL,
	`pr_amount`	int default 0 not	NULL,
	`pr_ca_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `buy_list`;

CREATE TABLE `buy_list` (
	`bl_num`	int primary key auto_increment	NOT NULL,
	`bl_amount`	int not	NULL,
	`bl_price`	int not	NULL,
	`bu_num`	int	NOT NULL,
	`pr_code`	char(6)	NOT NULL
);

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
	`ct_num`	int  primary key auto_increment	NOT NULL,
	`ct_amount`	int default 0 not	NULL,
	`ct_me_id`	varchar(13)	NOT NULL,
	`ct_pr_code`	char(6)	NOT NULL
);


ALTER TABLE `buy` ADD CONSTRAINT `FK_member_TO_buy_1` FOREIGN KEY (
	`me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `product` ADD CONSTRAINT `FK_category_TO_product_1` FOREIGN KEY (
	`pr_ca_num`
)
REFERENCES `category` (
	`ca_num`
);

ALTER TABLE `buy_list` ADD CONSTRAINT `FK_buy_TO_buy_list_1` FOREIGN KEY (
	`bu_num`
)
REFERENCES `buy` (
	`bu_num`
);

ALTER TABLE `buy_list` ADD CONSTRAINT `FK_product_TO_buy_list_1` FOREIGN KEY (
	`pr_code`
)
REFERENCES `product` (
	`pr_code`
);

ALTER TABLE `cart` ADD CONSTRAINT `FK_member_TO_cart_1` FOREIGN KEY (
	`ct_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `cart` ADD CONSTRAINT `FK_product_TO_cart_1` FOREIGN KEY (
	`ct_pr_code`
)
REFERENCES `product` (
	`pr_code`
);

