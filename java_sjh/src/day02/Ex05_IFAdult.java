package day02;

public class Ex05_IFAdult {

	public static void main(String[] args) {
		/*
		 * 나이를 저장하는 변수 age를 선언 및 초기화하고 age가 19세 이상이면 성인, 이상이 아니면 청소년으로 나오는 코드를 작성
		 * '면'이 붙으면 보통 if이다
		 */
		
		int num = 20;
		
		if(num >= 19) {
			System.out.println(num + "는 성인이다.");
		}
		
		if(num <= 19) //if(!(num >= 19)) => 이런식으로도 사용 가능
		{
			System.out.println(num + "는 청소년이다.");
		}
}
}
