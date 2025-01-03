package day04;

import java.util.Scanner;

public class Ex10_Homewokr {
	
	public static void main(String[] args) {
		/* 다음과 같이 실행되도록 프로그램 작성.(UpDown 게임 참고)
		 * 
		 * 메뉴
		 * 1. UpDown 게임 실행
		 * 2. 최고 기록 확인
		 * 3. 프로그램 종료
		 * 메뉴 선택 : 2
		 * 게임을 실행 한적이 없습니다.
		 * 메뉴
		 * 1. UpDown 게임 실행
		 * 2. 최고 기록 확인
		 * 3. 프로그램 종료
		 * 메뉴 선택 : 1
		 * 입력 : 50
		 * Down!
		 * 입력 : 25
		 * 정답!
		 * 메뉴
		 * 1. UpDown 게임 실행
		 * 2. 최고 기록 확인
		 * 3. 프로그램 종료
		 * 메뉴 선택 : 2
		 * 2회
		 * 메뉴로 가려면 엔터를 입력하세요.
		 * 메뉴
		 * 1. UpDown 게임 실행
		 * 2. 최고 기록 확인
		 * 3. 프로그램 종료
		 * 메뉴 선택 : 
		 * 프로그램 종료합니다.
		 */
		
		/*
		int min = 1, max = 100;
		int r = (int)(Math.random() * (max - min + 1) + min);
		System.out.println("랜덤 수 : " + r);
		int input = min - 1;
		for( ; input != r ; ) {
			System.out.print("입력 : ");
			input = scan.nextInt();
			if(input > r) {
				System.out.println("DOWN!");
			}
			else if(input < r) {
				System.out.println("UP!");
			}
			else {
				System.out.println("정답!");
		*/
				
				
		int min = 1, max = 100;
		int r = (int)(Math.random() * (max - min + 1) + min);
		char menu;
		Scanner scan = new Scanner(System.in);
		
		for(;;) {
					System.out.println("메뉴를 선택하세요(종료는 3번) : ");
					menu = scan.next().charAt(0);{
						if(menu=='1'){
							
						}
					}
			}
		
	}

}
