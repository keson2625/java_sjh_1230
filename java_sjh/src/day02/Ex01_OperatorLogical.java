package day02;

public class Ex01_OperatorLogical {

	public static void main(String[] args) {
		
		//성적을 저장하기 위한 정수 변수를 선언하고, 80으로 초기화
		
		int score = 80;
		
		/*성적이 80점이 이상이고 성적이 90점 미만이면 B이다
		*score가 80보다 (크거나 같)고 score가 90 보다 (작다)
		*score가 80보다 (크거나 같다) && score가 90보다 (작다)
		*score >= 80 && score <90
		*/
		boolean isb = score >= 100 && score <90;
		System.out.println(score + "는 B입니까? " + isb);
		
		//나이가 19세 이상이면 성인으로 판별하는 예제
		int age = 15;
		/*나이가 19세 이상이다
		 * age가 19보다 크거나 같다 
		 */
		
		boolean isa = age >= 19;
		System.out.println(age + "살은 성인입니까? " + isa);
		//나이가 19세 이상이 아니면 청소년으로 판별하는 예제(!연산자 사용)
		System.out.println(age + "살은 청소년입니까? " + !isa);
		
		//정수가 0이상인지 판별하는 예제(||연산자 사용)
		int num = 10;
		//num이 0보다 크거나 num이  과 같다
		boolean ispositive = num > 0 || num == 0; //num >= 10 <=이렇게 사용도 가능
		System.out.println(num + "는 0이상인가? " + ispositive);
	}
}
