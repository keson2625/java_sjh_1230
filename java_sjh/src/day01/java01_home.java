package day01;

public class java01_home {

	public static void main(String[] args) {

		int count = 20, a = 30;

		for (int kor = 70; count < a; count++)
			if (kor >= 60)
				System.out.println((kor + 1) + "번 학생은 합격입니다.");

			else {
				System.out.println((kor + 1) + "번 학생은 불합격입니다.");
			}
	}
}
