package co.yedam.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	private String user_id; // 아이디
	private String user_pw; // 비밀번호
	private String user_name; // 유저이름
	private int phone; // 휴대폰번호
	private String address; // 주소
	private String email; // 이메일
	private int maileage; // 마일리지
	private String review_id; // 리뷰번호
	private int order_detail_no; // 주문상세번호
}