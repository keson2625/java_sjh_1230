package day01;

public class Ex04_Variable_Overflow {
	
	public static void main(String[] args) {
		byte num1 = 127;
		num1++;//num1를 1씩 증가 //오버 플로우
		System.out.println(num1);//byte로 표현 가능한 가장 큰 숫자에 1을 더하면 127이 아닌 -128이 나옴
		
		byte num2 = 127;
		num1--;//num2를 1씩 감소 //언더 플로우
		System.out.println(num2);//byte로 표현 가능한 가장 작은 숫자에 1을 빼면 -128이 아닌 127이 나옴
		
	}

}
