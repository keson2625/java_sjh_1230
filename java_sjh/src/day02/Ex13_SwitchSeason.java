package day02;

public class Ex13_SwitchSeason {

	public static void main(String[] args) {

		/*
		 * 월이 주어졌을 떄 월에 맞는 계절을 출력 봄 : 3,4,5 여름 : 6,7,8 가을 : 9,10,11 겨울 : 12,1,2 
		 * 잘못된 월 : 그외
		 */
		int month = 4;
		// A==a, A==b, A==c
		switch (month) {
		case 3, 4, 5:
			System.out.println(month + "월은 봄");
			break;
		case 6, 7, 8:
			System.out.println(month + "월은 여름");
			break;
		case 9, 10, 11:
			System.out.println(month + "월은 가을");
			break;
		case 12, 1, 2:
			System.out.println(month + "월은 겨울");
			break;
		default:
			System.out.println("잘못된 월");
		}
	}
}
