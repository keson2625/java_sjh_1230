package day01;

import java.util.Scanner;

public class java01_home {

	public static void main(String[] args) {
	
		/* 문장을 입력받아 문자가 q일 때 종료하는 코드를 작성 
		 * 
		 */

		Scanner scan = new Scanner(System.in);

		
		for(;;) {
			System.out.print("문장을 입력하세요 : ");
			char a;
			a= scan.next().charAt(0);
			if(a=='q')
			break;{
				System.out.println("끝");
			
			}
			
		}
		
		
	}
}


	