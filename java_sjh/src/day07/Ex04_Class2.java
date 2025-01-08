package day07;

import java.util.Scanner;

public class Ex04_Class2 {
	
	public static void main(String[] args) {
		/* 학생의 성적을 관리하는 프로그램을 만들기 위해 필요한 
		 * Student 클래스를 작성하세요.
		 * 
		 *  메뉴
		 *  1. 학생 성적 추가
		 *  2. 학생 성적 조회
		 *  3. 학생 성적 수정
		 *  4. 프로그램 종료
		 *  메뉴 선택 : 1
		 *  학년 : 1
		 *  반 : 1
		 *  번호 : 1
		 *  이름 : 홍길동
		 *  과목 : 국어
		 *  성적 : 100
		 *  메뉴
		 *  1. 학생 성적 추가
		 *  2. 학생 성적 조회
		 *  3. 학생 성적 수정
		 *  4. 프로그램 종료
		 *  메뉴 선택 : 2
		 *  1학년 1반 1번 홍길동 국어 : 100
		 *  메뉴
		 *  1. 학생 성적 추가
		 *  2. 학생 성적 조회
		 *  3. 학생 성적 수정
		 *  4. 프로그램 종료
		 *  메뉴 선택 : 3
		 *  수정할 학생 정보를 입력하세요.
		 *  학년 : 1
		 *  반 : 1
		 *  번호 : 1
		 *  과목 : 국어 
		 *  수정할 학생 정보를 입력하세요.
		 *  성적 : 95
		 *  성적이 수정되었습니다.
		 *  메뉴
		 *  1. 학생 성적 추가
		 *  2. 학생 성적 조회
		 *  3. 학생 성적 수정
		 *  4. 프로그램 종료
		 *  메뉴 선택 : 3
		 *  수정할 학생 정보를 입력하세요.
		 *  학년 : 1
		 *  반 : 1
		 *  번호 : 1
		 *  과목 : 영어 
		 *  수정할 학생 정보를 입력하세요.
		 *  성적 : 95
		 *  과목이 없거나 학생 정보가 없습니다.
		 *  메뉴
		 *  1. 학생 성적 추가
		 *  2. 학생 성적 조회
		 *  3. 학생 성적 수정
		 *  4. 프로그램 종료
		 *  메뉴 선택 : 4
		 *  프로그램을 종료합니다.
		 * */
		int menu, count = 0;
		Scanner scan = new Scanner(System.in);
		
		do {System.out.print("메뉴\r\n"
				+ "1. 학생 성적 추가\r\n"
				+ "2. 학생 성적 추가\r\n"
				+ "3. 학생 성적 추가\r\n"
				+ "4. 학생 성적 추가\r\n"
				+ "메뉴 입렵 : "
				);
			menu = scan.nextInt();
			
			switch(menu) {
			case 1:
				System.out.print("학년 : ");
				int  gr = scan.nextInt();
				System.out.print("반 : ");
				
				System.out.print("번호 : ");
				System.out.print("과목: ");
				System.out.print("성적 : ");
				System.out.print("학년 : ");
				
			}
			
		}while();
	}
	
}
class Stu{
	
	int gr, classnum, num;
	String name, sub; 
	int score;
	
	public void print() {
		System.out.println(gr + "학년" + classnum + "반" + num + "번" + name + " " + sub+ " : "+ score);
	}

	public Stu(int gr, int classnum, int num, String name, String sub, int score) {
		super();
		this.gr = gr;
		this.classnum = classnum;
		this.num = num;
		this.name = name;
		this.sub = sub;
		this.score = score;
	}
		
}
