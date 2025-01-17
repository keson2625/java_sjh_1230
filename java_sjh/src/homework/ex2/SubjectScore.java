package homework.ex2;

import lombok.Data;

@Data
public class SubjectScore {

	private Subject subject;
	private int score;
	
public SubjectScore(Subject subject, int score) {
		
		this.subject = subject;
		this.score = score;
	}
	
	
}