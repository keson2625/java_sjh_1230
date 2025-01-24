package day18;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Account implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String  bank, name, num, pw;
	private Date date;
	private int money;
	


	@Override
	public String toString() {
		return "은행 :" + bank + " 이름 :" + name + " 계좌번호 :" + num + " 비밀번호 :" + pw +  " 잔액 :" + money;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Account other = (Account) obj;
		
		return Objects.equals(bank, other.bank) && Objects.equals(name, other.name) && Objects.equals(num, other.num)
				&& Objects.equals(pw, other.pw);
	}


	public Account(String bank,  String name, String num, String pw) {
		this.bank = bank;
		this.name = name;
		this.num = num;
		this.pw = pw;
	}

}