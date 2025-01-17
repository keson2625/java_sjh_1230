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

	public class StudentManager  {		
	
	static Scanner scan = new Scanner(System.in);
	ArrayList<StudentManager> stm = new ArrayList<StudentManager>();
	
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
				StudentManager stm = inputStudentManager();
				//객체를 생성했으면 리스트에 추가
				list.add(stm);
				System.out.println("학생을 등록했습니다.");
			} catch (ParseException e) {
				System.out.println("잘못 입력했습니다.");
			} 
		}
			
		private static StudentManager inputStudentManager() throws ParseException{
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
}