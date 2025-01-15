package day12;

import java.util.ArrayList;
import java.util.Scanner;

import lombok.AllArgsConstructor;
import lombok.Data;

public class Ex09_ObjectStream2 {
	
	 /* 다음 기능을 갖는 프로그램을 작성하세요.
	 * 단, 저장기능과 불러오기 기능을 추가
	 * - 저장은 프로그램 종료하기 전
	 * - 불러오기눈 프로그램 시작 전
	 * 
	 * 1. 자동차 추가
	 * 2. 자동차 조회(전체)
	 * 3. 종료
	 * 
	 * 힌트 
	 * ArrayList 클래스도 Serializeble 인터페이스를 구현한 구현 클래스이다.
	 */
	
	static Scanner scan = new Scanner(System.in);
	static ArrayList<Car>list = new ArrayList<>();
	
	public static void main(String[] args) {
		
		String filName = "src/day12/Car.txt";
		
		int menu;
		
		do {
			printMenu();
			menu = scan.nextInt();
			
			runMenu(menu);
			
		}while(menu != 3);
	
	}

	private static void printMenu() {
		System.out.println("------------\r\n"
							+"1. 자동차 추가\r\n"
							+"2. 자동차 조회(전체)\r\n"
							+"3. 종료\r\n"
							+"------------\r\n"
							);
	}

	private static void runMenu(int menu) {

		switch(menu) {
		case 1 : addCar();
		case 2 : saearchCar();
		case 3 : System.out.println("프로그램을 종료합니다.");
		default: System.out.println("잘못 입력 하셨습니다.");
		}
	}

	private static void addCar() {
		System.out.print("이름 : ");
        String name = scan.nextLine();
        
        System.out.print("회사명 : ");
        String brand = scan.nextLine();
	
        list.print(s->s.getname()==name);
	}

	private static void saearchCar() {
		// TODO Auto-generated method stub
		
	}
	private static void print() {
		// TODO Auto-generated method stub
		
	}
}


@Data
@AllArgsConstructor
class Car{
	
	private String name;
	private String brand;
	
	@Override
	public String toString() {
		return "(" + name + " , " + brand + ")";
	}
}
