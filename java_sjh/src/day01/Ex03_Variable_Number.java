package day01;

public class Ex03_Variable_Number {
	
	public static void main(String[] args) {
		byte num1 = 1;
		//num1 = 12345 //byte가 저장할수 있는 범위를 넘어서 에러발생
		System.out.println(num1);
		
		int num2 = 12345;
		//num2 = 123456789012;//int가 저장할수 있는 범위를 넘어서 에러발생
		System.out.println(num2);
		
		long num3 = 123456789012L;
		//long은 점미사에 L(ㅣ)을 안붙이면 에러발생 
		System.out.println(num3);
		
		float num4 = 3.14f;//3.14은 double형이기에 float에 저장불가
		//float는 점미사에 F(f)를 안붙이면 에러발생
		//소주점 9자리까지는 확인가능
		System.out.printf("%.9f\n", num4);
	
		double num5 = 3.14;
		//소수점 20자리까지 확인
		System.out.printf("%.20f\n", num5);
		
		//십진수 표현이 아닌 값을 정수에 저장하는 예제
		int num6 = 0x10; //16진수 10 => 16
		System.out.println(num6);
		
		int num7 = 0x10; //8진수 10 => 8
		System.out.println(num7);
		
		int num8 = 0x10; //2진수 10 => 2	
		System.out.println(num8);
		
		int num9 = 'A'; //'A'의 해당하는 정수 값 => 65
		System.out.println(num9);
		
		double num10 = 1e3; //1*10^3 => 1000
		System.out.println(num10);
	}
}
