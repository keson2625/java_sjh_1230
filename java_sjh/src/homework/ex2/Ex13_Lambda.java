package homework.ex2;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

public class Ex13_Lambda {

	public static void main(String[] args) {
		
	List<Point3> list = new ArrayList<Point3>();
	list.add(new Point3(0, 0));
	list.add(new Point3(1, 1));
	list.add(new Point3(-1, -1));
	
	//x좌표가 0이상인 좌표들만 출력되도록 메소드를 만들어서 테스트
public static 	void pintList(List<Point3>list)
	{
	
}
	//y좌표가 0이상인 좌표들만 출력되도록 메소드를 만들어서 테스트
	
	//람다식으로 x좌표가 0이상인 좌표들만 출력되도록 메소드를 만들어서 테스트
	
	//람다식으로 y좌표가 0이상인 좌표들만 출력되도록 메소드를 만들어서 테스트
	}
}

@Data
@AllArgsConstructor
class Point3{
	private int x,y;
}