package day03;

import java.util.Scanner;

public class Ex11_ForLcm {

	public static void main(String[] args) {
		
		/*	정수 num1과 num2를 입력받고 두정수의 최소 공배수를 구하는 코드를 작성
		 * 	A의 배수 : 어떤 수를 A로 나누었을 때 나머지가 0이 되는 수
		 * 	공배수 :	공통으로 있는 배수
		 * 	2의 배수 : 2 4 6 8 10 ....
		 *  3의 배수 : 3 6 9 12 ... 
		 *  2와3의 공배수 : 6 12 18 24 ... 
		 *  2와3의 최소 공배수 : 6 ... 
		 *  
		 *  반복횟수 : i는 1부터 1씩 증가
		 *  규칙성 : 	i가 num1과 num2의 배수이면 i를 출력하고 종료
		 *  	 =>	i를 num1로 나누었을 때 나머지가 0과 같고
		 *  		i를 num2로 나누었을 때 나머지가 0과 같다면
		 *  		i를 출력하고 반복문을 종료
		 *  반복문 종료 후 : 없음
		 */
		
		Scanner scan = new Scanner(System.in);
		System.out.println("두 정수를 입력 하세요 : ");
		
		int num1 = scan.nextInt(),
			num2 = scan.nextInt();
		int A=1;
		
		for(int i= 1; ; i++, A++) {
			if(i % num1 == 0 && i % num2 == 0) {
			System.out.println(num1 + "과 " + num2 + "의 최소 공배수 " + i + " ,반복횟수 : " + A);
			break;
			}
		}	
		/* 
		 *  반복횟수 : i는 num1부터 num1씩 증가 => num1의 배수를 활용
		 *  규칙성 : 	i가 num2의 배수이면 i를 출력하고 종료
		 *  	 =>	i를 num2로 나누었을 때 나머지가 0과 같다면
		 *  		i를 출력하고 반복문을 종료
		 *  반복문 종료 후 : 없음
		 */
		A = 1;
		for(int i= num1; ; i += num1, A++) {
			if(i % num2 == 0) {
			System.out.println(num1 + "과 " + num2 + "의 최소 공배수 " + i + " ,반복횟수 : " + A);
			break;
			}
		}
	}
}