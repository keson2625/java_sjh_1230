package day02;

public class Ex18_Forcount {

	public static void main(String[] args) {
		
		/* 1부터 5까지 출력하는 코드를 작성(for문을 이용해서)
		 * 반복횟수 : i는 1부터 5까지 1씩 증가
		 * 규칙성 : i를 출력
		 * 반복문 종료 후 : 없음
		 */
		
		int i = 1, a = 1;
		for(i = 1; i<=5; ++i) {
			System.out.println(a++);
		}
		/*for(int i =1; i<=5; ++i) {
			System.out.println(i);
		}*/
	}
}