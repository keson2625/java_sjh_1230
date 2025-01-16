package day13;

import java.util.Scanner;

public class Ex06_Eunm {
	
	/*	열거형	
	 * 	- 상수데이터들의 집합
	 *  - enum을 애용하여 선언
	 *  - 사용하는 값을 제한할 수 있음
	 *  enum 열거형명{
	 *  값1,값2,값3,...,값n
	 *  }
	 * 
	 */

	public static void main(String[] args) {
		System.out.print("계절 입력(봄:SPRING, 여름:SUMMER, 가을:FALL, 겨울:WINTER) : ");
		Scanner scan = new Scanner(System.in);
		String str = scan.next();
		
		/* valueOf(문자열) : 입력한 문자열과 이름이 같은 결거형 값이 있으면 해당 객체로 리턴
		 * 없으면 예외가 발생
		 */
		Season season = Season.valueOf(str);
		
		switch(season) {
		case SPRING:
			System.out.println("봄");
			break;
		case SUMMER:
			System.out.println("여름");
			break;
		case FALL:
			System.out.println("가을");
			break;
		case WiNTER:
			System.out.println("겨울");
			break;
		}
		
		System.out.print("계절 입력(봄:1, 여름:2, 가을:3, 겨울:4) : ");
		int num = scan.nextInt();
		
		/* 열거형.values() : 열거형 객채 안에 있는 모든 상수들을 배열로 반환
		 * 열거형객체.ordinnal() : 열거형 객체의 순서를 알려줌. 0부터 시작
		 */
		
		for(Season tmp : season.values()) {
			if(num == tmp.ordinal() + 1) {
				season =tmp;
			}
		}
		
		switch(season) {
		case SPRING:
			System.out.println("봄");
			break;
		case SUMMER:
			System.out.println("여름");
			break;
		case FALL:
			System.out.println("가을");
			break;
		case WiNTER:
			System.out.println("겨울");
			break;
		}
	}
}


enum Season{
		SPRING, SUMMER, FALL, WiNTER
}