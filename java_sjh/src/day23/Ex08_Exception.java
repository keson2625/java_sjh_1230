package day23;

public class Ex08_Exception {

	/* 다음코드를 실행했을 때 생기는 예외에 대한 원인과 해결방법에 대해 설명
	 */
	
	public static void main(String[] args) {
		
	int num1 = 1, num2 = 0;
	//방법1: num2가 0이 되지 않게 수정
	//방법2: try catch를 이용하여 예외 처리
	
	try {
	System.out.println(num1 + "/" + num2 + "="+ num1/num2);
	
	System.out.println("프로그램 종료");

	} catch (Exception e) {
		System.out.println("예외발생");
	}	
	System.out.println("종료");
	}
}