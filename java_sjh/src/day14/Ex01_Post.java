package day14;

import java.io.Reader;
import java.security.DrbgParameters.NextBytes;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Scanner;
import java.util.stream.Collectors;

import lombok.Data;

public class Ex01_Post {

	/*	게시글 프로그램을 위한 클래스를 선언하세요.
	 * 	게시글 등록
	 * 	- 제목, 내용, 작성자를 입력
	 *	게시글 수정
	 *	-게시글 번호를 선택
	 *	- 제목, 내용을 수정
	 *	게시글 삭제
	 *	- 게시글 번호를 선택해서 삭제
	 *	게시글 조회
	 *	- 게시글 번호를 이요해서 조회하고 조회수 1을 증가
	 */
	
	static Scanner scan = new Scanner(System.in);
	static ArrayList<Post> list = new ArrayList<Post>();
	
	public static void main(String[] args) {
		
		int menu;
		
		do {
			printMenu();
			menu = scan.nextInt();
			scan.nextLine();
			
			runMenu(menu);
			
		}while(menu != 5);
	}
	private static void printMenu() {
	
		System.out.println("---------------------\r\n"
							+"1. 게시글 등록\r\n"
							+"2. 게시글 수정\r\n"
							+"3. 게시글 삭제\r\n"
							+"4. 게시글 조회\r\n"
							+"5. 프로그램 종료\r\n"
							+"---------------------"
							);
		System.out.print("메뉴 선택 : ");
		}
	
	private static void runMenu(int menu) {
		
		
		switch(menu) {
					case 1 : insertPost();
						break;
					case 2 : updatePost();
						break;
					case 3 : deletePost();
						break;
					case 4 : searchPost();
						break;
					case 5 : System.out.println("프로그램을 종료합니다.");
						break;
					default: System.out.println("잘못된 입력입니다.");
					}
		}
	
	private static void insertPost() {
		try {
			//객체를 생성
			Post post = inputPost();
			//객체를 생성했으면 리스트에 추가
			list.add(post);
			System.out.println("게시글을 등록했습니다.");
		} catch (ParseException e) 
			{
			System.out.println("잘못 입력했습니다.");
			} 
		}

	private static Post inputPost() throws ParseException {
		
		System.out.print("제목 : ");
		String titie = scan.nextLine();
		
		System.out.print("내용 : ");
		String content = scan.nextLine();
		
		System.out.print("작성자 : ");
		String writer = scan.nextLine();
		
		return new Post(titie, content, writer);
	}
		
	private static void updatePost() {
		// TODO Auto-generated method stub
		
	}
	private static void deletePost() {
		// TODO Auto-generated method stub
		
	}
	private static void searchPost() {
	
	}
}	


@Data
class Post{
	
	private static int count;
	private int num;
	private String titie, content, writer;
	private Date date;
	private int view;
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Post other = (Post) obj;
		return num == other.num;
	}

	public Post(String titie, String content, String writer) {
		num = ++count;
		this.titie = titie;
		this.content = content;
		this.writer = writer;
		date = new Date();
	}
	
	public void print() {
		System.out.println("--------------------------");
		System.out.println("번호 : " + num);
		System.out.println("제목 : " + titie);
		System.out.println("내용 : " + content);
		System.out.println("작성자 : " + writer);
		System.out.println("작성일 : " + getDateStr());
		System.out.println("조회수 : " + view);
		System.out.println("--------------------------");
		
	}
	
	private String getDateStr() {
		//Date -> String
		//yyyy--MM-dd HH:mm:ss
		SimpleDateFormat format = new SimpleDateFormat("yyyy--MM-dd HH:mm:ss");
		return format.format(date);
		
	}
}