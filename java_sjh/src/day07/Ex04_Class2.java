package day07;

import java.util.ArrayList;
import java.util.Scanner;

public class Ex04_Class2{

	public static void main(String[] args) {

	
		        Scanner scan = new Scanner(System.in);
		        ArrayList<Student> list = new ArrayList<>(); // 학생 데이터를 저장할 리스트
		        //list.add(new Student(1, 1, 1, "홍길동", "국어", 100)); <= 초기 데이터 추가(테스트용)

		        int menu;
		        do {
		            System.out.print("""
		                    메뉴
		                    1. 학생 성적 추가
		                    2. 학생 성적 조회
		                    3. 학생 성적 수정
		                    4. 프로그램 종료
		                    메뉴 선택: """);
		            menu = scan.nextInt();

		            switch (menu) {
		                case 1 -> addStudent(list, scan); // 학생 추가
		                case 2 -> viewStudents(list); // 학생 조회
		                case 3 -> modifyStudent(list, scan); // 학생 수정
		                case 4 -> System.out.println("프로그램을 종료합니다.");
		                default -> System.out.println("올바른 메뉴를 선택하세요.");
		            }
		        } while (menu != 4);
		    }

		    // 학생 추가 메소드
		    private static void addStudent(ArrayList<Student> list, Scanner scan) {
		        Student student = inputStudent(scan);
		        list.add(student); // 학생 리스트에 추가
		        System.out.println("학생 성적이 추가되었습니다.");
		    }

		    // 학생 조회 메소드
		    private static void viewStudents(ArrayList<Student> list) {
		        if (list.isEmpty()) {
		            System.out.println("등록된 학생이 없습니다.");
		            return;
		        }
		        for (Student student : list) {
		            student.print();
		        }
		    }

		    // 학생 수정 메소드
		    private static void modifyStudent(ArrayList<Student> list, Scanner scan) {
		        System.out.println("수정할 학생 정보를 입력하세요.");
		        Student tmp = inputStudent(scan);

		        for (Student student : list) {
		            if (student.equals(tmp)) {
		                System.out.print("새로운 성적 입력: ");
		                int newScore = scan.nextInt();
		                student.setScore(newScore);
		                System.out.println("학생 성적이 수정되었습니다.");
		                return;
		            } 
		        }
		        System.out.println("해당 학생을 찾을 수 없습니다.");
		    }

		    // 학생 정보 입력 메소드
		    private static Student inputStudent(Scanner scan) {
		        System.out.print("학년: ");
		        int grade = scan.nextInt();
		        System.out.print("반: ");
		        int classNum = scan.nextInt();
		        System.out.print("번호: ");
		        int num = scan.nextInt();
		        System.out.print("이름: ");
		        String name = scan.next();
		        System.out.print("과목: ");
		        String subject = scan.next();
		        System.out.print("성적: ");
		        int score = scan.nextInt();
		        return new Student(grade, classNum, num, name, subject, score);
		    }
		}


