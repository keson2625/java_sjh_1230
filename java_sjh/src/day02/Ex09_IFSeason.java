package day02;

public class Ex09_IFSeason {

	public static void main(String[] args) {
		/* 월이 주어졌을 떄 월에 맞는 계절을 출력
		 * 봄 : 3,4,5
		 * 여름 : 6,7,8
		 * 가을 : 9,10,11
		 * 겨울 : 12,1,2
		 * 잘못된 월 : 그외
		 */
		int month = 9;
		
		if(month == 3 || month == 4 || month == 5) {
			System.out.println(month + "월은 봄이다.");
		}
		else if(month == 6 || month == 7 || month == 8){
			System.out.println(month + "월은 여름이다.");
		}
		else if(month == 9 || month == 10 || month == 11){
			System.out.println(month + "월은 가을이다.");
		}
		else if(month == 12 || month == 1 || month == 2){
			System.out.println(month + "월은 겨울이다.");
		}
		else {
		//else if(month < 1 || month > 12) => 사용가능
			System.out.println(month + "월은 없는 계절 이다.");
		}
	}
}
