package day02;

public class EX06_IFEvenNumber2 {

	public static void main(String[] args) {

		/*
		 * 홀짝 판별 예제 if else문 num가 짝수이면 짝수라고 출력 아니면 홀수라고 출력
		 */

		int num = 3;

		if (num % 2 == 0) {
			System.out.println(num + "는 짝수이다 ");
		} else {
			System.out.println(num + "는 홀수이다 ");
		}
	}
}
