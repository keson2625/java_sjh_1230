package homework.ex2;

import java.util.Scanner;

/*	학생성적 관리 프로그램작성
 * 	1. 학생 등록
 * 	-학년, 반, 번호, 이름을 입력받아 등록
 * 	-이미 등록된 학생 정보(학년,반,번호가 같은경우)라면 등록하지 않음
 * 	2. 학생 수정
 * 	-학년,반,번호를 입력받아 학생이 있는지 찾고, 있으면 수정
 * 	-수정하는 정보는 학년,반 ,번호, 이름을 수정
 * 	-이미 등록된 학생 정보로 수정하려고 하면 수정하지 않음
 * 	3. 학생 삭제
 * 	-학년,반,번호를 입력받아 학생이 있는지 찾고, 있으면 삭제
 * 	4. 과목 등록
 * 	-학년, 학기, 과목명을 입력받아 없으면 등록
 * 	5. 과목 수정
 *  -학년, 학기, 과목명을 입력받아 있으면 학년, 학기, 과목명을 입력받아 수정
 *  -수정하려는 과목이 이미 등록된 과목이라면 수정하지 않음
 * 	6. 과목 삭제
 * 	-학년, 학기, 과목명을 입력받아 있으면 삭제
 * 	7. 성적 등록
 * 	-학년, 반, 번호를 입력받아 학생을 찾음
 * 	-있으면 과목을 출력
 * 	-과목을 선택
 * 	-성적을 입력해서 학생 성적을 등록
 * 	8. 성적 수정
 * 	-학년, 반, 번호를 입력받아 학생을 찾음
 * 	-있으면 학년, 학기, 과목명을 입력받고 있으면 성적을 입력받아 수정
 * 	9. 성적 삭제
 * 	-학년, 반, 번호를 입력받아 학생을 찾음
 * 	-있으면 학년, 반, 번호를 입력받고 있으면 삭제 
 * 	10. 학생 조회
 * 	-학년, 반을 입력하면 학생들을 조회
 * 	11. 과목 조회
 * 	-둥록된 과목 전체를 조회
 * 	12. 성적 조회
 * 	-학년, 반, 번호를 입력하면 학생 있으면 학생 성적을 조회
 * 
 * 
 */

public  class StudentMain {

	
	static Scanner scan = new Scanner(System.in);
	

	public static void main(String[] args) {
		
		int menu;
        do {
            print();
            menu = scan.nextInt();
            runMenu(menu);
            

        }while(menu != 13);
	}
	

	public static void print() {
		System.out.print(
                "-------------------\r\n"+
                "1. 학생 등록\r\n"+
                "2. 학생 수정\r\n"+
                "3. 학생 삭제\r\n"+
                "4. 과목 등록\r\n"+
                "5. 과목 수정\r\n"+
                "6. 과목 삭제\r\n"+
                "7. 성적 등록\r\n"+
                "8. 성적 수정\r\n"+
                "9. 성적 삭제\r\n"+
                "10. 학생 조회\r\n"+
                "11. 과목 조회\r\n"+
                "12. 성적 조회\r\n"+
                "13. 프로그램 종료\r\n"+
                "-------------------\r\n"+
                "메뉴 선택: ");
	}
	
	private static void runMenu(int menu) {
		switch (menu) {
     	case 1 -> addStudent(); 
     	case 2 -> modifyStudent(); 
     	case 3 -> deleteStudent(); 
     	case 4 -> addSubject(); 
		case 5 -> modifySubject(); 
		case 6 -> dlelteSubject(); 
		case 7 -> addScore(); 
		case 8 -> modifyScore(); 
		case 9 -> deleteScore(); 
		case 10 -> viewStudent(); 
		case 11 -> viewSubject(); 
		case 12 -> viewScore(); 
		case 13 -> System.out.println("프로그램을 종료합니다.");
		default -> System.out.println("올바른 메뉴를 선택하세요.");
	 
	 }
	 
 }

private static Object addStudent() {
	// TODO Auto-generated method stub
	return null;
}

private static Object modifyStudent() {
	// TODO Auto-generated method stub
	return null;
}

private static Object deleteStudent() {
	// TODO Auto-generated method stub
	return null;
}

private static Object addSubject() {
	// TODO Auto-generated method stub
	return null;
}

private static Object modifySubject() {
	// TODO Auto-generated method stub
	return null;
}

private static Object dlelteSubject() {
	// TODO Auto-generated method stub
	return null;
}

private static Object addScore() {
	// TODO Auto-generated method stub
	return null;
}

private static Object modifyScore() {
	// TODO Auto-generated method stub
	return null;
}

private static Object deleteScore() {
	// TODO Auto-generated method stub
	return null;
}

private static Object viewStudent() {
	// TODO Auto-generated method stub
	return null;
}

private static Object viewSubject() {
	// TODO Auto-generated method stub
	return null;
}

private static Object viewScore() {
	// TODO Auto-generated method stub
	return null;
}
		
}


		
   





/*
Student [] stdList; 
Subject [] subjectList;
int stdCount = 0;
int subjectCount = 0;
Student tmp = new Student();
*/