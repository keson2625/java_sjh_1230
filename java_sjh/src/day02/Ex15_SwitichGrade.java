package day02;

public class Ex15_SwitichGrade {

	public static void main(String[] args) {
		/*
		 * 주어진 성적에 맞는 학점을 출력 
		 * A : 90~109 
		 * B : 80~89 
		 * C : 70~79 
		 * D : 60~69 
		 * F : -9~59 
		 * 잘못된 성적 : 110이상, -9미만
		 */

		int a = 10;

		switch (a / 10) {
		case 10, 9:
			System.out.println(a + "는 A");
			break;
		case 8:
			System.out.println(a + "는 B");
			break;
		case 7:
			System.out.println(a + "는 C");
			break;
		case 6:
			System.out.println(a + "는 F");
			break;
		case 0, 1, 2, 3, 4, 5:
			System.out.println(a + "는 잘못된 성적");
			break;
		}
	}
}