package day02;

public class Ex07_IFNumber {

	public static void main(String[] args) {
	
		/* num가 0보다 크면 양수라고 출력
		 * num가 0이면 0이라고 출력
		 * num가 0보다 작으면 음수라고 출력하는 코드 작성
		 */
		
		int num = 10;
		
		if(num>0) {
			System.out.println(num + "는 양수이다");
		}
		else if(num == 0){
			System.out.println(num + "는 0이다");
		}
		else{
			System.out.println(num + "는 음수이다");
		}
	}
}

