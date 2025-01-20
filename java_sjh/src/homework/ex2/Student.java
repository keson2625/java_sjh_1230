package homework.ex2;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Data
@Getter
@Setter
public class Student {
    private int grade;      // 학년
    private int classNum;   // 반
    private int num;        // 번호
    private String name;    // 이름

    public List<Score> list = new ArrayList<Score>();
    
    public void print() {
		System.out.println("-----------------");
		System.out.println(grade + "학년 " + classNum + "반 " + num + "번 " + name);
		System.out.println("-----------------");
		if(list.size() == 0) {
			System.out.println("등록된 성적이 없습니다.");
			return;
		}
		for(Score score : list) {
			System.out.println(score);
		}
	}


	public Student(int newgrade, int newclassNum, int newnum, String newname) {
		
		this.grade = newgrade;
		this.classNum = newclassNum;
		this.num = newnum;
		this.name = newname;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Student other = (Student) obj;
		return classNum == other.classNum && grade == other.grade && Objects.equals(name, other.name)
				&& num == other.num;
	}
}