package homework.ex2;


import java.util.ArrayList;
import java.util.Scanner;


	public class StudentManager  {		
	
	static Scanner scan = new Scanner(System.in);
	static ArrayList<Student> list = new ArrayList<Student>();
	
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
				list.add(stm);
				System.out.println("학생을 등록했습니다.");
			} catch (Exception e) {
				System.out.println("잘못 입력했습니다.");
			} 
		}
			
		
		private static boolean isDuplicate(Student student) {
	        for (Student std : list) {
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
			
	        return  new Student(grade, classNum, num, name);
		}
		


		protected static void updateStudent() {
			// TODO Auto-generated method stub
			
		}


		protected static void deleteStudent() {
			// TODO Auto-generated method stub
			
		}


		protected static void searchStudent() {
		
		}


}

	