package day01;

public class Ex10_Operator_Arithmetic {

	public static void main(String[] args) {
		int num1 = 1, num2 = 2;
		
		System.out.println(num1 + "+" + num2 + "=" + (num1 + num2));
		System.out.println(num1 + "-" + num2 + "=" + (num1 - num2));
		System.out.println(num1 + "*" + num2 + "=" + (num1 * num2));
		System.out.println(num1 + "/" + num2 + "=" + ((double)num1 / num2));
		//정수 / 정수 => 정수이므로 실수 / 정수로 변환해서 계산
		System.out.println(num1 + "%" + num2 + "=" + (num1 % num2));
	
	}
}
