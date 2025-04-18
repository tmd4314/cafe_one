package co.yedam.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private int reviewId;
	private String reviewTitle;
	private String reviewContent;
	private Date createDate;
	private String userId;
	private String pdCode;
}
