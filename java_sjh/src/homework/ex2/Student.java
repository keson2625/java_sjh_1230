package homework.ex2;

import java.util.ArrayList;
import java.util.Scanner;

import lombok.Data;

@Data
public class Student {

	public int grade, classNum, num;
	public String name;

	//학생 개인의 성적을 담고 있는 배열
	ArrayList<Student> list = new ArrayList<>();
	
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
	        return null;
	 }
}
//public Subject[] list;