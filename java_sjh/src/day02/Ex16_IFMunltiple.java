package day02;

public class Ex16_IFMunltiple {
	
	public static void main(String[] args) {
		
		/* 정수 num가 2의 배수인지, 3의배수인지 6의 배수인지, 전부 아닌지 판별하는 코드 작성
		 * 2 : 2의배수  
		 * 3 : 3의배수  
		 * 4 : 2의배수  
		 * 5 : 2,3,6의 배수가 아님  
		 * 6 : 6의배수로 나오게  	
		 */
		
		//순서에 상관없이 => 조건식 복잡
		//num가 2의 배수이고 3의 배수가 아니면 2의 배수라고 출력
		
		//num가 3의 배수이고 2의 배수가 아니면 3의 배수라고 출력
		
		//num가 6의 배수이면 6의 배수라고 출력
		
		//아니면 2,3,6의 배수가 아니라고 출력
		
		int num =60;
		
		if(num % 2 == 0 && num % 3 != 0) {
			System.out.println(num + "는 2의 배수");
		}
		else if(num %3 == 0 && num % 2 !=0) {
			System.out.println(num + "는 3의 배수");
		}	
		else if(num %6 == 0) {
			System.out.println(num + "는 6의 배수");
		}
		else 
			System.out.println(num + "는 2,3,6의 배수가 아님");
		
		
		
		
		//순서가 중요 => 조건식 간단
				
		//num가 6의 배수이면 6의 배수라고 출력
		
		//num가 2의 배수이면 2의 배수라고 출력
		
		//num가 3의 배수이고 3의 배수라고 출력
	
		//아니면 2,3,6의 배수가 아니라고 출력
		
		if(num % 6 == 0) {
			System.out.println(num + "는 6의 배수");
		}
		else if(num % 2 == 0) {
			System.out.println(num + "는 2의 배수");
		}
		else if(num % 3 == 0) {
			System.out.println(num + "는 3의 배수");
		}
		else {
			System.out.println(num + "는 2,3,6의 배수가 아님");
		}
	

			
		
		//중첩 if문
		
		//num가 2의 배수이면
		
			//num가 3의 배수이면 6의 배수라고 출력
			
			//아니면 2의 배수라고 출력
		
		//num가 3의 배수이면 3의 배수라고 출력
		
		//아니면 2,3,6의 배수가 아니라고 출력
		if(num % 2 == 0) {
			if(num % 3 ==0) {
			System.out.println(num + "는 6의 배수");
			}
			else {
			System.out.println(num + "는 2의 배수");
			}
		}
		else if(num % 3 ==0) {
			System.out.println(num + "는 3의 배수");
		}
			else {
				System.out.println(num + "는 2,3,6의 배수가 아님");
			}
	}
}
		
		
		
		
		
		/*switch(num) {
	    case 6:
		System.out.println(num + "는 6의 배수이다");
		break;
		case 2,4:
		System.out.println(num + "는 2의 배수이다");
		break;
		case 3:
		System.out.println(num + "는 3의 배수이다");
		break;
		case 5:
		System.out.println(num + "는 2,3,6의 배수가 아니다");
		*/
				


