package homework.ex2;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

	public class Manager  {		
	
	static Scanner scan = new Scanner(System.in);
	static ArrayList<Subject> subjectList = new ArrayList<Subject>();
	static ArrayList<Student> studentList = new ArrayList<Student>();
	
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
				catch(Exception e) {
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
	
		printMenu();
		menu = scan.nextInt();
		studentMenu(menu);
	}
	
	private static void subject(int menu) {
		
		printMenu();
		menu = scan.nextInt();
		subjectMenu(menu);
	}
	
	private static void score(int menu) {

		printMenu();
		menu = scan.nextInt();
		scoreMenu(menu);
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
				Student stm = inputStudentManager();
				//객체를 생성했으면 리스트에 추가
				if(isDuplicate(stm)) {
					System.out.println("이미 등록된 학생입니다.");
					return;
				}
				studentList.add(stm);
				System.out.println("학생을 등록했습니다.");
			} catch (Exception e) {
				System.out.println("잘못 입력했습니다.");
			} 
		}
		
		private static boolean isDuplicate(Student student) {
			
			for (Student std : studentList) {
	            if (std.getGrade() == student.getGrade() &&
	                std.getClassNum() == student.getClassNum() &&
	                std.getNum() == student.getNum()) {
	                return true;
	            }
	        }
	        return false;
	    }

		private static Student inputStudentManager(){
			System.out.print("학년 : ");
			int grade = scan.nextInt();
		        
	        System.out.print("반 : ");
	        int classNum = scan.nextInt();
		        
	        System.out.print("번호 : ");
	        int num = scan.nextInt();
		        
	        System.out.print("이름 : ");
	        String name = scan.next();
			
	        return new Student(grade, classNum, num, "");
		}
		
		protected static void updateStudent() {
			// TODO Auto-generated method stub
			
		}

		protected static void deleteStudent() {
			// TODO Auto-generated method stub
			
		}

		protected static void searchStudent() {
			System.out.print("이름 : ");
			String name = scan.nextLine();
			
			Student std = inputStudentManager();
			
			int index = studentList.indexOf(std);
			if(index >= 0) {
				studentList.get(index).print();
				return;
			}
			//없으면 없다고 알림 출력
			System.out.println("일치하는 학생이 없습니다.");
		}
		
		public static Student inputStudent() {
			Student tmp = inputStudentManager();

			removeBuffer();
			
			System.out.print("이름 : ");
			String name = scan.nextLine();
			
			tmp.setName(name);
			return tmp;
		}
		
		
	//과목
	protected static void subjectMenu(int menu){
		
		switch (menu) {
     	case 1 : addsubject();
     		break;
     	case 2 : updatesubject();
     		break;
     	case 3 : deletesubject();
     		break;
     	case 4 : searchsubject();
     		break;
		default : System.out.println("올바른 메뉴를 선택하세요.");
		}
	}

		protected static void addsubject() {
			try {
				//객체를 생성
				Subject sum = inputsubjectManager();
				//객체를 생성했으면 리스트에 추가
				if(isDuplicate(sum)) {
					System.out.println("이미 등록된 학생입니다.");
					return;
				}
				subjectList.add(sum);
				System.out.println("학생을 등록했습니다.");
			} catch (Exception e) {
				System.out.println("잘못 입력했습니다.");
			} 
		}
		
		private static boolean isDuplicate(Subject subject) {
			
			for (Subject std : subjectList) {
	            if (std.getGrade() == subject.getGrade() &&
	                std.getSemester() == subject.getSemester() &&
	                std.getName() == subject.getName()) {
	                return true;
	            }
	        }
	        return false;
	    }

		private static Subject inputsubjectManager(){
			System.out.print("학년 : ");
			int grade = scan.nextInt();
		        
	        System.out.print("학기 : ");
	        int semester = scan.nextInt();
		        
	        System.out.print("이름 : ");
	        String name = scan.next();
			
	        return new Subject(grade, semester, "");
		}
		
		protected static void updatesubject() {
			// TODO Auto-generated method stub
			
		}

		protected static void deletesubject() {
			// TODO Auto-generated method stub
			
		}

		protected static void searchsubject() {
			System.out.print("이름 : ");
			String name = scan.nextLine();
			
			Subject std = inputsubjectManager();
			
			int index = subjectList.indexOf(std);
			if(index >= 0) {
				subjectList.getLast();				
				return;
			}
			//없으면 없다고 알림 출력
			System.out.println("일치하는 학생이 없습니다.");
		}
		
		public static Subject inputsubject() {
			Subject tmp = inputsubjectManager();

			removeBuffer();
			
			System.out.print("이름 : ");
			String name = scan.nextLine();
			
			tmp.setName(name);
			return tmp;
		}
		
		//점수
		protected static void scoreMenu(int menu){
			
			switch (menu) {
	     	case 1 : addscore();
	     		break;
	     	case 2 : updatescore();
	     		break;
	     	case 3 : deletescore();
	     		break;
	     	case 4 : searchscore();
	     		break;
			default : System.out.println("올바른 메뉴를 선택하세요.");
			}
		}
	
			protected static void addscore() {
			Student student = Student(grade, classNum, num);

		    if (student == null) {
		        System.out.println("학생을 찾을 수 없습니다.");
		        return;
		    }

		    System.out.println(student + "을(를) 찾았습니다.");

		    // 등록된 과목 출력
		    List<Score> scores = student.getList();
		    if (!scores.isEmpty()) {
		        System.out.println("등록된 과목 목록:");
		        for (Score score : scores) {
		            System.out.println(" - " + score.getSubject());
		        }
		    } else {
		        System.out.println("현재 등록된 과목이 없습니다.");
		    }
		}
				
			
		
			
			private static Student Student(Object grade, Object classNum, Object num) {
				// TODO Auto-generated method stub
				return null;
			}

			protected static void updatescore() {
				// TODO Auto-generated method stub
				
			}
	
			protected static void deletescore() {
				// TODO Auto-generated method stub
				
			}
	
			protected static void searchscore() {
				
			
			}
	}
	
	
	