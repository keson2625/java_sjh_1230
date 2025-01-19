package homework.ex2;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

	public class ScoreManager  {		
	
	static Scanner scan = new Scanner(System.in);
	static ArrayList<Score> list = new ArrayList<Score>();
	
	//학생
	protected static void scoreMenu(int menu){
		
		switch (menu) {
     	case 1 : addScore();
     		break;
     	case 2 : updateScore();
     		break;
     	case 3 : deleteScore();
     		break;
     	case 4 : searchScore();
     		break;
		default : System.out.println("올바른 메뉴를 선택하세요.");
		}
	}

		protected static void addScore() {
			ArrayList<Student> List = new ArrayList<Student>();
			Student student = Student(grade, classNum, num);

            if (student == null) {
                System.out.println("학생을 찾을 수 없습니다.");
                return;
            }

            System.out.println(student + "을(를) 찾았습니다.");

            // 등록된 과목 출력
            List<Score> scores = student.getScores();
            if (!scores.isEmpty()) {
                System.out.println("등록된 과목 목록:");
                for (Score score : scores) {
                    System.out.println(" - " + score.getSubject());
                }
            } else {
                System.out.println("현재 등록된 과목이 없습니다.");
            }
		}
		
			
		


		protected static void updateScore() {
			// TODO Auto-generated method stub
			
		}


		protected static void deleteScore() {
			// TODO Auto-generated method stub
			
		}


		protected static void searchScore() {
		
			runSearchMenu();
		}


		
		private static void runSearchMenu() {
			System.out.print("이름 : ");
			String name = scan.nextLine();
			
			for(Subject std : list) {
				if(std.getName().contains(name)) {
					System.out.println(std);
						
			}
		}
	}
}
	