package homework.ex2;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

import lombok.AllArgsConstructor;

	public class Manager  {		
	
	static Scanner scan = new Scanner(System.in);
	ArrayList<StudentManager> list = new ArrayList<StudentManager>();
	
	public void Manager(){
		
		int menu=0;//예외처리 떄문에 초기화 해야함
		
		
		do {
			print();
		
			try {//메뉴 선택
				menu = scan.nextInt();
				//앞에서 입력한 엔터를 처리
				removeBuffer();
				//메뉴 실행
				runMenu(menu);
	        
				}
				catch(InputMismatchException e) {
					System.out.println();
				}
			}while(menu != 4);
	}
		
	public static void print() {
		System.out.print(
	            "-------------------\r\n"+
	            "1. 학생\r\n"+
	            "2. 과목\r\n"+
	            "3. 성적\r\n"+
	            "4. 프로그램 종료\r\n"+
	            "-------------------\r\n"+
	            "메뉴 선택: ");
	}
	
	private static void removeBuffer() {
		scan.nextLine();	
	}

	
	private static void runMenu(int menu) {
		switch (menu) {
	 	case 1 : student(menu);
	 		break;
	 	case 2 : subject(menu);
	 		break;
	 	case 3 : score(menu);
	 		break;
		case 4 : System.out.println("프로그램을 종료합니다.");
			break;
		default : System.out.println("올바른 메뉴를 선택하세요.");
	 }
}

	private static void student(int menu) {
		StudentManager stm = new StudentManager();
		stm.studentMenu(menu);
		
		printMenu();
		menu = scan.nextInt();
		student(menu);
	}
	
	private static void subject(int menu) {
		SubjectManager sjm = new SubjectManager();
		sjm.subjectMenu(menu);
		
		printMenu();
		menu = scan.nextInt();
		subject(menu);
	}
	
	private static void score(int menu) {
		ScoreManager scm = new ScoreManager();
		scm.scoreMenu(menu);
		
		printMenu();
		menu = scan.nextInt();
		score(menu);
	}
	
	private static void printMenu() {
		System.out.print(
	            "-------------------\r\n"+
	            "1. 등록\r\n"+
	            "2. 수정\r\n"+
	            "3. 삭제\r\n"+
	            "4. 조회\r\n"+
	            "-------------------\r\n"+
	            "메뉴 선택: ");
	}
}