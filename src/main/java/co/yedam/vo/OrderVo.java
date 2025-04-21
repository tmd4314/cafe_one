package co.yedam.vo;

import lombok.Data;

@Data
public class OrderVo {
	private String odNo;
	private String odStatus;
	private int price;
	private int delFee;
	private int useMali;
	private int odTotal;
	private String reName;
	private String reAddr;
	private String rePhone;
	private String paymentUid;
	private String userId;
}
