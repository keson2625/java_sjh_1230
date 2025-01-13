package homework.ex2;

import java.util.Objects;

public class Subject {

	public int grade;
	public int smester;
	public String name;
	public int score;
	
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Subject other = (Subject) obj;
		return grade == other.grade && Objects.equals(name, other.name) && score == other.score
				&& smester == other.smester;
	}
	
	s
}
	
	

