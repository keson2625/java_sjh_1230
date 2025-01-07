package day06;

public class Ex04_ArrayCopy2 {
	
	public static void main(String[] args) {
		//깊은 복사와 얕은 복사를 비교하는 예제
		point [] points = new point[5];
		for(int i =0; i<points.length; i++) {
			points[i] = new point(i , i);
		}
		
		print(points);
		
		point [] points2 = new point[points.length];
		System.arraycopy(points, 0, points2, 0, points.length);
		
		System.out.println("------------------");
		points[0].x =10;
		print(points2);
	
	}
	public static void print(point[] points) {
		for(int i = 0; i<points.length; i++) {
			points[i].print();
		}
	}

}

class point{
	int x,y;
	
	public point(int x, int y) {
		this.x= x;
		this.y= y;
	}
	
	public void print() {
		System.out.println("(" + x + "," + y + ")");
	}
}
