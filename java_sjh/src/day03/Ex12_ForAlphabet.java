package day03;

import java.util.Scanner;

public class Ex12_ForAlphabet {

	public static void main(String[] args) {
		/* 	a부터 z까지 출력하는 코드를 작성
		 * 
		 * 	adcef....xyz
		 * 
		 * 	반복횟수 : i는 0부터 26보다 작을 때까지 1씩 증가
		 * 	규칙성 : (char)('a'+ i)를 출력
		 * 	반복문 종료 후 :
		 */
		int a= 26;
				
		for(int i=0; i < a ; i++) {
			System.out.print((char)('a' + i));
		}
		System.out.println();
		
		/* 	반복횟수 : ch는 'a'부터 'z'까지 1씩 증가
		 * 	규칙성 : ch를 출력
		 * 	반복문 종료 후 : 없음
		 */ 
		for(char ch= 'a'; ch <= 'z'; ch++) {
			System.out.print(ch);
		}
	}
}
