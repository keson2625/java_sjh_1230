package day09;

import java.util.Scanner;

public class Ex02_String2 {
	
	public static void main(String[] args) {
		/*	파일명을 수정하는 기능을 구현
		 *  기존 파일명을 입력받고(확장자를 포함)
		 *  수정하려는 파일명을 입력받아(확장자 제외)
		 *  파일명 수정
		 *  
		 *  입력: test.txt
		 * 	수정 : 연습
		 * 	결과 : 연습.txt
		 * 
		 * 	lastIndexOf, substring, replace
		 */
		Scanner scan = new Scanner(System.in);
		System.out.println("입력 : ");
		String filName = scan.nextLine();
		System.out.println("수정 : ");
		String filName2 = scan.nextLine();
		//뒤에서 첫 .의 위치를 찾음
		int index = filName.lastIndexOf(".");
		
		if(index < 0) {
			System.out.println("확장자가 없는 파일명 입니다.");
			return;
		}
		//0번지 부터 .의 위치전까지 문자열을 추출
		String oriFilName = filName.substring(0,index);
		//추출한 문자열을 입력받은 문자열로 교체
		filName = filName.replace(oriFilName, filName2);
		
		System.out.println("결과 : " + filName);
		
		
	}

}
