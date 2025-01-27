package day18;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Scanner;

public class Ex01_Client {

	 /*
	 * 은행 계좌 관리 프로그램
	 * - 접속
	 *  -은행, 이름, 계좌번호, 비밀번호
	 * -계좌 개설
	 *  -은행, 이름, 계좌번호, 비밀번호, 비밀번호 확인
	 * - 종료
	 * 
	 * - 예금 조회
	 * - 입금
	 * - 출금
	 * - 이전
	 * 
	 *  주의사항
	 *  - 한 계좌에 여러명이 동시에 접근하는 경우 먼저 접근한 사람이 사용하도록 처리
	 */
	
	static Scanner scan = new Scanner(System.in);
	static ObjectInputStream ois;
	static ObjectOutputStream oos;
	
	
	public static void main(String[] args) {
		
		String ip = "127.0.0.1";
		int port = 5003;
		
		int menu;
		
		try {
			Socket socket = new Socket(ip, port);
			System.out.println("[프로그램을 시작합니다.]");
			oos = new ObjectOutputStream(socket.getOutputStream());
			ois = new ObjectInputStream(socket.getInputStream());
		}catch(Exception e) {
			System.out.println("[서버와 연결에 실패했습니다.]");
			System.out.println("[프로그램을 종료합니다.]");
			return;
		}
		
		do {
			print();
			
			menu =scan.nextInt();
			scan.nextLine();
			
			runMenu(menu);
			
		}while(menu !=3);
	}

	private static void print() {
		System.out.println("----------------");
		System.out.println("1.접속");
		System.out.println("2.계좌 개설");
		System.out.println("3.종료");
		System.out.println("----------------");
		System.out.print("메뉴 선택 : ");
	}

	private static void runMenu(int menu) {
		switch (menu) {
		case 1 : login(menu);
			break;
		case 2 : addAccount();
			break;
		case 3 : System.out.println("프로그램을 종료합니다,");
			break;
		default: System.out.println("잘못된 입력입니다.");
		}
		
	}

	private static void login(int menu) {
		do {
			loginPrint();
			
			menu =scan.nextInt();
			scan.nextLine();
			
			loginRunMenu(menu);
		}while(menu !=4);
		return;
		
	}
		

	private static void loginPrint() {
		System.out.println("----------------");
		System.out.println("1.예금 조회");
		System.out.println("2.입금");
		System.out.println("3.출금");
		System.out.println("4.이전");
		System.out.println("----------------");
		System.out.print("메뉴 선택 : ");
	}

	private static void loginRunMenu(int menu) {
		switch (menu) {
		case 1 : searchAccount();//조회
			break;
		case 2 : deposit();//입금
			break;
		case 3 : withdraw();//출금
			break;
		case 4 : before();//이전
			break;
		default: System.out.println("잘못된 입력입니다.");

	}
}
	
	private static void searchAccount(){
		try {
			oos.writeInt(1);

			Account acc = addAcc();
			
			oos.writeObject(acc);
			oos.flush();
			Account receiveStd 
				= (Account) ois.readObject();
			
			if(receiveStd != null) {
				System.out.println(receiveStd);
				return;
			}
			System.out.println("일치하는 계좌가 없습니다.");
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
	
	private static void deposit() {
		// TODO Auto-generated method stub
			
	}

	private static void withdraw() {
		// TODO Auto-generated method stub
		
	}

	private static void before() {
		
	}
	
	private static void addAccount() {
		System.out.println("계좌 정보를 입력하세요.");
		Account acc =  addAcc();
		try {
			oos.writeInt(2);
			oos.writeObject(acc);
			oos.flush();
			
			boolean res = ois.readBoolean();
			
			if(res) {
				System.out.println("계좌를 등록했습니다.");
				return;
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("계좌를 등록하지 못했습니다.");
	}
	
	
	private static Account addAcc() {
		
		System.out.print("은행 : ");
		String bank = scan.nextLine();
		System.out.print("이름 : ");
		String name = scan.nextLine();
		System.out.print("계좌번호 : ");
		String	num = scan.nextLine();
		System.out.print("비밀번호 : ");
		String pw = scan.nextLine();
		
		return new Account(bank, name, num, pw);
	}
}
