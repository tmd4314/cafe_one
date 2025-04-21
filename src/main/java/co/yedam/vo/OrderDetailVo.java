package co.yedam.vo;

import lombok.Data;

@Data
public class OrderDetailVo {
	private int orderDetailNo;
	private int quantity;
	private String pdCode;
	private String odNo;
	private int pdPrice;
	private String pdName;  // 상품 제목
	private String pdImg; // 상품 이미지
}
