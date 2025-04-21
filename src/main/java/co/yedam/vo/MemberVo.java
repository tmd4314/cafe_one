package co.yedam.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVo {
	private String userId;
	private String password;
	private String userName;
	private String phone;
	private String post;
	private String address1;
	private String address2;
	private String address3;
	private String email;
	private int mailage;
}
