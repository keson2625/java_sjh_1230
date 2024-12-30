package day01;

public class Ex05_Variable_Boolean {
	
	public static void main(String[] args) {
		boolean isAdult = true;//또는 false(거짓)
		int age = 20;
		isAdult = age > 18;//19세 이상이면 성인
		System.out.println(age + "살은 성인?" + isAdult);
	}

}
