package co.yedam.vo;

import lombok.Data;

@Data
public class OrderDetailVo {
	private int orderDetailNo;
	private int quantity;
	private String pdCode;
	private String odNo;
}
