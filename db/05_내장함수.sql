# 내장함수 - 문자열 
# char_length(문자열) : 문자열 개수 
select char_length("안녕하세요") as char_length;
# length(문자열) : 바이트 수 
select length("안녕하세요") as length;
# concat(문자열1, ...) : 문자열을 이어 붙임 
select concat("안녕", "하", "세요?") as concat;
# field(찾을문자열, 문자열1, ....) : 찾을 문자열의 위치를 찾아 반환 . 위치는 1부터 시작
select field("안녕", "안녕하", "누구 안녕?", "안녕") as field;
# instr(기준문자열, 부분문자열) : 기준 문자열에서 부분 문자열의 위치를 찾아 반환. 위치는 1부터 시작
select instr("hello java", "java") as instr;
# locate(부분문자열, 기준문자열) : 기준 문자열에서 부분 문자열의 위치를 찾아 반환 . 위치는 1부터 시작
select locate("java", "hello java") as locate;
# format(숫자, 소수점자리) : 숫자를 소수점이하 자리까지 표현. 1000단위마다 ,를 추가 
select format(10000.123456, 0) as format;
# bin(숫자), oct(숫자), hex(숫자) : 2,8,16진수로 변환 
select bin(255) as bin,oct(255) as oct,hex(255) as hex ;
# insert(기준문자열, 위치, 길이, 삽입할문자열) : 기준문자열의 위치부터 길이만큼 지우고 삽입할 문자열을 끼워서 반환
select insert("hello java", 7, 4, "c++") as `insert`;
# left(문자열, 길이), right(문자열, 길이) : 왼쪽/오른족에서 문자열의 길이만큼 반환 
select left("test.txt", 4) as `left`, right("test.txt", 3) as `right`;
# lower(문자열), upper(문자열) : 소문자로/대문자로 
select lower("hello java") as `lower`, upper("HELLO JAVA") as `upper`;
# lpad(문자열, 길이, 채울문자열)/rpad(문자열,길이,채울문자열) : 문자열을 길이만큼 늘리고 빈곳을 채울문자열로 채움 
select lpad(1, 3, "0") as lpad, rpad(1, 3, "0") as rpad;
# repeat(문자열, 횟수) : 문자열을 횟수만큼 반복 
select repeat(1, 3) `repeat`;
# replace(문자열, 문자열a, 문자열b) : 문자열에서 문자열a를 문자열b로 바꿈 
select replace("hello java", "java", "c++") as `replace`;
# reverse(문자열) : 문자열 순서를 역순으로 반환 
select reverse("abcdef") as `reverse`;
# substring(문자열, 시작위치, 길이) 문자열에서 시작위치부터 길이만큼 부분문자열을 반환 
select substring("hello java", 7, 4) as substring;

# group by 할 때 group by에 사용한 속성이 아닌 속성을 조회하는 경우 에러가 발생하는데 이를 해결하는 쿼리
set global sql_mode = 'strict_trans_tables,no_engine_substitution';
# 원상 복구하는 쿼리
set global sql_mode = 'strict_trans_tables,no_engine_substitution,only_full_group_by';
select * from student group by st_grade;#테스트

# 내장함수 - 날짜/시간함수
# adddate/subdate(날짜, 차이) : 날짜를 기준으로 차이만큼 열(date)을 더한/뺀 날짜를 반환
select adddate("2025-02-27 13:00:00",2);
select adddate(now(), 14);
select subdate(now(), 14);
# addtime/subtime(시간/날짜, 차이) : 날짜/시간을 기준으로 차이만큼 시간을 더한/뺀 날짜를 반환
select addtime(now(), "02:00:00");
select subtime(now(), "00:10:00");
# year/month/day(날짜) : 날짜에서 년/월/일을 구함
select year(now())as year, month(now())as month, day(now())as day;
# hour/minute/second/microsecond(시간) : 시간에서 시/분/초/마이크로초를 반환
select hour(now())as hour, minute(now())as minute, second(now())as second,
	microsecond(now(6))as microsecond, microsecond("2025-02-27 10:09:03.123")as microsecond;
# date/time(날짜) : 날짜에서 년-월-일/시:분:초를 반환
select date(now()) date, time(now()) time;
# datediff(날짜1, 날짜2) : 날짜1에서 날짜2의 차이를 일로 반환. 날짜1 - 날짜2
select datediff(now(), "2025-02-26 13:00:00" ) datediff;
# timediff(날짜1/시간1, 날짜2/시간2) : 날짜1.시간1에서 날짜2/시간2의 차이를 시간:분:초로 반환
select timediff(now(), "2025-02-26 13:00:00") timediff;
# now()sysdate() : 현재 날짜와 시간을 반환
select now(), sysdate();
# date_add/dete_sub(기준날짜, interval 간격 종류) : 기준 날짜에서 interval만큰 더한/뺀 날짜
# interval 종류
# year/month/day/hour/minute/second/microsecond/quarter/week
# year/month/day_hour/day_minute/day_microsecond : a_b => a에서 b까지의 시간들.(뒤에서부터 채움)
select date_add(now(), interval 1 day);
select date_add(now(), interval 1 quarter);
select date_add(now(), interval 1 week);
select date_add(now(), interval "1 1"year_month);
select date_add(now(), interval "1 12" day_microsecond);#1초 120000us뒤

# 수학 함수
# abs(숫자) : 절대값 
# ceil(숫자) : 소수점 첫번째 자리 올림
# floor(숫자) : 소수점 첫번째 자리 내림 
# round(숫자) : 소수점 첫번째 자리 반올림
select abs(1), abs(-1);
select ceil(1.49), floor(1.49), round(1.49);
select round(1.49, 1);
select ceil(1.59), floor(1.59), round(1.59);
