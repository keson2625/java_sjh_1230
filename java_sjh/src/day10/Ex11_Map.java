package day10;

import java.util.HashMap;

public class Ex11_Map {
	
	public static void main(String[] args) {
		
		/* Map 인터페이스
		 * - key, Value 값을 관리
		 * - Key : 중복 x
		 * - Value : 중복 가능
		 */
		HashMap<String, String>map = new HashMap<String, String>();
		
		/*	put(k,v) : k와 v의 값을 각각 key와 value에 추가하여 저장
		 *	k가 중복된 경우 v로 덮어쓰기 함
		 *	
		 */
		
		map.put("abc123", "pwabc123");
		map.put("qwe1234", "pwabc123");
		map.put("abc123", "pwqwe1234");
		
		System.out.println(map);
		
		// get(k) : key 값 중에서 k와 일치하는 value를 반환
		// 없으면 null를 반환
		System.out.println(map.get("abc1234"));
		System.out.println(map.get("abc123"));
		
		/* isEmpty()
		 * - map이 비었는지를 반환
		 * containsKey(k)
		 * - key 값중에서 k와 일치하는 값이 있는지를 반환
		 * containsValue(k)
		 * - value 값중에서 v와 일치하는 값이 있는지를 반환
		 */
		System.out.println(map.isEmpty());
		System.out.println(map.containsKey("abc"));
		System.out.println(map.containsKey("abc123"));
		System.out.println(map.containsValue("pwabc123"));
		System.out.println(map.containsValue("abc"));
	
		/* remove(k)
		 * -key 값 중에 k와 일치하는 값이 있으면 삭제 후 value를 반환
		 * remove(V)
		 * -key 값 중에 k와 일치하고, value 값이 일치하는 값이 있으면 
		 * 삭제 후 삭제 여부를 반환
		 */
	
		System.out.println("삭제 전");
		System.out.println(map);
		System.out.println(map.remove("abc123"));
		System.out.println("삭제 후");
		System.out.println(map);
		System.out.println(map.remove("qwe1234","pwabc123"));
		System.out.println("삭제 후");
		System.out.println(map);
	}

}
