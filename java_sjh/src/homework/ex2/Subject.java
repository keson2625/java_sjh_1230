package homework.ex2;

import lombok.Data;


@Data
public class Subject {

	private int grade;
	private int semester;
	private String name;
	
public Subject(int grade, int semester, String name) {

		this.grade = grade;
		this.semester = semester;
		this.name = name;
	}

	

}