package day02;

public class Ex19_ForMultipleTable {

	public static void main(String[] args) {
		/* 구구단 2단 출력하는 코드 작성
		 * 2x1 = 1
		 * 2x2 = 4
		 * ...
		 * 2x9 = 18
		 * 반복횟수 : i는 1부터 9까지 1씩 증가
		 */
		
		for(int i=2, a=1; a<=9; a++) {
		System.out.println(i + "x" +a+" = "+i*a);			
	}
}
}