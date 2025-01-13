package day10;

import java.util.HashMap;
import java.util.Scanner;
import java.util.Set;

 	
public class Ex13_Phone {

	 /* 전화번호를 관리하는 프로그램을 작성
	 * 1. 전화번호 추가
	 * - 이름과 전화 번호를 입력받아 추가
	 * - 동명이인이 있을 수 있기 때문에 중복되도 추가
	 * 2. 전화번호 수정
	 * - 이름을 입력
	 * - 이름과 일치하는 목록을 출력
	 * - 수정하련는 전화번호를 선택
	 * - 새 전화번호를 입력받아 수정 
	 * 3. 전화번호 삭제
	 * - 이름을 입력
	 * - 이름과 일치하는 목록을 출력
	 * - 삭제하려는 전화번호를 선택
	 * - 선택한 전화번호를 삭제  
	 * 4. 전화번호 조회
	 * - 이름을 입력
	 * - 이름이 포함된 전화번호를 출력
	 */
	
	static Scanner scan = new Scanner(System.in);
	static HashMap<String, String>user = new HashMap<String, String>();
	
	public static void main(String[] args) {
	

	
	int menu;
	
		do { 
			printMenu();
			
			menu = scan.nextInt();
			scan.nextLine();
			
			runMenu(menu);
		
		}while(menu != 5);
	
	}
	
	private static void runMenu(int menu) {
		switch (menu) {
		case 1: insertNumber();
			break;
		case 2: deleteNumber();
			break;
		case 3: deleteNumber();
			break;
		case 4: searchNumber();
			break;
		case 5: System.out.println("프로그램을 종료 합니다.");
			break;
		default: System.out.println("잘못 입력하셨습니다.");
			
		}
	}
	
	private static void insertNumber() {
		Set<String> keyset = user.keySet();
		
		System.out.print("이름 : ");
		String name = scan.nextLine();
		System.out.print("전화번호 : ");
		String phone = scan.nextLine();
		user.put(name, phone);
		
		for(String id : keyset) {
			String pw = user.get(id);
			System.out.println(id + " : " + pw);
			
		Phone wordObj = new Phone(name, phone);
			
			if(list.contains(wordObj)) {
				System.out.println("이미 등록된 단어입니다.");
				return;
		}
		
	}
	private static void deleteNumber() {
		// TODO Auto-generated method stub
		
	}
	private static void searchNumber() {
		// TODO Auto-generated method stub
		
	}
	
	private static void printMenu() {
		
		System.out.print("-----------------\r\n"
				+ "1. 전화번호 등록\r\n"
				+ "2. 전화번호 수정\r\n"
				+ "3. 전화번호 삭제\r\n"
				+ "4. 전화번호 조회\r\n"
				+ "5. 종료\r\n"
				+ "-----------------\r\n"
				+ "메뉴 선택 : ");
	}
 }
class Phone2{
	
}