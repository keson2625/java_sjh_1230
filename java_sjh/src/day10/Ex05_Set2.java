package day10;

import java.util.HashSet;
import java.util.Random;

public class Ex05_Set2 {

	public static void main(String[] args) {
		/* 1에서 9사이의 랜덤한 수를 생성하여 중복되지 않게 3개 만드는 코드를 
		 * 작성
		 */		
		
		HashSet<Integer> set = new HashSet<Integer>();
		
		int min=1,max=10;
		while(set.size()<3) {
			int r = (int)(Math.random() * (max - min + 1) + min);
			set.add(r);
		}
		System.out.println(set);
	
	}
	
}