package day07;

import java.util.Scanner;

public class Ex04_Class {

	static Scanner scan = new Scanner(System.in);

	public static void main(String[] args) {
		Student[] std = new Student[10];
		char menu;
		int count = 0; // 저장된 학생 수

		do {
			printMenu();
			menu = scan.next().charAt(0);
			count = runMenu(menu, std, count); // count 전달
			std = expend(std, count); // 학생 배열 확장
		} while (menu != '5');
	}

	public static void printMenu() {
		System.out.println("메뉴");
		System.out.println("1. 학생 성적 추가");
		System.out.println("2. 학생 성적 조회");
		System.out.println("3. 학생 성적 수정");
		System.out.println("4. 학생 성적 삭제");
		System.out.println("5. 프로그램 종료");
		System.out.print("메뉴 선택 : ");
	}

	private static int runMenu(int menu, Student[] std, int count) {
		System.out.println("-------------------------");

		switch (menu) {
		case '1': // 학생 성적 추가
			System.out.print("학년 : ");
			int grade = scan.nextInt();
			System.out.print("반 : ");
			int classnum = scan.nextInt();
			System.out.print("번호 : ");
			int num = scan.nextInt();
			System.out.print("이름 : ");
			String name = scan.next();
			System.out.print("과목 : ");
			String subject = scan.next();
			System.out.print("성적 : ");
			int score = scan.nextInt();

			Student tmp = new Student(grade, classnum, num, name, subject, score);

			// 중복 학생 정보 확인
			boolean exists = false;
			for (int i = 0; i < count; i++) {
				if (std[i].equal(grade, classnum, num, subject)) {
					exists = true;
					break;
				}
			}

			if (exists) {
				System.out.println("이미 등록된 학생 정보입니다.");
			} else {
				std[count] = tmp;
				System.out.println("학생 성적이 추가되었습니다.");
				count++;
			}
			break;

		case '2': // 학생 성적 조회
			System.out.println("학생 성적을 조회합니다.");
			for (int i = 0; i < count; i++) {
				std[i].print();
			}
			break;

		case '3': // 학생 성적 수정
			System.out.println("학생 성적을 수정합니다.");
			System.out.print("학년 : ");
			grade = scan.nextInt();
			System.out.print("반 : ");
			classnum = scan.nextInt();
			System.out.print("번호 : ");
			num = scan.nextInt();
			System.out.print("과목 : ");
			subject = scan.next();
			System.out.print("성적 : ");
			score = scan.nextInt();

			boolean found = false;
			for (int i = 0; i < count; i++) {
				if (std[i].equal(grade, classnum, num, subject)) {
					std[i].setScore(score);
					System.out.println("학생 정보를 수정했습니다.");
					found = true;
					break;
				}
			}
			if (!found) {
				System.out.println("과목이 없거나 학생 정보가 없습니다.");
			}
			break;

			case '4': // 정보 삭제
				System.out.println("삭제할 학생 성적을 입력하세요.");
				System.out.print("학년 : ");
				grade = scan.nextInt();
				System.out.print("반 : ");
				classnum = scan.nextInt();
				System.out.print("번호 : ");
				num = scan.nextInt();
				System.out.print("과목 : ");
				subject = scan.next();
				
			break;
		
			case '5': // 프로그램 종료
			System.out.println("프로그램을 종료합니다.");
			break;

			default:
			System.out.println("올바른 메뉴가 아닙니다.");
			}
			return menu;
			}

		private static Student[] expend(Student[] std, int count) {
		if (count < std.length) {
			return std;
		}

		Student[] tmp = new Student[std.length + 5];
		System.arraycopy(std, 0, tmp, 0, std.length);
		return tmp;
		}

		static class Student {
		int grade, classNum, num;
		String name, subject;
		int score;

		public Student(int grade, int classNum, int num, String name, String subject, int score) {
			this.grade = grade;
			this.classNum = classNum;
			this.num = num;
			this.name = name;
			this.subject = subject;
			this.score = score;
		}

		public void print() {
			System.out
					.println(grade + "학년 " + classNum + "반 " + num + "번 " + name + " " + subject + " : " + score + "점");
		}

		public boolean equal(int grade, int classNum, int num, String subject) {
			return this.grade == grade && this.classNum == classNum && this.num == num && this.subject.equals(subject);
		}

		public void setScore(int score) {
			this.score = score;
		}
		

	}
}
