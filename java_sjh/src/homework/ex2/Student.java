package homework.ex2;

import java.util.ArrayList;
import lombok.Data;

@Data

public class Student {

	public int grade, classNum, num;
	public String name;
	
	public Student(int grade, int classNum, int num, String name, ArrayList<Student> list) {
		
		this.grade = grade;
		this.classNum = classNum;
		this.num = num;
		this.name = name;
		this.list = list;
	}


	//학생 개인의 성적을 담고 있는 배열
	ArrayList<Student> list = new ArrayList<>();
	
	 
	
}
//public Subject[] list;