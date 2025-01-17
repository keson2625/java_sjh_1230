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

	public class trasdasd  {		
	
	static Scanner scan = new Scanner(System.in);
	
	protected void studentManager() {
		
		int menu=0;//예외처리 떄문에 초기화 해야함
		ArrayList<trasdasd> list = new ArrayList<trasdasd>();
		
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
	 	//case 3 : score(menu);
	 		//break;
		case 4 : System.out.println("프로그램을 종료합니다.");
			break;
		default : System.out.println("올바른 메뉴를 선택하세요.");
	 }
}

	private static void student(int menu) {
		
		printMenu();
		menu = scan.nextInt();
		studentMenu(menu);
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
	
	
	//학생
	protected static void studentMenu(int menu){
		
		switch (menu) {
     	case 1 : addStudent();
     		break;
     	case 2 : updateStudent();
     		break;
     	case 3 : deleteStudent();
     		break;
     	case 4 : searchStudent();
     		break;
		default : System.out.println("올바른 메뉴를 선택하세요.");
		}
	}

		protected static void addStudent() {
			try {
				//객체를 생성
				trasdasd stm = inputStudentManager();
				//객체를 생성했으면 리스트에 추가
				list.add(stm);
				System.out.println("학생을 등록했습니다.");
			} catch (ParseException e) {
				System.out.println("잘못 입력했습니다.");
			} 
		}
			
		private static trasdasd inputStudentManager() throws ParseException{
			System.out.print("학년 : ");
			int grade = scan.nextInt();
		        
	        System.out.print("반 : ");
	        int classNum = scan.nextInt();
		        
	        System.out.print("번호 : ");
	        int num = scan.nextInt();
		        
	        System.out.print("이름 : ");
	        String name = scan.next();
			
	        return null;
		}
		


		protected static void updateStudent() {
			// TODO Auto-generated method stub
			
		}


		protected static void deleteStudent() {
			// TODO Auto-generated method stub
			
		}


		protected static void searchStudent() {
		
			runSearchMenu();
		}
	

		
		private static void runSearchMenu() {
			System.out.print("이름 : ");
			String name = scan.nextLine();
			
			for(Student std : list) {
				if(std.getName().contains(name)) {
					System.out.println(std);
						
		}
		
		
		//과목
		private static void subject(int menu) {
	
			printMenu();
			menu = scan.nextInt();
			subjectMenu(menu);
			
		}
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

		
		private static void addSubject() {
			ArrayList<Subject> list = new ArrayList<Subject>();
	
			System.out.print("학년 : ");
			int grade = scan.nextInt();
		        
	        System.out.print("학기 : ");
	        int semester = scan.nextInt();
		        
	        System.out.print("과목명 : ");
	        String name = scan.nextLine();
			
			Subject suj = new Subject(grade, semester, name);
			list.add(suj);
			System.out.println("과목을 등록했습니다.");
			
			return;
	}

					
		private static void updateSubject() {
					// TODO Auto-generated method stub
					
				}
		
		private static void deleteSubject() {
					// TODO Auto-generated method stub
					
				}
		
			
			private static ArrayList<Subject> searchSubjectList(int grade, int semester, String name) {
				ArrayList<Subject> list = new ArrayList<Subject>();
				ArrayList<Subject> tmpList = new ArrayList<Subject>();
				
				for(Subject suj : list) {
					if(suj.getName().contains(name)) {
						tmpList.add(suj);
					}
				}
				
				return tmpList;
			}
			
			private static void searchSubject() {
				System.out.print("학년 : ");
				int grade = scan.nextInt();
				System.out.print("학기 : ");
				int semester = scan.nextInt();
				System.out.print("과목명 : ");
				String name = scan.nextLine();
				
				ArrayList<Subject> pList = searchSubjectList(grade, semester, name);
				printPhoneNumberList(pList, false);
			}
			
		private static boolean printPhoneNumberList(ArrayList<Subject> pList, 
				boolean isNumber) {
			if(pList == null || pList.size() == 0) {
				System.out.println("결과가 없습니다.");
				return false;
			}
			for(int i = 0; i<pList.size(); i++) {
				if(isNumber) {
					System.out.print(i+1+". ");
				}
				System.out.println(pList.get(i));
			}
			return true;
		}
			
		
			
		/*
		//성적
		private static void score(int menu) {
			
				printMenu();
				menu = scan.nextInt();
				scoretMenu(menu);
				
			}
			protected static void scoretMenu(int menu){
				
				switch (menu) {
		     	case 1 : addScoret();
		     		break;
		     	case 2 : updateScoret();
		     		break;
		     	case 3 : deleteScoret();
		     		break;
		     	case 4 : searchScoret();
		     		break;
				default : System.out.println("올바른 메뉴를 선택하세요.");
				}
			}

			
			private static void addScoret() {
				try {
					//객체를 생성
					Student stm = inputScorettManager();
					//객체를 생성했으면 리스트에 추가
					list.add(stm);
					System.out.println("성적을 등록했습니다.");
				} catch (ParseException e) {
					System.out.println("잘못 입력했습니다.");
				} 
			}
			
			private static Student inputScorettManager() throws ParseException{
				System.out.print("학년 : ");
				String name = scan.nextLine();
				
				System.out.print("반 : ");
				String classNum = scan.nextLine();
				
				System.out.print("번호 : ");
				String num = scan.nextLine();
				/*
				ArrayList<StudentManager> stdList = searchPhoneNumberList(name); 
				
				System.out.print("과목 : ");
				int sbuject = scan.nextInt();
				
				System.out.print("성적 : ");
				int score = scan.nextInt();
			
			
				if(!printPhoneNumberList(stdList, true)) {
					return;
				}
			}	
			*/
			private static void updateScoret() {
				// TODO Auto-generated method stub
				
			}

			private static void deleteScoret() {
				// TODO Auto-generated method stub
				
			}

			private static void searchScoret() {
				// TODO Auto-generated method stub
				
			}
	
}