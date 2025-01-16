package homework.ex2;

import java.util.Scanner;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
	public class StudentManager {		

	Scanner scan = new Scanner(System.in);
	int menu;	

	protected static void studentMenu(int menu) {
		
		switch (menu) {
     	case 1 : addStudent();
     	case 2 : updateStudent();
     	case 3 : deleteStudent();
     	case 4 : searchStudent();
		default : System.out.println("올바른 메뉴를 선택하세요.");
		}
	}

		protected static void addStudent() {
			// TODO Auto-generated method stub
			
		}


		protected static void updateStudent() {
			// TODO Auto-generated method stub
			
		}


		protected static void deleteStudent() {
			// TODO Auto-generated method stub
			
		}


		protected static void searchStudent() {
			// TODO Auto-generated method stub
			
		}
}