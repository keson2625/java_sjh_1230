package day10;

import java.security.KeyStore.Entry;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.print.DocFlavor.STRING;

public class Ex12_Map2 {
 
	public static void main(String[] args) {
		
		/* 반복문을 이용하여 Map에 있는 값들을 확인 예제
		 */
		HashMap<String, String>user = new HashMap<String, String>();
		
		user.put("abc123", "123123");
		user.put("qwe123", "qwe123");
		
		/* keySet()을 이용
		 * -key값들을 하나의 Set으로 만드어서 반환
		 */
		Set<String> keyset = user.keySet();
		
		for(String id : keyset) {
			String pw = user.get(id);
			System.out.println(id + " : " + pw);
		}
		System.out.println("----------------------------");
		Iterator<String> it= keyset.iterator();
		while(it.hasNext()) {
			String id = it.next();
			String pw = user.get(id);
			System.out.println(id + " : " + pw);
		}
		
		System.out.println("-----------------------------");
		Set<Map.Entry<String, String>> entryset = user.entrySet();
		for(Map.Entry<String, String> entry : entryset) {
			String id = entry.getKey();
			String pw = entry.getValue();
			System.out.println(id + " : " + pw);
			}
		System.out.println("-----------------------------");
		Iterator<Map.Entry<String, String>>it2 = entryset.iterator();
		while(it2.hasNext()) {
			Map.Entry<String, String>entry = it2.next();
			String id = entry.getKey();
			String pw = entry.getValue();
			System.out.println(id + " : " + pw);
		}
	}
}
