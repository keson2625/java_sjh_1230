package day08;

import day08.ex02.KiaCar;
import lombok.Data;

public class Ex05_Super {

	public static void main(String[] args) {
		
		parent p = new parent("홍길동");
		p.print();
		System.out.println("---------------");
		Child c = new Child("임꺽정");
		c.print();
	}
	
}

class parent{
	
	String name;

	public parent(String name) {
		super();
		this.name = name;
	}
	public void print() {
		System.out.println("출력합니다.");
	}
}

class Child extends parent{
	
	String type;
	
	public Child() {
		super("");
		type = "";
		
	}
	public Child(String name) {
		super(name);
		type = "일반";
	}
	
	@Override
	public void print() {
		//출력합니다.
		//자식 클래스에서 출력합니다.
		super.print();
		System.out.println(name + " : " + type);
	}
}