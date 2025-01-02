package day03;

import java.util.Scanner;

public class Ex19_NestingPrimeNumber {
	
	public static void main(String[] args) {
		/*100이하의 소수를 출력하는 코드 작성
		 * 
		 */
		

		int num = 2;
		int count = 0;
		
		for(num=2; num<=100; num++) {
			count = 0; //<= 중요
		for(int i = 1; i <= num ; i++) {
			if(num % i ==  0) {
				count++;
			}
		}
		if(count == 2) {
			System.out.println(num);
		}	
	}
}
}
