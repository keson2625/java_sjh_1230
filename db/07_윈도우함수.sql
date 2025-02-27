# 윈도우 함수
# 테이블의 행과 행 사이의 관계를 정의하는 함수
# over절이 들어간 함수
# 순위를 표현할 때 사용
# a : 10, b : 5, c : 10, d : 10, f : 9, g : 8

# row_number() over(order by 속성 정렬방법)
#	-값이 같더라도 다른 번호를 부여
use window_fucn;
select row_number() over(order by ts_score desc)as 순위, 
	team_score.* from team_score;
    
# rank() over(order by 속성 정렬방법)
# 값이 같으면 같은 등수로 표시. 다음 등수는 같은 등수가 있는 개수만큼 건너뜀
select rank() over(order by ts_score desc)as 순위, team_score.* from team_score;

# dense_rank() over(order by 속성 정렬방법)
# 값이 같으면 같은 등수로 표시. 다음 등수는 건너 뛰지 않고 이어서 진행
select dense_rank() over(order by ts_score desc)as 순위, team_score.* from team_score;

# ntile(그룹수) over(order by 속성 정렬방법)
# 결과 전체를 지정된 그룹 수만큼 분할하여 번호를 할당
select ntile(2) over(order by ts_score desc)as 순위, team_score.* from team_score;
