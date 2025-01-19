package homework.ex2;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class Student {
    private int grade;      // 학년
    private int classNum;   // 반
    private int num;        // 번호
    private String name;    // 이름

    @Override
    public String toString() {
        return grade + "학년 " + classNum + "반 " + num + "번 " + name;
    }
}