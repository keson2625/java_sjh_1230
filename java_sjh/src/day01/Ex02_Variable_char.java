package day01;

public class Ex02_Variable_char {

	public static void main(String[] args) {

		char ch1; //문자 변수 ch1을 선언. 사용불가
		//System.out.println(ch1);//에러 발생.
		//The local variable ch1 may not have been initialized : 초기화 하지 않아서 사용불가	
		ch1 = '1'; //저장가능
		System.out.println(ch1);//에러 발생하지 않음. 저장해서 초기화
		
		char ch2 = '한';// 선언과 동시에 초기화 했기에 사용가능
		System.out.print(ch2);
		
		char ch3 = '\u0041';
		System.out.print(ch3);//유니코드 0041에 해당하는 A가 출력
		
		char ch4 = '\\' , ch5 = '\n' , ch6 = '\"';
		System.out.print(ch4);
		System.out.print(ch5);//엔터
		System.out.print(ch6);
		
		//쉬프트+엔터 줄 변경
		//알트+화살표 해당 글 위치변경
		
	}

}
