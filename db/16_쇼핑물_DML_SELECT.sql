# 카테고리 상의를 클릭했을 때 조회하는 쿼리 
select * from product where pr_ca_num = 1;

select * from product 
where pr_ca_num = (select ca_num from category where ca_name = '상의');

select * from product join category on ca_num = pr_ca_num
where ca_name = '상의';

select * from product 
where pr_ca_num = (select ca_num from category where ca_code = 'top');

select * from product
where pr_code like concat('top', '%');

# ABC123회원이 구매한 제품들 목록을 조회하는 쿼리 
select distinct product.* from buy 
join buy_list on bu_num = bl_bu_num
join product on pr_code = bl_pr_code 
where bu_me_id = 'abc123';

# 제품 가격이 만원 이상인 제품들을 조회하는 쿼리
select * from product where pr_price >= 10000;

# 제품 금액이 높은 순으로 조회하는 쿼리
select * from product 
order by pr_price desc;

# 제품별 판매 개수를 조회하는 쿼리 => outer join, sum(), buy_list, product, group by
select product.*, ifnull(sum(bl_amount), 0) as 판매수 from product 
left join buy_list on pr_code = bl_pr_code
group by pr_code;   

# 판매량이 제일 많은 제품을 조회하는 쿼리
select product.*, ifnull(sum(bl_amount), 0) as 판매수 from product 
left join buy_list on pr_code = bl_pr_code
group by pr_code
order by 판매수 desc limit 1;   

select * from(
	select dense_rank() over(order by 판매수 desc) rnk, buy_product.* from(
		select product.*, ifnull(sum(bl_amount), 0) as 판매수 from product 
		left join buy_list on pr_code = bl_pr_code
		group by pr_code) buy_product) t
where rnk= 1;

# 카테고리별 최고 금액을 조회하는 쿼리
select pr_ca_num 카테고리, max(pr_price) 최고금액 from product group by pr_ca_num;

# 카테고리별 최고 금액의 제품을 조회하는 쿼리
select * from product
join (select pr_ca_num 카테고리, max(pr_price) 최고금액 from product group by pr_ca_num ) t
on pr_ca_num = 카테고리
where pr_price = 최고금액
order by 카테고리;

# 사용자별 누적 구매액을 조회하는 쿼리
select me_id, ifnull(sum(bu_total_price), 0) as 누적금액 from buy
right join member on me_id = bu_me_id
group by me_id
order by 누적금액 desc;   

# "반"으로 제품을 검색했을 때 조회하는 쿼리 
select * from product
where pr_title like concat("%", "반", "%") or pr_content like concat("%", "반", "%");