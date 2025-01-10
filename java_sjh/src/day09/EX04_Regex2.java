package day09;

import java.util.regex.Pattern;

public class EX04_Regex2 {

	public static void main(String[] args) {
		/* 아이디가 주어진 조건에 맞는지 확인하는 코드를 작성
		 * 아이다는 숫자, 또는 영문 또는 특수문자(!@#$)로 이루어져있다
		 * 아이디는 최소 8자리에서 최대 13자리이다.
		 */
		String id = "abc123";
		//String regex = "^[a-zA-z0-9!@#$]{8,13}$";
		String regex = "(\\w[!@#$]){8,13}$";
		if(Pattern.matches(regex, id)) {
			System.out.println(id + "는 사용이 불가능한 아이디 입니다.");
		}
		else {	
			System.out.println(id + "는 사용이 가능한아이디 입니다.");
		}
	}
}
