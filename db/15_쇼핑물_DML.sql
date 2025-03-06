use shoppingmall;
# 회원이 다음의 정보로 회원 가입을 했을 때 필요한 쿼리
# 아이디 : ABC123, 비번 : ABC123, 이메일 : ABC123@DB.COM, 전화번호 : 111-1234-5678
insert into member(me_id, me_pw, me_email, me_number) 
values("ABC123", "ABC123", "ABC123@DB.COM", "111-1234-5678");

# 관리자가 다읨 정보로 회원 가입을 했을 때 필요한 쿼리 
# 아이디 : ADMIN123, 비번 : ADMIN123, 이메일 : ADMIN123@DB.COM, 전화번호 : 111-2222-3333
insert into member(me_id, me_pw, me_email, me_number, me_authority) 
values("ADMIN123", "ADMIN123", "ADMIN123@DB.COM", "111-2222-3333" ,"admin");

# 카테고리를 등록할 때 필요한 쿼리
# 상의 : top, 하의 : pan, 악세사리 : acc, 모자 : cap, 신발 : sho
insert into category(ca_name, ca_code) values
("상의", "top"),("하의", "pan"),("악세사리", "acc"),("모자", "cap"),("신발", "sho");

# 제품을 등록하기 위한 프로시저를 만드세요. 

drop procedure if exists insert_product;

delimiter //
create procedure insert_product(
	in _ca_code char(3),
    in _title varchar(100),
    in _content longtext,
    in _price int,
    in _thumb varchar(200)
)
begin
	declare _count int;
    declare _count_str char(3);
    declare _pr_code char(6);
    declare _ca_num int;
    
    # pr_code가 _ca_code로 시작하는 제품의 개수 + 1를 구함 
    set _count = (select count(*) + 1 from product where pr_code like concat(_ca_code, '%'));
    
    # 제품의 개수를 이용하여 3자리 문자열을 만듬. 빈 자리는 앞에 0으로 채움 
    set _count_str = lpad(_count, 3, "0");
    
    # 제품 코드는 _ca_code와 위에서 구한 3자리 문자열을 합해서 구함 
    set _pr_code = concat(_ca_code, _count_str);
    
    # _ca_code를 이용해서 pr_ca_num를 구함 
    set _ca_num = (select ca_num from category where ca_code = _ca_code);
    # 위에서 구한 값들을 이용하여 insert문 작성 
    insert product(pr_code, pr_title, pr_content, pr_price, pr_thumb, pr_ca_num)
    values(_pr_code, _title, _content, _price, _thumb, _ca_num );
end //
delimiter ;

call insert_product("top", "셔츠입니다.", "셔츠를 싸게 팝니다.", 10000, "/img/top_01.jpg");
call insert_product("top", "반팔", "반팔입니다.", 5000, "/img/top_02.jpg");
call insert_product("top", "긴팔", "긴팔입니다..", 15000, "/img/top_03.jpg");

call insert_product("pan", "반바지", "시원한 반바지입니다.", 7000, "/img/pan_01.jpg");
call insert_product("pan", "청바지", "스타일한 청바지입니다.", 30000, "/img/pan_02.jpg");
call insert_product("pan", "면바지", "편한 면바지입니다.", 40000, "/img/pan_03.jpg");

call insert_product("acc", "반지 14k", "커플링", 100000, "/img/acc_01.jpg");
call insert_product("acc", "목걸이 14k", "금목걸이", 150000, "/img/acc_02.jpg");
call insert_product("acc", "순금반지 1돈", "돌반지", 400000, "/img/acc_03.jpg");

call insert_product("cap", "빈티지 모자", "모자입니다.", 12000, "/img/cap_01.jpg");
call insert_product("cap", "위생 모자", "모자입니다.", 15000, "/img/cap_02.jpg");
call insert_product("cap", "선캡", "모자입니다.", 40000, "/img/cap_03.jpg");

call insert_product("sho", "장화", "장화", 20000, "/img/sho_01.jpg");
call insert_product("sho", "런닝화", "편한 런닝화", 200000, "/img/sho_02.jpg");
call insert_product("sho", "구두", "스타일 좋은 구두", 300000, "/img/sho_03.jpg");

# ABC123회원이 top001 제품을 장바구니에 3개 담았을 때 쿼리
insert cart(ct_amount, ct_me_id, ct_pr_code) values(3, "ABC123", "top001");
# ABC123회원이 sho001 제품을 장바구니에 1개 담았을 때 쿼리
insert cart(ct_amount, ct_me_id, ct_pr_code) values(1, "ABC123", "sho001");

# ABC123회원이 장바구니에 담긴 모든 제품을 구매할 때 쿼리 
# 구매 테이블에 총 가격과 구매자를 추가하는 쿼리 
insert into buy(bu_total_price, bu_me_id) values("50000", "ABC123");
# 구매 리스트에 장바구니에 담긴 제품들을 추가하는 쿼리 
insert into buy_list(bl_amount, bl_price, bl_bu_num, bl_pr_code)
select 3, 30000, max(bu_num), "top001" from buy;
insert into buy_list(bl_amount, bl_price, bl_bu_num, bl_pr_code)
select 1, 20000, max(bu_num), "sho001" from buy;
# 장바구니에 있는 목록들을 제거하는 쿼리 
delete from cart where ct_me_id = 'ABC123' and ct_pr_code = 'top001';
delete from cart where ct_me_id = 'ABC123' and ct_pr_code = 'sho001';

# abc123회원이 구매한 제품들을 구매확정을 했을 때 쿼리 
update buy 
set bu_state = "구매확정", bu_final_date =now() where bu_me_id = 'ABC123' ;