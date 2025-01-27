package day18;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Server {
	
	private List<Account> list;
	private Socket socket;
	
	public void run() {
		Thread t = new Thread(()->{
			try {
				ObjectInputStream ois = new ObjectInputStream(socket.getInputStream());
				ObjectOutputStream oos = new ObjectOutputStream(socket.getOutputStream());

				int menu;
				do {
					menu = ois.readInt();
					runMenu(menu, ois, oos);
				}while(menu != 3);
				
				
			} catch (IOException e) {
				System.out.println("[클라이언트 연결이 끊어졌습니다.]");
				e.printStackTrace();
			}
			
		});
		t.start();
	}

	private synchronized void runMenu(int menu, ObjectInputStream ois, ObjectOutputStream oos) {
		switch (menu) {
		case 1:
			login(menu, ois, oos);
			break;
		case 2:
			addAccount(ois, oos);
			break;
		default:
			
		}
	}

	private void login(int menu,ObjectInputStream ois, ObjectOutputStream oos) {
		try {
			do {
				menu = ois.readInt();
				loginRunMenu(menu, ois, oos);
			}while(menu != 4);
			return;
			
			} catch (IOException e) {
				System.out.println("[클라이언트 연결이 끊어졌습니다.]");
				e.printStackTrace();
			}
	}
	
	private void loginRunMenu(int menu, ObjectInputStream ois, ObjectOutputStream oos) {
		switch (menu) {
		case 1 : searchAccount(ois, oos);//조회
			break;
		case 2 : deposit();//입금
			break;
		case 3 : withdraw();//출금
			break;
		case 4 : before();//이전
			break;
		default:
			
		}
	}


	private void searchAccount(ObjectInputStream ois, ObjectOutputStream oos) {
		try {
			//클라이언트가 보내준 학생 정보를 받아옴
			Account receiveStd 
				= (Account) ois.readObject();
			//받은 학생 정보를 이용해서 일치하는 학생 정보를 가져옴
			Account acc = null;
			int index = list.indexOf(receiveStd);
			if(index >= 0) {
				acc = list.get(index);
			}
			
			//일치하는 학생 정보(없을 수도 있음)를 클라이언트에게 전송
			oos.writeObject(acc);
			oos.flush();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void deposit() {
		// TODO Auto-generated method stub
		
	}

	private void withdraw() {
		// TODO Auto-generated method stub
		
	}

	private void before() {
		
	}

	private void addAccount(ObjectInputStream ois, ObjectOutputStream oos) {

		try {
			
			Account acc = (Account)ois.readObject();

			boolean res = true;
			
			if(list.contains(acc)) {
				res = false;
			}
			//없으면 리스트에 추가
			else {
				list.add(acc);
			}
			//추가 여부를 클라이언트에게 전송
			oos.writeBoolean(res);
			oos.flush();
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list);
	}	 
}