package day03;

public class Ex18_MutipleTable {
	
	public static void main(String[] args) {
		
		/* 2~9단을 출력하는 코드를 작성
		 * 2단
		 * 2 X 1 = 2
		 * 2 X 2 = 4
		 * ...
		 * 2 X 9 = 18
		 * 3단
		 * ...
		 * 9 X 9 = 81
		 */
		
		int num =2;
		
			for(num =2; num <= 9; num++) {
			System.out.println(num + "단");
			//num단
			for(int i = 1; i<=9; i++) {
			System.out.println(num + " X " + i + " = " + num*i);
		}	
	}
}
}