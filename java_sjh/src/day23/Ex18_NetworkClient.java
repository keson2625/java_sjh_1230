package day23;

import java.io.ObjectOutputStream;
import java.net.Socket;

public class Ex18_NetworkClient {

	public static void main(String[] args) {
		
		//ip, port 설정
		String ip = "192.168.40.3";
		int port = 3001;
		
		try {
		//ip와 port를 이용한 소캣을 생성
		Socket socket = new Socket(ip,port);
		//데이터를 주고받음
		ObjectOutputStream oos = new ObjectOutputStream(socket.getOutputStream());
		oos.writeUTF("안녕");
		oos.flush();
		Thread.sleep(1000);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
