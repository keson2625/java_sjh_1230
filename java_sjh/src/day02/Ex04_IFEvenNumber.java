package day02;

public class Ex04_IFEvenNumber {

	public static void main(String[] args) {

		//if문을 이용한 홀짝 판별 예제
		
		int num =3;
		
		//num가 짝수라면 짝수라고 출력
		//num을 2로 나누었을 때 나머지가 0가 같다
		if(num %2 == 0) {
			System.out.println(num + "는 짝수이다. ");
		}
		
		//num가 홀수라면 홀수라고 출력
		//num을 2로 나누었을 때 나머지가 0가 같지 않다
		if(num % 2 != 0) {
			System.out.println(num + "는 홀수이다. ");
	}

 }
}
