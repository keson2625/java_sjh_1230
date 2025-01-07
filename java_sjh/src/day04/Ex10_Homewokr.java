package day04;

import java.util.Scanner;

public class Ex10_Homewokr {
	
	public static void main(String[] args) {
		/* 다음과 같이 실행되도록 프로그램 작성.(UpDown 게임 참고)
		 * 
		 * 메뉴
		 * 1. UpDown 게임 실행
		 * 2. 최고 기록 확인
		 * 3. 프로그램 종료
		 * 메뉴 선택 : 2
		 * 게임을 실행 한적이 없습니다.
		 * 메뉴
		 * 1. UpDown 게임 실행
		 * 2. 최고 기록 확인
		 * 3. 프로그램 종료
		 * 메뉴 선택 : 1
		 * 입력 : 50
		 * Down!
		 * 입력 : 25
		 * 정답!
		 * 메뉴
		 * 1. UpDown 게임 실행
		 * 2. 최고 기록 확인
		 * 3. 프로그램 종료
		 * 메뉴 선택 : 2
		 * 2회
		 * 메뉴로 가려면 엔터를 입력하세요.
		 * 메뉴
		 * 1. UpDown 게임 실행
		 * 2. 최고 기록 확인
		 * 3. 프로그램 종료
		 * 메뉴 선택 : 
		 * 프로그램 종료합니다.
		 */
		
		
		        int min = 1, max = 100;
		        int bestRecord = 0; // 최고 기록 초기값
		        char menu;
		        Scanner scan = new Scanner(System.in);

		        while (true) {
		            System.out.println("메뉴를 선택하세요 (1: 게임 시작, 2: 최고 기록 확인, 3: 종료): ");
		            menu = scan.next().charAt(0);

		            if (menu == '1') {
		                // 새 게임 시작
		                int randomNum = (int) (Math.random() * (max - min + 1)) + min;

		                // for문 사용
		                for (int count = 1; ; count++) {
		                    System.out.print("숫자를 입력하세요 (" + min + " ~ " + max + "): ");
		                    int input = scan.nextInt();

		                    if (input > randomNum) {
		                        System.out.println("DOWN!");
		                    } else if (input < randomNum) {
		                        System.out.println("UP!");
		                    } else {
		                        System.out.println("정답입니다!");
		                        
		                        // 최고 기록 갱신
		                        if (bestRecord == 0 || count < bestRecord) {
		                            bestRecord = count;
		                            System.out.println("축하합니다! 새로운 최고 기록: " + bestRecord + "번");
		                        } else {
		                            System.out.println("정답을 맞추는 데 " + count + "번 걸렸습니다.");
		                        }
		                        break; // 정답을 맞추면 루프 종료
		                    }
		                }
		            } else if (menu == '2') {
		                // 최고 기록 확인
		                if (bestRecord == 0) {
		                    System.out.println("아직 기록이 없습니다. 먼저 게임을 시작하세요.");
		                } else {
		                    System.out.println("현재 최고 기록: " + bestRecord + "번");
		                }
		            } else if (menu == '3') {
		                // 게임 종료
		                System.out.println("게임을 종료합니다. 감사합니다!");
		                break;
		            } else {
		                System.out.println("잘못된 입력입니다. 다시 선택해주세요.");
		            }
		        }
		    }
		}
