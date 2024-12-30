package day01;

public class Ex07_Variable_Naming {

	public static void main(String[] args) {
		int num = 10;
		
		int NUM = 10; //	1. 대소문자 구분, 서로 다른변수
		
		//int int;//		2. 예약어(키워드)는 사용불가
		
		//int 1num = 10; //	3. 변수명은 숫자로 시작불가 
		
		int _num = 10; //	4. 특수문자는 _와 $만 가능
		//int n um = 10; 불가
		//int %num = 10; 불가

		//int num = 20;//	5. 중복선언 불가
	}
}
