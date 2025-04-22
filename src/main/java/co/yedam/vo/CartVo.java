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
    
    public CartVo() {} // 기본 생성자 추가
    
public CartVo(String userId, String pdCode, int quantity) {
        this.userId = userId;
        this.pdCode = pdCode;
        this.quantity = quantity;
    }

    // 생성자, getter, setter
}
