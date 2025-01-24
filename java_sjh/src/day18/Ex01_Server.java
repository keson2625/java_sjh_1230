package day18;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class Ex01_Server {

	
	public static void main(String[] args) {
		
		String fileName = "src/day18/data.txt";
		List<Account> list = (List<Account>) load(fileName);
		if(list == null) {
			list = new ArrayList<Account>();
		}
		
		int port = 5003;
		
		try {
			ServerSocket serverSocket = new ServerSocket(port);
			
			while(true) {
				save(fileName, list);
				Socket socket = serverSocket.accept();
				System.out.println("[연결 성공]");
				
				Server server = new Server(list, socket);
				server.run();
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			save(fileName, list);
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
}
