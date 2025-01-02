package day03;

import java.util.Random;

public class Ex13_Random {
	
	public static void main(String[] args) {
		
		/* 최소에서 맥스 사이의 랜덤한 수를 생성하는 코드
		 */
		
		
		int min= 1, max = 7;
		
		//math.random()는 0이상 1미만의 랜덤한 실수를 제공
		/* 0 <= r < 1
		 * 각 항에 (max - min + 1)을 곱합
		 * 0 <= r < 1 *(max - min + 1) < max - min + 1
		 * 각 항에 min을 더함
		 * min <= r * (max - min + 1) + max - min + 1
		 */
		//min ~max 사이의 랜덤한 수를 생성
		int r = (int)(Math.random() * (max - min + 1) + min);
		System.out.println(r);
		
		
		Random random = new Random();
		r = random.nextInt(max - min + 1) + min; // random.nexint(a)는 0에서 a-1 사이의 랜덤한 정수를 생성
		System.out.println(r);
	}
}
