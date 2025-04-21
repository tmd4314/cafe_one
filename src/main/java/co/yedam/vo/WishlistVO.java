package co.yedam.vo;

import lombok.Data;
 
@Data
public class WishlistVO {
    private String userId;
    private String pdCode;
    private String pdName;
    private String pdImg;
    private String manufacturer;
    private int pdPrice;

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setPdCode(String pdCode) {
        this.pdCode = pdCode;
    }
}
