package co.yedam.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	
	private String pdCode;
	private String pdName;
	private String manufacturer;
	private String pdCoo;
	private String material;
	private String pdImg;
	private Date pdMfd;
	private Date pdExp;
	private int pdStock;
	private int pdPrice;
	private int pdScore;
}
