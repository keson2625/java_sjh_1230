package homework.ex2;

import java.util.ArrayList;
import java.util.Scanner;

	public class SubjectManager  {		
	
	static Scanner scan = new Scanner(System.in);
	static ArrayList<Subject> list = new ArrayList<Subject>();
	
	//학생
	protected static void subjectMenu(int menu){
		
		switch (menu) {
     	case 1 : addSubject();
     		break;
     	case 2 : updateSubject();
     		break;
     	case 3 : deleteSubject();
     		break;
     	case 4 : searchSubject();
     		break;
		default : System.out.println("올바른 메뉴를 선택하세요.");
		}
	}

		protected static void addSubject() {
			try {
				//객체를 생성
				Subject sjm = inputSubjectManager();
				//객체를 생성했으면 리스트에 추가
				list.add(sjm);
				System.out.println("학생을 등록했습니다.");
			} catch (Exception e) {
				System.out.println("잘못 입력했습니다.");
			} 
		}
			
		private static Subject inputSubjectManager(){
			System.out.print("학년 : ");
			int grade = scan.nextInt();
		        
	        System.out.print("학기 : ");
	        int semester = scan.nextInt();
		        
	        System.out.print("과목명 : ");
	        String name = scan.next();
			
	        return  new Subject(grade, semester, name);
		}
		


		protected static void updateSubject() {
			// TODO Auto-generated method stub
			
		}


		protected static void deleteSubject() {
			// TODO Auto-generated method stub
			
		}


		protected static void searchSubject() {
		
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
	