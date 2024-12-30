package day01;

public class Ex09_Tset1 {

	public static void main(String[] args) {

		int max = 20;
		int kor = 90, eng = 70, math = 80;

		for (int i = 0; i < max; i++) {
			for (int a = 0; a < kor; a++)
				if (a >= 60)
					System.out.println((i + 1) + "번 학생은 합격입니다.");
		}

		for (int i = 0; i < eng; i++)
			if (i >= 60)
				System.out.println((i + 1) + "번 학생은 합격입니다.");

		for (int i = 0; i < math; i++)
			if (i >= 60)
				System.out.println((i + 1) + "번 학생은 합격입니다.");

			else {
				System.out.println((i + 1) + "번 학생은 불합격입니다.");
			}
	}
}
