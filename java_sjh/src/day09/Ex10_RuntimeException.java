package day09;

public class Ex10_RuntimeException {

	public static void main(String[] args) {
		
		/*	ArrayStoreException : 0으로 나누었을 떄 발생. a/0, a%0 
		 */
		
		int num1= 1, num2= 0;
		//System.out.println(num1 / num2);//에외 발생
		System.out.println(num1 / (double)num2);//정상 실행
		
		/*NullPointerException : 객체를 생성하지 않고 null인 상태로 필드나 메소드를 호출하는 경우*/
		String str= null;
		//System.out.println(str.charAt(0));
		
		/*ArrayIndexOutOfBoundsException : 배열을 사용할 때 벗어난 번지에 접근한 경우 발생*/
		int [] arr= new int[4];
		//arr[4] = 10;
		
		/*NumberFormatException : 숫자 형식이 필요한 곳에서 숫자 형식이 아닌 값을 넘겨주는 경우 발생*/
		
		String strnum = "1234a";
		//System.out.println(Integer.parseInt(strnum));
		
		/*ClassCastException : 다운 캐스팅에서 발생. 부모클래스의 객체를 자식 클래스에 객체로 클래스 형변환 하는 경우 발생
		 * - 업캐스팅 후 다운캐스팅을 하면 예외가 발생하지 않음. 
		 * - 업캐스팅 하지 않고 다운캐스팅만 하면 예외가 발생. 
		 */
		parent p = new parent();
		//child c = (child)p;
		
	}
}

class parent{}
class child extends parent{}