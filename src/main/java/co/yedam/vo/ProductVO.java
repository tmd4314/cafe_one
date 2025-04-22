package co.yedam.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class ProductVO {
	private String pdCode;
	private String pdName;
	private String manufacturer;
	private String pdCoo;
	private String material;
	private String pdimg;
	private Date pdMfd;
	private Date pdExp;
	private int pdStock;
	private int pdPrice;
	private int pdScore;
	private String categoryCode;

	private int reviewCount;
}
