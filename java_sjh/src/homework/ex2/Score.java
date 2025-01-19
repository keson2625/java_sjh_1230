package homework.ex2;

import lombok.Data;

@Data
public class Score {

	private Subject subject;
	private int score;
	
public Score(Subject subject, int score) {
		
		this.subject = subject;
		this.score = score;
	}
@Override
public String toString() {
    return "과목: " + subject + ", 점수: " + score;

	}
}