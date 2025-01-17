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
	/*
	"-------------------\r\n"+
    "1. 등록\r\n"+
    "2. 수정\r\n"+
    "3. 삭제\r\n"+
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
    
    case 1 -> addStudent(); addSubject(); addScore(); 
     	case 2 -> updateStudent(); modifySubject(); modifyScore(); 
     	case 3 -> deleteStudent(); dlelteSubject(); deleteScore(); 
     	case 4 : searchStudent(); viewSubject(); viewScore(); 
		
    */
	
	private static void runMenu(int menu) {
		switch (menu) {
     	case 1 : student();
     	case 2 : subject();
     	case 3 : score();
		case 4 : System.out.println("프로그램을 종료합니다.");
		default : System.out.println("올바른 메뉴를 선택하세요.");
	 }
	 
 }


	



	private static void student(int menu) {
		
            print();
            menu = scan.nextInt();
            studentMenu(menu);
		
	}


	private static void subject() {
		// TODO Auto-generated method stub
		
	}


	private static void score() {
		// TODO Auto-generated method stub
		
	}





		
}


		
   





/*
Student [] stdList; 
Subject [] subjectList;
int stdCount = 0;
int subjectCount = 0;
Student tmp = new Student();
*/