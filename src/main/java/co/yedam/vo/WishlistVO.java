package co.yedam.vo;

import lombok.Data;

@Data
public class WishlistVO {
    private String userId;     // user_id → userId
    private String pdCode;     // pd_code
    private String pdImg;      // pd_img
    private String pdName;     // pd_name
    private String manufacturer;
    private int pdPrice;
}
