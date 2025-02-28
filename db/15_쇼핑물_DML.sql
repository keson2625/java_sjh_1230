# 회원이 다음의 정보로 회원 가입을 했을 때 필요한 쿼리
# 아이디 : abc123, 비번 : abc123, 이메일 : abc123@db.com, 전화번호 : 111-1234-5678
insert into member(me_id, me_pw, me_email, me_number)
values("abc123", "abc123", "abc123@db.com", "111-1234-5678");

# 관리자가 다음 정보로 회원 가입을 했을 때 필요한 쿼리
# 아이디 : admin123, 비번 : admin123, 이메일 : admin@db.com, 전화번호 : 111-2222-3333
insert into member(me_id, me_pw, me_email, me_number, me_authority)
values("admin123", "admin123", "admin123123@db.com", "111-2222-3333", "admin");

# 카테고리를 등록할 때 필요한 쿼리
# 상의 : top, 하의 : pan, 악세사리 : acc, 모자: cap, 신발 : sho
insert into category(ca_name, ca_code)
values("상의", "top"), ("하의", "pan"), ("악세사리", "acc"), ("모자", "cap"), ("신발", "sho");