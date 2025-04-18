package co.yedam.vo;

import lombok.Data;

@Data
public class CategoryVO {

    private String categoryCode;       
    private String categoryName;       
    private String subcategoryName;    

    // 기본 생성자
    public CategoryVO() {}

    // 전체 필드를 사용하는 생성자
    public CategoryVO(String categoryCode, String categoryName, String subcategoryName) {
        this.categoryCode = categoryCode;
        this.categoryName = categoryName;
        this.subcategoryName = subcategoryName;
    }


    @Override
    public String toString() {
        return "CategoryVO [categoryCode=" + categoryCode + ", categoryName=" + categoryName + ", subcategoryName=" + subcategoryName + "]";
    }

}
