package day21;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Ex02_Main {

	/*
	 * 단어장 프로그램 구현 
	 * - 관리자 
	 * 	단어 등록 
	 * 	단어 수정 
	 * 	단어 삭제 
	 * 
	 * - 사용자 
	 * 	단어 검색 
	 * 	내 검색 단어 보기
	 * 
	 * - 주의사항 
	 * 	중복된 단어 허용 
	 * 	단어는 단어, 품사, 뜻으로 구성 사용자는 아이디로만 구분. 
	 * 	중복된 아이디는 없음 사용자는 회원가입을 따로 하지않음 
	 * 	관리자는 admin 고정 저장과 불러오기 필수
	 * 
	 * - 시작전 아이디 : admin 관리자 메뉴 출력 메뉴 선택 : 
	 * 	아이디 : abc 사용자 메뉴 출력 메뉴 선택 :
	 */
	private static Scanner scan = new Scanner(System.in);
	private static List<User> users = new ArrayList<User>();

	public static void main(String[] args) {
		
		String fileName = "src/day21/date.txt";
		
		users = (ArrayList<User>)load(fileName);

		
		System.out.print("아이디 : ");
		String id = scan.next();

		User user = new User(id);
		save(fileName, users);
		
		boolean user2 = id.equals("admin");// 관리자인지 여부 받기
		if (user2) {
			System.out.println("관리자로 로그인 하셨습니다.");
			adminMenu(); // 관리자 메뉴 실행
		} else {
			System.out.println("회원가입이 완료됐습니다.");
			userMenu(); // 일반 사용자 메뉴 실행
		}
	}
	private static void save(String fileName, Object obj) {
		try(FileOutputStream fos = new FileOutputStream(fileName);
			ObjectOutputStream oos = new ObjectOutputStream(fos)){
			
			oos.writeObject(obj);
			
		} catch (Exception e) {
			System.out.println("-----------------");
			System.out.println("저장하기 실패");
			System.out.println("-----------------");
		}
	}
	
	private static Object load(String fileName) {
		try(FileInputStream fis = new FileInputStream(fileName);
			ObjectInputStream ois = new ObjectInputStream(fis)){
			
			return ois.readObject();
			
		} catch (Exception e) {
			System.out.println("-----------------");
			System.out.println("불러오기 실패");
			System.out.println("-----------------");
		}
		return null;
	}
	

	private static void adminMenu() {
		int menu;
		do {
			adminPrint();
			menu = scan.nextInt();
			runAdmin(menu);
		}while(menu != 4);
	}

	private static void adminPrint() {
		System.out.println("------------------");
		System.out.println("1. 단어 등록");
		System.out.println("2. 단어 수정");
		System.out.println("3. 단어 삭제");
		System.out.println("4. 프로그램 종료");
		System.out.println("------------------");
		System.out.print("메뉴 선택: ");
	}

	private static void runAdmin(int menu) {
	
		switch (menu) {
		case 1:
			break;
		case 2: 
			break;
		case 3: 
			break;
		case 4: System.out.println("프로그램을 종료합니다.");
			break;
		default: System.out.println("잘못된 입력입니다.");
		}
	}
	
	private static void userMenu() {
		int menu;
		do {
			userPrint();
			menu = scan.nextInt();
			runUser(menu);
		}while(menu != 3);
	}


	private static void userPrint() {
		System.out.println("------------------");
		System.out.println("1. 단어 검색");
		System.out.println("2. 검색기록 보기");
		System.out.println("3. 프로그램 종료");
		System.out.println("------------------");
		System.out.print("메뉴 선택: ");
		
	}

	private static void runUser(int menu) {
		switch (menu) {
		case 1:
			break;
		case 2: 
			break;
		case 3: System.out.println("프로그램을 종료합니다.");
			break;
		default: System.out.println("잘못된 입력입니다.");
		}
	}	
}