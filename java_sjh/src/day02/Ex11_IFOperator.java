package day02;

import java.util.Scanner;

public class Ex11_IFOperator {

	public static void main(String[] args) {
		/*
		 * 두 정수와 산술연산자를 입력받는 코드를 작성 ex) (1+2) : 3 * 4 3 * 4
		 */
		int num1, num2;
		char oper;
		Scanner scan = new Scanner(System.in);

		System.out.println("두 정수와 산술연산자를 입력하세요(예 : 1 + 2) : ");
		num1 = scan.nextInt();
		oper = scan.next().charAt(0);
		num2 = scan.nextInt();

		/*
		 * 연산자가 +이면 두수의 더한 값을 출력 // operator +와 같다면 num1 + num2을 출력 
		 * 연산자가 -이면 두수의 뺀 값을 출력 // operator -와 같다면 num1 - num2을 출력 
		 * 연산자가 *이면 두수의 곱 값을 출력 // operator *와 같다면 num1 * num2을 출력 
		 * 연산자가 /이면 두수의 나눈 값을 출력 // operator /와 같다면 num1 / num2을 출력 
		 * 연산자가 %이면 두수의 나머지 값을 출력 // operator %와 같다면 num1 % num2을 출력 
		 * 산술연산자가 아니면 '잘못된 연산자'라고 출력
		 */

		if(oper == '+'){
			System.out.println("" + num1 + " " + oper + " " + num2 + " = " + (num1 + num2));}
		else if(oper == '-'){
			System.out.println("" + num1 + " " + oper + " " + num2 + " = " + (num1 - num2));}
		else if(oper == '*'){
				System.out.println("" + num1 + " " + oper + " " + num2 + " = " + (num1 * num2));}
		else if(oper == '/'){
				System.out.println("" + num1 + " " + oper + " " + num2 + " = " + (num1 / num2));}
		else if(oper == '%'){
				System.out.println("" + num1 + " " + oper + " " + num2 + " = " + ((double)num1 % num2));}
		else{
				System.out.println(oper + "는 잘못된 연산자 입니다.");
		}
	}
}
