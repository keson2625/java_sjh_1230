package day08;

import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.ToString;

public class Ex09_Object {

	public static void main(String[] args) throws CloneNotSupportedException {
		
		Point p = new Point();
		
		/*	println은 매개변수가 클래스의 객체이면 객체의 toString을 호출해서 출력
		 *  => 모든 클래스는 Object 클래스를 상속 받음 => Object 클래스에서 물려받은 toString을
		 *  가지고 있기 때문이다. 
		 */
		System.out.println(p);
		System.out.println(p.toString());
		
		Student std1 = new Student(1, 1, 1, "홍길도", "국어", 100);//<=테스트
		Student std2 = new Student(1, 1, 2, "홍길도", "국어", 100);
		Student std3 = new Student(1, 1, 1, "임꺽정", "국어", 90);
		
		System.out.println(std1.equals(std2));
		System.out.println(std1.equals(std3));//<==equals 학년,반,번호가 같기에 이게 같다
		
		Student std4 = (Student)std1.clone();
		std1.score = 90;
		System.out.println(std4);
	}
	
	public void pirntln(Object Object) {
		System.out.println(Object.toString());
	}
}


class Point{
	private int x, y;

	@Override
	public String toString() {
		return "(" + x + ", " + y + ")";
	}
	
	
}

@AllArgsConstructor
@ToString
class Student implements Cloneable{
	
	int grede, classNum, num;
	String name, subject;
	int score;
	
	@Override//<= 노쓸모 지워도됨
	public int hashCode() {
		return Objects.hash(classNum, grede, num, subject);
	}
	@Override//<= 우측클릭, source equals 생성
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Student other = (Student) obj;
		return classNum == other.classNum && grede == other.grede && num == other.num
				&& Objects.equals(subject, other.subject);
	}
	
	@Override
	public Object clone() throws CloneNotSupportedException{//<throws(예외)
		return super.clone();
	}
	
}