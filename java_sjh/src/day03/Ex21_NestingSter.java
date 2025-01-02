package day03;

public class Ex21_NestingSter {
	
	public static void main(String[] args) {
		/* *****
		/* *****
		/* *****
		/* *****
		/* *****
		 * 
		 * 반복횟수 : i는 1부터 5까지 1씩 증가 => 줄 
		 * 규칙성 : 	반복횟수 : j는 1부터 5까지 증가
		 * 			규칙성 : *을 출력
		 * 반복문 종료 후 : 없음
		 */
		
	for(int i=1; i<=5; i++){		
		for(int j=1; j<=5; j++) {
			System.out.print("*");
		}
		System.out.println();
		}
 	 
	  /* *		i=1 *1
		 **		i=2 *2
		 ***
		 ****
		 *****
	   */

	for(int j=1; j<=5; j++) {
			System.out.println();		
		for(int star=1; star <= j; star++) {
			System.out.print("*");
		for(int space=1; space <= j; space++) {
			System.out.print("");
			}
		}	
	}
}
}
	
/*
	int num = 5;
	for(int i = 1; i<= num; i++) {
		for(int j = 1; j<=i; j++) {
			System.out.print("*");
		}
		System.out.println();
		}
	}
}	
	
*/	