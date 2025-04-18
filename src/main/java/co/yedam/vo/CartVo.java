package co.yedam.vo;

import lombok.Data;

@Data
public class CartVo {
    private int cartNo;
    private int quantity;
    private String pdCode;
    private String userId;
    private String pdName;
    private int pdPrice;
    private String pdImg;
    private int totalPrice;

    // 생성자, getter, setter
}
