package homework.ex2;

import lombok.Data;

@Data
public class Student {

	public int grade, classNum, num;
	public String name;

	//학생 개인의 성적을 담고 있는 배열
	public Subject[] list;
}
